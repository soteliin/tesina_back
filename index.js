const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const multer = require('multer');
const { Pool } = require('pg');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const {  trainModel, getHistoricalData, predictNext, predictMultipleDays  } = require('./recomendacion'); // Importar el sistema de recomendación
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(bodyParser.json());

const upload = multer();

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

const JWT_SECRET = process.env.JWT_SECRET || 'secret_key';
let tokenBlacklist = [];

// Middleware para verificar token JWT con lista negra
const verifyToken = (req, res, next) => {
    const token = req.headers['authorization']?.split(' ')[1];

    if (!token) {
        return res.status(403).json({ message: 'Token no proporcionado' });
    }

    if (tokenBlacklist.includes(token)) {
        return res.status(401).json({ message: 'Token inválido o expirado' });
    }

    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        req.userId = decoded.userId;
        next();
    } catch (err) {
        return res.status(401).json({ message: 'Token inválido o expirado' });
    }
};

// Ruta de Logout
app.post('/logout', verifyToken, (req, res) => {
    const token = req.headers['authorization']?.split(' ')[1];

    if (token) {
        tokenBlacklist.push(token);
        return res.status(200).json({ message: 'Logout exitoso' });
    }

    return res.status(400).json({ message: 'Token no proporcionado' });
});

// Ruta para registrar usuario
app.post('/insert-usuario', upload.none(), async (req, res) => {
    try {
        const { nombre, email, contrasena, id_tipo_usuario } = req.body;

        const hashedPassword = await bcrypt.hash(contrasena, 10);

        const result = await pool.query(
            'INSERT INTO public.tr_usuario (nombre, email, contrasena, id_tipo_usuario) VALUES ($1, $2, $3, $4) RETURNING id_usuario',
            [nombre, email, hashedPassword, id_tipo_usuario]
        );

        res.status(201).json({ message: 'Usuario creado con éxito', userId: result.rows[0].id_usuario });
    } catch (error) {
        console.error('Error al insertar usuario:', error);
        if (error.code === '23505') {
            res.status(400).json({ message: 'El email ya está registrado' });
        } else {
            res.status(500).json({ message: 'Error al crear el usuario' });
        }
    }
});

// Ruta para inicio de sesión
app.post('/login', upload.none(), async (req, res) => {
    try {
        const { email, contrasena } = req.body;

        const result = await pool.query(
            'SELECT id_usuario, contrasena FROM public.tr_usuario WHERE email = $1',
            [email]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Usuario no encontrado' });
        }

        const usuario = result.rows[0];
        const passwordMatch = await bcrypt.compare(contrasena, usuario.contrasena);

        if (!passwordMatch) {
            return res.status(401).json({ message: 'Contraseña incorrecta' });
        }

        const token = jwt.sign({ userId: usuario.id_usuario }, JWT_SECRET, { expiresIn: '1h' });

        res.status(200).json({ message: 'Inicio de sesión exitoso', token });
    } catch (error) {
        console.error('Error al iniciar sesión:', error);
        res.status(500).json({ message: 'Error al iniciar sesión' });
    }
});

// Ruta protegida para obtener datos del usuario
app.get('/datos-usuario', verifyToken, async (req, res) => {
    try {
        const result = await pool.query(
            'SELECT id_usuario, nombre, email FROM public.tr_usuario WHERE id_usuario = $1',
            [req.userId]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Usuario no encontrado' });
        }

        res.status(200).json({ user: result.rows[0] });
    } catch (error) {
        console.error('Error al obtener datos del usuario:', error);
        res.status(500).json({ message: 'Error al obtener los datos del usuario' });
    }
});

app.post('/recomendaciones', verifyToken, async (req, res) => {
    const { tickers, days } = req.body;

    if (!Array.isArray(tickers) || tickers.length === 0) {
        return res.status(400).json({ message: 'Se debe proporcionar una lista de tickers válida' });
    }

    if (!days || days <= 0) {
        return res.status(400).json({ message: 'Se debe proporcionar un número válido de días' });
    }

    try {
        const recommendations = [];

        for (const ticker of tickers) {
            try {
                const data = await getHistoricalData(ticker);
                const { model, max, min } = await trainModel(data);
                const lastPrice = data[data.length - 1].close;

                // Predecir para múltiples días
                const futurePredictions = predictMultipleDays(model, lastPrice, max, min, days);

                // Calcular el rendimiento
                const highestPrediction = Math.max(...futurePredictions.map((p) => p.price));
                const rendimiento = ((highestPrediction - lastPrice) / lastPrice) * 100;

                recommendations.push({
                    ticker,
                    lastPrice,
                    rendimiento: parseFloat(rendimiento.toFixed(2)), // Redondear a 2 decimales
                    futurePredictions,
                });
            } catch (error) {
                console.error(`Error procesando el ticker ${ticker}:`, error.message);
                recommendations.push({
                    ticker,
                    error: `No se pudo generar la recomendación para ${ticker}: ${error.message}`,
                });
            }
        }

        res.status(200).json(recommendations);
    } catch (error) {
        console.error('Error al generar recomendaciones:', error);
        res.status(500).json({ message: 'Error al generar recomendaciones' });
    }
});


// Inicia el servidor
app.listen(port, () => {
    console.log(`Servidor ejecutándose en el puerto ${port}`);
});

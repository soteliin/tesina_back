const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const multer = require('multer');
const { Pool } = require('pg');
const bcrypt = require('bcrypt');

const app = express();
const port = 5000;

app.use(cors());
app.use(bodyParser.json());

const upload = multer();

const pool = new Pool({
    user: 'postgres',
    host: '172.16.129.171',
    database: 'postgres',
    password: 'postgres',
    port: 5432,
});

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
        res.status(500).json({ message: 'Error al crear el usuario' });
    }
});

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

        res.status(200).json({ message: 'Inicio de sesión exitoso', userId: usuario.id_usuario });
    } catch (error) {
        console.error('Error al iniciar sesión:', error);
        res.status(500).json({ message: 'Error al iniciar sesión' });
    }
});


app.listen(port, () => {
    console.log(`Servidor ejecutándose en el puerto ${port}`);
});
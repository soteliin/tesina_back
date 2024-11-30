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

        // Genera un token JWT válido por 1 hora
        const token = jwt.sign({ userId: usuario.id_usuario }, JWT_SECRET, { expiresIn: '1h' });

        res.status(200).json({ 
            message: 'Inicio de sesión exitoso', 
            token, 
            userId: usuario.id_usuario // Incluye el id_usuario en la respuesta
        });
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
    const { tickers, days, investment } = req.body;

    if (!Array.isArray(tickers) || tickers.length === 0) {
        return res.status(400).json({ message: 'Se debe proporcionar una lista de tickers válida' });
    }

    if (!days || days <= 0) {
        return res.status(400).json({ message: 'Se debe proporcionar un número válido de días' });
    }

    if (!investment || investment <= 0) {
        return res.status(400).json({ message: 'Se debe proporcionar un monto válido para la inversión' });
    }

    try {
        const recommendations = [];

        for (const ticker of tickers) {
            try {
                const data = await getHistoricalData(ticker);
                const { model, max, min } = await trainModel(data);
                let lastPrice = data[data.length - 1].close; // Cambiado a "let"

                // Predecir precios futuros
                const futurePredictions = predictMultipleDays(model, lastPrice, max, min, days);

                // Calcular valores de la inversión
                let currentInvestment = investment; // Inicializa la inversión inicial
                for (let i = 0; i < futurePredictions.length; i++) {
                    const prediction = futurePredictions[i];
                    if (i > 0) { // Solo actualizar la inversión a partir del segundo día
                        const rendimientoDia = (prediction.price - lastPrice) / lastPrice; // Rendimiento diario
                        currentInvestment += currentInvestment * rendimientoDia; // Actualiza la inversión acumulada
                    }
                    prediction.investmentValue = currentInvestment.toFixed(2); // Guarda el valor actualizado
                    lastPrice = prediction.price; // Actualiza el precio base
                }

                // Calcular rendimiento total
                const rendimientoTotal =
                    ((futurePredictions[futurePredictions.length - 1].price - data[data.length - 1].close) /
                        data[data.length - 1].close) *
                    100;

                recommendations.push({
                    ticker,
                    lastPrice,
                    rendimiento: parseFloat(rendimientoTotal.toFixed(2)), // Redondeo a 2 decimales
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



// Nueva ruta en el backend
app.post('/finanzas', verifyToken, async (req, res) => {
    try {
      const { salario_mensual, id_usuario } = req.body;
  
      if (!salario_mensual || isNaN(salario_mensual) || salario_mensual <= 0) {
        return res.status(400).json({ message: "Salario mensual inválido" });
      }
  
      // Calcula necesidades, deseos y ahorros
      const necesidades = salario_mensual * 0.5;
      const deseos = salario_mensual * 0.3;
      const ahorros = salario_mensual * 0.2;
  
      // Guarda los datos en la base de datos
      const result = await pool.query(
        `INSERT INTO public.tr_finanzas_personales (id_usuario, salario_mensual, necesidades, deseos, ahorros) 
         VALUES ($1, $2, $3, $4, $5) RETURNING id_finanzas`,
        [id_usuario, salario_mensual, necesidades, deseos, ahorros]
      );
  
      res.status(201).json({
        message: "Datos de finanzas guardados con éxito",
        presupuesto: {
          id: result.rows[0].id_finanzas,
          salario_mensual,
          necesidades,
          deseos,
          ahorros,
        },
      });
    } catch (error) {
      console.error("Error al guardar finanzas:", error);
      res.status(500).json({ message: "Error al guardar los datos de finanzas" });
    }
  });
  

  app.delete('/finanzas/:id', verifyToken, async (req, res) => {
    const { id } = req.params;

    try {
        const result = await pool.query(
            'DELETE FROM public.tr_finanzas_personales WHERE id_finanzas = $1 AND id_usuario = $2 RETURNING *',
            [id, req.userId]
        );

        if (result.rowCount === 0) {
            return res.status(404).json({ message: 'Registro de finanzas no encontrado o no autorizado' });
        }

        res.status(200).json({ message: 'Registro de finanzas eliminado con éxito' });
    } catch (error) {
        console.error('Error al eliminar registro de finanzas:', error);
        res.status(500).json({ message: 'Error al eliminar registro de finanzas' });
    }
});

app.get('/finanzas', verifyToken, async (req, res) => {
    try {
        const result = await pool.query(
            'SELECT id_Finanzas, salario_mensual, necesidades, deseos, ahorros, fecha FROM public.tr_finanzas_personales WHERE id_usuario = $1 ORDER BY fecha DESC',
            [req.userId]
        );

        res.status(200).json({ finanzas: result.rows });
    } catch (error) {
        console.error('Error al obtener finanzas:', error);
        res.status(500).json({ message: 'Error al obtener datos de finanzas' });
    }
});

// Guardar un gasto
app.post('/gastos', verifyToken, async (req, res) => {
    const { monto, fecha_gasto, descripcion, id_tipo_gasto } = req.body;

    if (!monto || !fecha_gasto || !id_tipo_gasto) {
        return res.status(400).json({ message: 'Todos los campos son obligatorios' });
    }

    try {
        const result = await pool.query(
            'INSERT INTO public.tr_gasto (id_usuario, monto, fecha_gasto, descripcion, id_tipo_gasto) VALUES ($1, $2, $3, $4, $5) RETURNING id_gasto',
            [req.userId, monto, fecha_gasto, descripcion || '', id_tipo_gasto]
        );

        res.status(201).json({ message: 'Gasto guardado exitosamente', id_gasto: result.rows[0].id_gasto });
    } catch (error) {
        console.error('Error al guardar gasto:', error);
        res.status(500).json({ message: 'Error al guardar gasto' });
    }
});



// Eliminar deuda
app.delete('/deudas/:id', verifyToken, async (req, res) => {
    const { id } = req.params;

    try {
        const result = await pool.query(
            'DELETE FROM public.tr_deudas WHERE id_deuda = $1 AND id_usuario = $2',
            [id, req.userId]
        );

        if (result.rowCount === 0) {
            return res.status(404).json({ message: "Deuda no encontrada o no autorizada" });
        }

        res.status(200).json({ message: "Deuda eliminada con éxito" });
    } catch (error) {
        console.error('Error al eliminar deuda:', error);
        res.status(500).json({ message: "Error al eliminar la deuda" });
    }
});


// Guardar un ingreso
app.post('/ingresos', verifyToken, async (req, res) => {
    const { monto, fecha_ingreso, descripcion, id_tipo_ingreso } = req.body;

    if (!monto || !fecha_ingreso || !id_tipo_ingreso) {
        return res.status(400).json({ message: 'Todos los campos son obligatorios' });
    }

    try {
        const result = await pool.query(
            'INSERT INTO public.tr_ingreso (id_usuario, monto, fecha_ingreso, descripcion, id_tipo_ingreso) VALUES ($1, $2, $3, $4, $5) RETURNING id_ingreso',
            [req.userId, monto, fecha_ingreso, descripcion || '', id_tipo_ingreso]
        );

        res.status(201).json({ message: 'Ingreso guardado exitosamente', id_ingreso: result.rows[0].id_ingreso });
    } catch (error) {
        console.error('Error al guardar ingreso:', error);
        res.status(500).json({ message: 'Error al guardar ingreso' });
    }
});

// Obtener gastos
app.get('/gastos', verifyToken, async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT g.*, tg.nombre_tipo_gasto 
            FROM public.tr_gasto g
            JOIN public.tc_tipo_gasto tg ON g.id_tipo_gasto = tg.id_tipo_gasto
            WHERE g.id_usuario = $1
            ORDER BY g.fecha_gasto DESC
        `, [req.userId]);

        res.status(200).json({ gastos: result.rows });
    } catch (error) {
        console.error('Error al obtener gastos:', error);
        res.status(500).json({ message: 'Error al obtener gastos' });
    }
});

// Obtener ingresos
app.get('/ingresos', verifyToken, async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT i.*, ti.nombre_tipo_ingreso 
            FROM public.tr_ingreso i
            JOIN public.tc_tipo_ingreso ti ON i.id_tipo_ingreso = ti.id_tipo_ingreso
            WHERE i.id_usuario = $1
            ORDER BY i.fecha_ingreso DESC
        `, [req.userId]);

        res.status(200).json({ ingresos: result.rows });
    } catch (error) {
        console.error('Error al obtener ingresos:', error);
        res.status(500).json({ message: 'Error al obtener ingresos' });
    }
});

// Ruta para eliminar un gasto
app.delete("/gastos/:id", verifyToken, async (req, res) => {
    const { id } = req.params;
  
    try {
      // Verificar si el gasto pertenece al usuario autenticado
      const verifyResult = await pool.query(
        "SELECT id_gasto FROM public.tr_gasto WHERE id_gasto = $1 AND id_usuario = $2",
        [id, req.userId]
      );
  
      if (verifyResult.rows.length === 0) {
        return res.status(404).json({ message: "Gasto no encontrado o no autorizado" });
      }
  
      // Eliminar el gasto
      await pool.query("DELETE FROM public.tr_gasto WHERE id_gasto = $1", [id]);
  
      res.status(200).json({ message: "Gasto eliminado exitosamente" });
    } catch (error) {
      console.error("Error al eliminar gasto:", error);
      res.status(500).json({ message: "Error al eliminar el gasto" });
    }
  });
  

app.delete("/ingresos/:id", verifyToken, async (req, res) => {
    const { id } = req.params;
  
    try {
      const verifyResult = await pool.query(
        "SELECT id_ingreso FROM public.tr_ingreso WHERE id_ingreso = $1 AND id_usuario = $2",
        [id, req.userId]
      );
  
      if (verifyResult.rows.length === 0) {
        console.log(`Ingreso no encontrado: ID ${id}, Usuario ${req.userId}`);
        return res
          .status(404)
          .json({ message: "Ingreso no encontrado o no autorizado" });
      }
  
      await pool.query("DELETE FROM public.tr_ingreso WHERE id_ingreso = $1", [id]);
  
      res.status(200).json({ message: "Ingreso eliminado exitosamente" });
    } catch (error) {
      console.error("Error al eliminar ingreso:", error);
      res.status(500).json({ message: "Error al eliminar el ingreso" });
    }
  });
  


// Endpoint para obtener los tipos de gasto
app.get('/tipo-gasto', verifyToken, async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM public.tc_tipo_gasto');
        res.status(200).json(result.rows);
    } catch (error) {
        console.error('Error al obtener tipos de gasto:', error);
        res.status(500).json({ message: 'Error al obtener los tipos de gasto' });
    }
});

// Endpoint para obtener los tipos de ingreso
app.get('/tipo-ingreso', verifyToken, async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM public.tc_tipo_ingreso');
        res.status(200).json(result.rows);
    } catch (error) {
        console.error('Error al obtener tipos de ingreso:', error);
        res.status(500).json({ message: 'Error al obtener los tipos de ingreso' });
    }
});

// Registrar una nueva deuda
app.post('/deudas', verifyToken, async (req, res) => {
    const { descripcion, monto, fecha_inicio, acreedor } = req.body;

    if (!descripcion || !monto || !fecha_inicio || !acreedor) {
        return res.status(400).json({ message: 'Todos los campos son obligatorios' });
    }

    try {
        const result = await pool.query(
            `INSERT INTO public.tr_deudas (id_usuario, descripcion, monto, fecha_inicio, acreedor) 
            VALUES ($1, $2, $3, $4, $5) RETURNING id_deuda`,
            [req.userId, descripcion, monto, fecha_inicio, acreedor]
        );

        res.status(201).json({ message: 'Deuda registrada con éxito', id_deuda: result.rows[0].id_deuda });
    } catch (error) {
        console.error('Error al registrar deuda:', error);
        res.status(500).json({ message: 'Error al registrar deuda' });
    }
});

// Listar deudas de un usuario
app.get('/deudas', verifyToken, async (req, res) => {
    try {
        const result = await pool.query(
            'SELECT * FROM public.tr_deudas WHERE id_usuario = $1 ORDER BY fecha_inicio DESC',
            [req.userId]
        );

        res.status(200).json(result.rows);
    } catch (error) {
        console.error('Error al obtener deudas:', error);
        res.status(500).json({ message: 'Error al obtener deudas' });
    }
});

// Actualizar estado de deuda
app.put('/deudas/:id', verifyToken, async (req, res) => {
    const { id } = req.params;
    const { estado, fecha_pago } = req.body;

    if (!estado || (estado === 'pagada' && !fecha_pago)) {
        return res.status(400).json({ message: 'Estado y fecha de pago son requeridos' });
    }

    try {
        await pool.query(
            `UPDATE public.tr_deudas SET estado = $1, fecha_pago = $2 WHERE id_deuda = $3 AND id_usuario = $4`,
            [estado, fecha_pago || null, id, req.userId]
        );

        res.status(200).json({ message: 'Deuda actualizada con éxito' });
    } catch (error) {
        console.error('Error al actualizar deuda:', error);
        res.status(500).json({ message: 'Error al actualizar deuda' });
    }
});

app.get('/dashboard/resumen/:mes/:anio', verifyToken, async (req, res) => {
    const { mes, anio } = req.params;

    try {
        const finanzas = await pool.query(
            `SELECT * FROM public.tr_finanzas_personales 
             WHERE id_usuario = $1 
             AND EXTRACT(MONTH FROM fecha) = $2 
             AND EXTRACT(YEAR FROM fecha) = $3`,
            [req.userId, mes, anio]
        );

        const gastos = await pool.query(
            `SELECT * FROM public.tr_gasto 
             WHERE id_usuario = $1 
             AND EXTRACT(MONTH FROM fecha_gasto) = $2 
             AND EXTRACT(YEAR FROM fecha_gasto) = $3`,
            [req.userId, mes, anio]
        );

        const ingresos = await pool.query(
            `SELECT * FROM public.tr_ingreso 
             WHERE id_usuario = $1 
             AND EXTRACT(MONTH FROM fecha_ingreso) = $2 
             AND EXTRACT(YEAR FROM fecha_ingreso) = $3`,
            [req.userId, mes, anio]
        );

        const deudas = await pool.query(
            `SELECT * FROM public.tr_deudas 
             WHERE id_usuario = $1 
             AND EXTRACT(MONTH FROM fecha_inicio) = $2 
             AND EXTRACT(YEAR FROM fecha_inicio) = $3`,
            [req.userId, mes, anio]
        );

        res.status(200).json({
            finanzas: finanzas.rows,
            gastos: gastos.rows,
            ingresos: ingresos.rows,
            deudas: deudas.rows,
        });
    } catch (error) {
        console.error('Error al consolidar el dashboard:', error);
        res.status(500).json({ message: 'Error al consolidar estadísticas' });
    }
});

app.get('/usuario/datos', verifyToken, async (req, res) => {
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

app.put('/usuario/actualizar', verifyToken, async (req, res) => {
    const { nombre } = req.body;

    if (!nombre || nombre.trim() === '') {
        return res.status(400).json({ message: 'El nombre es requerido' });
    }

    try {
        await pool.query(
            'UPDATE public.tr_usuario SET nombre = $1 WHERE id_usuario = $2',
            [nombre, req.userId]
        );

        res.status(200).json({ message: 'Datos actualizados con éxito' });
    } catch (error) {
        console.error('Error al actualizar datos del usuario:', error);
        res.status(500).json({ message: 'Error al actualizar los datos del usuario' });
    }
});

app.post('/usuario/cambiar-contrasena', verifyToken, async (req, res) => {
    const { currentPassword, newPassword } = req.body;

    if (!currentPassword || !newPassword) {
        return res.status(400).json({ message: 'Todos los campos son obligatorios' });
    }

    try {
        const result = await pool.query(
            'SELECT contrasena FROM public.tr_usuario WHERE id_usuario = $1',
            [req.userId]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Usuario no encontrado' });
        }

        const passwordMatch = await bcrypt.compare(currentPassword, result.rows[0].contrasena);

        if (!passwordMatch) {
            return res.status(401).json({ message: 'La contraseña actual es incorrecta' });
        }

        const hashedPassword = await bcrypt.hash(newPassword, 10);

        await pool.query(
            'UPDATE public.tr_usuario SET contrasena = $1 WHERE id_usuario = $2',
            [hashedPassword, req.userId]
        );

        res.status(200).json({ message: 'Contraseña actualizada con éxito' });
    } catch (error) {
        console.error('Error al cambiar la contraseña:', error);
        res.status(500).json({ message: 'Error al cambiar la contraseña' });
    }
});

app.get("/sectores", verifyToken, async (req, res) => {
    try {
      const result = await pool.query("SELECT id_tipo_sector, nombre_tipo_sector FROM public.tc_tipo_sector");
      res.status(200).json(result.rows);
    } catch (error) {
      console.error("Error al obtener los sectores:", error);
      res.status(500).json({ message: "Error al obtener los sectores" });
    }
  });
  


  app.post("/guardar-analisis", verifyToken, async (req, res) => {
    const {
        nombre_empresa,
        ticker,
        id_tipo_sector,
        precio_actual,
        predicciones,
        rendimiento,
        dias_prediccion,
        monto_invertido,
    } = req.body;

    if (!nombre_empresa || !ticker || !id_tipo_sector) {
        return res.status(400).json({ message: "Datos incompletos para guardar el análisis." });
    }

    try {
        // Actualizar si ya existe, insertar si no
        const result = await pool.query(
            `INSERT INTO tr_accion (
                nombre_empresa, ticker, id_tipo_sector, precio_actual,
                predicciones, rendimiento, dias_prediccion, monto_invertido, usuario_id
            ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
            ON CONFLICT (ticker) DO UPDATE
            SET
                nombre_empresa = EXCLUDED.nombre_empresa,
                id_tipo_sector = EXCLUDED.id_tipo_sector,
                precio_actual = EXCLUDED.precio_actual,
                predicciones = EXCLUDED.predicciones,
                rendimiento = EXCLUDED.rendimiento,
                dias_prediccion = EXCLUDED.dias_prediccion,
                monto_invertido = EXCLUDED.monto_invertido,
                usuario_id = EXCLUDED.usuario_id`,
            [
                nombre_empresa,
                ticker,
                id_tipo_sector,
                precio_actual,
                JSON.stringify(predicciones),
                rendimiento,
                dias_prediccion,
                monto_invertido,
                req.userId,
            ]
        );

        res.status(200).json({ message: "Análisis guardado o actualizado exitosamente." });
    } catch (error) {
        console.error("Error al guardar análisis:", error);
        res.status(500).json({ message: "Error al guardar el análisis." });
    }
});

app.get('/analisis-guardados', verifyToken, async (req, res) => {
    const { page = 1, limit = 3, search = '' } = req.query; // Paginación y búsqueda
    const offset = (page - 1) * limit;

    try {
        let baseQuery = `
            SELECT a.id_accion, a.nombre_empresa, a.ticker, a.precio_actual, 
                   a.predicciones, a.rendimiento, a.dias_prediccion, a.monto_invertido, 
                   ts.nombre_tipo_sector 
            FROM public.tr_accion a
            JOIN public.tc_tipo_sector ts ON a.id_tipo_sector = ts.id_tipo_sector
            WHERE a.usuario_id = $1
        `;

        let countQuery = `
            SELECT COUNT(*) 
            FROM public.tr_accion a 
            WHERE a.usuario_id = $1
        `;

        const values = [req.userId];
        if (search) {
            baseQuery += ` AND (LOWER(a.nombre_empresa) LIKE $2 OR LOWER(a.ticker) LIKE $2)`;
            countQuery += ` AND (LOWER(a.nombre_empresa) LIKE $2 OR LOWER(a.ticker) LIKE $2)`;
            values.push(`%${search.toLowerCase()}%`);
        }

        baseQuery += ` ORDER BY a.nombre_empresa ASC LIMIT $${values.length + 1} OFFSET $${values.length + 2}`;
        values.push(limit, offset);

        const result = await pool.query(baseQuery, values);
        const countResult = await pool.query(countQuery, values.slice(0, -2));

        const totalRecords = parseInt(countResult.rows[0].count, 10);
        const totalPages = Math.ceil(totalRecords / limit);

        res.status(200).json({
            data: result.rows,
            pagination: {
                currentPage: parseInt(page, 10),
                totalPages,
                totalRecords,
                limit: parseInt(limit, 10),
            },
        });
    } catch (error) {
        console.error('Error al obtener análisis guardados:', error);
        res.status(500).json({ message: 'Error al obtener análisis guardados' });
    }
});

app.delete('/analisis/:id', verifyToken, async (req, res) => {
    const { id } = req.params;

    try {
        const verifyResult = await pool.query(
            'SELECT id_accion FROM public.tr_accion WHERE id_accion = $1 AND usuario_id = $2',
            [id, req.userId]
        );

        if (verifyResult.rows.length === 0) {
            return res.status(404).json({ message: "Análisis no encontrado o no autorizado" });
        }

        await pool.query('DELETE FROM public.tr_accion WHERE id_accion = $1', [id]);

        res.status(200).json({ message: "Análisis eliminado exitosamente" });
    } catch (error) {
        console.error('Error al eliminar el análisis:', error);
        res.status(500).json({ message: "Error al eliminar el análisis" });
    }
});


app.delete('/usuario/eliminar', verifyToken, async (req, res) => {
    try {
        await pool.query(
            'DELETE FROM public.tr_usuario WHERE id_usuario = $1',
            [req.userId]
        );

        res.status(200).json({ message: 'Cuenta eliminada con éxito' });
    } catch (error) {
        console.error('Error al eliminar la cuenta:', error);
        res.status(500).json({ message: 'Error al eliminar la cuenta' });
    }
});

// Inicia el servidor
app.listen(port, () => {
    console.log(`Servidor ejecutándose en el puerto ${port}`);
});

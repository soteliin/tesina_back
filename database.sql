BEGIN;


CREATE TABLE IF NOT EXISTS public.tc_tipo_gasto
(
    id_tipo_gasto serial NOT NULL,
    nombre_tipo_gasto character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tc_tipo_gasto_pkey PRIMARY KEY (id_tipo_gasto)
);

-- SUGERENCIAS DE INSERT DE CHAT
-- INSERT INTO public.tc_tipo_gasto (nombre_tipo_gasto) VALUES
-- ('Alimentación'),
-- ('Transporte'),
-- ('Vivienda'),
-- ('Salud'),
-- ('Educación'),
-- ('Ocio'),
-- ('Entretenimiento'),
-- ('Hogar y Mantenimiento'),
-- ('Ropa y Accesorios'),
-- ('Regalos y Donaciones'),
-- ('Impuestos'),
-- ('Otros');

CREATE TABLE IF NOT EXISTS public.tc_tipo_ingreso
(
    id_tipo_ingreso serial NOT NULL,
    nombre_tipo_ingreso character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tc_tipo_ingreso_pkey PRIMARY KEY (id_tipo_ingreso)
);

-- SUGERENCIAS DE INSERT DE CHAT
-- INSERT INTO public.tc_tipo_inversion (nombre_tipo_inversion) VALUES
-- ('Acciones'),
-- ('Bonos'),
-- ('Fondos Mutuos'),
-- ('Criptomonedas'),
-- ('Bienes Raíces'),
-- ('Fideicomisos de Inversión'),
-- ('Materias Primas'),
-- ('Cuentas de Ahorro'),
-- ('Otros');

CREATE TABLE IF NOT EXISTS public.tc_tipo_inversion
(
    id_tipo_inversion serial NOT NULL,
    nombre_tipo_inversion character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tc_tipo_inversion_pkey PRIMARY KEY (id_tipo_inversion)
);

-- SUGERENCIAS DE INSERT DE CHAT
-- INSERT INTO public.tc_tipo_inversion (nombre_tipo_inversion) VALUES
-- ('Acciones'),
-- ('Bonos'),
-- ('Fondos Mutuos'),
-- ('Criptomonedas'),
-- ('Bienes Raíces'),
-- ('Fideicomisos de Inversión'),
-- ('Materias Primas'),
-- ('Cuentas de Ahorro'),
-- ('Otros');

CREATE TABLE IF NOT EXISTS public.tc_tipo_sector
(
    id_tipo_sector serial NOT NULL,
    nombre_tipo_sector character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tc_tipo_sector_pkey PRIMARY KEY (id_tipo_sector)
);

-- SUGERENCIAS DE INSERT DE CHAT
-- INSERT INTO public.tc_tipo_sector (nombre_tipo_sector) VALUES
-- ('Tecnología'),
-- ('Finanzas'),
-- ('Salud'),
-- ('Consumo Discrecional'),
-- ('Consumo Básico'),
-- ('Energía'),
-- ('Industrial'),
-- ('Servicios Públicos'),
-- ('Bienes Raíces'),
-- ('Materiales'),
-- ('Telecomunicaciones'),
-- ('Otros');

CREATE TABLE IF NOT EXISTS public.tc_tipo_usuario
(
    id_tipo_usuario serial NOT NULL,
    nombre_tipo_usuario character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tc_tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario)
);

-- SUGERENCIAS DE INSERT DE CHAT
-- INSERT INTO public.tc_tipo_usuario (nombre_tipo_usuario) VALUES
-- ('Administrador'),
-- ('Usuario Estándar'),
-- ('Usuario Premium');

CREATE TABLE IF NOT EXISTS public.tr_accion
(
    id_accion serial NOT NULL,
    nombre_empresa character varying(100) COLLATE pg_catalog."default" NOT NULL,
    ticker character varying(10) COLLATE pg_catalog."default" NOT NULL,
    id_tipo_sector integer NOT NULL,
    precio_actual numeric(12, 2) NOT NULL,
    rendimiento numeric(12, 2) NOT NULL,
    CONSTRAINT tr_accion_pkey PRIMARY KEY (id_accion),
    CONSTRAINT tr_accion_ticker_key UNIQUE (ticker)
);

CREATE TABLE IF NOT EXISTS public.tr_gasto
(
    id_gasto serial NOT NULL,
    id_usuario integer NOT NULL,
    monto numeric(12, 2) NOT NULL,
    fecha_gasto timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descripcion text COLLATE pg_catalog."default",
    id_tipo_gasto integer NOT NULL,
    CONSTRAINT tr_gasto_pkey PRIMARY KEY (id_gasto)
);

CREATE TABLE IF NOT EXISTS public.tr_ingreso
(
    id_ingreso serial NOT NULL,
    id_usuario integer NOT NULL,
    monto numeric(12, 2) NOT NULL,
    fecha_ingreso timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descripcion text COLLATE pg_catalog."default",
    id_tipo_ingreso integer NOT NULL,
    CONSTRAINT tr_ingreso_pkey PRIMARY KEY (id_ingreso)
);

CREATE TABLE IF NOT EXISTS public.tr_inversion
(
    id_inversion serial NOT NULL,
    id_usuario integer NOT NULL,
    cantidad_invertida numeric(12, 2) NOT NULL,
    fecha_inversion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    rendimiento_esperado numeric(12, 2),
    id_tipo_inversion integer NOT NULL,
    CONSTRAINT tr_inversion_pkey PRIMARY KEY (id_inversion)
);

CREATE TABLE IF NOT EXISTS public.tr_recomendacion
(
    id_recomendacion serial NOT NULL,
    id_usuario integer,
    id_tipo_inversion integer NOT NULL,
    id_accion_recomendada integer NOT NULL,
    motivo text COLLATE pg_catalog."default",
    fecha_recomendacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT tr_recomendacion_pkey PRIMARY KEY (id_recomendacion)
);

CREATE TABLE IF NOT EXISTS public.tr_usuario
(
    id_usuario serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(150) COLLATE pg_catalog."default" NOT NULL,
    contrasena text COLLATE pg_catalog."default" NOT NULL,
    fecha_registro timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_tipo_usuario integer NOT NULL,
    CONSTRAINT tr_usuario_pkey PRIMARY KEY (id_usuario),
    CONSTRAINT tr_usuario_email_key UNIQUE (email)
);

ALTER TABLE IF EXISTS public.tr_accion
    ADD CONSTRAINT fk_tipo_sector FOREIGN KEY (id_tipo_sector)
    REFERENCES public.tc_tipo_sector (id_tipo_sector) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.tr_gasto
    ADD CONSTRAINT fk_tipo_gasto FOREIGN KEY (id_tipo_gasto)
    REFERENCES public.tc_tipo_gasto (id_tipo_gasto) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.tr_gasto
    ADD CONSTRAINT fk_usuario_gasto FOREIGN KEY (id_usuario)
    REFERENCES public.tr_usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.tr_ingreso
    ADD CONSTRAINT fk_tipo_ingreso FOREIGN KEY (id_tipo_ingreso)
    REFERENCES public.tc_tipo_ingreso (id_tipo_ingreso) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.tr_ingreso
    ADD CONSTRAINT fk_usuario_ingreso FOREIGN KEY (id_usuario)
    REFERENCES public.tr_usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.tr_inversion
    ADD CONSTRAINT fk_tipo_inversion FOREIGN KEY (id_tipo_inversion)
    REFERENCES public.tc_tipo_inversion (id_tipo_inversion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.tr_inversion
    ADD CONSTRAINT fk_usuario_inversion FOREIGN KEY (id_usuario)
    REFERENCES public.tr_usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.tr_recomendacion
    ADD CONSTRAINT fk_id_accion_recomendada FOREIGN KEY (id_accion_recomendada)
    REFERENCES public.tr_accion (id_accion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;


ALTER TABLE IF EXISTS public.tr_recomendacion
    ADD CONSTRAINT fk_usuario_recomendacion FOREIGN KEY (id_usuario)
    REFERENCES public.tr_usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.tr_usuario
    ADD CONSTRAINT fk_tipo_usuario FOREIGN KEY (id_tipo_usuario)
    REFERENCES public.tc_tipo_usuario (id_tipo_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE SET NULL;

END;
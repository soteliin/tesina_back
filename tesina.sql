--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2024-12-01 18:12:38 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 218 (class 1259 OID 24578)
-- Name: tc_tipo_gasto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tc_tipo_gasto (
    id_tipo_gasto integer NOT NULL,
    nombre_tipo_gasto character varying(50) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 24577)
-- Name: tc_tipo_gasto_id_tipo_gasto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tc_tipo_gasto_id_tipo_gasto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 217
-- Name: tc_tipo_gasto_id_tipo_gasto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tc_tipo_gasto_id_tipo_gasto_seq OWNED BY public.tc_tipo_gasto.id_tipo_gasto;


--
-- TOC entry 220 (class 1259 OID 24585)
-- Name: tc_tipo_ingreso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tc_tipo_ingreso (
    id_tipo_ingreso integer NOT NULL,
    nombre_tipo_ingreso character varying(50) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 24584)
-- Name: tc_tipo_ingreso_id_tipo_ingreso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tc_tipo_ingreso_id_tipo_ingreso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 219
-- Name: tc_tipo_ingreso_id_tipo_ingreso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tc_tipo_ingreso_id_tipo_ingreso_seq OWNED BY public.tc_tipo_ingreso.id_tipo_ingreso;


--
-- TOC entry 222 (class 1259 OID 24592)
-- Name: tc_tipo_inversion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tc_tipo_inversion (
    id_tipo_inversion integer NOT NULL,
    nombre_tipo_inversion character varying(50) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 24591)
-- Name: tc_tipo_inversion_id_tipo_inversion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tc_tipo_inversion_id_tipo_inversion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 221
-- Name: tc_tipo_inversion_id_tipo_inversion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tc_tipo_inversion_id_tipo_inversion_seq OWNED BY public.tc_tipo_inversion.id_tipo_inversion;


--
-- TOC entry 224 (class 1259 OID 24599)
-- Name: tc_tipo_sector; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tc_tipo_sector (
    id_tipo_sector integer NOT NULL,
    nombre_tipo_sector character varying(50) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 24598)
-- Name: tc_tipo_sector_id_tipo_sector_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tc_tipo_sector_id_tipo_sector_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 223
-- Name: tc_tipo_sector_id_tipo_sector_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tc_tipo_sector_id_tipo_sector_seq OWNED BY public.tc_tipo_sector.id_tipo_sector;


--
-- TOC entry 226 (class 1259 OID 24606)
-- Name: tc_tipo_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tc_tipo_usuario (
    id_tipo_usuario integer NOT NULL,
    nombre_tipo_usuario character varying(100) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 24605)
-- Name: tc_tipo_usuario_id_tipo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tc_tipo_usuario_id_tipo_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 225
-- Name: tc_tipo_usuario_id_tipo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tc_tipo_usuario_id_tipo_usuario_seq OWNED BY public.tc_tipo_usuario.id_tipo_usuario;


--
-- TOC entry 228 (class 1259 OID 24613)
-- Name: tr_accion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tr_accion (
    id_accion integer NOT NULL,
    nombre_empresa character varying(100) NOT NULL,
    ticker character varying(20) NOT NULL,
    id_tipo_sector integer NOT NULL,
    precio_actual numeric(12,2) NOT NULL,
    rendimiento numeric(12,2) NOT NULL,
    predicciones json NOT NULL,
    dias_prediccion integer NOT NULL,
    monto_invertido numeric(15,2) NOT NULL,
    usuario_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 24612)
-- Name: tr_accion_id_accion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tr_accion_id_accion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 227
-- Name: tr_accion_id_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tr_accion_id_accion_seq OWNED BY public.tr_accion.id_accion;


--
-- TOC entry 240 (class 1259 OID 24745)
-- Name: tr_deudas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tr_deudas (
    id_deuda integer NOT NULL,
    id_usuario integer NOT NULL,
    descripcion text NOT NULL,
    monto numeric(10,2) NOT NULL,
    fecha_inicio date NOT NULL,
    estado character varying(50) DEFAULT 'pendiente'::character varying,
    acreedor text NOT NULL,
    fecha_pago date
);


--
-- TOC entry 239 (class 1259 OID 24744)
-- Name: tr_deudas_id_deuda_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tr_deudas_id_deuda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 239
-- Name: tr_deudas_id_deuda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tr_deudas_id_deuda_seq OWNED BY public.tr_deudas.id_deuda;


--
-- TOC entry 238 (class 1259 OID 24732)
-- Name: tr_finanzas_personales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tr_finanzas_personales (
    id_finanzas integer NOT NULL,
    id_usuario integer NOT NULL,
    salario_mensual numeric(12,2) NOT NULL,
    necesidades numeric(12,2) NOT NULL,
    deseos numeric(12,2) NOT NULL,
    ahorros numeric(12,2) NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 237 (class 1259 OID 24731)
-- Name: tr_finanzas_personales_id_finanzas_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tr_finanzas_personales_id_finanzas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 237
-- Name: tr_finanzas_personales_id_finanzas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tr_finanzas_personales_id_finanzas_seq OWNED BY public.tr_finanzas_personales.id_finanzas;


--
-- TOC entry 230 (class 1259 OID 24622)
-- Name: tr_gasto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tr_gasto (
    id_gasto integer NOT NULL,
    id_usuario integer NOT NULL,
    monto numeric(12,2) NOT NULL,
    fecha_gasto timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descripcion text,
    id_tipo_gasto integer NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 24621)
-- Name: tr_gasto_id_gasto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tr_gasto_id_gasto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 229
-- Name: tr_gasto_id_gasto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tr_gasto_id_gasto_seq OWNED BY public.tr_gasto.id_gasto;


--
-- TOC entry 232 (class 1259 OID 24632)
-- Name: tr_ingreso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tr_ingreso (
    id_ingreso integer NOT NULL,
    id_usuario integer NOT NULL,
    monto numeric(12,2) NOT NULL,
    fecha_ingreso timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descripcion text,
    id_tipo_ingreso integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 24631)
-- Name: tr_ingreso_id_ingreso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tr_ingreso_id_ingreso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 231
-- Name: tr_ingreso_id_ingreso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tr_ingreso_id_ingreso_seq OWNED BY public.tr_ingreso.id_ingreso;


--
-- TOC entry 234 (class 1259 OID 24642)
-- Name: tr_inversion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tr_inversion (
    id_inversion integer NOT NULL,
    id_usuario integer NOT NULL,
    cantidad_invertida numeric(12,2) NOT NULL,
    fecha_inversion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    rendimiento_esperado numeric(12,2),
    id_tipo_inversion integer NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 24641)
-- Name: tr_inversion_id_inversion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tr_inversion_id_inversion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 233
-- Name: tr_inversion_id_inversion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tr_inversion_id_inversion_seq OWNED BY public.tr_inversion.id_inversion;


--
-- TOC entry 236 (class 1259 OID 24660)
-- Name: tr_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tr_usuario (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    contrasena text NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_tipo_usuario integer NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 24659)
-- Name: tr_usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tr_usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 235
-- Name: tr_usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tr_usuario_id_usuario_seq OWNED BY public.tr_usuario.id_usuario;


--
-- TOC entry 3265 (class 2604 OID 24581)
-- Name: tc_tipo_gasto id_tipo_gasto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_gasto ALTER COLUMN id_tipo_gasto SET DEFAULT nextval('public.tc_tipo_gasto_id_tipo_gasto_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 24588)
-- Name: tc_tipo_ingreso id_tipo_ingreso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_ingreso ALTER COLUMN id_tipo_ingreso SET DEFAULT nextval('public.tc_tipo_ingreso_id_tipo_ingreso_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 24595)
-- Name: tc_tipo_inversion id_tipo_inversion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_inversion ALTER COLUMN id_tipo_inversion SET DEFAULT nextval('public.tc_tipo_inversion_id_tipo_inversion_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 24602)
-- Name: tc_tipo_sector id_tipo_sector; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_sector ALTER COLUMN id_tipo_sector SET DEFAULT nextval('public.tc_tipo_sector_id_tipo_sector_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 24609)
-- Name: tc_tipo_usuario id_tipo_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_usuario ALTER COLUMN id_tipo_usuario SET DEFAULT nextval('public.tc_tipo_usuario_id_tipo_usuario_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 24616)
-- Name: tr_accion id_accion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_accion ALTER COLUMN id_accion SET DEFAULT nextval('public.tr_accion_id_accion_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 24748)
-- Name: tr_deudas id_deuda; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_deudas ALTER COLUMN id_deuda SET DEFAULT nextval('public.tr_deudas_id_deuda_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 24735)
-- Name: tr_finanzas_personales id_finanzas; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_finanzas_personales ALTER COLUMN id_finanzas SET DEFAULT nextval('public.tr_finanzas_personales_id_finanzas_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 24625)
-- Name: tr_gasto id_gasto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_gasto ALTER COLUMN id_gasto SET DEFAULT nextval('public.tr_gasto_id_gasto_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 24635)
-- Name: tr_ingreso id_ingreso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_ingreso ALTER COLUMN id_ingreso SET DEFAULT nextval('public.tr_ingreso_id_ingreso_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 24645)
-- Name: tr_inversion id_inversion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_inversion ALTER COLUMN id_inversion SET DEFAULT nextval('public.tr_inversion_id_inversion_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 24663)
-- Name: tr_usuario id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.tr_usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3468 (class 0 OID 24578)
-- Dependencies: 218
-- Data for Name: tc_tipo_gasto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tc_tipo_gasto (id_tipo_gasto, nombre_tipo_gasto) FROM stdin;
1	Alimentación
2	Transporte
3	Vivienda
4	Salud
5	Educación
6	Ocio
7	Entretenimiento
8	Hogar y Mantenimiento
9	Ropa y Accesorios
10	Regalos y Donaciones
11	Impuestos
12	Otros
\.


--
-- TOC entry 3470 (class 0 OID 24585)
-- Dependencies: 220
-- Data for Name: tc_tipo_ingreso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tc_tipo_ingreso (id_tipo_ingreso, nombre_tipo_ingreso) FROM stdin;
1	Sueldo o Salario
2	Freelance
3	Negocio Propio
4	Bono Anual
5	Comisiones
6	Propinas
7	Renta de Propiedades
8	Dividendos
9	Regalías
10	Intereses Bancarios
11	Venta de Activos
12	Ganancias de Inversiones
13	Herencias o Donaciones
14	Loterías o Concursos
15	Otro
\.


--
-- TOC entry 3472 (class 0 OID 24592)
-- Dependencies: 222
-- Data for Name: tc_tipo_inversion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tc_tipo_inversion (id_tipo_inversion, nombre_tipo_inversion) FROM stdin;
1	Acciones
2	Bonos
3	Fondos Mutuos
4	Criptomonedas
5	Bienes Raíces
6	Fideicomisos de Inversión
7	Materias Primas
8	Cuentas de Ahorro
9	Otros
\.


--
-- TOC entry 3474 (class 0 OID 24599)
-- Dependencies: 224
-- Data for Name: tc_tipo_sector; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tc_tipo_sector (id_tipo_sector, nombre_tipo_sector) FROM stdin;
21	Tecnología
22	Finanzas
23	Salud
24	Consumo Discrecional
25	Consumo Básico
26	Energía
27	Industrial
28	Servicios Públicos
29	Bienes Raíces
30	Materiales
31	Telecomunicaciones
32	Agricultura
33	Turismo
34	Transporte
35	Educación
36	Alimentos y Bebidas
37	Manufactura
38	Automotriz
39	Minería
40	Entretenimiento
1	Otro\n
\.


--
-- TOC entry 3476 (class 0 OID 24606)
-- Dependencies: 226
-- Data for Name: tc_tipo_usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tc_tipo_usuario (id_tipo_usuario, nombre_tipo_usuario) FROM stdin;
1	Administrador
2	Usuario Estándar
3	Usuario Premium
\.


--
-- TOC entry 3478 (class 0 OID 24613)
-- Dependencies: 228
-- Data for Name: tr_accion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tr_accion (id_accion, nombre_empresa, ticker, id_tipo_sector, precio_actual, rendimiento, predicciones, dias_prediccion, monto_invertido, usuario_id) FROM stdin;
3	Ejemplo	WALMEX.MX	21	72.66	34.80	[{"day":1,"date":"2024-11-30","price":53.14904437128181,"investmentValue":"1000.00"},{"day":2,"date":"2024-12-01","price":53.158836028061174,"investmentValue":"1000.18"},{"day":3,"date":"2024-12-02","price":53.788649546190065,"investmentValue":"1012.03"},{"day":4,"date":"2024-12-03","price":54.387380148467955,"investmentValue":"1023.30"},{"day":5,"date":"2024-12-04","price":53.65414268453582,"investmentValue":"1009.50"},{"day":6,"date":"2024-12-05","price":53.450459644508165,"investmentValue":"1005.67"},{"day":7,"date":"2024-12-06","price":54.0108967442549,"investmentValue":"1016.22"},{"day":8,"date":"2024-12-07","price":54.94189588458989,"investmentValue":"1033.73"},{"day":9,"date":"2024-12-08","price":54.71391171107859,"investmentValue":"1029.44"},{"day":10,"date":"2024-12-09","price":53.823311331687506,"investmentValue":"1012.69"},{"day":11,"date":"2024-12-10","price":54.86973217650464,"investmentValue":"1032.37"},{"day":12,"date":"2024-12-11","price":54.29547096227914,"investmentValue":"1021.57"},{"day":13,"date":"2024-12-12","price":53.557290779291606,"investmentValue":"1007.68"},{"day":14,"date":"2024-12-13","price":53.03399168286276,"investmentValue":"997.84"},{"day":15,"date":"2024-12-14","price":52.41786652936334,"investmentValue":"986.24"},{"day":16,"date":"2024-12-15","price":51.89963076018992,"investmentValue":"976.49"},{"day":17,"date":"2024-12-16","price":52.735904643947066,"investmentValue":"992.23"},{"day":18,"date":"2024-12-17","price":53.73276306608498,"investmentValue":"1010.98"},{"day":19,"date":"2024-12-18","price":53.01480149002521,"investmentValue":"997.47"},{"day":20,"date":"2024-12-19","price":52.38711651637691,"investmentValue":"985.66"},{"day":21,"date":"2024-12-20","price":52.8999760718779,"investmentValue":"995.31"},{"day":22,"date":"2024-12-21","price":51.86606059282076,"investmentValue":"975.86"},{"day":23,"date":"2024-12-22","price":52.51633376746378,"investmentValue":"988.10"},{"day":24,"date":"2024-12-23","price":53.34712915107949,"investmentValue":"1003.73"},{"day":25,"date":"2024-12-24","price":52.54571220835928,"investmentValue":"988.65"},{"day":26,"date":"2024-12-25","price":53.47055151169098,"investmentValue":"1006.05"},{"day":27,"date":"2024-12-26","price":53.30222036178401,"investmentValue":"1002.88"},{"day":28,"date":"2024-12-27","price":52.67942363784306,"investmentValue":"991.16"},{"day":29,"date":"2024-12-28","price":52.216157131493304,"investmentValue":"982.45"},{"day":30,"date":"2024-12-29","price":51.609188544999355,"investmentValue":"971.03"},{"day":31,"date":"2024-12-30","price":51.27545812006273,"investmentValue":"964.75"},{"day":32,"date":"2024-12-31","price":51.5191147690304,"investmentValue":"969.33"},{"day":33,"date":"2025-01-01","price":51.12861772017705,"investmentValue":"961.99"},{"day":34,"date":"2025-01-02","price":50.412181176401674,"investmentValue":"948.51"},{"day":35,"date":"2025-01-03","price":49.98050419344133,"investmentValue":"940.38"},{"day":36,"date":"2025-01-04","price":49.29620240918828,"investmentValue":"927.51"},{"day":37,"date":"2025-01-05","price":48.76500793570499,"investmentValue":"917.51"},{"day":38,"date":"2025-01-06","price":49.27384135267512,"investmentValue":"927.09"},{"day":39,"date":"2025-01-07","price":49.25308615202674,"investmentValue":"926.70"},{"day":40,"date":"2025-01-08","price":49.89329757814282,"investmentValue":"938.74"},{"day":41,"date":"2025-01-09","price":50.753889068553164,"investmentValue":"954.94"},{"day":42,"date":"2025-01-10","price":50.185757446014094,"investmentValue":"944.25"},{"day":43,"date":"2025-01-11","price":50.77317146470678,"investmentValue":"955.30"},{"day":44,"date":"2025-01-12","price":50.2494932012449,"investmentValue":"945.44"},{"day":45,"date":"2025-01-13","price":51.125949706817956,"investmentValue":"961.94"},{"day":46,"date":"2025-01-14","price":51.745827030091135,"investmentValue":"973.60"},{"day":47,"date":"2025-01-15","price":52.222837731775634,"investmentValue":"982.57"},{"day":48,"date":"2025-01-16","price":51.4183319595217,"investmentValue":"967.44"},{"day":49,"date":"2025-01-17","price":52.0433408993091,"investmentValue":"979.20"},{"day":50,"date":"2025-01-18","price":52.19767700343844,"investmentValue":"982.10"},{"day":51,"date":"2025-01-19","price":52.08243226172309,"investmentValue":"979.93"},{"day":52,"date":"2025-01-20","price":52.26853940059615,"investmentValue":"983.43"},{"day":53,"date":"2025-01-21","price":51.613247678887184,"investmentValue":"971.10"},{"day":54,"date":"2025-01-22","price":50.617795120424596,"investmentValue":"952.37"},{"day":55,"date":"2025-01-23","price":51.61923737345948,"investmentValue":"971.22"},{"day":56,"date":"2025-01-24","price":52.30392279815605,"investmentValue":"984.10"},{"day":57,"date":"2025-01-25","price":52.917689233348035,"investmentValue":"995.65"},{"day":58,"date":"2025-01-26","price":52.89964295492076,"investmentValue":"995.31"},{"day":59,"date":"2025-01-27","price":53.89916971008171,"investmentValue":"1014.11"},{"day":60,"date":"2025-01-28","price":54.58854704139803,"investmentValue":"1027.08"},{"day":61,"date":"2025-01-29","price":55.416080604558275,"investmentValue":"1042.65"},{"day":62,"date":"2025-01-30","price":55.930312242623664,"investmentValue":"1052.33"},{"day":63,"date":"2025-01-31","price":55.75402947752603,"investmentValue":"1049.01"},{"day":64,"date":"2025-02-01","price":56.15044431579333,"investmentValue":"1056.47"},{"day":65,"date":"2025-02-02","price":56.730155283449136,"investmentValue":"1067.38"},{"day":66,"date":"2025-02-03","price":55.74315528933168,"investmentValue":"1048.81"},{"day":67,"date":"2025-02-04","price":56.598009776726705,"investmentValue":"1064.89"},{"day":68,"date":"2025-02-05","price":57.69803540301239,"investmentValue":"1085.59"},{"day":69,"date":"2025-02-06","price":58.57870691816475,"investmentValue":"1102.16"},{"day":70,"date":"2025-02-07","price":59.71525780875784,"investmentValue":"1123.54"},{"day":71,"date":"2025-02-08","price":59.44079780902349,"investmentValue":"1118.38"},{"day":72,"date":"2025-02-09","price":60.12122461376697,"investmentValue":"1131.18"},{"day":73,"date":"2025-02-10","price":61.06153393407856,"investmentValue":"1148.87"},{"day":74,"date":"2025-02-11","price":61.23495753712655,"investmentValue":"1152.14"},{"day":75,"date":"2025-02-12","price":61.290355800396014,"investmentValue":"1153.18"},{"day":76,"date":"2025-02-13","price":60.19691591449947,"investmentValue":"1132.61"},{"day":77,"date":"2025-02-14","price":60.802416683119844,"investmentValue":"1144.00"},{"day":78,"date":"2025-02-15","price":60.90637539483582,"investmentValue":"1145.95"},{"day":79,"date":"2025-02-16","price":60.983925581245465,"investmentValue":"1147.41"},{"day":80,"date":"2025-02-17","price":60.68303497387145,"investmentValue":"1141.75"},{"day":81,"date":"2025-02-18","price":61.19248543786521,"investmentValue":"1151.34"},{"day":82,"date":"2025-02-19","price":60.35481011016591,"investmentValue":"1135.58"},{"day":83,"date":"2025-02-20","price":61.379457706774105,"investmentValue":"1154.86"},{"day":84,"date":"2025-02-21","price":61.231465708778686,"investmentValue":"1152.07"},{"day":85,"date":"2025-02-22","price":61.88911732425301,"investmentValue":"1164.44"},{"day":86,"date":"2025-02-23","price":61.47409281069497,"investmentValue":"1156.64"},{"day":87,"date":"2025-02-24","price":60.51384724996494,"investmentValue":"1138.57"},{"day":88,"date":"2025-02-25","price":60.271935695170065,"investmentValue":"1134.02"},{"day":89,"date":"2025-02-26","price":59.16758419435312,"investmentValue":"1113.24"},{"day":90,"date":"2025-02-27","price":59.93956258997857,"investmentValue":"1127.76"},{"day":91,"date":"2025-02-28","price":61.05304707786485,"investmentValue":"1148.71"},{"day":92,"date":"2025-03-01","price":60.77576749005469,"investmentValue":"1143.50"},{"day":93,"date":"2025-03-02","price":61.26317702198446,"investmentValue":"1152.67"},{"day":94,"date":"2025-03-03","price":62.07110217306623,"investmentValue":"1167.87"},{"day":95,"date":"2025-03-04","price":63.2943665821605,"investmentValue":"1190.88"},{"day":96,"date":"2025-03-05","price":63.66901191373503,"investmentValue":"1197.93"},{"day":97,"date":"2025-03-06","price":64.94717253175217,"investmentValue":"1221.98"},{"day":98,"date":"2025-03-07","price":64.05189899115298,"investmentValue":"1205.14"},{"day":99,"date":"2025-03-08","price":64.01604962378478,"investmentValue":"1204.46"},{"day":100,"date":"2025-03-09","price":62.86899634847701,"investmentValue":"1182.88"},{"day":101,"date":"2025-03-10","price":62.86958304338298,"investmentValue":"1182.89"},{"day":102,"date":"2025-03-11","price":63.86849710486806,"investmentValue":"1201.69"},{"day":103,"date":"2025-03-12","price":63.25891221716551,"investmentValue":"1190.22"},{"day":104,"date":"2025-03-13","price":62.10291812655829,"investmentValue":"1168.47"},{"day":105,"date":"2025-03-14","price":62.22849873655121,"investmentValue":"1170.83"},{"day":106,"date":"2025-03-15","price":63.26108650602997,"investmentValue":"1190.26"},{"day":107,"date":"2025-03-16","price":64.33362119350247,"investmentValue":"1210.44"},{"day":108,"date":"2025-03-17","price":65.0058204323006,"investmentValue":"1223.09"},{"day":109,"date":"2025-03-18","price":65.02893112130128,"investmentValue":"1223.52"},{"day":110,"date":"2025-03-19","price":64.8448448006457,"investmentValue":"1220.06"},{"day":111,"date":"2025-03-20","price":64.79777517984652,"investmentValue":"1219.17"},{"day":112,"date":"2025-03-21","price":65.31938646165324,"investmentValue":"1228.99"},{"day":113,"date":"2025-03-22","price":64.68990704317584,"investmentValue":"1217.14"},{"day":114,"date":"2025-03-23","price":64.77070336722336,"investmentValue":"1218.66"},{"day":115,"date":"2025-03-24","price":66.01873455455767,"investmentValue":"1242.14"},{"day":116,"date":"2025-03-25","price":65.82965710181398,"investmentValue":"1238.59"},{"day":117,"date":"2025-03-26","price":67.08888671696856,"investmentValue":"1262.28"},{"day":118,"date":"2025-03-27","price":68.27982164670959,"investmentValue":"1284.69"},{"day":119,"date":"2025-03-28","price":68.78150233770772,"investmentValue":"1294.12"},{"day":120,"date":"2025-03-29","price":67.55472676890653,"investmentValue":"1271.04"},{"day":121,"date":"2025-03-30","price":68.65807530398048,"investmentValue":"1291.80"},{"day":122,"date":"2025-03-31","price":67.87841836949029,"investmentValue":"1277.13"},{"day":123,"date":"2025-04-01","price":67.78004469440336,"investmentValue":"1275.28"},{"day":124,"date":"2025-04-02","price":66.46590505818106,"investmentValue":"1250.56"},{"day":125,"date":"2025-04-03","price":65.68297802701443,"investmentValue":"1235.83"},{"day":126,"date":"2025-04-04","price":64.46969739255309,"investmentValue":"1213.00"},{"day":127,"date":"2025-04-05","price":65.7233821855872,"investmentValue":"1236.59"},{"day":128,"date":"2025-04-06","price":65.0750921027848,"investmentValue":"1224.39"},{"day":129,"date":"2025-04-07","price":65.23163094020845,"investmentValue":"1227.33"},{"day":130,"date":"2025-04-08","price":66.35986139043506,"investmentValue":"1248.56"},{"day":131,"date":"2025-04-09","price":65.65598148680957,"investmentValue":"1235.32"},{"day":132,"date":"2025-04-10","price":65.67220890701229,"investmentValue":"1235.62"},{"day":133,"date":"2025-04-11","price":64.62897558689227,"investmentValue":"1216.00"},{"day":134,"date":"2025-04-12","price":64.10259513341715,"investmentValue":"1206.09"},{"day":135,"date":"2025-04-13","price":65.39547849693992,"investmentValue":"1230.42"},{"day":136,"date":"2025-04-14","price":66.20507195714535,"investmentValue":"1245.65"},{"day":137,"date":"2025-04-15","price":66.77315006735046,"investmentValue":"1256.34"},{"day":138,"date":"2025-04-16","price":65.8381971717714,"investmentValue":"1238.75"},{"day":139,"date":"2025-04-17","price":64.86396369318055,"investmentValue":"1220.42"},{"day":140,"date":"2025-04-18","price":64.95144251482535,"investmentValue":"1222.06"},{"day":141,"date":"2025-04-19","price":65.46546857055226,"investmentValue":"1231.73"},{"day":142,"date":"2025-04-20","price":65.88272877178566,"investmentValue":"1239.58"},{"day":143,"date":"2025-04-21","price":65.7791907847839,"investmentValue":"1237.64"},{"day":144,"date":"2025-04-22","price":64.90887671095082,"investmentValue":"1221.26"},{"day":145,"date":"2025-04-23","price":65.4513925834895,"investmentValue":"1231.47"},{"day":146,"date":"2025-04-24","price":66.0422767651925,"investmentValue":"1242.59"},{"day":147,"date":"2025-04-25","price":66.32757584925149,"investmentValue":"1247.95"},{"day":148,"date":"2025-04-26","price":66.29018116586911,"investmentValue":"1247.25"},{"day":149,"date":"2025-04-27","price":65.0613326688563,"investmentValue":"1224.13"},{"day":150,"date":"2025-04-28","price":65.1351080325711,"investmentValue":"1225.52"},{"day":151,"date":"2025-04-29","price":65.59983827131266,"investmentValue":"1234.26"},{"day":152,"date":"2025-04-30","price":65.96026625759417,"investmentValue":"1241.04"},{"day":153,"date":"2025-05-01","price":67.01094170623807,"investmentValue":"1260.81"},{"day":154,"date":"2025-05-02","price":66.29348128009083,"investmentValue":"1247.31"},{"day":155,"date":"2025-05-03","price":66.68523123503924,"investmentValue":"1254.68"},{"day":156,"date":"2025-05-04","price":65.539116282556,"investmentValue":"1233.12"},{"day":157,"date":"2025-05-05","price":64.8228325216269,"investmentValue":"1219.64"},{"day":158,"date":"2025-05-06","price":65.43433054931054,"investmentValue":"1231.15"},{"day":159,"date":"2025-05-07","price":65.84623620753932,"investmentValue":"1238.90"},{"day":160,"date":"2025-05-08","price":64.83891950539503,"investmentValue":"1219.95"},{"day":161,"date":"2025-05-09","price":64.89367032369016,"investmentValue":"1220.98"},{"day":162,"date":"2025-05-10","price":65.08215237733951,"investmentValue":"1224.52"},{"day":163,"date":"2025-05-11","price":64.11222642309339,"investmentValue":"1206.27"},{"day":164,"date":"2025-05-12","price":64.35647959954619,"investmentValue":"1210.87"},{"day":165,"date":"2025-05-13","price":63.67490548647672,"investmentValue":"1198.04"},{"day":166,"date":"2025-05-14","price":64.17284034609352,"investmentValue":"1207.41"},{"day":167,"date":"2025-05-15","price":64.18165213737099,"investmentValue":"1207.58"},{"day":168,"date":"2025-05-16","price":65.35946856974664,"investmentValue":"1229.74"},{"day":169,"date":"2025-05-17","price":64.99431890277349,"investmentValue":"1222.87"},{"day":170,"date":"2025-05-18","price":64.87130917386229,"investmentValue":"1220.55"},{"day":171,"date":"2025-05-19","price":65.84327672995309,"investmentValue":"1238.84"},{"day":172,"date":"2025-05-20","price":66.17449171303309,"investmentValue":"1245.07"},{"day":173,"date":"2025-05-21","price":65.87805562180532,"investmentValue":"1239.50"},{"day":174,"date":"2025-05-22","price":65.19827891605551,"investmentValue":"1226.71"},{"day":175,"date":"2025-05-23","price":65.68840324482234,"investmentValue":"1235.93"},{"day":176,"date":"2025-05-24","price":64.73425433519505,"investmentValue":"1217.98"},{"day":177,"date":"2025-05-25","price":64.80446794253471,"investmentValue":"1219.30"},{"day":178,"date":"2025-05-26","price":66.06706106655565,"investmentValue":"1243.05"},{"day":179,"date":"2025-05-27","price":66.68863574168603,"investmentValue":"1254.75"},{"day":180,"date":"2025-05-28","price":67.97657749133985,"investmentValue":"1278.98"},{"day":181,"date":"2025-05-29","price":68.96823105353064,"investmentValue":"1297.64"},{"day":182,"date":"2025-05-30","price":68.11437506379866,"investmentValue":"1281.57"},{"day":183,"date":"2025-05-31","price":67.8954003277824,"investmentValue":"1277.45"},{"day":184,"date":"2025-06-01","price":67.01445227529165,"investmentValue":"1260.88"},{"day":185,"date":"2025-06-02","price":65.99235977634277,"investmentValue":"1241.65"},{"day":186,"date":"2025-06-03","price":66.56836597363828,"investmentValue":"1252.48"},{"day":187,"date":"2025-06-04","price":67.16914253239563,"investmentValue":"1263.79"},{"day":188,"date":"2025-06-05","price":66.83116221662958,"investmentValue":"1257.43"},{"day":189,"date":"2025-06-06","price":65.6737478158847,"investmentValue":"1235.65"},{"day":190,"date":"2025-06-07","price":66.0762063336605,"investmentValue":"1243.22"},{"day":191,"date":"2025-06-08","price":66.56391647456698,"investmentValue":"1252.40"},{"day":192,"date":"2025-06-09","price":66.2693652488948,"investmentValue":"1246.86"},{"day":193,"date":"2025-06-10","price":67.20817730346072,"investmentValue":"1264.52"},{"day":194,"date":"2025-06-11","price":66.8268679315485,"investmentValue":"1257.35"},{"day":195,"date":"2025-06-12","price":68.16621205086557,"investmentValue":"1282.55"},{"day":196,"date":"2025-06-13","price":67.51377854608573,"investmentValue":"1270.27"},{"day":197,"date":"2025-06-14","price":67.30796318251403,"investmentValue":"1266.40"},{"day":198,"date":"2025-06-15","price":67.58323396617295,"investmentValue":"1271.58"},{"day":199,"date":"2025-06-16","price":68.20368947997645,"investmentValue":"1283.25"},{"day":200,"date":"2025-06-17","price":67.43349250272742,"investmentValue":"1268.76"},{"day":201,"date":"2025-06-18","price":67.34769810867503,"investmentValue":"1267.15"},{"day":202,"date":"2025-06-19","price":68.13387885206897,"investmentValue":"1281.94"},{"day":203,"date":"2025-06-20","price":67.61876116842696,"investmentValue":"1272.25"},{"day":204,"date":"2025-06-21","price":68.78615467114575,"investmentValue":"1294.21"},{"day":205,"date":"2025-06-22","price":69.2645219685147,"investmentValue":"1303.21"},{"day":206,"date":"2025-06-23","price":70.57369636827067,"investmentValue":"1327.85"},{"day":207,"date":"2025-06-24","price":71.57658163150046,"investmentValue":"1346.71"},{"day":208,"date":"2025-06-25","price":70.54678666378875,"investmentValue":"1327.34"},{"day":209,"date":"2025-06-26","price":69.6098540370084,"investmentValue":"1309.71"},{"day":210,"date":"2025-06-27","price":70.91449211782732,"investmentValue":"1334.26"},{"day":211,"date":"2025-06-28","price":71.18485959462421,"investmentValue":"1339.34"},{"day":212,"date":"2025-06-29","price":72.1085745120974,"investmentValue":"1356.72"},{"day":213,"date":"2025-06-30","price":70.92687386995306,"investmentValue":"1334.49"},{"day":214,"date":"2025-07-01","price":71.34175391438126,"investmentValue":"1342.30"},{"day":215,"date":"2025-07-02","price":70.58373582762466,"investmentValue":"1328.03"},{"day":216,"date":"2025-07-03","price":71.08803266913698,"investmentValue":"1337.52"},{"day":217,"date":"2025-07-04","price":71.39056693428988,"investmentValue":"1343.21"},{"day":218,"date":"2025-07-05","price":70.41884760144153,"investmentValue":"1324.93"},{"day":219,"date":"2025-07-06","price":70.74938863715049,"investmentValue":"1331.15"},{"day":220,"date":"2025-07-07","price":70.82127731444233,"investmentValue":"1332.50"},{"day":221,"date":"2025-07-08","price":70.8972935533523,"investmentValue":"1333.93"},{"day":222,"date":"2025-07-09","price":69.78461039043371,"investmentValue":"1313.00"},{"day":223,"date":"2025-07-10","price":71.06024645440732,"investmentValue":"1337.00"},{"day":224,"date":"2025-07-11","price":71.11085450212641,"investmentValue":"1337.95"},{"day":225,"date":"2025-07-12","price":69.73532861706182,"investmentValue":"1312.07"},{"day":226,"date":"2025-07-13","price":68.90170069145569,"investmentValue":"1296.39"},{"day":227,"date":"2025-07-14","price":68.42029540703928,"investmentValue":"1287.33"},{"day":228,"date":"2025-07-15","price":68.95717047309134,"investmentValue":"1297.43"},{"day":229,"date":"2025-07-16","price":69.64033961323716,"investmentValue":"1310.28"},{"day":230,"date":"2025-07-17","price":68.59773573514417,"investmentValue":"1290.67"},{"day":231,"date":"2025-07-18","price":67.61849397708276,"investmentValue":"1272.24"},{"day":232,"date":"2025-07-19","price":67.13937047974864,"investmentValue":"1263.23"},{"day":233,"date":"2025-07-20","price":68.38246597373498,"investmentValue":"1286.62"},{"day":234,"date":"2025-07-21","price":69.04693980552099,"investmentValue":"1299.12"},{"day":235,"date":"2025-07-22","price":69.56284531066152,"investmentValue":"1308.83"},{"day":236,"date":"2025-07-23","price":69.05097690380327,"investmentValue":"1299.20"},{"day":237,"date":"2025-07-24","price":69.27792594587496,"investmentValue":"1303.47"},{"day":238,"date":"2025-07-25","price":68.10353538140751,"investmentValue":"1281.37"},{"day":239,"date":"2025-07-26","price":68.51240509533478,"investmentValue":"1289.06"},{"day":240,"date":"2025-07-27","price":68.6859549233585,"investmentValue":"1292.33"},{"day":241,"date":"2025-07-28","price":68.13471191861613,"investmentValue":"1281.96"},{"day":242,"date":"2025-07-29","price":67.98021230876786,"investmentValue":"1279.05"},{"day":243,"date":"2025-07-30","price":67.02261984608343,"investmentValue":"1261.03"},{"day":244,"date":"2025-07-31","price":66.48740371324058,"investmentValue":"1250.96"},{"day":245,"date":"2025-08-01","price":66.92281538402719,"investmentValue":"1259.15"},{"day":246,"date":"2025-08-02","price":67.8425184207114,"investmentValue":"1276.46"},{"day":247,"date":"2025-08-03","price":68.65467937775371,"investmentValue":"1291.74"},{"day":248,"date":"2025-08-04","price":69.47719468815033,"investmentValue":"1307.21"},{"day":249,"date":"2025-08-05","price":69.18608227354305,"investmentValue":"1301.74"},{"day":250,"date":"2025-08-06","price":68.78624866352108,"investmentValue":"1294.21"},{"day":251,"date":"2025-08-07","price":68.87668913398065,"investmentValue":"1295.92"},{"day":252,"date":"2025-08-08","price":69.61967381608522,"investmentValue":"1309.90"},{"day":253,"date":"2025-08-09","price":70.46957646245602,"investmentValue":"1325.89"},{"day":254,"date":"2025-08-10","price":69.75442165626798,"investmentValue":"1312.43"},{"day":255,"date":"2025-08-11","price":70.98759383006495,"investmentValue":"1335.63"},{"day":256,"date":"2025-08-12","price":71.41998898420846,"investmentValue":"1343.77"},{"day":257,"date":"2025-08-13","price":72.47819924245381,"investmentValue":"1363.68"},{"day":258,"date":"2025-08-14","price":72.12398544834197,"investmentValue":"1357.01"},{"day":259,"date":"2025-08-15","price":72.6533569939554,"investmentValue":"1366.97"},{"day":260,"date":"2025-08-16","price":71.53670869380659,"investmentValue":"1345.96"},{"day":261,"date":"2025-08-17","price":72.74574999289705,"investmentValue":"1368.71"},{"day":262,"date":"2025-08-18","price":73.84749454215331,"investmentValue":"1389.44"},{"day":263,"date":"2025-08-19","price":74.88907074361339,"investmentValue":"1409.04"},{"day":264,"date":"2025-08-20","price":73.75462780225794,"investmentValue":"1387.69"},{"day":265,"date":"2025-08-21","price":73.86671972491165,"investmentValue":"1389.80"},{"day":266,"date":"2025-08-22","price":75.05365187907088,"investmentValue":"1412.14"},{"day":267,"date":"2025-08-23","price":74.0285611798023,"investmentValue":"1392.85"},{"day":268,"date":"2025-08-24","price":73.23226021880139,"investmentValue":"1377.87"},{"day":269,"date":"2025-08-25","price":72.81716589516492,"investmentValue":"1370.06"},{"day":270,"date":"2025-08-26","price":73.42587078129313,"investmentValue":"1381.51"},{"day":271,"date":"2025-08-27","price":72.73947647917014,"investmentValue":"1368.59"},{"day":272,"date":"2025-08-28","price":72.96218621644807,"investmentValue":"1372.78"},{"day":273,"date":"2025-08-29","price":72.90382317700492,"investmentValue":"1371.69"},{"day":274,"date":"2025-08-30","price":71.8420975556275,"investmentValue":"1351.71"},{"day":275,"date":"2025-08-31","price":71.06038280836167,"investmentValue":"1337.00"},{"day":276,"date":"2025-09-01","price":71.93178666305272,"investmentValue":"1353.40"},{"day":277,"date":"2025-09-02","price":70.52052373687428,"investmentValue":"1326.84"},{"day":278,"date":"2025-09-03","price":71.00704105803821,"investmentValue":"1336.00"},{"day":279,"date":"2025-09-04","price":70.27323941535487,"investmentValue":"1322.19"},{"day":280,"date":"2025-09-05","price":71.52692636855294,"investmentValue":"1345.78"},{"day":281,"date":"2025-09-06","price":70.21701297954397,"investmentValue":"1321.13"},{"day":282,"date":"2025-09-07","price":71.50425939694946,"investmentValue":"1345.35"},{"day":283,"date":"2025-09-08","price":70.15600047442653,"investmentValue":"1319.99"},{"day":284,"date":"2025-09-09","price":71.10768810201027,"investmentValue":"1337.89"},{"day":285,"date":"2025-09-10","price":69.79917039709167,"investmentValue":"1313.27"},{"day":286,"date":"2025-09-11","price":69.99303765082627,"investmentValue":"1316.92"},{"day":287,"date":"2025-09-12","price":70.29785133233963,"investmentValue":"1322.66"},{"day":288,"date":"2025-09-13","price":71.27972692215324,"investmentValue":"1341.13"},{"day":289,"date":"2025-09-14","price":70.42727833132318,"investmentValue":"1325.09"},{"day":290,"date":"2025-09-15","price":71.2894510951484,"investmentValue":"1341.31"},{"day":291,"date":"2025-09-16","price":70.66146099802178,"investmentValue":"1329.50"},{"day":292,"date":"2025-09-17","price":71.43544069001524,"investmentValue":"1344.06"},{"day":293,"date":"2025-09-18","price":70.89113762375786,"investmentValue":"1333.82"},{"day":294,"date":"2025-09-19","price":72.19629396943884,"investmentValue":"1358.37"},{"day":295,"date":"2025-09-20","price":73.02444677307562,"investmentValue":"1373.96"},{"day":296,"date":"2025-09-21","price":73.29597376515507,"investmentValue":"1379.06"},{"day":297,"date":"2025-09-22","price":74.37321806182291,"investmentValue":"1399.33"},{"day":298,"date":"2025-09-23","price":74.0716500969288,"investmentValue":"1393.66"},{"day":299,"date":"2025-09-24","price":74.23321782124377,"investmentValue":"1396.70"},{"day":300,"date":"2025-09-25","price":75.23626831021608,"investmentValue":"1415.57"},{"day":301,"date":"2025-09-26","price":73.6630983103838,"investmentValue":"1385.97"},{"day":302,"date":"2025-09-27","price":74.69811290039146,"investmentValue":"1405.45"},{"day":303,"date":"2025-09-28","price":73.53319419002227,"investmentValue":"1383.53"},{"day":304,"date":"2025-09-29","price":72.7564583901636,"investmentValue":"1368.91"},{"day":305,"date":"2025-09-30","price":72.65087678604114,"investmentValue":"1366.93"},{"day":306,"date":"2025-10-01","price":71.35384193484785,"investmentValue":"1342.52"},{"day":307,"date":"2025-10-02","price":70.55911570479738,"investmentValue":"1327.57"},{"day":308,"date":"2025-10-03","price":70.509111547555,"investmentValue":"1326.63"},{"day":309,"date":"2025-10-04","price":70.93706142948359,"investmentValue":"1334.68"},{"day":310,"date":"2025-10-05","price":70.55709125527015,"investmentValue":"1327.53"},{"day":311,"date":"2025-10-06","price":70.33357014187361,"investmentValue":"1323.33"},{"day":312,"date":"2025-10-07","price":71.20414920787645,"investmentValue":"1339.71"},{"day":313,"date":"2025-10-08","price":70.09584368136257,"investmentValue":"1318.85"},{"day":314,"date":"2025-10-09","price":70.0273594924825,"investmentValue":"1317.57"},{"day":315,"date":"2025-10-10","price":70.92995997119368,"investmentValue":"1334.55"},{"day":316,"date":"2025-10-11","price":70.72631756311415,"investmentValue":"1330.72"},{"day":317,"date":"2025-10-12","price":71.74062852560647,"investmentValue":"1349.80"},{"day":318,"date":"2025-10-13","price":70.35807368243626,"investmentValue":"1323.79"},{"day":319,"date":"2025-10-14","price":69.15609360925906,"investmentValue":"1301.17"},{"day":320,"date":"2025-10-15","price":69.43641784961126,"investmentValue":"1306.45"},{"day":321,"date":"2025-10-16","price":70.64401722142136,"investmentValue":"1329.17"},{"day":322,"date":"2025-10-17","price":70.65701410638088,"investmentValue":"1329.41"},{"day":323,"date":"2025-10-18","price":69.79529008225431,"investmentValue":"1313.20"},{"day":324,"date":"2025-10-19","price":70.07192807958519,"investmentValue":"1318.40"},{"day":325,"date":"2025-10-20","price":69.70662814366533,"investmentValue":"1311.53"},{"day":326,"date":"2025-10-21","price":70.85623056102968,"investmentValue":"1333.16"},{"day":327,"date":"2025-10-22","price":70.47987837611173,"investmentValue":"1326.08"},{"day":328,"date":"2025-10-23","price":69.47587329506867,"investmentValue":"1307.19"},{"day":329,"date":"2025-10-24","price":70.64675222872522,"investmentValue":"1329.22"},{"day":330,"date":"2025-10-25","price":71.03862817301192,"investmentValue":"1336.59"},{"day":331,"date":"2025-10-26","price":72.04202584646794,"investmentValue":"1355.47"},{"day":332,"date":"2025-10-27","price":71.42882145437288,"investmentValue":"1343.93"},{"day":333,"date":"2025-10-28","price":71.70555221727477,"investmentValue":"1349.14"},{"day":334,"date":"2025-10-29","price":73.0097577774125,"investmentValue":"1373.68"},{"day":335,"date":"2025-10-30","price":72.58860135989366,"investmentValue":"1365.76"},{"day":336,"date":"2025-10-31","price":73.37040598563468,"investmentValue":"1380.47"},{"day":337,"date":"2025-11-01","price":74.1107453942484,"investmentValue":"1394.39"},{"day":338,"date":"2025-11-02","price":74.30327074236683,"investmentValue":"1398.02"},{"day":339,"date":"2025-11-03","price":73.29561420446242,"investmentValue":"1379.06"},{"day":340,"date":"2025-11-04","price":72.6025949897487,"investmentValue":"1366.02"},{"day":341,"date":"2025-11-05","price":72.78383552617193,"investmentValue":"1369.43"},{"day":342,"date":"2025-11-06","price":71.8475878198363,"investmentValue":"1351.81"},{"day":343,"date":"2025-11-07","price":72.62086738456932,"investmentValue":"1366.36"},{"day":344,"date":"2025-11-08","price":73.96338363205602,"investmentValue":"1391.62"},{"day":345,"date":"2025-11-09","price":75.05250024813922,"investmentValue":"1412.11"},{"day":346,"date":"2025-11-10","price":75.7292979972002,"investmentValue":"1424.85"},{"day":347,"date":"2025-11-11","price":74.87111945130425,"investmentValue":"1408.70"},{"day":348,"date":"2025-11-12","price":74.96160011090703,"investmentValue":"1410.40"},{"day":349,"date":"2025-11-13","price":73.56398284275426,"investmentValue":"1384.11"},{"day":350,"date":"2025-11-14","price":74.6528164666419,"investmentValue":"1404.59"},{"day":351,"date":"2025-11-15","price":73.8203481640711,"investmentValue":"1388.93"},{"day":352,"date":"2025-11-16","price":74.5454634265717,"investmentValue":"1402.57"},{"day":353,"date":"2025-11-17","price":73.47215152385344,"investmentValue":"1382.38"},{"day":354,"date":"2025-11-18","price":74.39090810707978,"investmentValue":"1399.67"},{"day":355,"date":"2025-11-19","price":74.94977299841193,"investmentValue":"1410.18"},{"day":356,"date":"2025-11-20","price":75.35928037899971,"investmentValue":"1417.89"},{"day":357,"date":"2025-11-21","price":74.62851967903872,"investmentValue":"1404.14"},{"day":358,"date":"2025-11-22","price":75.44300431830844,"investmentValue":"1419.46"},{"day":359,"date":"2025-11-23","price":74.48816848759179,"investmentValue":"1401.50"},{"day":360,"date":"2025-11-24","price":75.28625010005125,"investmentValue":"1416.51"},{"day":361,"date":"2025-11-25","price":74.72070117157104,"investmentValue":"1405.87"},{"day":362,"date":"2025-11-26","price":73.88194219893188,"investmentValue":"1390.09"},{"day":363,"date":"2025-11-27","price":73.30929448841373,"investmentValue":"1379.32"},{"day":364,"date":"2025-11-28","price":72.35641553802695,"investmentValue":"1361.39"},{"day":365,"date":"2025-11-29","price":72.65748762846682,"investmentValue":"1367.05"}]	365	1000.00	2
17	FEMSA	FEMSAUBD.MX	28	172.89	-3.33	[{"day":1,"date":"2024-11-30","price":176.05056153886082,"investmentValue":"1000.00"},{"day":2,"date":"2024-12-01","price":177.73361334913966,"investmentValue":"1009.56"},{"day":3,"date":"2024-12-02","price":177.2459182446507,"investmentValue":"1006.79"},{"day":4,"date":"2024-12-03","price":179.6325529141597,"investmentValue":"1020.35"},{"day":5,"date":"2024-12-04","price":181.96290872469086,"investmentValue":"1033.58"},{"day":6,"date":"2024-12-05","price":184.72348416659742,"investmentValue":"1049.26"},{"day":7,"date":"2024-12-06","price":184.29494572848589,"investmentValue":"1046.83"},{"day":8,"date":"2024-12-07","price":181.34499592749327,"investmentValue":"1030.07"},{"day":9,"date":"2024-12-08","price":180.39896228158133,"investmentValue":"1024.70"},{"day":10,"date":"2024-12-09","price":182.0693314680083,"investmentValue":"1034.19"},{"day":11,"date":"2024-12-10","price":183.4494915488997,"investmentValue":"1042.03"},{"day":12,"date":"2024-12-11","price":180.37267953030656,"investmentValue":"1024.55"},{"day":13,"date":"2024-12-12","price":180.21080201365476,"investmentValue":"1023.63"},{"day":14,"date":"2024-12-13","price":178.9680822411456,"investmentValue":"1016.57"},{"day":15,"date":"2024-12-14","price":178.2993237887233,"investmentValue":"1012.77"},{"day":16,"date":"2024-12-15","price":177.18143830603884,"investmentValue":"1006.42"},{"day":17,"date":"2024-12-16","price":175.88394735231992,"investmentValue":"999.05"},{"day":18,"date":"2024-12-17","price":177.66271833204328,"investmentValue":"1009.16"},{"day":19,"date":"2024-12-18","price":175.5603889750905,"investmentValue":"997.22"},{"day":20,"date":"2024-12-19","price":172.39628550923584,"investmentValue":"979.24"},{"day":21,"date":"2024-12-20","price":171.23914911143055,"investmentValue":"972.67"},{"day":22,"date":"2024-12-21","price":169.81775988920913,"investmentValue":"964.60"},{"day":23,"date":"2024-12-22","price":173.1112561929689,"investmentValue":"983.30"},{"day":24,"date":"2024-12-23","price":173.96756227852825,"investmentValue":"988.17"},{"day":25,"date":"2024-12-24","price":171.40665683001168,"investmentValue":"973.62"},{"day":26,"date":"2024-12-25","price":171.79647729978134,"investmentValue":"975.84"},{"day":27,"date":"2024-12-26","price":172.4994654357111,"investmentValue":"979.83"},{"day":28,"date":"2024-12-27","price":169.35765895692035,"investmentValue":"961.98"},{"day":29,"date":"2024-12-28","price":171.96969282117195,"investmentValue":"976.82"},{"day":30,"date":"2024-12-29","price":172.89423975075601,"investmentValue":"982.07"}]	30	1000.00	2
13	Grupo Aeroportuario del Pacífico	GAPB.MX	24	369.76	-1.48	[{"day":1,"date":"2024-11-30","price":376.1975479266139,"investmentValue":"1000.00"},{"day":2,"date":"2024-12-01","price":377.9865238497182,"investmentValue":"1004.76"},{"day":3,"date":"2024-12-02","price":382.35061634719233,"investmentValue":"1016.36"},{"day":4,"date":"2024-12-03","price":378.6514675906021,"investmentValue":"1006.52"},{"day":5,"date":"2024-12-04","price":369.76006016835555,"investmentValue":"982.89"}]	5	1000.00	2
15	Banorte	GFNORTEO.MX	1	133.87	-1.08	[{"day":1,"date":"2024-11-30","price":132.81983076548855,"investmentValue":"1000.00"},{"day":2,"date":"2024-12-01","price":132.13493308136051,"investmentValue":"994.84"},{"day":3,"date":"2024-12-02","price":132.24392664678766,"investmentValue":"995.66"},{"day":4,"date":"2024-12-03","price":133.09500882649183,"investmentValue":"1002.07"},{"day":5,"date":"2024-12-04","price":133.86651201193266,"investmentValue":"1007.88"}]	5	1000.00	2
\.


--
-- TOC entry 3490 (class 0 OID 24745)
-- Dependencies: 240
-- Data for Name: tr_deudas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tr_deudas (id_deuda, id_usuario, descripcion, monto, fecha_inicio, estado, acreedor, fecha_pago) FROM stdin;
5	4	Me compré un juego	2000.00	2024-11-25	pendiente	Yo	\N
8	2	gffdg	54454.00	2024-05-29	pendiente	y	\N
11	2	Tarjeta de Credito	500.00	2024-11-30	pendiente	Nu	\N
\.


--
-- TOC entry 3488 (class 0 OID 24732)
-- Dependencies: 238
-- Data for Name: tr_finanzas_personales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tr_finanzas_personales (id_finanzas, id_usuario, salario_mensual, necesidades, deseos, ahorros, fecha) FROM stdin;
12	2	2345.00	1172.50	703.50	469.00	2024-11-28 07:32:23.184121
13	2	2345.00	1172.50	703.50	469.00	2024-11-28 07:32:23.372672
16	2	8000.00	4000.00	2400.00	1600.00	2024-11-29 03:57:07.802698
17	2	1500.00	750.00	450.00	300.00	2024-11-30 04:40:31.134512
\.


--
-- TOC entry 3480 (class 0 OID 24622)
-- Dependencies: 230
-- Data for Name: tr_gasto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tr_gasto (id_gasto, id_usuario, monto, fecha_gasto, descripcion, id_tipo_gasto) FROM stdin;
2	2	43.00	2024-10-30 00:00:00	fddf	10
4	2	434.00	2024-11-28 00:00:00	gfdg	2
7	4	1000.00	2024-11-27 00:00:00	Unos tacos	1
9	2	2000.00	2024-10-01 00:00:00	Pago colegiatura	5
10	2	2500.00	2024-11-29 00:00:00	Ternurines	6
\.


--
-- TOC entry 3482 (class 0 OID 24632)
-- Dependencies: 232
-- Data for Name: tr_ingreso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tr_ingreso (id_ingreso, id_usuario, monto, fecha_ingreso, descripcion, id_tipo_ingreso) FROM stdin;
3	4	1500.00	2024-11-12 00:00:00	Pagó el jefe	1
5	2	3000.00	2024-11-30 00:00:00	Quincena	1
6	2	3000.00	2024-11-15 00:00:00	Sueldo	1
\.


--
-- TOC entry 3484 (class 0 OID 24642)
-- Dependencies: 234
-- Data for Name: tr_inversion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tr_inversion (id_inversion, id_usuario, cantidad_invertida, fecha_inversion, rendimiento_esperado, id_tipo_inversion) FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 24660)
-- Dependencies: 236
-- Data for Name: tr_usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tr_usuario (id_usuario, nombre, email, contrasena, fecha_registro, id_tipo_usuario) FROM stdin;
4	Luis Alvizo	AlvizoLuis@gmail.com	$2b$10$JWPfNH0OZEEtIXflzVAkkOhKy5BoDDT094BqVY8rxWzrS7HLNr3GO	2024-11-28 07:57:17.196686	1
2	Juan Pérez Perez	juan.perez@example.com	$2b$10$ZqunAYIBdxhM8AoS8P5PW.Axm3gDmzyiy1cqJ7OYOlBEkVxvHc6xa	2024-11-23 02:52:27.731983	1
\.


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 217
-- Name: tc_tipo_gasto_id_tipo_gasto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tc_tipo_gasto_id_tipo_gasto_seq', 12, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 219
-- Name: tc_tipo_ingreso_id_tipo_ingreso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tc_tipo_ingreso_id_tipo_ingreso_seq', 15, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 221
-- Name: tc_tipo_inversion_id_tipo_inversion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tc_tipo_inversion_id_tipo_inversion_seq', 9, true);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 223
-- Name: tc_tipo_sector_id_tipo_sector_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tc_tipo_sector_id_tipo_sector_seq', 40, true);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 225
-- Name: tc_tipo_usuario_id_tipo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tc_tipo_usuario_id_tipo_usuario_seq', 3, true);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 227
-- Name: tr_accion_id_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tr_accion_id_accion_seq', 17, true);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 239
-- Name: tr_deudas_id_deuda_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tr_deudas_id_deuda_seq', 11, true);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 237
-- Name: tr_finanzas_personales_id_finanzas_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tr_finanzas_personales_id_finanzas_seq', 17, true);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 229
-- Name: tr_gasto_id_gasto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tr_gasto_id_gasto_seq', 10, true);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 231
-- Name: tr_ingreso_id_ingreso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tr_ingreso_id_ingreso_seq', 6, true);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 233
-- Name: tr_inversion_id_inversion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tr_inversion_id_inversion_seq', 1, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 235
-- Name: tr_usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tr_usuario_id_usuario_seq', 4, true);


--
-- TOC entry 3284 (class 2606 OID 24583)
-- Name: tc_tipo_gasto tc_tipo_gasto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_gasto
    ADD CONSTRAINT tc_tipo_gasto_pkey PRIMARY KEY (id_tipo_gasto);


--
-- TOC entry 3286 (class 2606 OID 24590)
-- Name: tc_tipo_ingreso tc_tipo_ingreso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_ingreso
    ADD CONSTRAINT tc_tipo_ingreso_pkey PRIMARY KEY (id_tipo_ingreso);


--
-- TOC entry 3288 (class 2606 OID 24597)
-- Name: tc_tipo_inversion tc_tipo_inversion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_inversion
    ADD CONSTRAINT tc_tipo_inversion_pkey PRIMARY KEY (id_tipo_inversion);


--
-- TOC entry 3290 (class 2606 OID 24604)
-- Name: tc_tipo_sector tc_tipo_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_sector
    ADD CONSTRAINT tc_tipo_sector_pkey PRIMARY KEY (id_tipo_sector);


--
-- TOC entry 3292 (class 2606 OID 24611)
-- Name: tc_tipo_usuario tc_tipo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tc_tipo_usuario
    ADD CONSTRAINT tc_tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario);


--
-- TOC entry 3294 (class 2606 OID 24618)
-- Name: tr_accion tr_accion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT tr_accion_pkey PRIMARY KEY (id_accion);


--
-- TOC entry 3296 (class 2606 OID 32952)
-- Name: tr_accion tr_accion_ticker_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT tr_accion_ticker_key UNIQUE (ticker);


--
-- TOC entry 3310 (class 2606 OID 24753)
-- Name: tr_deudas tr_deudas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_deudas
    ADD CONSTRAINT tr_deudas_pkey PRIMARY KEY (id_deuda);


--
-- TOC entry 3308 (class 2606 OID 24738)
-- Name: tr_finanzas_personales tr_finanzas_personales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_finanzas_personales
    ADD CONSTRAINT tr_finanzas_personales_pkey PRIMARY KEY (id_finanzas);


--
-- TOC entry 3298 (class 2606 OID 24630)
-- Name: tr_gasto tr_gasto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_gasto
    ADD CONSTRAINT tr_gasto_pkey PRIMARY KEY (id_gasto);


--
-- TOC entry 3300 (class 2606 OID 24640)
-- Name: tr_ingreso tr_ingreso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_ingreso
    ADD CONSTRAINT tr_ingreso_pkey PRIMARY KEY (id_ingreso);


--
-- TOC entry 3302 (class 2606 OID 24648)
-- Name: tr_inversion tr_inversion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_inversion
    ADD CONSTRAINT tr_inversion_pkey PRIMARY KEY (id_inversion);


--
-- TOC entry 3304 (class 2606 OID 24670)
-- Name: tr_usuario tr_usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_usuario
    ADD CONSTRAINT tr_usuario_email_key UNIQUE (email);


--
-- TOC entry 3306 (class 2606 OID 24668)
-- Name: tr_usuario tr_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_usuario
    ADD CONSTRAINT tr_usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3311 (class 2606 OID 24721)
-- Name: tr_accion fk_empresa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT fk_empresa FOREIGN KEY (id_tipo_sector) REFERENCES public.tc_tipo_sector(id_tipo_sector) ON DELETE SET NULL;


--
-- TOC entry 3313 (class 2606 OID 24676)
-- Name: tr_gasto fk_tipo_gasto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_gasto
    ADD CONSTRAINT fk_tipo_gasto FOREIGN KEY (id_tipo_gasto) REFERENCES public.tc_tipo_gasto(id_tipo_gasto) ON DELETE SET NULL;


--
-- TOC entry 3315 (class 2606 OID 24686)
-- Name: tr_ingreso fk_tipo_ingreso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_ingreso
    ADD CONSTRAINT fk_tipo_ingreso FOREIGN KEY (id_tipo_ingreso) REFERENCES public.tc_tipo_ingreso(id_tipo_ingreso) ON DELETE SET NULL;


--
-- TOC entry 3317 (class 2606 OID 24696)
-- Name: tr_inversion fk_tipo_inversion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_inversion
    ADD CONSTRAINT fk_tipo_inversion FOREIGN KEY (id_tipo_inversion) REFERENCES public.tc_tipo_inversion(id_tipo_inversion) ON DELETE SET NULL;


--
-- TOC entry 3319 (class 2606 OID 24716)
-- Name: tr_usuario fk_tipo_usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_usuario
    ADD CONSTRAINT fk_tipo_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES public.tc_tipo_usuario(id_tipo_usuario) ON DELETE SET NULL;


--
-- TOC entry 3320 (class 2606 OID 24739)
-- Name: tr_finanzas_personales fk_usuario_finanzas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_finanzas_personales
    ADD CONSTRAINT fk_usuario_finanzas FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 3314 (class 2606 OID 24681)
-- Name: tr_gasto fk_usuario_gasto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_gasto
    ADD CONSTRAINT fk_usuario_gasto FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 3312 (class 2606 OID 24759)
-- Name: tr_accion fk_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.tr_usuario(id_usuario);


--
-- TOC entry 3316 (class 2606 OID 24691)
-- Name: tr_ingreso fk_usuario_ingreso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_ingreso
    ADD CONSTRAINT fk_usuario_ingreso FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 24701)
-- Name: tr_inversion fk_usuario_inversion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_inversion
    ADD CONSTRAINT fk_usuario_inversion FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 3321 (class 2606 OID 24754)
-- Name: tr_deudas tr_deudas_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tr_deudas
    ADD CONSTRAINT tr_deudas_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario);


-- Completed on 2024-12-01 18:12:39 UTC

--
-- PostgreSQL database dump complete
--


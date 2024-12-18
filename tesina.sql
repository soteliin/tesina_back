PGDMP          	            |            tesina    17.0 (Debian 17.0-1.pgdg120+1)    17.0 U    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24576    tesina    DATABASE     q   CREATE DATABASE tesina WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE tesina;
                     postgres    false            �            1259    24578    tc_tipo_gasto    TABLE     �   CREATE TABLE public.tc_tipo_gasto (
    id_tipo_gasto integer NOT NULL,
    nombre_tipo_gasto character varying(50) NOT NULL
);
 !   DROP TABLE public.tc_tipo_gasto;
       public         heap r       postgres    false            �            1259    24577    tc_tipo_gasto_id_tipo_gasto_seq    SEQUENCE     �   CREATE SEQUENCE public.tc_tipo_gasto_id_tipo_gasto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tc_tipo_gasto_id_tipo_gasto_seq;
       public               postgres    false    218            �           0    0    tc_tipo_gasto_id_tipo_gasto_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tc_tipo_gasto_id_tipo_gasto_seq OWNED BY public.tc_tipo_gasto.id_tipo_gasto;
          public               postgres    false    217            �            1259    24585    tc_tipo_ingreso    TABLE     �   CREATE TABLE public.tc_tipo_ingreso (
    id_tipo_ingreso integer NOT NULL,
    nombre_tipo_ingreso character varying(50) NOT NULL
);
 #   DROP TABLE public.tc_tipo_ingreso;
       public         heap r       postgres    false            �            1259    24584 #   tc_tipo_ingreso_id_tipo_ingreso_seq    SEQUENCE     �   CREATE SEQUENCE public.tc_tipo_ingreso_id_tipo_ingreso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tc_tipo_ingreso_id_tipo_ingreso_seq;
       public               postgres    false    220            �           0    0 #   tc_tipo_ingreso_id_tipo_ingreso_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tc_tipo_ingreso_id_tipo_ingreso_seq OWNED BY public.tc_tipo_ingreso.id_tipo_ingreso;
          public               postgres    false    219            �            1259    24599    tc_tipo_sector    TABLE     �   CREATE TABLE public.tc_tipo_sector (
    id_tipo_sector integer NOT NULL,
    nombre_tipo_sector character varying(50) NOT NULL
);
 "   DROP TABLE public.tc_tipo_sector;
       public         heap r       postgres    false            �            1259    24598 !   tc_tipo_sector_id_tipo_sector_seq    SEQUENCE     �   CREATE SEQUENCE public.tc_tipo_sector_id_tipo_sector_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.tc_tipo_sector_id_tipo_sector_seq;
       public               postgres    false    222            �           0    0 !   tc_tipo_sector_id_tipo_sector_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.tc_tipo_sector_id_tipo_sector_seq OWNED BY public.tc_tipo_sector.id_tipo_sector;
          public               postgres    false    221            �            1259    24606    tc_tipo_usuario    TABLE     �   CREATE TABLE public.tc_tipo_usuario (
    id_tipo_usuario integer NOT NULL,
    nombre_tipo_usuario character varying(100) NOT NULL
);
 #   DROP TABLE public.tc_tipo_usuario;
       public         heap r       postgres    false            �            1259    24605 #   tc_tipo_usuario_id_tipo_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tc_tipo_usuario_id_tipo_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tc_tipo_usuario_id_tipo_usuario_seq;
       public               postgres    false    224            �           0    0 #   tc_tipo_usuario_id_tipo_usuario_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tc_tipo_usuario_id_tipo_usuario_seq OWNED BY public.tc_tipo_usuario.id_tipo_usuario;
          public               postgres    false    223            �            1259    24613 	   tr_accion    TABLE     �  CREATE TABLE public.tr_accion (
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
    DROP TABLE public.tr_accion;
       public         heap r       postgres    false            �            1259    24612    tr_accion_id_accion_seq    SEQUENCE     �   CREATE SEQUENCE public.tr_accion_id_accion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tr_accion_id_accion_seq;
       public               postgres    false    226            �           0    0    tr_accion_id_accion_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tr_accion_id_accion_seq OWNED BY public.tr_accion.id_accion;
          public               postgres    false    225            �            1259    24745 	   tr_deudas    TABLE     =  CREATE TABLE public.tr_deudas (
    id_deuda integer NOT NULL,
    id_usuario integer NOT NULL,
    descripcion text NOT NULL,
    monto numeric(10,2) NOT NULL,
    fecha_inicio date NOT NULL,
    estado character varying(50) DEFAULT 'pendiente'::character varying,
    acreedor text NOT NULL,
    fecha_pago date
);
    DROP TABLE public.tr_deudas;
       public         heap r       postgres    false            �            1259    24744    tr_deudas_id_deuda_seq    SEQUENCE     �   CREATE SEQUENCE public.tr_deudas_id_deuda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tr_deudas_id_deuda_seq;
       public               postgres    false    236            �           0    0    tr_deudas_id_deuda_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tr_deudas_id_deuda_seq OWNED BY public.tr_deudas.id_deuda;
          public               postgres    false    235            �            1259    24732    tr_finanzas_personales    TABLE     N  CREATE TABLE public.tr_finanzas_personales (
    id_finanzas integer NOT NULL,
    id_usuario integer NOT NULL,
    salario_mensual numeric(12,2) NOT NULL,
    necesidades numeric(12,2) NOT NULL,
    deseos numeric(12,2) NOT NULL,
    ahorros numeric(12,2) NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 *   DROP TABLE public.tr_finanzas_personales;
       public         heap r       postgres    false            �            1259    24731 &   tr_finanzas_personales_id_finanzas_seq    SEQUENCE     �   CREATE SEQUENCE public.tr_finanzas_personales_id_finanzas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.tr_finanzas_personales_id_finanzas_seq;
       public               postgres    false    234            �           0    0 &   tr_finanzas_personales_id_finanzas_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.tr_finanzas_personales_id_finanzas_seq OWNED BY public.tr_finanzas_personales.id_finanzas;
          public               postgres    false    233            �            1259    24622    tr_gasto    TABLE       CREATE TABLE public.tr_gasto (
    id_gasto integer NOT NULL,
    id_usuario integer NOT NULL,
    monto numeric(12,2) NOT NULL,
    fecha_gasto timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descripcion text,
    id_tipo_gasto integer NOT NULL
);
    DROP TABLE public.tr_gasto;
       public         heap r       postgres    false            �            1259    24621    tr_gasto_id_gasto_seq    SEQUENCE     �   CREATE SEQUENCE public.tr_gasto_id_gasto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tr_gasto_id_gasto_seq;
       public               postgres    false    228            �           0    0    tr_gasto_id_gasto_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tr_gasto_id_gasto_seq OWNED BY public.tr_gasto.id_gasto;
          public               postgres    false    227            �            1259    24632 
   tr_ingreso    TABLE       CREATE TABLE public.tr_ingreso (
    id_ingreso integer NOT NULL,
    id_usuario integer NOT NULL,
    monto numeric(12,2) NOT NULL,
    fecha_ingreso timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descripcion text,
    id_tipo_ingreso integer NOT NULL
);
    DROP TABLE public.tr_ingreso;
       public         heap r       postgres    false            �            1259    24631    tr_ingreso_id_ingreso_seq    SEQUENCE     �   CREATE SEQUENCE public.tr_ingreso_id_ingreso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tr_ingreso_id_ingreso_seq;
       public               postgres    false    230            �           0    0    tr_ingreso_id_ingreso_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tr_ingreso_id_ingreso_seq OWNED BY public.tr_ingreso.id_ingreso;
          public               postgres    false    229            �            1259    24660 
   tr_usuario    TABLE     2  CREATE TABLE public.tr_usuario (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    contrasena text NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_tipo_usuario integer NOT NULL
);
    DROP TABLE public.tr_usuario;
       public         heap r       postgres    false            �            1259    24659    tr_usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tr_usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tr_usuario_id_usuario_seq;
       public               postgres    false    232            �           0    0    tr_usuario_id_usuario_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tr_usuario_id_usuario_seq OWNED BY public.tr_usuario.id_usuario;
          public               postgres    false    231            �           2604    24581    tc_tipo_gasto id_tipo_gasto    DEFAULT     �   ALTER TABLE ONLY public.tc_tipo_gasto ALTER COLUMN id_tipo_gasto SET DEFAULT nextval('public.tc_tipo_gasto_id_tipo_gasto_seq'::regclass);
 J   ALTER TABLE public.tc_tipo_gasto ALTER COLUMN id_tipo_gasto DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    24588    tc_tipo_ingreso id_tipo_ingreso    DEFAULT     �   ALTER TABLE ONLY public.tc_tipo_ingreso ALTER COLUMN id_tipo_ingreso SET DEFAULT nextval('public.tc_tipo_ingreso_id_tipo_ingreso_seq'::regclass);
 N   ALTER TABLE public.tc_tipo_ingreso ALTER COLUMN id_tipo_ingreso DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    24602    tc_tipo_sector id_tipo_sector    DEFAULT     �   ALTER TABLE ONLY public.tc_tipo_sector ALTER COLUMN id_tipo_sector SET DEFAULT nextval('public.tc_tipo_sector_id_tipo_sector_seq'::regclass);
 L   ALTER TABLE public.tc_tipo_sector ALTER COLUMN id_tipo_sector DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    24609    tc_tipo_usuario id_tipo_usuario    DEFAULT     �   ALTER TABLE ONLY public.tc_tipo_usuario ALTER COLUMN id_tipo_usuario SET DEFAULT nextval('public.tc_tipo_usuario_id_tipo_usuario_seq'::regclass);
 N   ALTER TABLE public.tc_tipo_usuario ALTER COLUMN id_tipo_usuario DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    24616    tr_accion id_accion    DEFAULT     z   ALTER TABLE ONLY public.tr_accion ALTER COLUMN id_accion SET DEFAULT nextval('public.tr_accion_id_accion_seq'::regclass);
 B   ALTER TABLE public.tr_accion ALTER COLUMN id_accion DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    24748    tr_deudas id_deuda    DEFAULT     x   ALTER TABLE ONLY public.tr_deudas ALTER COLUMN id_deuda SET DEFAULT nextval('public.tr_deudas_id_deuda_seq'::regclass);
 A   ALTER TABLE public.tr_deudas ALTER COLUMN id_deuda DROP DEFAULT;
       public               postgres    false    236    235    236            �           2604    24735 "   tr_finanzas_personales id_finanzas    DEFAULT     �   ALTER TABLE ONLY public.tr_finanzas_personales ALTER COLUMN id_finanzas SET DEFAULT nextval('public.tr_finanzas_personales_id_finanzas_seq'::regclass);
 Q   ALTER TABLE public.tr_finanzas_personales ALTER COLUMN id_finanzas DROP DEFAULT;
       public               postgres    false    234    233    234            �           2604    24625    tr_gasto id_gasto    DEFAULT     v   ALTER TABLE ONLY public.tr_gasto ALTER COLUMN id_gasto SET DEFAULT nextval('public.tr_gasto_id_gasto_seq'::regclass);
 @   ALTER TABLE public.tr_gasto ALTER COLUMN id_gasto DROP DEFAULT;
       public               postgres    false    227    228    228            �           2604    24635    tr_ingreso id_ingreso    DEFAULT     ~   ALTER TABLE ONLY public.tr_ingreso ALTER COLUMN id_ingreso SET DEFAULT nextval('public.tr_ingreso_id_ingreso_seq'::regclass);
 D   ALTER TABLE public.tr_ingreso ALTER COLUMN id_ingreso DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    24663    tr_usuario id_usuario    DEFAULT     ~   ALTER TABLE ONLY public.tr_usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.tr_usuario_id_usuario_seq'::regclass);
 D   ALTER TABLE public.tr_usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public               postgres    false    232    231    232            y          0    24578    tc_tipo_gasto 
   TABLE DATA           I   COPY public.tc_tipo_gasto (id_tipo_gasto, nombre_tipo_gasto) FROM stdin;
    public               postgres    false    218   km       {          0    24585    tc_tipo_ingreso 
   TABLE DATA           O   COPY public.tc_tipo_ingreso (id_tipo_ingreso, nombre_tipo_ingreso) FROM stdin;
    public               postgres    false    220   n       }          0    24599    tc_tipo_sector 
   TABLE DATA           L   COPY public.tc_tipo_sector (id_tipo_sector, nombre_tipo_sector) FROM stdin;
    public               postgres    false    222   �n                 0    24606    tc_tipo_usuario 
   TABLE DATA           O   COPY public.tc_tipo_usuario (id_tipo_usuario, nombre_tipo_usuario) FROM stdin;
    public               postgres    false    224    p       �          0    24613 	   tr_accion 
   TABLE DATA           �   COPY public.tr_accion (id_accion, nombre_empresa, ticker, id_tipo_sector, precio_actual, rendimiento, predicciones, dias_prediccion, monto_invertido, usuario_id) FROM stdin;
    public               postgres    false    226   Lp       �          0    24745 	   tr_deudas 
   TABLE DATA           y   COPY public.tr_deudas (id_deuda, id_usuario, descripcion, monto, fecha_inicio, estado, acreedor, fecha_pago) FROM stdin;
    public               postgres    false    236   f�       �          0    24732    tr_finanzas_personales 
   TABLE DATA              COPY public.tr_finanzas_personales (id_finanzas, id_usuario, salario_mensual, necesidades, deseos, ahorros, fecha) FROM stdin;
    public               postgres    false    234   ��       �          0    24622    tr_gasto 
   TABLE DATA           h   COPY public.tr_gasto (id_gasto, id_usuario, monto, fecha_gasto, descripcion, id_tipo_gasto) FROM stdin;
    public               postgres    false    228   ��       �          0    24632 
   tr_ingreso 
   TABLE DATA           p   COPY public.tr_ingreso (id_ingreso, id_usuario, monto, fecha_ingreso, descripcion, id_tipo_ingreso) FROM stdin;
    public               postgres    false    230   A�       �          0    24660 
   tr_usuario 
   TABLE DATA           l   COPY public.tr_usuario (id_usuario, nombre, email, contrasena, fecha_registro, id_tipo_usuario) FROM stdin;
    public               postgres    false    232   ��       �           0    0    tc_tipo_gasto_id_tipo_gasto_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tc_tipo_gasto_id_tipo_gasto_seq', 12, true);
          public               postgres    false    217            �           0    0 #   tc_tipo_ingreso_id_tipo_ingreso_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tc_tipo_ingreso_id_tipo_ingreso_seq', 15, true);
          public               postgres    false    219            �           0    0 !   tc_tipo_sector_id_tipo_sector_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tc_tipo_sector_id_tipo_sector_seq', 40, true);
          public               postgres    false    221            �           0    0 #   tc_tipo_usuario_id_tipo_usuario_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tc_tipo_usuario_id_tipo_usuario_seq', 3, true);
          public               postgres    false    223            �           0    0    tr_accion_id_accion_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tr_accion_id_accion_seq', 19, true);
          public               postgres    false    225            �           0    0    tr_deudas_id_deuda_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tr_deudas_id_deuda_seq', 13, true);
          public               postgres    false    235            �           0    0 &   tr_finanzas_personales_id_finanzas_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.tr_finanzas_personales_id_finanzas_seq', 18, true);
          public               postgres    false    233            �           0    0    tr_gasto_id_gasto_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tr_gasto_id_gasto_seq', 12, true);
          public               postgres    false    227            �           0    0    tr_ingreso_id_ingreso_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tr_ingreso_id_ingreso_seq', 8, true);
          public               postgres    false    229            �           0    0    tr_usuario_id_usuario_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tr_usuario_id_usuario_seq', 4, true);
          public               postgres    false    231            �           2606    24583     tc_tipo_gasto tc_tipo_gasto_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tc_tipo_gasto
    ADD CONSTRAINT tc_tipo_gasto_pkey PRIMARY KEY (id_tipo_gasto);
 J   ALTER TABLE ONLY public.tc_tipo_gasto DROP CONSTRAINT tc_tipo_gasto_pkey;
       public                 postgres    false    218            �           2606    24590 $   tc_tipo_ingreso tc_tipo_ingreso_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tc_tipo_ingreso
    ADD CONSTRAINT tc_tipo_ingreso_pkey PRIMARY KEY (id_tipo_ingreso);
 N   ALTER TABLE ONLY public.tc_tipo_ingreso DROP CONSTRAINT tc_tipo_ingreso_pkey;
       public                 postgres    false    220            �           2606    24604 "   tc_tipo_sector tc_tipo_sector_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tc_tipo_sector
    ADD CONSTRAINT tc_tipo_sector_pkey PRIMARY KEY (id_tipo_sector);
 L   ALTER TABLE ONLY public.tc_tipo_sector DROP CONSTRAINT tc_tipo_sector_pkey;
       public                 postgres    false    222            �           2606    24611 $   tc_tipo_usuario tc_tipo_usuario_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tc_tipo_usuario
    ADD CONSTRAINT tc_tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario);
 N   ALTER TABLE ONLY public.tc_tipo_usuario DROP CONSTRAINT tc_tipo_usuario_pkey;
       public                 postgres    false    224            �           2606    24618    tr_accion tr_accion_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT tr_accion_pkey PRIMARY KEY (id_accion);
 B   ALTER TABLE ONLY public.tr_accion DROP CONSTRAINT tr_accion_pkey;
       public                 postgres    false    226            �           2606    32952    tr_accion tr_accion_ticker_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT tr_accion_ticker_key UNIQUE (ticker);
 H   ALTER TABLE ONLY public.tr_accion DROP CONSTRAINT tr_accion_ticker_key;
       public                 postgres    false    226            �           2606    24753    tr_deudas tr_deudas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tr_deudas
    ADD CONSTRAINT tr_deudas_pkey PRIMARY KEY (id_deuda);
 B   ALTER TABLE ONLY public.tr_deudas DROP CONSTRAINT tr_deudas_pkey;
       public                 postgres    false    236            �           2606    24738 2   tr_finanzas_personales tr_finanzas_personales_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.tr_finanzas_personales
    ADD CONSTRAINT tr_finanzas_personales_pkey PRIMARY KEY (id_finanzas);
 \   ALTER TABLE ONLY public.tr_finanzas_personales DROP CONSTRAINT tr_finanzas_personales_pkey;
       public                 postgres    false    234            �           2606    24630    tr_gasto tr_gasto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tr_gasto
    ADD CONSTRAINT tr_gasto_pkey PRIMARY KEY (id_gasto);
 @   ALTER TABLE ONLY public.tr_gasto DROP CONSTRAINT tr_gasto_pkey;
       public                 postgres    false    228            �           2606    24640    tr_ingreso tr_ingreso_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tr_ingreso
    ADD CONSTRAINT tr_ingreso_pkey PRIMARY KEY (id_ingreso);
 D   ALTER TABLE ONLY public.tr_ingreso DROP CONSTRAINT tr_ingreso_pkey;
       public                 postgres    false    230            �           2606    24670    tr_usuario tr_usuario_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.tr_usuario
    ADD CONSTRAINT tr_usuario_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.tr_usuario DROP CONSTRAINT tr_usuario_email_key;
       public                 postgres    false    232            �           2606    24668    tr_usuario tr_usuario_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tr_usuario
    ADD CONSTRAINT tr_usuario_pkey PRIMARY KEY (id_usuario);
 D   ALTER TABLE ONLY public.tr_usuario DROP CONSTRAINT tr_usuario_pkey;
       public                 postgres    false    232            �           2606    24721    tr_accion fk_empresa    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT fk_empresa FOREIGN KEY (id_tipo_sector) REFERENCES public.tc_tipo_sector(id_tipo_sector) ON DELETE SET NULL;
 >   ALTER TABLE ONLY public.tr_accion DROP CONSTRAINT fk_empresa;
       public               postgres    false    222    226    3275            �           2606    24676    tr_gasto fk_tipo_gasto    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_gasto
    ADD CONSTRAINT fk_tipo_gasto FOREIGN KEY (id_tipo_gasto) REFERENCES public.tc_tipo_gasto(id_tipo_gasto) ON DELETE SET NULL;
 @   ALTER TABLE ONLY public.tr_gasto DROP CONSTRAINT fk_tipo_gasto;
       public               postgres    false    228    218    3271            �           2606    24686    tr_ingreso fk_tipo_ingreso    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_ingreso
    ADD CONSTRAINT fk_tipo_ingreso FOREIGN KEY (id_tipo_ingreso) REFERENCES public.tc_tipo_ingreso(id_tipo_ingreso) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.tr_ingreso DROP CONSTRAINT fk_tipo_ingreso;
       public               postgres    false    220    230    3273            �           2606    24716    tr_usuario fk_tipo_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_usuario
    ADD CONSTRAINT fk_tipo_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES public.tc_tipo_usuario(id_tipo_usuario) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.tr_usuario DROP CONSTRAINT fk_tipo_usuario;
       public               postgres    false    224    3277    232            �           2606    24739 *   tr_finanzas_personales fk_usuario_finanzas    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_finanzas_personales
    ADD CONSTRAINT fk_usuario_finanzas FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.tr_finanzas_personales DROP CONSTRAINT fk_usuario_finanzas;
       public               postgres    false    3289    232    234            �           2606    24681    tr_gasto fk_usuario_gasto    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_gasto
    ADD CONSTRAINT fk_usuario_gasto FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.tr_gasto DROP CONSTRAINT fk_usuario_gasto;
       public               postgres    false    232    3289    228            �           2606    24759    tr_accion fk_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_accion
    ADD CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.tr_usuario(id_usuario);
 A   ALTER TABLE ONLY public.tr_accion DROP CONSTRAINT fk_usuario_id;
       public               postgres    false    226    3289    232            �           2606    24691    tr_ingreso fk_usuario_ingreso    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_ingreso
    ADD CONSTRAINT fk_usuario_ingreso FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.tr_ingreso DROP CONSTRAINT fk_usuario_ingreso;
       public               postgres    false    232    230    3289            �           2606    24754 #   tr_deudas tr_deudas_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_deudas
    ADD CONSTRAINT tr_deudas_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.tr_usuario(id_usuario);
 M   ALTER TABLE ONLY public.tr_deudas DROP CONSTRAINT tr_deudas_id_usuario_fkey;
       public               postgres    false    3289    236    232            y   �   x�M�=
�@��z�9���_�BQ�l�����;<�G�b�`a�����P~d1r��,�H��Wp�����B����nv�x��;���Sm�{8jO!{fg�??@�%.���k�|	-�4hL^��oN��i�f���
h,�q_ ��T;�      {   �   x�5�KnB1E��*���S萏�HT 1��J,)�(y����`c8����N��N݉�8�MfN$�q{����~��N`��n!%��J��D.���P�YZr��g(�1�u�c`	Z�Ӝ�����v�r���-m��aq�w�·����$�D*5�I���A3�/+y2uk�/2�o���fd��\j�mV� �hVXv      }     x�=�;N1��S�	Pbo^e�D�Ȗi�$�;F~ ��p�Tt�{1lE��_�?>5���x�/�͠R��b�j"*�򀪅G/1��y�hY�b�ſ�Mߑ�G���P�g��E�S�����O.�ؼM�'W�K�:&�ؼ��f)����$��z�}����5���
���6���A��ρ��Q��#�ÇD��r�M?�z	[�#I*���N<N�*������ְ�ɏ�쾢���Qjg.J$<r��9������D��p�         <   x�3�tL����,.)JL�/�2�-.M,��Wp-.9�0/%���.P���Y������ o�      �      x��}�ζ�Q���U �W��p
p�([���02&R�r��T���S3�߰`a��_�y�����?�������o��?�ѿ��?��ϟ�ŏ��i�G.�~������������?����/��?K!�����~�?��_��_�߬����ӈ�o������w������_��?��!�O?�_�[�鰙~�ڬc��-�^\�q��h��&1��he����U�hL��g��F�f�|��y�XFi}V�hʟ���z-��VK,��Rs����S7���Y�f����
���ޯ������h�_b��RR-����I�w&�m���Y�����9�s�H�9�f�y������4?���f��):R�1���54�8��Y=�)�<Y�h��{��j���铷�ow�Q�&��fK���M�Sw��;Eu�Z{����fl����6��?�,V�m'�4Z��9�g�_�v���S���Gk5��r6�8���۝��N�3�l9�pZ�颳�Oٿ��M��:{��_=O|�����I�я�?ŮQ/c3̅Q�pNi���+��~%���RMf��W*�yJ�?�)��4"0Ŗ{��́��6��7� 6�m�B���^f�丙�})E�����L#���?�ټ])%Y&t���?��Fs�O�o�ۑ�:R.��g��yӋ�A�h�=)�'�Ra5����B[�lޞ�����Z���f�hh���])5��!a����K�@	��v���J�˯�_R�'*�x]���ۓ��)��=�p����¶_�oWJS�h3�QK���6(�=
�ɷ/	΋����GL��g�f�U�/�v���T#���oo��e�/U�F���~����/���-~��s�m��p�$@[\�8K͆�����h��nZ&"n�g.%f{?K@T�l��f�	w<vz}~�?S�u�����U�"�!����dڌ��q�l�N�f��Z�Ѿ=�ΰ�y��j��O_�o�ڧoA�����c�p���g�mȡ�����kc�6jv��p�f4]F62�Xf)�#���	ܼ�ܮ$�+���hĹ�j�̦ܮՕR�m�ᝩط�,U�x�I #=��&�8"R0;.��w��'	f���ȼ:�|)f'�"S���J�Sy�j��C�Ipx�}IPcDpHBf�@b���]w�v��](����f��=��=)�=���C.�|����ޞt �0R�)!�',�[�ܮ�z;ҁ�uW�od�83�g�,��ۏ��bN����������ߎ�ԑx�M�P�z�;5Q��+�|�t����0Yl��B�|�ޞt`��d�9bm΅<���ۑ�:n�6�T���߁h�)i�Ŕ�0U�.�?��z{R��k0�Ş�����Ј_�m�/%-gTb;��1C���<��:�ۙ3"�"��lJe�s�C%ɞ�۝4V8_�HJj �^=��ds�v;��Ɗ+���$�@x��;�z:�Qsl�4VJw���Im;�9n�kE��m�S$A|�a^;]�(:��s��:W�����3����Qtl���fG�~�K-8қ�ө��c�4Q|.�C�N����FO�:ʎ �}��~r�*<@2�~z�Qx����a��'?)�f�����Ȓ"�3�ΐ����8���ө��� �]
�Jo�-���8�O���#�Q�u�3��H�y�����S;��Q�h S>4�8	�=�}j��4�lA
Xb�:V���ۧv�ME��L�����O�ۧv	��Xlm��{��EG��S;��U$���y E�-R�ۧvI��te�_jq����؊��S�HV������|�g4J�`�N�cI ���0�ќ�#����T�۩�:���]��j�^��{7��S%u�ܑ�t�O�D'��U�߬�^�N�BR�t|t��p|��x��q�UR�BRcRe"�l ���I�۫v@	��#M����Yi�����UI��F��$���SI���TI�*�8sm���}���?f�^%�r�
�u�8KF��j���0o�JzS͌47U`K�jgS���v���TI�*�T�H��y��-�=�*�j� TV�'ҩҜ�dyȜ�Se�T<��	tH+���Ȝ�Oe�T��BȀ�ZK6�÷��o�.�R5|V|�������ZR���GeT��+Q
`���`_�ڒ��ӣ� ��bSG�#ڽ"G�G�yzT@��F>�N~���B����P�(��L|"`4�&Ŕ�S�����:��#��=��f�b���N��
�huV�%��m���?�ۧSe��0�,�?�g��>;�۩T�"��w\����=������^�gu�t����oCr�uM�V�XM�O�=s�����W�;i�+�c��L�U��izWw@N��YQ=�dK�W���Y1ԃ۵VU�E�'V��;HU��۵V�(J�����ZL��#o�\hS
��:�sW��}�Fo�\U>ȩp�Ď�U�Z��������g	�bigf�~.���+p���(�۳W�CK��X�P�Yk�0��Y�����V�'q�
	�e�}�=K�UCt��U�՛�J:�z{�@�����"`V�l��k���g�Ъ����j�W�y	kb��cv�=k�VE,T�.���P�}R��Z���F���̯֝�:���s��^���;�V���Tm(��̻�t��^�k|��e`qѮ�W��v�z��^�[�i�i@pn���{�N�oŗ���+�����zA�z��[Efx�3T��8�^+Ґݷ��[EfEH�% �R���Sn�t�VQ�I�3�c�0�K�!�ӷ����鉘%\��q�M6��Ud�~�� K��;W	�==�(Ȭ̅~x	)�������O�*�2�'�9���G�K|��O@>=�(��s�ƅۦw��=
�ӳ��L6I���_� Xmb��,A�p ���,��-M��E�(�2�ʓ*2���������Ť(�2�a�76$�6; �%;p{VԻ�	�B|�H�s�)^l��(��7�
0���I^SmR����(�d�H����;Q^�]�z�V��m����Gp���n����(�D�Y#��p��nkJ
/REQ�Y�` �d)9ۚ����Ū(
3��#�4��,�{V���E�('��}"�X���"��VJb��U�eN�!@6����03x�^.jEQ��m���jȌ��r����V�dD��g��*��rQ+�bL8�y��ɣ��j�R���(�l|j ����hg������X���p������r� .B�B��(Ĭ���c�	�Yi���]����r�%���\(z�.�EQ�Y?)vkXh�ū6��^,�zb���s�!��*�d�n���zb�4q�nB��9' ��ӯ�b�,X�8���e��(u�bZTł�Z�r��,�}��9�Ŵ��q	��D�wKN�����iQO$Xr�9Ԃ�%Tﾊ����ŵ�'�$���ef }�!�E��g���� P�So�H`��U� ё��Y3��^�`�_l�zBAD~�fX����mQO(y!�B�U�.,����ݢ�P0�V:R쯆,�06���X�g=6T@l���94�\|��P; ��4�Wn
�4/�EU(���J,��`k�UAᢞP�����n�&g5^��zb�9` Rw�-�zj��uQ.�.�0cϣ�����uq.�Ga�KO8ZnJ�8 =D�*l8��p�ٵZ���ƋuQO,8:�uK��n��N�x�.��A`��;{�-�z��D.�~^/�E=� �
�  �d�WW���<ŋwQ@r6f�Y�<*��"^T��l`-e�kT���Q;˾޾u�A�m�n�!���q*YZU�ż�
	�i�^����`@���yQb� �{'�,O�=gD���^T���m$^���E�y$/���%G>��2�9<�9��ċ|Q��#������0V��Y/�E�Qf)H1{eף��M�t�Žh�2�3�C�����Xj���(����斝n��)��ӵ�����m�W�,��&�{�v�/����!E
� .�4���.��x�/�	4����;B�_p�m��Mq&�@�d�^�^����_��∭�d3�ښ�F�o    ����f�5�̚��Km�>���)�D�K.s�y��v�̋��eb	�##����?˧��J@&�I|��*�l���_	�d� � n�ڝp�,A���h
2��B� ���ㄜ�ۯd=�Q�ll��J8=*ȼXMA����G���֫��,u�t�0��L:wf� 3���!��t�0����FXx�����1��Zoϊz�ZvC���Ҧ�t�0��Lܛ�������޳ұ��k	���c�W�NV�C���c���/FS�9[pF>�F'�"DFo��1&|��Xtf�� ��3dn��1&O7���Uyw��f���E�h�1�Vl)�
�����\k�#p��`����A�|�a �Х^$�&K]��qSwҌ|�����h1ٰ4�'��TB�n���h1;9C����Mә���X�v��c�����4s��	����E��;Ƒ�&���W :�2�E��y��}�R�V�4�{;]$�.`�,���0�E��ȹ˭�.F0�����r��X-G�H]�`g�5���%:�䡒i�����*���T�������QuL	�$�,1��XjIN�P�I2�t�0��AZ���s�ȋ6*�n����4FA��^����+�.F8ȃ��i�luqcK?�ޮյ"�@ ��b��礋��NNX�k> �x�,G%Χ������8��zE�لِ.FW<8>�>3��7�e6����b��c�����q��Y�batŃ��sn�\q�����p����I�c���{'�A���ba���#�t΄�/���Z�+$qif�+��FH2���batŃ�Kee�zg�	�#],��xp~��&�]��+<�)/E�ba�֖8�����s�oJ�k�k������;ڌ�.Fע#�O�ɩu�Rp�k�:��bat-:r@Ofal �^�uDi�N�+ �T�T��\���B�H��<�F�V�B]�t{j[n�X��9F[㌈�-:��"Y��Z�'5��C~�����A�k���?F��xMg䤋�ѵ��
؝�$�e�p���ZC���ۆ�U���S����Zt��T[_��h�N�t�0���e�=���a�G��t�0��'���A��BW�y�0���_7q�%;����^D��5Ǖm�!-Dv<��m_L��EG�ݶ6���^w�N�n�t��U��yi[�k�b��'�t11��L���ј���J�K��Cˎ�M��2�0'� v�r11��L������}ũ�e�����Z;���2�M:�p������b���$�dϙ8�#;�V3��w�u�1��L�ۉD� F��&��E��39G����<����l�\\�!0�u�&��g������yYc��R{�����x��@���tq1��̞]aYQb[���Mc��M�Hzɤ��;P�~C��C`&�
�j��tB��6�.M��b��܁��٧��2���H�..���+�T���}p*%j�J��C�������5��pHʎchّ`�e�����RH�b-;b�Go����ڵ�*]T�!(k8X�Hv�[���chݑMg�����Mj�M;�E�ZwL�o�ic�N�~���{���;2�H��8���}��b-<F��@"=�-�F�ic���ge-��Ƶ ��*�Yr���f��ճCMλ^�N�zzּ��)����܋S�ȩ	']L�yU3�Q��^y�;p���j&_���͚c-�{}�,����ĘZ̈́����4�o{���׋�1�jf�K�ّ�e��NQX��bbL�fb�� �6��\�R�6]L�yV39�^�9�^�Z&�R��t��0���:3��{�\/�yQ1�3'��4L׷8�a�c��6ZFZ���o�ZcS�~Q1��L��`y��7�N�tf�EŘ
39��6�,��C�T<N��[Q}��U��
���Ł*�?��bL��X� �b�'�K�	�c*�دH��;8�����..�T��� �D�f���Z�޾�Sa&
"�@!�V�8�����1f2µ������d]l�y�̐
Yy�zm���_l�y�L��@
PX������Ƙ
3~Z&)������&Nc^0��-ll�^�fV��Saf̤` ߡJv�c��2�6_d��0���H�G�P��1pQ
'/_d�y�L��I�H��U��|q1��L6c�ȗ���X�J���۳�&pLۀ8���ď�ۭޞu�L��RG&��iX& ��4勊1d2��mq�ȅ�M���ň�z�fő�٩�`W6j��j��x�r ��S�w8�Z������鍵i���M������ �9k�{�6�䓊A�k�Y$`A�7�5"��bЪ^Y��)�74'\Q�F��۪^Y	�iMC.͋�={�'�V���m=
N9�drHy@�l瓋A�Zt���&6�:F�cuR1`4����>jdg�&�@��ގu���`U�/��� �|R1hUk���6k7��U�ܒO*��ceN� ��>p����'�V��τ ;���qB��-��bЪ��DJ��٢K�	M�A�j�h�$o�+Ѡ��v�����审�ᕱhuo)�'�V���l�� 0�B�᱿�擋A��k��`ن�E�޾��D���F\Ҽ7�5�\ZU�@��1'O��e4l>����.������0~y�����ŠU}��m�p�H}v_��rC>��Z���z����7�����O.�j�أ58/F�:v��'�V� �@�n���u�<��;|>��zdZ �pWNuavQ�T>���lG�����z�`6��^x�'�V��L�\��s>�wmu}��'F<X�`�YeV!R瓊A��h��`���k�p|�ӵT����4��a����N��'#�`�7�E`�Cǝ���6P�ӳT��+�$dkYr��g��O&FT�����+�Cαb�ɾԓ�U�eվ��ึ�WG�iu�ci>�Qe[V1�kDdp^��
Y��u1����'R�j��ms����W�ܲ�8&Xe
���'#�v�z|JH�qR�d[]�O��c�xK紥�B��)8K�s(>�Q�[��E�� �t��xhU�$bD�o�U@�8%��o�(g(VoǊ�Xl~iJLy�m�JB>�Q%\X���[*��J��X'#��5S�@�V�7f#��W�IÈ*႕V���,�w��X���䓅Uą/z=��q �fg�xI�NFTF��A���ӫ��)��|�0b<��9�ۣD/\�X�������W+<`k�K��X�� �,��j.}Mƪ����y&�p�0b<��KɁ3"Gޠx�bac哅�Yo,c����h b�Q*���aDUtY����
�V���T�aD�t�Z��q.X��ܪ������a�x���H(�%נRc'#���2�Y�����E�$�|�0b<ߵ9#�
���E�PyY��[G�A��\`!�~�>��?`��o��ߋ����������ǟ��������ɿ�Rt�)�7~ ��U�V1�NO�U�ȡ��(ַRtV��A>��ڷgA<ڙV�Pt�mR;gpL��E�@S��7t��n3}&a��̊�PS���0d�����9M� yڔk��92�}�	��i d`G�͋�Au�����L;��IG�#�dh�D���bE�w�3�3:�>	톨m�mN�q��l��?�1U�6����[��K�ce�Ǹ C#:���D��C�1j������7d�GD�2���s2�mSܨ��h"��m�X����<t�u���v�����W�d����7�RZg7봯l�a1��y]����vA"Ө�衑) �7>I&�o�AD��Sm"SB�A�eN%��v5j��5ʹ�w����������@�c�T{��]M�X�I#	���;[�Y�5%=�Y#I�|嬉g�����>#�P�Ѣ^?�,�%�!�7�=�2T��ni�uP)�H���=;�*�m�#���)��It�tH��R���    ��L	aF��%�b�T��^����Y�sTTz��=�-m�h��6�c�Bȸl�a�o%����"�" �Jt�� �k, �v�lEy�9����G�1jS�5�/�T�2�VoAō�s�f�eu��=�\�.�e�Dg5Z87�V/��d؋Rɸ����;4���2y9xĖPt�-���_Lf�C�MR$-��65J�D�<����>>��𱤢w'M�󅭭��3�CZѻ��$�s���a_z}h�����R��gEp��ОmC+Z�c����T��e������X���������'�2��g-��e�՗�Y�S��u}���woJ�j��A�@��m�5��#YZ�E
h\"9su� �~guXb���YVU�zv�N�;����ŗ��֥FW����@�vK+��Qΰ��)d��K,��q�'͍A^�]��{�=u�=D@��33�=Gځ���/��Q~4>��o�E��jj�����۞!oO�-��??wNC���
��eJ����^#��9r�)B�{�쯂�`�q7a���B��&�[f	FWEPllH���K탎԰���I�t���tR<ւ7o��������r�{r�pvz�_�Ћ>�#y&�����Tt'sZz�x,7��2M6��0w'pz��,l$N~!|�6vN�����Gi��2/f'QJ��4�̈���[��J��P���z掲#�"T ���g�'�&�Uf�E��Q���ξ����v��Ģ�~�J��ln��8����]��W�9/�c���}H��}�x8�}M�%��^i�ҒoIEw]頶!����w���8�%=t��L;����d˳��UXR�S�r��D1X�*�SZ��h-?bi	%���i�,i�������s
�=�S�W�p�P�T��yH	gv�LGՏ�[`)Eg�������qJ�s�X�ٍJ�G�$!	�m?x ��Q���f���jt"�Y8b��
&���]�PtS�y�m=8���q��~��}��Ɂ[�u$�����ۍo�D�|62&��Mc����fb�DO])�+(�Ѻ3D�卽i�D+�dqg�|�%��&{2j�D�ß�?:8�����A�,�裞?�D�
�S;y��c�%��H�ɹ�zw~���DtQ'"�		 m��i��oIDW5��ږ9C�9^���)ǒ�>.���,BbS��֫�dyK"��?�b���W��"��eD����My������{����|�డ����G'�����Er�����FtzR�������ђ�>��s�8�)����Q��X��gЧp"���&�oz�:�Q&G�q�9���P���l�C���8�3�l��cC�t�:���α���Q�F|��8����Jf�d�N��O���7ġ��_��5}*kx!w&C:!��zq�U���=W�b����Q'o�@��O�ܰ!}�(�l�gl��U�(�6ġ�T�d|��e\���C���.�VD�1�ܰ3ۍ��.k5ġ E�Iz>�S��%�J�8tӀZ3y�Ҕ��)g�#��-q讑
9y�2�Y�>i��d�6��8�bR�N�����B�4�QA �74'�8���$�e�6t:J���l/��8���^B���O4�>Ȋ �;�y.Y�w?�8�A3�9�ٱ���n���8��^4�e޳C�^�Eb�P�>܊�&X۬-yd��LK�(�%NE��l��I�2������Ir�wTá�`�Bo�HOJf�.�n����.�P�����8�0;z*̣��t����#�X�(Iv�_8��o��G�_�`��7���\�ζ�t����@����Ջ��}�b�P����� FG(p��)�k&q9p%/�9�{��4�V��X���5��I�&��c(�ԅ>�s52�+[��@�]�s�.�q�L6�+q� V]��a��5(-g�,��_���GA�{-.��s�YT��Ѕj��4��b�s}�7���9R�ŒV�\�!h	C�E:��(�Tj��4�ز�^+eov�!_��⽢�*e*S:�����B�]�~gC:+�b�=���<�+��*��.�QX�Ye�K�LN�҄2d�B�����UX����S�US�(������T��O�"�e�Bw]io�j�Fg�1�H�Z��C� c`@�I�Q^�C��P�>��]��;��x����
/�Ӏ�.�<.U�Q�^�S���b7�-Ɯ(-��G%$�69}�JȔ���G��o�a k������T��I*7@0g�8� �z�c���V�y@+����30���I[��	���ނ3C���Y���]��wT��R�Ney��"�m�B�4\��0	Z����Ʋd���@�k�\���݁}6�������jg�JN��l<������������zh���-.� ŝ|Us?C��L]�V9g�'~z��L�(V]h�,>�E6��-�d�(�Ȇ.��N��Zc!�QN$��VC��'%V�y��<X���Dl��>�I����ȇ�+~����T�>J����;�"1O��a��j6�G�w�\͠�eC�ñZ��^��<VjQ�2����X8��� ��"���-a�ó�\yK����o��Ȇ.t�Ú:�m�����~C��ȋW�����x4e��������q�6�]m/Y裂�8)vis�����-Y�qd ���֑Z�ܕ�j����G�i;7`V\���	Ô�>��4bdS|����B�VCZ� �.��H���q2�$�gK:�"6�¯8�;;����%-�">t��sŎF
T���ǐ�>�E���6u6K��2kRmS��Z�P"l�v��Ƭ�lS� 5�]L,
�����,��Ҍ���@M��YTV-Y��8+��29FΨ��-|�BGʍ#�<�\]f�A�Ր�>-DKd�	.;�V���*�I�V�����yv#sI�ޮ��bI���	)	/�V�n��Q�JN�(#;%W��hM�J��,��|1K{uf�T>��ִ!��0P(��*c�*/��XY�Ї���7q��C����b�BW=�c��!�s��PzQ��]�D8���êFM��f�Μǲh�Ւ����U¬���$+�*mw44�wg�0)�6��M�,m�:��҄�I ����p�س��R�UCZk��W9�‸�݊�)eQK:��_�BV1)eo���k)B�O��*
�M�A�$RTה�.j��=�}*ۛ��w��"�܁��P��56p��g
B7]iO�'p�<�Y~��{ã)��C�d
�6�,8_��È%=� ֒J@�<h�T�ƒ��\!d-���:뗲Ԡ[��GI�Qר���*kjЊ-q�X��c�z�<��T��x2
��j3x�x�������T��Lԝ���5Ġ�.50km�[%[���|�~C��*"AzHΤ���j�tӥ�*��������MS��Zٷ�'�ʲ�V���҂�Qĩ��Խv����Y�Ġ牀(��mŵ��+��!-����#v���-/����t��;W·$WΞ͋%��[�/9[!��OndQ�iC�x+�P��9v4�����`�+j�x�ճ,1��V�!/Ky:��?�Ġ�k/9o/�f��1
��2Ġų�]UV՚]j|M�Z1�q��jj�?��D�ϒ�>�q�Y�.��][�f��W{9\�Ɣ�`{^��,�j���#`GN
g��р��*�%��S�F�4��YSN)��fJAgW8�#u\�xE��c�L)�����l��%�U������F��bG��f}r6����cQd�Z�Cǭ�bK�p�@�EK�ׂ��^��5�BЇ[MΆ�������*�`
AO�Vc"��3r8mE�p,!h��̜qUe6�I[��]KZ� ��8����Wh��j
A�U9�wV!�1:���J���;V����.|�u��Kaf7j�@])�j�R�e��:f�2�UO+�)�;%���*�_,�k�d�eD�T�=��r��X5d���+��u�xCRkm��h�@��\q��e�hñ�+��
��H��Ԙhy�J��� ȣ��?�V;Գ�TaKZJ���+{:���Ö�n�P�=��C�    ���Q�!���ߊ@���r� ��D�t�D��Ѐ�z�x�8Wi��<@�̦�ᭈ|�R�)zՐ:��4��.57��A�ugRmR�25��� 9l�1����uz����*�4M� \�N�U3d��}\��͈L qN���NK��Y`b�1����"�eh@+�d�l���87K"�c)@+�d';�Ǒ����zi

�IWJ�A݈Y<4� X�Y7��x[����L=S Z�%�ī��\ѡ	2s�fC Z���;�li9��X��dc|ckG��̜� 
؆�s?OU�l6�y-�<W�UK z��ڐ�w��0=�%N��������[qF)9.��_C��(4��B��>�$�������h��-;cd�jQ߭��Ǜ_��1�ڰ='�VY�χgq�,����fX�-��#mk$ �s��� K��(߇:����^���ԃ,�禐�mh1�1z10��Z�χ_�pp��e4�Ԡ��R>�
x����ӻZ�"VK�y!������|u�B@���~�u�
0� �ȓ�U����%���r;[����� X���G���;�C�:��� �������|��% ��
�5x�T��ǫ .�P�0�[�(�J��x��*�����X�WS����F�:�p�F�vb���MBnArDw�LY�L���11��D� bh��5��[Y���6\*���S��:�~���gM�ݲ���d}��][/9���;���؈D��O{V/�6�X��0�7yQS6����6V�sL�t��5P�cC���^α�ar.�t�p�Jݙ��g�Ɖ���\�`��R~�=�R�����2 �v2�&9S�Y�,$	���&�Ȼ #�������V�k <�b9N0�͔~�*q{/����P�C����Rei|o*����.�Ց�	�R~�Y����dr h�H`h����, ��%�F���pO��Z��t��2�FU8ezp�} ��Z��ϻc�ȶ��ƆA-Y�l!�m�>�ŲL�+��9F��d�>W5��?�f����O�����ݭZ����*�'5#k���b�>w]*{c�a{U��e�>�W�;:F��n�΃+'M�R��������5���2<��/'75&��<��J��z�>J�\)�Oj\�&��µ��[�Op`c[' �b�ޱb��n�P}�"�i8M%Y� (J��)�,^E��*u�J�6�hC�}����x���D�v��M�g��i�yT��9����f�>�nE]�
%�b ��'��TEI�P}�Ri�c�'�Ƶ�oM���T��B-P8�1Ӷ���R} �&vlN����q�5Mw7j(�F�Vfkȵ[	�
�U��gq��d�C��؄���rc�>g��@�u䶞�ll�8�]v�}.��ڑ[pvZ���@S�yw,��`��a���L/Ն�sӏE���ц�$Y�0D����ɼ];���Y�!�k�>�׾J!}��9���>E����Yd��F�Բ�} �����@��+%���l�]KQUY�g���Ő�R��DY��-��K-�S,xő\h��b���
�A`���6����D�%�\��B:[Z�B~\�	���sU�$�ⷷH2�g4ɞr�MOj�4jT�WO�~�箛ʒ-\*�	�&�5
'�.�!��{ՎI<����m�����r�S�6vݴ�W߲eRG'XZ�Iz��Op+
���@���g)2R���r/�:��x1jH�F��Fr$�0��
��CrV�� 	�����ǩ2���6�b���Q��S�n�=E�T%�p"���AdP�b�=W���f����Q�j�X���-G*p��jI�n���;���! y��p���f�RS1JK�����IF?�'l� ���Zb�S+�ʐ:�v��Q�h+���	-�צF�)2hu�W��s<�d�X���nt�)'��zN�ʜF��yy��rZ�G�FI0jc!kv� ��,�g�+�u
Sg�@����oj=��0�z8;�.1Ѫ@vK��(���LűPmn�$m��s�8C�}�AN���^d����P�T!�#�'�O��V�Xj��,��̋ H�)\��ڳbKrn
;�$�����{>�e�T"���4G��L���ƚ��b[9�ԞJC��j�=�2/���uF�2�t��6��pɤj��xf���r��s=n�=� �:;9[҆iS��@��j���ݻ�ڡ�l(=���.l�0�Xŭ,��_
����W�w	d�Z-��V)nD�ъ�]�Zo���5�	Fb���m8	䷊��G�����ǟ�����?��O�������A9��Iw?Rn���1w����9u|D���[-�0}�=��8H�C�x�V%��)���LM*D��G��l0�� q�"s'��� *�#�
�I5�n�R��8��X=���1ʙk[�xH2wʞ2��d@�"	�Q�|Mf|{�v+!E�nٜ�����(3~=�i9i,��}y��~�l��X"�ሡ���cj��C��SJ�d���k�Ѧ#+�����ј3���sCu��m3�����]ہ/S���#qnt
�4ٰ&�P��e��Ý:�u>I�dS�;�(ۇ23NPۉ�58R؀ 	�K�����T�K���'��^�̽�v������R�����N�UdI�d��a�Ɑ��Rg�	�T����� �N�0��̰�#'����},�R������V� .�IƏMz&qI��^
�!V[�Q��y�^_; 2���ט�H���&^�Zz�C�y T�X����M�F(o��y�4�*2���B�?Uk\/�f�+�3�УV�[����i�'��HǼ8T�B��-$�3�Ly$��|K�)��|�@8R&��eWα���J�Vŷ��h�ɲ����C7_b�8��a�39z>	Z�|�5^��h�̽�5_'�K����M
��Vh��J��lpXt�������Л>!?���U�B%pj�c4���C������[=�C�`_��7ga�{���}�q�=�)EM4>yi;��})1����
�l6>8�;X�]Зh3���瓈l�I,�2�^��\j[�D���=�k�b���<�?�k|A��wެ��fjȒ��zE˝o�Q��z	7O���հ]�G%eTZ*^�Ͱ�Y������'�*��%�<�6��; :⨑�.�|��ޜ�ff�:bK��~?�d��|�~3N����7a�vom\vI���Ӓ�c�� =i���V�Ůd���s�(I�,�Tm��v���d^�ȟjb(���vQ>�i�x�8��f��d�����.��8�2�U�E���*�gn+���gGK�q��Oz�8}��&���,�����r��b��ȓ�a�,~Q�7�)g�Гc<9-�9=`qT�	bδ�$M�^s��ս��s������<ɡ[t��K�q0q��rt�E��!�;�Ol+� O���ڕ�r΃�c
�u�[s��OL�'���IinB,&�F�J#x):#w+��Hݩ������+wEg$.��Q'��E>73����E���YqV�+��P�Sx):2&�̹��C�y��%���|��ސ��]hD/I���	��̵
zi:V�X�#l�+-K�|��us@��0Rq��ַ��^��L���a�*
�l��uf��S��G*�v���/YgX%ߗz1���!~/Y�����:�v����v/]g���8�9�?��@�%��2K�lj�(��V��r�����P5s�����w�eg��|=]sqa�ـ�����V)�U�l�?�:��C�y�z ;�@O�j�K�yP��zH]j��
l%F�΃c�)Ǘ�\gv�A���+�v��V��uz�;/��EM���'d���*�xfJN����Vt6�+|)<ON.��	oe>蠀���^�cM0k���cw���^�z�<��د�鴞�*9�%�<9��bS9��e/0 �b�����x.��������׈��K��hE]R
}�u�!�Շ����
�!
:��8?\�ؽ�����(m&e�����a��/�g�5#Vt'�J��%    ���8n���q�9WY��^r�|K]�	����w�]_zϓ*[1&��W*v�|�����~��`� �L���C�VCB&��n���O���C𙥶��'B�ﷇ��R�j3?�gA�9Ȧ�$�x9f��S$�'�K� �u�!f�{A�)�<>/AC"5��9Yvl*$��|�T���4
�-�u��|�'j"b��c6��{�P}f� �g@�ư�GE-��L��Ɂ�L'br�+��N6	?�/Fe>;Ewk��!	?S�>������NPWx	?�u�`���7��m�X$�y
?/��q�e��}t�K���6o�pxüV�Ed�_�ϼi3�N�i�Ѩ��iek���p���&�1�����D�� �T�ҜHYw���+�������ŘAa�@oZ>N�Cze�=�Kc�{������A�<]ݞ��*O�@�4�vK��@G�PL�*���f��j���$F:;�TT����r�S�82��6Y���}�@cg�KD�>'fٳ��ΊF�Kz�y�:zH.{t���a�%=8:�W<�s�4�P~�@��I����7c�Ǳڇ4�����Q�Tr�(R�� )�c󨦖��S�^R�' �ɷ�aO�d�~hA/H�d�qۆ�U�	��S���&4,����r�W���^rЃӸ*�����X5#�j{�A3zu�2�d��͖芻ه �*�W�5R���?����&<�qlɞ�S'{�����D�Y<�}�x�
��z.2�/U�>(UŮֹ�;��lR	��,4���R$���2/Yh���F�t�\�Q�����_�9F�ك��S���0�\��^�@eg��"����K���(��ɓ�ۤ�3���d�s�1һ������+�}�C�5�-��.2�q&K�S�����t|؝^� A2��:4���i������x|��<��S]�U��%�a(I�M�c|*N���w�*�h�'�u����S�y�d6�.�g��B*��P������%8��v,";�Јf=��b�����g��p2A3���VWH���C#V�H�0r�ou?/���:�`[Q������L_���T����Dv�`B�Έ�uf%o|�D��'�V�J��=�am�������p�pf#eK��v�ۗR4�����7pﹲ){��M�f�25p����!��K)z5�� ���}�ҡ>����1�i��x5/)v�Ģy g�j���Vm�|�Es_b$�9o��jd؇�?�9��p|���Y��/��EM-K�ni�zL���r������O�#t9�hv��I��A�X���Cd?�/�h�]�5T }��J�����Y���c�+��Fk;t��у� ��	n6�W������IqA&L�YR����C(�����Y����.'`6y�{jFO�r��8PRC�7�9!�h4�x�jV�3hU��q_��4�L�����C㹵�h>�$Κ-ߙ��\B��s~�g�DJN��E�+��=�S��Oo|��6��%M2���NYb�)��k���|�y�����ǐ��ԎƱE����>��ފDL�-^�ѓL��!��}�N�9T$���8��}v��{T�8�����WQ���)���q3�����&�m<�aU��M�Z~IH�,QU8Rt�.�z"ғ�'}��^��f����"�`[&y׮[�d��):��]�,�5�u8W�z�㇒4��O�7��蝯�ZO)i�X_����A�.��1凘4� &�� �/�{ЎY��O5i>�s&@����^��!��Г^�� �� �i�D��8(1��(�"Ƨ�:_��b-{�� <D�ylu�Y�ΐ��	z���u�l�W���)-?e������|��>C$^��,%y�Z�p����&�O�~)K�h/�Hc�^/!"�ޙ�T���rT"�o90�iOb��*v?����M\`�C�L�Ư^t��K\��#~#��{��6�J�X}�K3s"�m�0У7������ߗ��*�t�DD`?�_H���Зfր�?{&%{�f ��>�)	I�(��|��}�%1=��������R
C��Sc��~d�C`/���u*�l����LT q��"��E�2=Y�MK�ɩۮ�ټ"����U 6;YFth����ɄO�i�p�j��6c�ؤS�>��'eC&�-u��0��Yx	M��5����st��E�!4����A�D+��V��<��y��/�9���t�O��i	�q"P�Vgg����bӓ����Zښ����{���jӫe�r.P��p�<���&J��`��ᔽR^v"��Л^�U����,��}�M3%����4Ѽ�&E���,�%ܵ����)������b>�����wd��
/�i2�[�_Rb��CR�(Y?4�)��k �wzs��� �NO�FX� Ծ޿M�I�Kt�8�!�`X��!��}�N�ǍB5�H����4-ك��4=�����㻳��ҝf�i8�^�����!�g�<����+�l�k@���X���4����Y���-�Y�����l_�� �#]�d�x�{hO3g�ɳg���L�_�ӓ3p��2�8�1;U�%?�k�����o�:�{��j��w�5��y�`PT��5�O n!0R0�8��0׿��H�a�U�B20�%A=O���j@r^2c< �K���=(]G�,F��\�>D�q5~�Ezk�&{�0��$-�Oj&����)E�U��4�T���Z��w�=k����
��aD��2��=J�R�S���9��p\�[J������뉸t����w��(�C�,��K����.e%ͼ�������a�Jm��kxIQ� ���1�1�tQIF���b�4�3@(C�rr�-�u,E��5�΁;��6H�Ų�"V�W�Nk@"y�_�4��=���96%��s���k����
r�G��z^9��M�[���/A�5���P�0y���������j���)��C;�{Ij~0�2Qӆ�Έ���C^��kk>'���M=\"h?A���c���p}0�z5�Re��K����6AeVsԤ)�C��{K9��g����u_���$ u�7|s�&�Ц�޲�,���uJ�!4�6�:��Ő�7��Aݾ�bx�S�/��'��pj��bk�����g��Jn��ٲ/}j~1�6,����U��D��!P�/�8�0q��ê���ޓ�ҧ�[ș�%2<�+�I>���k�����sx7y�:V��P��I-%Β�XEƃ���Ҩ�bsH�k����1ϩ�/�j�$��L����;("�}�TO�'ȉ�$��#6P�z����j��#�7�i��ˀ��H5q��a�W��KރJ����ڊ�W�s�Q�]������jY�%�/�B�<��=�Ъ���zC�
���&tU�x�U3�F�Q�.s� ڿ��c����T�п׫^{G[�)-蘭��C���س�F@��q��
*����5Q���d�����~5<$�FȬ+��YwV��B��kV'�j\�Z�<�"�c{��K��f[�c=�5���![�M(�͹-e�k���[�X&���ɺ������^��^F�23�@����8`�jnk�p��x�Hϊ���_{�SKJ%|�{���{�jn���ѣ|�,�ݗ��W�I�� �k�+O�C��`�H8�q�H�M�$�[p�a���R�Uto�}��b�װ���rd:���
>M�k.��wY���92c�Α�kn-[��jN�dX�f��V�ױ��v'�\��#{�2�c��C�z��8��Q��k�bj�3g^J��pN7�_={p��e)k���X#U��M=�&��{-�U���us"{j.��+��f���� #`��ș��%J�5k��X������s�f����u��8�w�<'x!�V���5�� ��!pXTwT������S��#.�H��(4!�{E��ҋ%���l���K�zmBl����޹r������5�L =)� ��U��̗�5� ~�\�0��������\*�V�+��7^mܛՇ��^T��t����ط��hM���bG���|2��� �  ���$}����N8���h:�iM�h�	=r���Vj��Ç�5�"e$�@R�S���T�C�:-�0�Y����B�/�b\���Y��P�,��ُ\������o�P���&���Stؿ��j�=��u>{�$~=���[��fN�,׶����w}�[/o�N�֔�taf����b��$P�(E���vU>�^�z��B,����q|�yhy�\���\h�ͫ�S�d_�kz�c3���=���]��s�6a����*����������:ե8��z�����{�k�m��?��\�4D��{�kf��������{j�Q�_Z��9 ���O�|	>TQ%�^�z��(��j�|�E��C�z�sG�KJNs����K���.X��PY�ɯVu������B},5���ڟ�x�
����9��+U���!y�=���)-�6��M�/��%/�Θ��gsk�I��K�f#��V߳�>��0dg��&Z�c��Mn��tR�K��ы�hHV�f<_@����!{�Xkm����U�ơR�н&���m��O�=;fٿ*b��_3&ּ�����x�M�!�/���w�`o#�Ұ���W��n�{�k~��;���ŭ~F�e����X�*��*@�W��
����t�ߣ3��3�L,hH|�_/d��R�.�y8�.#���k��g�Xc�< ��В^��i1�2� �����IEE�^
�\m@4ĕFJ�\U�'k	塁����tǨU�%8����"�\l����c	�:�!������Ml?G�J"�8R�|�Q)f���ƕ�!���sq�qY)���Uu�K	I� �� ���җY�k��U���v��g��������/���կ�O���������������������Տ?����Kx���fGߏ�r�����3 5�.�pJ�V��ݎ�����b/���"�1{`�mna%s�F�h���E�w��&��v�J�B����5�,��b�no!��^�����1���/����|~��~��a:�i      �   �   x�3�4��MUH��-(:�R�4O!�45=�����@�� H����r��d�敤rF�s��qYpq�����s������U��Y"��)64�I,�J-ITHIUp.JM�,��4E��� I�_)Hg� �Q,$      �   �   x�����1D�K��Z3��v-鿎ز��_�8<�x0�k�y-�E���+a}M��h���t�6�Rh��-5R�1�`����&���߰Qs K�Fo>��˺�l�_�pÇcg\��mE?Oy�,?[�^Y�{Xȫ��oj7�      �   �   x�]�1�0��>�6PD��ڭKEj���]"�,yy��JJuU���L�����aI�-�iى�6���b�}XH�K�z�0��v
E>n�vݢ��{�9�r���E?��.,�����=|�`�'�JO'�Y޼�+~���|7�      �   l   x�3�4�4450�30�4202�54�54R00�#΀��ÛRs�R�R9�L9�8�P� ��f�%��%��aQjh�P\����Th���H���Bb��qqq �$-      �   �   x�M�=n�0 Fgs
�X���a
TB��R*(QJIB�h�7�9z�uH��}z�3�z(�U���S�q3�C��5��h�C�H��߄���g����ح*~|M���Wd^�����oi����c��0QǤ�ۖ�,��!;�����*�y��l��v��̚s]<F���+�S_��n�0E]�����r�yQ����X^�ܒ�=BWqL�
��m���PQ�?!9N     
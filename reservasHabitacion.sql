PGDMP                      |            reservas    16.3    16.3                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    16398    reservas    DATABASE     {   CREATE DATABASE reservas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE reservas;
                postgres    false            �            1259    16400    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16399    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    216            
           0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    215            �            1259    16411    habitaciones    TABLE     �   CREATE TABLE public.habitaciones (
    id integer NOT NULL,
    numero integer NOT NULL,
    tipo character varying(50) NOT NULL,
    precio numeric(10,2) NOT NULL
);
     DROP TABLE public.habitaciones;
       public         heap    postgres    false            �            1259    16410    habitaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.habitaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.habitaciones_id_seq;
       public          postgres    false    218                       0    0    habitaciones_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.habitaciones_id_seq OWNED BY public.habitaciones.id;
          public          postgres    false    217            �            1259    16429    habitacionesreservaciones    TABLE     {   CREATE TABLE public.habitacionesreservaciones (
    habitacion_id integer NOT NULL,
    reservacion_id integer NOT NULL
);
 -   DROP TABLE public.habitacionesreservaciones;
       public         heap    postgres    false            �            1259    16418    reservaciones    TABLE     �   CREATE TABLE public.reservaciones (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);
 !   DROP TABLE public.reservaciones;
       public         heap    postgres    false            �            1259    16417    reservaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.reservaciones_id_seq;
       public          postgres    false    220                       0    0    reservaciones_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.reservaciones_id_seq OWNED BY public.reservaciones.id;
          public          postgres    false    219            ^           2604    16403    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            _           2604    16414    habitaciones id    DEFAULT     r   ALTER TABLE ONLY public.habitaciones ALTER COLUMN id SET DEFAULT nextval('public.habitaciones_id_seq'::regclass);
 >   ALTER TABLE public.habitaciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            `           2604    16421    reservaciones id    DEFAULT     t   ALTER TABLE ONLY public.reservaciones ALTER COLUMN id SET DEFAULT nextval('public.reservaciones_id_seq'::regclass);
 ?   ALTER TABLE public.reservaciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �          0    16400    clientes 
   TABLE DATA           5   COPY public.clientes (id, nombre, email) FROM stdin;
    public          postgres    false    216   %                  0    16411    habitaciones 
   TABLE DATA           @   COPY public.habitaciones (id, numero, tipo, precio) FROM stdin;
    public          postgres    false    218   ,%                 0    16429    habitacionesreservaciones 
   TABLE DATA           R   COPY public.habitacionesreservaciones (habitacion_id, reservacion_id) FROM stdin;
    public          postgres    false    221   I%                 0    16418    reservaciones 
   TABLE DATA           P   COPY public.reservaciones (id, cliente_id, fecha_inicio, fecha_fin) FROM stdin;
    public          postgres    false    220   f%                  0    0    clientes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);
          public          postgres    false    215                       0    0    habitaciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.habitaciones_id_seq', 1, false);
          public          postgres    false    217                       0    0    reservaciones_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.reservaciones_id_seq', 1, false);
          public          postgres    false    219            b           2606    16409    clientes clientes_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_email_key;
       public            postgres    false    216            d           2606    16407    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    216            f           2606    16416    habitaciones habitaciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.habitaciones DROP CONSTRAINT habitaciones_pkey;
       public            postgres    false    218            j           2606    16433 8   habitacionesreservaciones habitacionesreservaciones_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.habitacionesreservaciones
    ADD CONSTRAINT habitacionesreservaciones_pkey PRIMARY KEY (habitacion_id, reservacion_id);
 b   ALTER TABLE ONLY public.habitacionesreservaciones DROP CONSTRAINT habitacionesreservaciones_pkey;
       public            postgres    false    221    221            h           2606    16423     reservaciones reservaciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.reservaciones
    ADD CONSTRAINT reservaciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.reservaciones DROP CONSTRAINT reservaciones_pkey;
       public            postgres    false    220            l           2606    16434 F   habitacionesreservaciones habitacionesreservaciones_habitacion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitacionesreservaciones
    ADD CONSTRAINT habitacionesreservaciones_habitacion_id_fkey FOREIGN KEY (habitacion_id) REFERENCES public.habitaciones(id);
 p   ALTER TABLE ONLY public.habitacionesreservaciones DROP CONSTRAINT habitacionesreservaciones_habitacion_id_fkey;
       public          postgres    false    4710    218    221            m           2606    16439 G   habitacionesreservaciones habitacionesreservaciones_reservacion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitacionesreservaciones
    ADD CONSTRAINT habitacionesreservaciones_reservacion_id_fkey FOREIGN KEY (reservacion_id) REFERENCES public.reservaciones(id);
 q   ALTER TABLE ONLY public.habitacionesreservaciones DROP CONSTRAINT habitacionesreservaciones_reservacion_id_fkey;
       public          postgres    false    4712    221    220            k           2606    16424 +   reservaciones reservaciones_cliente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservaciones
    ADD CONSTRAINT reservaciones_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);
 U   ALTER TABLE ONLY public.reservaciones DROP CONSTRAINT reservaciones_cliente_id_fkey;
       public          postgres    false    220    4708    216            �      x������ � �             x������ � �            x������ � �            x������ � �     
--
-- PostgreSQL database dump
--
CREATE USER mortal2018 WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

ALTER USER mortal2018 WITH PASSWORD 'mortal';
-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.7

-- Started on 2018-06-14 14:38:05 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12390)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16387)
-- Name: calendario; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE calendario (
    id_fecha integer NOT NULL,
    fecha date,
    descripcion text,
    recurrente boolean
);


ALTER TABLE calendario OWNER TO mortal2018;

--
-- TOC entry 186 (class 1259 OID 16393)
-- Name: calendario_excepcion; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE calendario_excepcion (
    id_excepcion integer NOT NULL,
    fecha date NOT NULL,
    estado boolean,
    descripcion text
);


ALTER TABLE calendario_excepcion OWNER TO mortal2018;

--
-- TOC entry 187 (class 1259 OID 16399)
-- Name: calendario_excepcion_id_excepcion_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE calendario_excepcion_id_excepcion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE calendario_excepcion_id_excepcion_seq OWNER TO mortal2018;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 187
-- Name: calendario_excepcion_id_excepcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE calendario_excepcion_id_excepcion_seq OWNED BY calendario_excepcion.id_excepcion;


--
-- TOC entry 188 (class 1259 OID 16401)
-- Name: calendario_id_fecha_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE calendario_id_fecha_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE calendario_id_fecha_seq OWNER TO mortal2018;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 188
-- Name: calendario_id_fecha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE calendario_id_fecha_seq OWNED BY calendario.id_fecha;


--
-- TOC entry 189 (class 1259 OID 16403)
-- Name: diagnostico; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE diagnostico (
    id_diagnostico integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE diagnostico OWNER TO mortal2018;

--
-- TOC entry 190 (class 1259 OID 16409)
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE diagnostico_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diagnostico_id_diagnostico_seq OWNER TO mortal2018;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 190
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE diagnostico_id_diagnostico_seq OWNED BY diagnostico.id_diagnostico;


--
-- TOC entry 191 (class 1259 OID 16411)
-- Name: diagnostico_parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE diagnostico_parte (
    id_diagnostico_parte integer NOT NULL,
    id_diagnostico integer,
    id_parte integer
);


ALTER TABLE diagnostico_parte OWNER TO mortal2018;

--
-- TOC entry 192 (class 1259 OID 16414)
-- Name: diagnostico_parte_id_diagnostico_parte_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE diagnostico_parte_id_diagnostico_parte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diagnostico_parte_id_diagnostico_parte_seq OWNER TO mortal2018;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 192
-- Name: diagnostico_parte_id_diagnostico_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE diagnostico_parte_id_diagnostico_parte_seq OWNED BY diagnostico_parte.id_diagnostico_parte;


--
-- TOC entry 193 (class 1259 OID 16416)
-- Name: equipo; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE equipo (
    id_equipo integer NOT NULL,
    no_inventario character varying(20) NOT NULL,
    observaciones text,
    id_marca integer,
    responsable character varying(200),
    fecha_ingreso date
);


ALTER TABLE equipo OWNER TO mortal2018;

--
-- TOC entry 194 (class 1259 OID 16422)
-- Name: equipo_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE equipo_detalle (
    id_equipo integer NOT NULL,
    id_parte integer NOT NULL,
    id_equipo_detalle bigint NOT NULL,
    id_modelo integer,
    id_marca integer,
    activo boolean,
    n_inventario character varying(200),
    serie character varying(200),
    caracteristicas text
);


ALTER TABLE equipo_detalle OWNER TO mortal2018;

--
-- TOC entry 195 (class 1259 OID 16428)
-- Name: equipo_detalle_id_equipo_detalle_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE equipo_detalle_id_equipo_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipo_detalle_id_equipo_detalle_seq OWNER TO mortal2018;

--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 195
-- Name: equipo_detalle_id_equipo_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE equipo_detalle_id_equipo_detalle_seq OWNED BY equipo_detalle.id_equipo_detalle;


--
-- TOC entry 196 (class 1259 OID 16430)
-- Name: equipo_id_equipo_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE equipo_id_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipo_id_equipo_seq OWNER TO mortal2018;

--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 196
-- Name: equipo_id_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE equipo_id_equipo_seq OWNED BY equipo.id_equipo;


--
-- TOC entry 197 (class 1259 OID 16432)
-- Name: equipo_parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE equipo_parte (
    id_equipo integer NOT NULL,
    id_parte integer NOT NULL
);


ALTER TABLE equipo_parte OWNER TO mortal2018;

--
-- TOC entry 198 (class 1259 OID 16435)
-- Name: estado; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE estado (
    id_estado integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean,
    descripcion text
);


ALTER TABLE estado OWNER TO mortal2018;

--
-- TOC entry 199 (class 1259 OID 16441)
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_estado_seq OWNER TO mortal2018;

--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 199
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE estado_id_estado_seq OWNED BY estado.id_estado;


--
-- TOC entry 200 (class 1259 OID 16443)
-- Name: estado_mantenimiento_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE estado_mantenimiento_detalle (
    id_estado_mantenimiento_detalle integer NOT NULL,
    id_mantenimiento_detalle integer,
    id_estado integer,
    id_responsable integer,
    id_paso integer,
    observaciones text
);


ALTER TABLE estado_mantenimiento_detalle OWNER TO mortal2018;

--
-- TOC entry 201 (class 1259 OID 16446)
-- Name: estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq OWNER TO mortal2018;

--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 201
-- Name: estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq OWNED BY estado_mantenimiento_detalle.id_estado_mantenimiento_detalle;


--
-- TOC entry 202 (class 1259 OID 16448)
-- Name: mantenimiento_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE mantenimiento_detalle (
    id_mantenimiento_detalle bigint NOT NULL,
    id_equipo_detalle integer,
    id_oden_trabajo integer
);


ALTER TABLE mantenimiento_detalle OWNER TO mortal2018;

--
-- TOC entry 203 (class 1259 OID 16451)
-- Name: mantenimiento_detalle_id_mantenimiento_detalle_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE mantenimiento_detalle_id_mantenimiento_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mantenimiento_detalle_id_mantenimiento_detalle_seq OWNER TO mortal2018;

--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 203
-- Name: mantenimiento_detalle_id_mantenimiento_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE mantenimiento_detalle_id_mantenimiento_detalle_seq OWNED BY mantenimiento_detalle.id_mantenimiento_detalle;


--
-- TOC entry 204 (class 1259 OID 16453)
-- Name: marca; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE marca (
    id_marca integer NOT NULL,
    nombre character varying(50),
    activo boolean,
    descripcion text
);


ALTER TABLE marca OWNER TO mortal2018;

--
-- TOC entry 205 (class 1259 OID 16459)
-- Name: marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE marca_id_marca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marca_id_marca_seq OWNER TO mortal2018;

--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 205
-- Name: marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE marca_id_marca_seq OWNED BY marca.id_marca;


--
-- TOC entry 206 (class 1259 OID 16461)
-- Name: modelo; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE modelo (
    id_modelo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean,
    descripcion text
);


ALTER TABLE modelo OWNER TO mortal2018;

--
-- TOC entry 207 (class 1259 OID 16467)
-- Name: modelo_id_modelo_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE modelo_id_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modelo_id_modelo_seq OWNER TO mortal2018;

--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 207
-- Name: modelo_id_modelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE modelo_id_modelo_seq OWNED BY modelo.id_modelo;


--
-- TOC entry 208 (class 1259 OID 16469)
-- Name: orden; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE orden (
    id_orden bigint NOT NULL,
    fecha date,
    observaciones text,
    activo boolean,
    id_solicitud integer,
    id_unidad integer
);


ALTER TABLE orden OWNER TO mortal2018;

--
-- TOC entry 209 (class 1259 OID 16475)
-- Name: orden_calendario; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE orden_calendario (
    id_orden_calendario integer NOT NULL,
    id_fecha integer,
    id_orden integer
);


ALTER TABLE orden_calendario OWNER TO mortal2018;

--
-- TOC entry 210 (class 1259 OID 16478)
-- Name: orden_calendario_id_orden_calendario_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE orden_calendario_id_orden_calendario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orden_calendario_id_orden_calendario_seq OWNER TO mortal2018;

--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 210
-- Name: orden_calendario_id_orden_calendario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE orden_calendario_id_orden_calendario_seq OWNED BY orden_calendario.id_orden_calendario;


--
-- TOC entry 211 (class 1259 OID 16480)
-- Name: orden_id_orden_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE orden_id_orden_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orden_id_orden_seq OWNER TO mortal2018;

--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 211
-- Name: orden_id_orden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE orden_id_orden_seq OWNED BY orden.id_orden;


--
-- TOC entry 212 (class 1259 OID 16482)
-- Name: orden_trabajo_equipo; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE orden_trabajo_equipo (
    id_orden_trabajo integer NOT NULL,
    fecha_inicio date,
    fecha_estimada date,
    id_orden integer,
    id_equipo integer,
    id_tipo_mantenimiento integer,
    id_prioridad integer,
    estado boolean
);


ALTER TABLE orden_trabajo_equipo OWNER TO mortal2018;

--
-- TOC entry 213 (class 1259 OID 16485)
-- Name: orden_trabajo_equipo_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE orden_trabajo_equipo_detalle (
    id_orden_trabajo_equipo_detalle integer NOT NULL,
    id_orden_trabajo integer,
    id_equipo integer,
    id_parte integer,
    id_usuario integer,
    id_rol integer
);


ALTER TABLE orden_trabajo_equipo_detalle OWNER TO mortal2018;

--
-- TOC entry 214 (class 1259 OID 16488)
-- Name: orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq OWNER TO mortal2018;

--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 214
-- Name: orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq OWNED BY orden_trabajo_equipo_detalle.id_orden_trabajo_equipo_detalle;


--
-- TOC entry 215 (class 1259 OID 16490)
-- Name: orden_trabajo_equipo_id_orden_trabajo_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE orden_trabajo_equipo_id_orden_trabajo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orden_trabajo_equipo_id_orden_trabajo_seq OWNER TO mortal2018;

--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 215
-- Name: orden_trabajo_equipo_id_orden_trabajo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE orden_trabajo_equipo_id_orden_trabajo_seq OWNED BY orden_trabajo_equipo.id_orden_trabajo;


--
-- TOC entry 216 (class 1259 OID 16492)
-- Name: parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE parte (
    id_parte integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    id_tipo_parte integer
);


ALTER TABLE parte OWNER TO mortal2018;

--
-- TOC entry 217 (class 1259 OID 16498)
-- Name: parte_id_parte_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE parte_id_parte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parte_id_parte_seq OWNER TO mortal2018;

--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 217
-- Name: parte_id_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE parte_id_parte_seq OWNED BY parte.id_parte;


--
-- TOC entry 218 (class 1259 OID 16500)
-- Name: paso; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE paso (
    id_paso integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    id_procedimiento integer
);


ALTER TABLE paso OWNER TO mortal2018;

--
-- TOC entry 219 (class 1259 OID 16506)
-- Name: paso_id_paso_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE paso_id_paso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paso_id_paso_seq OWNER TO mortal2018;

--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 219
-- Name: paso_id_paso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE paso_id_paso_seq OWNED BY paso.id_paso;


--
-- TOC entry 220 (class 1259 OID 16508)
-- Name: prioridad; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE prioridad (
    id_prioridad integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    activo boolean
);


ALTER TABLE prioridad OWNER TO mortal2018;

--
-- TOC entry 221 (class 1259 OID 16514)
-- Name: prioridad_id_prioridad_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE prioridad_id_prioridad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prioridad_id_prioridad_seq OWNER TO mortal2018;

--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 221
-- Name: prioridad_id_prioridad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE prioridad_id_prioridad_seq OWNED BY prioridad.id_prioridad;


--
-- TOC entry 222 (class 1259 OID 16516)
-- Name: procedimiento; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE procedimiento (
    id_procedimiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean,
    descripcion text,
    id_diagnostico integer
);


ALTER TABLE procedimiento OWNER TO mortal2018;

--
-- TOC entry 223 (class 1259 OID 16522)
-- Name: procedimiento_id_procedimiento_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE procedimiento_id_procedimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE procedimiento_id_procedimiento_seq OWNER TO mortal2018;

--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedimiento_id_procedimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE procedimiento_id_procedimiento_seq OWNED BY procedimiento.id_procedimiento;


--
-- TOC entry 224 (class 1259 OID 16524)
-- Name: responsable; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE responsable (
    id_responsable integer NOT NULL,
    nombre character varying(50),
    activo boolean,
    descripcion text,
    id_tipo_responsable integer
);


ALTER TABLE responsable OWNER TO mortal2018;

--
-- TOC entry 225 (class 1259 OID 16530)
-- Name: responsable_id_responsable_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE responsable_id_responsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE responsable_id_responsable_seq OWNER TO mortal2018;

--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 225
-- Name: responsable_id_responsable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE responsable_id_responsable_seq OWNED BY responsable.id_responsable;


--
-- TOC entry 226 (class 1259 OID 16532)
-- Name: solicitud; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE solicitud (
    id_solicitud integer NOT NULL,
    solicitante character varying(255),
    fecha_solicitud date,
    activo boolean,
    correlativo character varying(50),
    observaciones text,
    id_unidad integer,
    id_usuario integer
);


ALTER TABLE solicitud OWNER TO mortal2018;

--
-- TOC entry 227 (class 1259 OID 16538)
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE solicitud_id_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solicitud_id_solicitud_seq OWNER TO mortal2018;

--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 227
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE solicitud_id_solicitud_seq OWNED BY solicitud.id_solicitud;


--
-- TOC entry 228 (class 1259 OID 16540)
-- Name: sub_tipo_mantenimiento; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE sub_tipo_mantenimiento (
    id_sub_tipo_mantenimiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE sub_tipo_mantenimiento OWNER TO mortal2018;

--
-- TOC entry 229 (class 1259 OID 16546)
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq OWNER TO mortal2018;

--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 229
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq OWNED BY sub_tipo_mantenimiento.id_sub_tipo_mantenimiento;


--
-- TOC entry 230 (class 1259 OID 16548)
-- Name: tipo_mantenimiento; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE tipo_mantenimiento (
    id_tipo_mantenimiento integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descipcion text,
    activo boolean,
    id_sub_tipo_mantenimiento integer
);


ALTER TABLE tipo_mantenimiento OWNER TO mortal2018;

--
-- TOC entry 231 (class 1259 OID 16554)
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE tipo_mantenimiento_id_tipo_mantenimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_mantenimiento_id_tipo_mantenimiento_seq OWNER TO mortal2018;

--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE tipo_mantenimiento_id_tipo_mantenimiento_seq OWNED BY tipo_mantenimiento.id_tipo_mantenimiento;


--
-- TOC entry 232 (class 1259 OID 16556)
-- Name: tipo_parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE tipo_parte (
    id_tipo_parte integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE tipo_parte OWNER TO mortal2018;

--
-- TOC entry 233 (class 1259 OID 16562)
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE tipo_parte_id_tipo_parte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_parte_id_tipo_parte_seq OWNER TO mortal2018;

--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE tipo_parte_id_tipo_parte_seq OWNED BY tipo_parte.id_tipo_parte;


--
-- TOC entry 234 (class 1259 OID 16564)
-- Name: tipo_responsable; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE tipo_responsable (
    id_tipo_responsable integer NOT NULL,
    nombre character varying(50),
    descripciont text
);


ALTER TABLE tipo_responsable OWNER TO mortal2018;

--
-- TOC entry 235 (class 1259 OID 16570)
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE tipo_responsable_id_tipo_responsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_responsable_id_tipo_responsable_seq OWNER TO mortal2018;

--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE tipo_responsable_id_tipo_responsable_seq OWNED BY tipo_responsable.id_tipo_responsable;


--
-- TOC entry 236 (class 1259 OID 16572)
-- Name: unidad; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE unidad (
    id_unidad integer NOT NULL,
    nombre character varying(50) NOT NULL,
    codigo character varying
);


ALTER TABLE unidad OWNER TO mortal2018;

--
-- TOC entry 237 (class 1259 OID 16578)
-- Name: unidad_id_unidad_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE unidad_id_unidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_id_unidad_seq OWNER TO mortal2018;

--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 237
-- Name: unidad_id_unidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE unidad_id_unidad_seq OWNED BY unidad.id_unidad;


--
-- TOC entry 239 (class 1259 OID 16783)
-- Name: usuario; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    identificador character varying(50)
);


ALTER TABLE usuario OWNER TO mortal2018;

--
-- TOC entry 238 (class 1259 OID 16781)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO mortal2018;

--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 238
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 2183 (class 2604 OID 16580)
-- Name: calendario id_fecha; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario ALTER COLUMN id_fecha SET DEFAULT nextval('calendario_id_fecha_seq'::regclass);


--
-- TOC entry 2184 (class 2604 OID 16581)
-- Name: calendario_excepcion id_excepcion; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario_excepcion ALTER COLUMN id_excepcion SET DEFAULT nextval('calendario_excepcion_id_excepcion_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 16582)
-- Name: diagnostico id_diagnostico; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('diagnostico_id_diagnostico_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 16583)
-- Name: diagnostico_parte id_diagnostico_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte ALTER COLUMN id_diagnostico_parte SET DEFAULT nextval('diagnostico_parte_id_diagnostico_parte_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 16584)
-- Name: equipo id_equipo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo ALTER COLUMN id_equipo SET DEFAULT nextval('equipo_id_equipo_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 16585)
-- Name: equipo_detalle id_equipo_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle ALTER COLUMN id_equipo_detalle SET DEFAULT nextval('equipo_detalle_id_equipo_detalle_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 16586)
-- Name: estado id_estado; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado ALTER COLUMN id_estado SET DEFAULT nextval('estado_id_estado_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 16587)
-- Name: estado_mantenimiento_detalle id_estado_mantenimiento_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle ALTER COLUMN id_estado_mantenimiento_detalle SET DEFAULT nextval('estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 16588)
-- Name: mantenimiento_detalle id_mantenimiento_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY mantenimiento_detalle ALTER COLUMN id_mantenimiento_detalle SET DEFAULT nextval('mantenimiento_detalle_id_mantenimiento_detalle_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 16589)
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY marca ALTER COLUMN id_marca SET DEFAULT nextval('marca_id_marca_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 16590)
-- Name: modelo id_modelo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY modelo ALTER COLUMN id_modelo SET DEFAULT nextval('modelo_id_modelo_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 16591)
-- Name: orden id_orden; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden ALTER COLUMN id_orden SET DEFAULT nextval('orden_id_orden_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 16592)
-- Name: orden_calendario id_orden_calendario; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario ALTER COLUMN id_orden_calendario SET DEFAULT nextval('orden_calendario_id_orden_calendario_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 16593)
-- Name: orden_trabajo_equipo id_orden_trabajo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo ALTER COLUMN id_orden_trabajo SET DEFAULT nextval('orden_trabajo_equipo_id_orden_trabajo_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 16594)
-- Name: orden_trabajo_equipo_detalle id_orden_trabajo_equipo_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle ALTER COLUMN id_orden_trabajo_equipo_detalle SET DEFAULT nextval('orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 16595)
-- Name: parte id_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY parte ALTER COLUMN id_parte SET DEFAULT nextval('parte_id_parte_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 16596)
-- Name: paso id_paso; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY paso ALTER COLUMN id_paso SET DEFAULT nextval('paso_id_paso_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 16597)
-- Name: prioridad id_prioridad; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY prioridad ALTER COLUMN id_prioridad SET DEFAULT nextval('prioridad_id_prioridad_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 16598)
-- Name: procedimiento id_procedimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY procedimiento ALTER COLUMN id_procedimiento SET DEFAULT nextval('procedimiento_id_procedimiento_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 16599)
-- Name: responsable id_responsable; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY responsable ALTER COLUMN id_responsable SET DEFAULT nextval('responsable_id_responsable_seq'::regclass);


--
-- TOC entry 2203 (class 2604 OID 16600)
-- Name: solicitud id_solicitud; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY solicitud ALTER COLUMN id_solicitud SET DEFAULT nextval('solicitud_id_solicitud_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 16601)
-- Name: sub_tipo_mantenimiento id_sub_tipo_mantenimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY sub_tipo_mantenimiento ALTER COLUMN id_sub_tipo_mantenimiento SET DEFAULT nextval('sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq'::regclass);


--
-- TOC entry 2205 (class 2604 OID 16602)
-- Name: tipo_mantenimiento id_tipo_mantenimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_mantenimiento ALTER COLUMN id_tipo_mantenimiento SET DEFAULT nextval('tipo_mantenimiento_id_tipo_mantenimiento_seq'::regclass);


--
-- TOC entry 2206 (class 2604 OID 16603)
-- Name: tipo_parte id_tipo_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_parte ALTER COLUMN id_tipo_parte SET DEFAULT nextval('tipo_parte_id_tipo_parte_seq'::regclass);


--
-- TOC entry 2207 (class 2604 OID 16604)
-- Name: tipo_responsable id_tipo_responsable; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_responsable ALTER COLUMN id_tipo_responsable SET DEFAULT nextval('tipo_responsable_id_tipo_responsable_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 16605)
-- Name: unidad id_unidad; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY unidad ALTER COLUMN id_unidad SET DEFAULT nextval('unidad_id_unidad_seq'::regclass);


--
-- TOC entry 2209 (class 2604 OID 16786)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2407 (class 0 OID 16387)
-- Dependencies: 185
-- Data for Name: calendario; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY calendario (id_fecha, fecha, descripcion, recurrente) FROM stdin;
\.


--
-- TOC entry 2408 (class 0 OID 16393)
-- Dependencies: 186
-- Data for Name: calendario_excepcion; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY calendario_excepcion (id_excepcion, fecha, estado, descripcion) FROM stdin;
\.


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 187
-- Name: calendario_excepcion_id_excepcion_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('calendario_excepcion_id_excepcion_seq', 1, false);


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 188
-- Name: calendario_id_fecha_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('calendario_id_fecha_seq', 1, false);


--
-- TOC entry 2411 (class 0 OID 16403)
-- Dependencies: 189
-- Data for Name: diagnostico; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY diagnostico (id_diagnostico, nombre, descripcion) FROM stdin;
1	Cambio de componente	El componente ya no tiene arreglo, necesita cambiarse
\.


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 190
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('diagnostico_id_diagnostico_seq', 1, true);


--
-- TOC entry 2413 (class 0 OID 16411)
-- Dependencies: 191
-- Data for Name: diagnostico_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY diagnostico_parte (id_diagnostico_parte, id_diagnostico, id_parte) FROM stdin;
\.


--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 192
-- Name: diagnostico_parte_id_diagnostico_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('diagnostico_parte_id_diagnostico_parte_seq', 1, false);


--
-- TOC entry 2415 (class 0 OID 16416)
-- Dependencies: 193
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY equipo (id_equipo, no_inventario, observaciones, id_marca, responsable, fecha_ingreso) FROM stdin;
1	123456789	Reporte de falla	2	Carlos	2018-06-06
2	123456789	Falla terminada	2	Carlos	2017-06-06
\.


--
-- TOC entry 2416 (class 0 OID 16422)
-- Dependencies: 194
-- Data for Name: equipo_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY equipo_detalle (id_equipo, id_parte, id_equipo_detalle, id_modelo, id_marca, activo, n_inventario, serie, caracteristicas) FROM stdin;
1	2	1	1	1	t	123456789-1	Serie	Caracterisitcas
\.


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 195
-- Name: equipo_detalle_id_equipo_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('equipo_detalle_id_equipo_detalle_seq', 1, false);


--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 196
-- Name: equipo_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('equipo_id_equipo_seq', 2, true);


--
-- TOC entry 2419 (class 0 OID 16432)
-- Dependencies: 197
-- Data for Name: equipo_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY equipo_parte (id_equipo, id_parte) FROM stdin;
1	2
2	1
\.


--
-- TOC entry 2420 (class 0 OID 16435)
-- Dependencies: 198
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY estado (id_estado, nombre, activo, descripcion) FROM stdin;
1	En proceso	t	Estado para cuando este en proceso
2	Terminado	t	Estado para cuando este terminado
\.


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 199
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('estado_id_estado_seq', 2, true);


--
-- TOC entry 2422 (class 0 OID 16443)
-- Dependencies: 200
-- Data for Name: estado_mantenimiento_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY estado_mantenimiento_detalle (id_estado_mantenimiento_detalle, id_mantenimiento_detalle, id_estado, id_responsable, id_paso, observaciones) FROM stdin;
4	1	2	2	4	\N
5	1	2	2	5	\N
6	1	2	3	6	\N
1	1	1	1	1	Observacion 1
2	1	1	1	2	Obsercacion 2
3	1	2	1	3	Observacion 3
\.


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 201
-- Name: estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq', 6, true);


--
-- TOC entry 2424 (class 0 OID 16448)
-- Dependencies: 202
-- Data for Name: mantenimiento_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY mantenimiento_detalle (id_mantenimiento_detalle, id_equipo_detalle, id_oden_trabajo) FROM stdin;
1	1	1
\.


--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 203
-- Name: mantenimiento_detalle_id_mantenimiento_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('mantenimiento_detalle_id_mantenimiento_detalle_seq', 1, true);


--
-- TOC entry 2426 (class 0 OID 16453)
-- Dependencies: 204
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY marca (id_marca, nombre, activo, descripcion) FROM stdin;
1	Dell	t	Descripcion de marca
2	Asus	t	Descripcion de marca de la pc de shobe
3	Hp	t	Pc hp
\.


--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 205
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('marca_id_marca_seq', 3, true);


--
-- TOC entry 2428 (class 0 OID 16461)
-- Dependencies: 206
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY modelo (id_modelo, nombre, activo, descripcion) FROM stdin;
1	X55-UAK	t	Modelo para marca ASUS
\.


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 207
-- Name: modelo_id_modelo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('modelo_id_modelo_seq', 1, true);


--
-- TOC entry 2430 (class 0 OID 16469)
-- Dependencies: 208
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY orden (id_orden, fecha, observaciones, activo, id_solicitud, id_unidad) FROM stdin;
4	2018-06-06	Primera orden	t	1	1
5	2017-06-06	Orden pasada	f	2	1
\.


--
-- TOC entry 2431 (class 0 OID 16475)
-- Dependencies: 209
-- Data for Name: orden_calendario; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY orden_calendario (id_orden_calendario, id_fecha, id_orden) FROM stdin;
\.


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 210
-- Name: orden_calendario_id_orden_calendario_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_calendario_id_orden_calendario_seq', 1, false);


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 211
-- Name: orden_id_orden_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_id_orden_seq', 5, true);


--
-- TOC entry 2434 (class 0 OID 16482)
-- Dependencies: 212
-- Data for Name: orden_trabajo_equipo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY orden_trabajo_equipo (id_orden_trabajo, fecha_inicio, fecha_estimada, id_orden, id_equipo, id_tipo_mantenimiento, id_prioridad, estado) FROM stdin;
1	2018-06-06	2018-06-10	4	1	1	1	f
\.


--
-- TOC entry 2435 (class 0 OID 16485)
-- Dependencies: 213
-- Data for Name: orden_trabajo_equipo_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY orden_trabajo_equipo_detalle (id_orden_trabajo_equipo_detalle, id_orden_trabajo, id_equipo, id_parte, id_usuario, id_rol) FROM stdin;
1	1	1	2	1	10
\.


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 214
-- Name: orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq', 1, true);


--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 215
-- Name: orden_trabajo_equipo_id_orden_trabajo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_trabajo_equipo_id_orden_trabajo_seq', 1, true);


--
-- TOC entry 2438 (class 0 OID 16492)
-- Dependencies: 216
-- Data for Name: parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY parte (id_parte, nombre, descripcion, id_tipo_parte) FROM stdin;
1	Motherboard	Tarjeta de circuito impreso	1
2	Ram	Tarjeta de memoria ram	1
3	Procesador	Procesador	1
4	Ventilador	Ventilador	1
\.


--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 217
-- Name: parte_id_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('parte_id_parte_seq', 4, true);


--
-- TOC entry 2440 (class 0 OID 16500)
-- Dependencies: 218
-- Data for Name: paso; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY paso (id_paso, nombre, descripcion, id_procedimiento) FROM stdin;
1	Cotizar precio	Ver opciones de venta	1
2	Solicitar fondos	Verificar si se tienen los fondos	1
3	Comprar el repuesto	Compar el repuesto en la mejor opcion de precio-calidad	1
4	Remover la parte dañada	Remover la parte dañada	2
5	Intalar el componente	Instalacion fisica del componente	3
6	Verificar funcionamiento	Verificar el correcto funcionamiento	3
\.


--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 219
-- Name: paso_id_paso_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('paso_id_paso_seq', 6, true);


--
-- TOC entry 2442 (class 0 OID 16508)
-- Dependencies: 220
-- Data for Name: prioridad; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY prioridad (id_prioridad, nombre, descripcion, activo) FROM stdin;
1	Urgente	Prioridad para los mantenimiento que son necesarios rapido	t
2	No urgente	Prioridad no urgente	t
\.


--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 221
-- Name: prioridad_id_prioridad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('prioridad_id_prioridad_seq', 2, true);


--
-- TOC entry 2444 (class 0 OID 16516)
-- Dependencies: 222
-- Data for Name: procedimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY procedimiento (id_procedimiento, nombre, activo, descripcion, id_diagnostico) FROM stdin;
1	Compra del elemento	t	Comprar un nuevo elemento con las mismas especificaciones	1
2	Remover elemento 	t	Remover el elemento inservible	\N
3	Instalar nuevo elemento	t	Instalar el nuevo elemento comprado	\N
\.


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedimiento_id_procedimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('procedimiento_id_procedimiento_seq', 3, true);


--
-- TOC entry 2446 (class 0 OID 16524)
-- Dependencies: 224
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY responsable (id_responsable, nombre, activo, descripcion, id_tipo_responsable) FROM stdin;
2	Juan Pleitez	t	Descripcion de jc	2
3	Diana Magaña	t	Descripcion	2
1	Roberto Carlos	t	Descripcion	1
\.


--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 225
-- Name: responsable_id_responsable_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('responsable_id_responsable_seq', 3, true);


--
-- TOC entry 2448 (class 0 OID 16532)
-- Dependencies: 226
-- Data for Name: solicitud; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY solicitud (id_solicitud, solicitante, fecha_solicitud, activo, correlativo, observaciones, id_unidad, id_usuario) FROM stdin;
1	Carlos	2018-06-06	t	123456789	No enciende la computadora	\N	10
2	Roberto Carlos	2017-06-06	t	123456789	Solicitud hecha	\N	10
3	CM15048	\N	f	987654321	Se arruino el cargador	0	10
36	CM15048	\N	f	987654321	otra falla :c	1	10
37	CM15048	\N	f	987654321	Otra falla x2	1	10
70	CM15048	\N	f	987654321	Otra falla x3	1	10
71	CM15048	\N	f	987654321	Falla x4	1	10
72	CM15048	\N	f	987654321	Falla x5	1	10
73	CM15048	\N	f	987654321	descripcion	1	10
74	CM15048	\N	f	987654321	descripcion x2	1	10
75	CM15048	\N	f	987654321	alsdjals	0	10
76	CM15048	\N	f	987654321	alsdjals	0	10
77	asdkalk	\N	f	akjsnd	sasda	0	10
78	Carlos	\N	f	q	q	0	10
\.


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 227
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('solicitud_id_solicitud_seq', 78, true);


--
-- TOC entry 2450 (class 0 OID 16540)
-- Dependencies: 228
-- Data for Name: sub_tipo_mantenimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY sub_tipo_mantenimiento (id_sub_tipo_mantenimiento, nombre, descripcion) FROM stdin;
1	Sub tipo mantenimiento 1	Descripcion de subtipo mantenimiento 1
\.


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 229
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq', 1, true);


--
-- TOC entry 2452 (class 0 OID 16548)
-- Dependencies: 230
-- Data for Name: tipo_mantenimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY tipo_mantenimiento (id_tipo_mantenimiento, nombre, descipcion, activo, id_sub_tipo_mantenimiento) FROM stdin;
1	Mantenimiento de hadware	descripcion de mantenimiento de harware	t	1
\.


--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('tipo_mantenimiento_id_tipo_mantenimiento_seq', 1, true);


--
-- TOC entry 2454 (class 0 OID 16556)
-- Dependencies: 232
-- Data for Name: tipo_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY tipo_parte (id_tipo_parte, nombre, descripcion) FROM stdin;
1	Parte de CPU	Partes que se necesitan para el correcto funcionamiento del cpu
\.


--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('tipo_parte_id_tipo_parte_seq', 1, true);


--
-- TOC entry 2456 (class 0 OID 16564)
-- Dependencies: 234
-- Data for Name: tipo_responsable; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY tipo_responsable (id_tipo_responsable, nombre, descripciont) FROM stdin;
1	tipo responsable compra	descripcion
2	tipo responsable reparacion o verificacion	descripcion de tipo responsable de reparacion
\.


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('tipo_responsable_id_tipo_responsable_seq', 2, true);


--
-- TOC entry 2458 (class 0 OID 16572)
-- Dependencies: 236
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY unidad (id_unidad, nombre, codigo) FROM stdin;
1	Unidad 1	30392842
\.


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 237
-- Name: unidad_id_unidad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('unidad_id_unidad_seq', 1, true);


--
-- TOC entry 2461 (class 0 OID 16783)
-- Dependencies: 239
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY usuario (id_usuario, identificador) FROM stdin;
1	CM15048
2	asdkalk
3	Carlos
\.


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 238
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 3, true);


--
-- TOC entry 2239 (class 2606 OID 16607)
-- Name: orden_trabajo_equipo ok_orden_trabajo_equipo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT ok_orden_trabajo_equipo PRIMARY KEY (id_orden_trabajo);


--
-- TOC entry 2211 (class 2606 OID 16609)
-- Name: calendario pk_calendario; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario
    ADD CONSTRAINT pk_calendario PRIMARY KEY (id_fecha);


--
-- TOC entry 2213 (class 2606 OID 16611)
-- Name: calendario_excepcion pk_calendario_excepcion; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario_excepcion
    ADD CONSTRAINT pk_calendario_excepcion PRIMARY KEY (id_excepcion);


--
-- TOC entry 2215 (class 2606 OID 16613)
-- Name: diagnostico pk_diagnostico; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico
    ADD CONSTRAINT pk_diagnostico PRIMARY KEY (id_diagnostico);


--
-- TOC entry 2217 (class 2606 OID 16615)
-- Name: diagnostico_parte pk_diagnostico_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte
    ADD CONSTRAINT pk_diagnostico_parte PRIMARY KEY (id_diagnostico_parte);


--
-- TOC entry 2219 (class 2606 OID 16617)
-- Name: equipo pk_equipo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT pk_equipo PRIMARY KEY (id_equipo);


--
-- TOC entry 2221 (class 2606 OID 16619)
-- Name: equipo_detalle pk_equipo_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle
    ADD CONSTRAINT pk_equipo_detalle PRIMARY KEY (id_equipo, id_parte);


--
-- TOC entry 2223 (class 2606 OID 16621)
-- Name: equipo_parte pk_equipo_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_parte
    ADD CONSTRAINT pk_equipo_parte PRIMARY KEY (id_equipo, id_parte);


--
-- TOC entry 2225 (class 2606 OID 16623)
-- Name: estado pk_estado; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (id_estado);


--
-- TOC entry 2227 (class 2606 OID 16625)
-- Name: estado_mantenimiento_detalle pk_estado_mantenimiento_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT pk_estado_mantenimiento_detalle PRIMARY KEY (id_estado_mantenimiento_detalle);


--
-- TOC entry 2229 (class 2606 OID 16627)
-- Name: mantenimiento_detalle pk_mantenimiento_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY mantenimiento_detalle
    ADD CONSTRAINT pk_mantenimiento_detalle PRIMARY KEY (id_mantenimiento_detalle);


--
-- TOC entry 2231 (class 2606 OID 16629)
-- Name: marca pk_marca; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (id_marca);


--
-- TOC entry 2233 (class 2606 OID 16631)
-- Name: modelo pk_modelo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT pk_modelo PRIMARY KEY (id_modelo);


--
-- TOC entry 2235 (class 2606 OID 16633)
-- Name: orden pk_orden; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden
    ADD CONSTRAINT pk_orden PRIMARY KEY (id_orden);


--
-- TOC entry 2237 (class 2606 OID 16635)
-- Name: orden_calendario pk_orden_calendario; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario
    ADD CONSTRAINT pk_orden_calendario PRIMARY KEY (id_orden_calendario);


--
-- TOC entry 2241 (class 2606 OID 16637)
-- Name: orden_trabajo_equipo_detalle pk_orden_trabajo_equipo_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle
    ADD CONSTRAINT pk_orden_trabajo_equipo_detalle PRIMARY KEY (id_orden_trabajo_equipo_detalle);


--
-- TOC entry 2243 (class 2606 OID 16639)
-- Name: parte pk_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY parte
    ADD CONSTRAINT pk_parte PRIMARY KEY (id_parte);


--
-- TOC entry 2245 (class 2606 OID 16641)
-- Name: paso pk_paso; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY paso
    ADD CONSTRAINT pk_paso PRIMARY KEY (id_paso);


--
-- TOC entry 2247 (class 2606 OID 16643)
-- Name: prioridad pk_prioridad; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY prioridad
    ADD CONSTRAINT pk_prioridad PRIMARY KEY (id_prioridad);


--
-- TOC entry 2249 (class 2606 OID 16645)
-- Name: procedimiento pk_procedimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY procedimiento
    ADD CONSTRAINT pk_procedimiento PRIMARY KEY (id_procedimiento);


--
-- TOC entry 2251 (class 2606 OID 16647)
-- Name: responsable pk_rsponsable; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY responsable
    ADD CONSTRAINT pk_rsponsable PRIMARY KEY (id_responsable);


--
-- TOC entry 2253 (class 2606 OID 16649)
-- Name: solicitud pk_solicitud; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud);


--
-- TOC entry 2255 (class 2606 OID 16651)
-- Name: sub_tipo_mantenimiento pk_sub_tipo_mantenimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY sub_tipo_mantenimiento
    ADD CONSTRAINT pk_sub_tipo_mantenimiento PRIMARY KEY (id_sub_tipo_mantenimiento);


--
-- TOC entry 2257 (class 2606 OID 16653)
-- Name: tipo_mantenimiento pk_tipo_mantenimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_mantenimiento
    ADD CONSTRAINT pk_tipo_mantenimiento PRIMARY KEY (id_tipo_mantenimiento);


--
-- TOC entry 2259 (class 2606 OID 16655)
-- Name: tipo_parte pk_tipo_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_parte
    ADD CONSTRAINT pk_tipo_parte PRIMARY KEY (id_tipo_parte);


--
-- TOC entry 2261 (class 2606 OID 16657)
-- Name: tipo_responsable pk_tipo_responsable; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_responsable
    ADD CONSTRAINT pk_tipo_responsable PRIMARY KEY (id_tipo_responsable);


--
-- TOC entry 2263 (class 2606 OID 16659)
-- Name: unidad pk_unidad; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY unidad
    ADD CONSTRAINT pk_unidad PRIMARY KEY (id_unidad);


--
-- TOC entry 2265 (class 2606 OID 16788)
-- Name: usuario pk_usuario; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2266 (class 2606 OID 16660)
-- Name: diagnostico_parte fk_diagnostico_parte_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte
    ADD CONSTRAINT fk_diagnostico_parte_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico) MATCH FULL;


--
-- TOC entry 2267 (class 2606 OID 16665)
-- Name: diagnostico_parte fk_diagnostico_parte_parte; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte
    ADD CONSTRAINT fk_diagnostico_parte_parte FOREIGN KEY (id_parte) REFERENCES parte(id_parte) MATCH FULL;


--
-- TOC entry 2268 (class 2606 OID 16670)
-- Name: equipo_detalle fk_equipo_detalle_marca; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle
    ADD CONSTRAINT fk_equipo_detalle_marca FOREIGN KEY (id_marca) REFERENCES marca(id_marca) MATCH FULL;


--
-- TOC entry 2269 (class 2606 OID 16675)
-- Name: equipo_detalle fk_equipo_detalle_modelo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle
    ADD CONSTRAINT fk_equipo_detalle_modelo FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo) MATCH FULL;


--
-- TOC entry 2270 (class 2606 OID 16680)
-- Name: equipo_parte fk_equipo_parte_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_parte
    ADD CONSTRAINT fk_equipo_parte_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo) MATCH FULL;


--
-- TOC entry 2271 (class 2606 OID 16685)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_estado; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado) MATCH FULL;


--
-- TOC entry 2272 (class 2606 OID 16690)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_mantenimiento_detalle; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_mantenimiento_detalle FOREIGN KEY (id_mantenimiento_detalle) REFERENCES mantenimiento_detalle(id_mantenimiento_detalle) MATCH FULL;


--
-- TOC entry 2273 (class 2606 OID 16695)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_responsable; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_responsable FOREIGN KEY (id_responsable) REFERENCES responsable(id_responsable) MATCH FULL;


--
-- TOC entry 2274 (class 2606 OID 16700)
-- Name: mantenimiento_detalle fk_mantenimiento_detalle_orden_trabajo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY mantenimiento_detalle
    ADD CONSTRAINT fk_mantenimiento_detalle_orden_trabajo_equipo FOREIGN KEY (id_oden_trabajo) REFERENCES orden_trabajo_equipo(id_orden_trabajo) MATCH FULL;


--
-- TOC entry 2277 (class 2606 OID 16705)
-- Name: orden_calendario fk_orden_calendario_calendario; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario
    ADD CONSTRAINT fk_orden_calendario_calendario FOREIGN KEY (id_fecha) REFERENCES calendario(id_fecha) MATCH FULL;


--
-- TOC entry 2278 (class 2606 OID 16710)
-- Name: orden_calendario fk_orden_calendario_orden; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario
    ADD CONSTRAINT fk_orden_calendario_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden) MATCH FULL;


--
-- TOC entry 2275 (class 2606 OID 16715)
-- Name: orden fk_orden_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden
    ADD CONSTRAINT fk_orden_solicitud FOREIGN KEY (id_solicitud) REFERENCES solicitud(id_solicitud) MATCH FULL;


--
-- TOC entry 2283 (class 2606 OID 16720)
-- Name: orden_trabajo_equipo_detalle fk_orden_trabajo_equipo_detalle_equipo_detalle; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle
    ADD CONSTRAINT fk_orden_trabajo_equipo_detalle_equipo_detalle FOREIGN KEY (id_equipo, id_parte) REFERENCES equipo_detalle(id_equipo, id_parte) MATCH FULL;


--
-- TOC entry 2284 (class 2606 OID 16725)
-- Name: orden_trabajo_equipo_detalle fk_orden_trabajo_equipo_detalle_orden_trabajo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle
    ADD CONSTRAINT fk_orden_trabajo_equipo_detalle_orden_trabajo_equipo FOREIGN KEY (id_orden_trabajo) REFERENCES orden_trabajo_equipo(id_orden_trabajo) MATCH FULL;


--
-- TOC entry 2279 (class 2606 OID 16730)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo) MATCH FULL;


--
-- TOC entry 2280 (class 2606 OID 16735)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_orden; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden) MATCH FULL;


--
-- TOC entry 2281 (class 2606 OID 16740)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_prioridad; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_prioridad FOREIGN KEY (id_prioridad) REFERENCES prioridad(id_prioridad) MATCH FULL;


--
-- TOC entry 2282 (class 2606 OID 16745)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_tipo_mantenimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_tipo_mantenimiento FOREIGN KEY (id_tipo_mantenimiento) REFERENCES tipo_mantenimiento(id_tipo_mantenimiento) MATCH FULL;


--
-- TOC entry 2276 (class 2606 OID 16750)
-- Name: orden fk_orden_unidad; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden
    ADD CONSTRAINT fk_orden_unidad FOREIGN KEY (id_unidad) REFERENCES unidad(id_unidad) MATCH FULL;


--
-- TOC entry 2285 (class 2606 OID 16755)
-- Name: parte fk_parte_tipo_parte; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY parte
    ADD CONSTRAINT fk_parte_tipo_parte FOREIGN KEY (id_tipo_parte) REFERENCES tipo_parte(id_tipo_parte) MATCH FULL;


--
-- TOC entry 2286 (class 2606 OID 16760)
-- Name: paso fk_paso_procedimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY paso
    ADD CONSTRAINT fk_paso_procedimiento FOREIGN KEY (id_procedimiento) REFERENCES procedimiento(id_procedimiento) MATCH FULL;


--
-- TOC entry 2287 (class 2606 OID 16765)
-- Name: procedimiento fk_procedimiento_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY procedimiento
    ADD CONSTRAINT fk_procedimiento_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico) MATCH FULL;


--
-- TOC entry 2288 (class 2606 OID 16770)
-- Name: responsable fk_responsable_tipo_responsable; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY responsable
    ADD CONSTRAINT fk_responsable_tipo_responsable FOREIGN KEY (id_tipo_responsable) REFERENCES tipo_responsable(id_tipo_responsable) MATCH FULL;


--
-- TOC entry 2289 (class 2606 OID 16775)
-- Name: tipo_mantenimiento fk_tipo_mantenimiento_sub_tipo_mantenimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_mantenimiento
    ADD CONSTRAINT fk_tipo_mantenimiento_sub_tipo_mantenimiento FOREIGN KEY (id_sub_tipo_mantenimiento) REFERENCES sub_tipo_mantenimiento(id_sub_tipo_mantenimiento) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-06-14 14:38:05 CST

--
-- PostgreSQL database dump complete
--


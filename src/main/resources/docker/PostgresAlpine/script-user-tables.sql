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

-- Started on 2018-06-08 21:52:41 CST

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
-- TOC entry 2456 (class 0 OID 0)
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
-- TOC entry 2457 (class 0 OID 0)
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
-- TOC entry 2458 (class 0 OID 0)
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
-- TOC entry 2459 (class 0 OID 0)
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
-- TOC entry 2460 (class 0 OID 0)
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
-- TOC entry 2461 (class 0 OID 0)
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
-- TOC entry 2462 (class 0 OID 0)
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
-- TOC entry 2463 (class 0 OID 0)
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
    id_paso integer
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
-- TOC entry 2464 (class 0 OID 0)
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
-- TOC entry 2465 (class 0 OID 0)
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
-- TOC entry 2466 (class 0 OID 0)
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
-- TOC entry 2467 (class 0 OID 0)
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
-- TOC entry 2468 (class 0 OID 0)
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
-- TOC entry 2469 (class 0 OID 0)
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
    id_prioridad integer
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
-- TOC entry 2470 (class 0 OID 0)
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
-- TOC entry 2471 (class 0 OID 0)
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
-- TOC entry 2472 (class 0 OID 0)
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
-- TOC entry 2473 (class 0 OID 0)
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
-- TOC entry 2474 (class 0 OID 0)
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
-- TOC entry 2475 (class 0 OID 0)
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
-- TOC entry 2476 (class 0 OID 0)
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
    id_unidad integer
);


ALTER TABLE solicitud OWNER TO mortal2018;

--
-- TOC entry 227 (class 1259 OID 16535)
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
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 227
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE solicitud_id_solicitud_seq OWNED BY solicitud.id_solicitud;


--
-- TOC entry 228 (class 1259 OID 16537)
-- Name: sub_tipo_mantenimiento; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE sub_tipo_mantenimiento (
    id_sub_tipo_mantenimiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE sub_tipo_mantenimiento OWNER TO mortal2018;

--
-- TOC entry 229 (class 1259 OID 16543)
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
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 229
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq OWNED BY sub_tipo_mantenimiento.id_sub_tipo_mantenimiento;


--
-- TOC entry 230 (class 1259 OID 16545)
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
-- TOC entry 231 (class 1259 OID 16551)
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
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE tipo_mantenimiento_id_tipo_mantenimiento_seq OWNED BY tipo_mantenimiento.id_tipo_mantenimiento;


--
-- TOC entry 232 (class 1259 OID 16553)
-- Name: tipo_parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE tipo_parte (
    id_tipo_parte integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE tipo_parte OWNER TO mortal2018;

--
-- TOC entry 233 (class 1259 OID 16559)
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
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE tipo_parte_id_tipo_parte_seq OWNED BY tipo_parte.id_tipo_parte;


--
-- TOC entry 234 (class 1259 OID 16561)
-- Name: tipo_responsable; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE tipo_responsable (
    id_tipo_responsable integer NOT NULL,
    nombre character varying(50),
    descripciont text
);


ALTER TABLE tipo_responsable OWNER TO mortal2018;

--
-- TOC entry 235 (class 1259 OID 16567)
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
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE tipo_responsable_id_tipo_responsable_seq OWNED BY tipo_responsable.id_tipo_responsable;


--
-- TOC entry 236 (class 1259 OID 16569)
-- Name: unidad; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE unidad (
    id_unidad integer NOT NULL,
    nombre character varying(50) NOT NULL,
    codigo character varying
);


ALTER TABLE unidad OWNER TO mortal2018;

--
-- TOC entry 237 (class 1259 OID 16575)
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
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 237
-- Name: unidad_id_unidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE unidad_id_unidad_seq OWNED BY unidad.id_unidad;


--
-- TOC entry 2176 (class 2604 OID 16577)
-- Name: calendario id_fecha; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario ALTER COLUMN id_fecha SET DEFAULT nextval('calendario_id_fecha_seq'::regclass);


--
-- TOC entry 2177 (class 2604 OID 16578)
-- Name: calendario_excepcion id_excepcion; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario_excepcion ALTER COLUMN id_excepcion SET DEFAULT nextval('calendario_excepcion_id_excepcion_seq'::regclass);


--
-- TOC entry 2178 (class 2604 OID 16579)
-- Name: diagnostico id_diagnostico; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('diagnostico_id_diagnostico_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 16580)
-- Name: diagnostico_parte id_diagnostico_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte ALTER COLUMN id_diagnostico_parte SET DEFAULT nextval('diagnostico_parte_id_diagnostico_parte_seq'::regclass);


--
-- TOC entry 2180 (class 2604 OID 16581)
-- Name: equipo id_equipo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo ALTER COLUMN id_equipo SET DEFAULT nextval('equipo_id_equipo_seq'::regclass);


--
-- TOC entry 2181 (class 2604 OID 16582)
-- Name: equipo_detalle id_equipo_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle ALTER COLUMN id_equipo_detalle SET DEFAULT nextval('equipo_detalle_id_equipo_detalle_seq'::regclass);


--
-- TOC entry 2182 (class 2604 OID 16583)
-- Name: estado id_estado; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado ALTER COLUMN id_estado SET DEFAULT nextval('estado_id_estado_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 16584)
-- Name: estado_mantenimiento_detalle id_estado_mantenimiento_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle ALTER COLUMN id_estado_mantenimiento_detalle SET DEFAULT nextval('estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq'::regclass);


--
-- TOC entry 2184 (class 2604 OID 16585)
-- Name: mantenimiento_detalle id_mantenimiento_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY mantenimiento_detalle ALTER COLUMN id_mantenimiento_detalle SET DEFAULT nextval('mantenimiento_detalle_id_mantenimiento_detalle_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 16586)
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY marca ALTER COLUMN id_marca SET DEFAULT nextval('marca_id_marca_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 16587)
-- Name: modelo id_modelo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY modelo ALTER COLUMN id_modelo SET DEFAULT nextval('modelo_id_modelo_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 16588)
-- Name: orden id_orden; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden ALTER COLUMN id_orden SET DEFAULT nextval('orden_id_orden_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 16589)
-- Name: orden_calendario id_orden_calendario; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario ALTER COLUMN id_orden_calendario SET DEFAULT nextval('orden_calendario_id_orden_calendario_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 16590)
-- Name: orden_trabajo_equipo id_orden_trabajo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo ALTER COLUMN id_orden_trabajo SET DEFAULT nextval('orden_trabajo_equipo_id_orden_trabajo_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 16591)
-- Name: orden_trabajo_equipo_detalle id_orden_trabajo_equipo_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle ALTER COLUMN id_orden_trabajo_equipo_detalle SET DEFAULT nextval('orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 16592)
-- Name: parte id_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY parte ALTER COLUMN id_parte SET DEFAULT nextval('parte_id_parte_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 16593)
-- Name: paso id_paso; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY paso ALTER COLUMN id_paso SET DEFAULT nextval('paso_id_paso_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 16594)
-- Name: prioridad id_prioridad; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY prioridad ALTER COLUMN id_prioridad SET DEFAULT nextval('prioridad_id_prioridad_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 16595)
-- Name: procedimiento id_procedimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY procedimiento ALTER COLUMN id_procedimiento SET DEFAULT nextval('procedimiento_id_procedimiento_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 16596)
-- Name: responsable id_responsable; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY responsable ALTER COLUMN id_responsable SET DEFAULT nextval('responsable_id_responsable_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 16597)
-- Name: solicitud id_solicitud; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY solicitud ALTER COLUMN id_solicitud SET DEFAULT nextval('solicitud_id_solicitud_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 16598)
-- Name: sub_tipo_mantenimiento id_sub_tipo_mantenimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY sub_tipo_mantenimiento ALTER COLUMN id_sub_tipo_mantenimiento SET DEFAULT nextval('sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 16599)
-- Name: tipo_mantenimiento id_tipo_mantenimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_mantenimiento ALTER COLUMN id_tipo_mantenimiento SET DEFAULT nextval('tipo_mantenimiento_id_tipo_mantenimiento_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 16600)
-- Name: tipo_parte id_tipo_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_parte ALTER COLUMN id_tipo_parte SET DEFAULT nextval('tipo_parte_id_tipo_parte_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 16601)
-- Name: tipo_responsable id_tipo_responsable; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_responsable ALTER COLUMN id_tipo_responsable SET DEFAULT nextval('tipo_responsable_id_tipo_responsable_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 16602)
-- Name: unidad id_unidad; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY unidad ALTER COLUMN id_unidad SET DEFAULT nextval('unidad_id_unidad_seq'::regclass);


--
-- TOC entry 2397 (class 0 OID 16387)
-- Dependencies: 185
-- Data for Name: calendario; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2398 (class 0 OID 16393)
-- Dependencies: 186
-- Data for Name: calendario_excepcion; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 187
-- Name: calendario_excepcion_id_excepcion_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('calendario_excepcion_id_excepcion_seq', 1, false);


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 188
-- Name: calendario_id_fecha_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('calendario_id_fecha_seq', 1, false);


--
-- TOC entry 2401 (class 0 OID 16403)
-- Dependencies: 189
-- Data for Name: diagnostico; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 190
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('diagnostico_id_diagnostico_seq', 1, false);


--
-- TOC entry 2403 (class 0 OID 16411)
-- Dependencies: 191
-- Data for Name: diagnostico_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 192
-- Name: diagnostico_parte_id_diagnostico_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('diagnostico_parte_id_diagnostico_parte_seq', 1, false);


--
-- TOC entry 2405 (class 0 OID 16416)
-- Dependencies: 193
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2406 (class 0 OID 16422)
-- Dependencies: 194
-- Data for Name: equipo_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 195
-- Name: equipo_detalle_id_equipo_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('equipo_detalle_id_equipo_detalle_seq', 1, false);


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 196
-- Name: equipo_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('equipo_id_equipo_seq', 1, false);


--
-- TOC entry 2409 (class 0 OID 16432)
-- Dependencies: 197
-- Data for Name: equipo_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2410 (class 0 OID 16435)
-- Dependencies: 198
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 199
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('estado_id_estado_seq', 1, false);


--
-- TOC entry 2412 (class 0 OID 16443)
-- Dependencies: 200
-- Data for Name: estado_mantenimiento_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 201
-- Name: estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq', 1, false);


--
-- TOC entry 2414 (class 0 OID 16448)
-- Dependencies: 202
-- Data for Name: mantenimiento_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 203
-- Name: mantenimiento_detalle_id_mantenimiento_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('mantenimiento_detalle_id_mantenimiento_detalle_seq', 1, false);


--
-- TOC entry 2416 (class 0 OID 16453)
-- Dependencies: 204
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

INSERT INTO marca (id_marca, nombre, activo, descripcion) VALUES (1, 'Dell', true, 'Descripcion de marca');
INSERT INTO marca (id_marca, nombre, activo, descripcion) VALUES (2, 'Asus', true, 'Descripcion de marca de la pc de shobe');
INSERT INTO marca (id_marca, nombre, activo, descripcion) VALUES (3, 'Hp', true, 'Pc hp');


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 205
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('marca_id_marca_seq', 3, true);


--
-- TOC entry 2418 (class 0 OID 16461)
-- Dependencies: 206
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 207
-- Name: modelo_id_modelo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('modelo_id_modelo_seq', 1, false);


--
-- TOC entry 2420 (class 0 OID 16469)
-- Dependencies: 208
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2421 (class 0 OID 16475)
-- Dependencies: 209
-- Data for Name: orden_calendario; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 210
-- Name: orden_calendario_id_orden_calendario_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_calendario_id_orden_calendario_seq', 1, false);


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 211
-- Name: orden_id_orden_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_id_orden_seq', 1, false);


--
-- TOC entry 2424 (class 0 OID 16482)
-- Dependencies: 212
-- Data for Name: orden_trabajo_equipo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2425 (class 0 OID 16485)
-- Dependencies: 213
-- Data for Name: orden_trabajo_equipo_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 214
-- Name: orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq', 1, false);


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 215
-- Name: orden_trabajo_equipo_id_orden_trabajo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('orden_trabajo_equipo_id_orden_trabajo_seq', 1, false);


--
-- TOC entry 2428 (class 0 OID 16492)
-- Dependencies: 216
-- Data for Name: parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 217
-- Name: parte_id_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('parte_id_parte_seq', 1, false);


--
-- TOC entry 2430 (class 0 OID 16500)
-- Dependencies: 218
-- Data for Name: paso; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 219
-- Name: paso_id_paso_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('paso_id_paso_seq', 1, false);


--
-- TOC entry 2432 (class 0 OID 16508)
-- Dependencies: 220
-- Data for Name: prioridad; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 221
-- Name: prioridad_id_prioridad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('prioridad_id_prioridad_seq', 1, false);


--
-- TOC entry 2434 (class 0 OID 16516)
-- Dependencies: 222
-- Data for Name: procedimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedimiento_id_procedimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('procedimiento_id_procedimiento_seq', 1, false);


--
-- TOC entry 2436 (class 0 OID 16524)
-- Dependencies: 224
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 225
-- Name: responsable_id_responsable_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('responsable_id_responsable_seq', 1, false);


--
-- TOC entry 2438 (class 0 OID 16532)
-- Dependencies: 226
-- Data for Name: solicitud; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 227
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('solicitud_id_solicitud_seq', 1, false);


--
-- TOC entry 2440 (class 0 OID 16537)
-- Dependencies: 228
-- Data for Name: sub_tipo_mantenimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 229
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq', 1, false);


--
-- TOC entry 2442 (class 0 OID 16545)
-- Dependencies: 230
-- Data for Name: tipo_mantenimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('tipo_mantenimiento_id_tipo_mantenimiento_seq', 1, false);


--
-- TOC entry 2444 (class 0 OID 16553)
-- Dependencies: 232
-- Data for Name: tipo_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('tipo_parte_id_tipo_parte_seq', 1, false);


--
-- TOC entry 2446 (class 0 OID 16561)
-- Dependencies: 234
-- Data for Name: tipo_responsable; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('tipo_responsable_id_tipo_responsable_seq', 1, false);


--
-- TOC entry 2448 (class 0 OID 16569)
-- Dependencies: 236
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: mortal2018
--



--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 237
-- Name: unidad_id_unidad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('unidad_id_unidad_seq', 1, false);


--
-- TOC entry 2231 (class 2606 OID 16604)
-- Name: orden_trabajo_equipo ok_orden_trabajo_equipo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT ok_orden_trabajo_equipo PRIMARY KEY (id_orden_trabajo);


--
-- TOC entry 2203 (class 2606 OID 16606)
-- Name: calendario pk_calendario; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario
    ADD CONSTRAINT pk_calendario PRIMARY KEY (id_fecha);


--
-- TOC entry 2205 (class 2606 OID 16608)
-- Name: calendario_excepcion pk_calendario_excepcion; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY calendario_excepcion
    ADD CONSTRAINT pk_calendario_excepcion PRIMARY KEY (id_excepcion);


--
-- TOC entry 2207 (class 2606 OID 16610)
-- Name: diagnostico pk_diagnostico; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico
    ADD CONSTRAINT pk_diagnostico PRIMARY KEY (id_diagnostico);


--
-- TOC entry 2209 (class 2606 OID 16612)
-- Name: diagnostico_parte pk_diagnostico_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte
    ADD CONSTRAINT pk_diagnostico_parte PRIMARY KEY (id_diagnostico_parte);


--
-- TOC entry 2211 (class 2606 OID 16614)
-- Name: equipo pk_equipo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT pk_equipo PRIMARY KEY (id_equipo);


--
-- TOC entry 2213 (class 2606 OID 16616)
-- Name: equipo_detalle pk_equipo_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle
    ADD CONSTRAINT pk_equipo_detalle PRIMARY KEY (id_equipo, id_parte);


--
-- TOC entry 2215 (class 2606 OID 16618)
-- Name: equipo_parte pk_equipo_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_parte
    ADD CONSTRAINT pk_equipo_parte PRIMARY KEY (id_equipo, id_parte);


--
-- TOC entry 2217 (class 2606 OID 16620)
-- Name: estado pk_estado; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (id_estado);


--
-- TOC entry 2219 (class 2606 OID 16622)
-- Name: estado_mantenimiento_detalle pk_estado_mantenimiento_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT pk_estado_mantenimiento_detalle PRIMARY KEY (id_estado_mantenimiento_detalle);


--
-- TOC entry 2221 (class 2606 OID 16624)
-- Name: mantenimiento_detalle pk_mantenimiento_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY mantenimiento_detalle
    ADD CONSTRAINT pk_mantenimiento_detalle PRIMARY KEY (id_mantenimiento_detalle);


--
-- TOC entry 2223 (class 2606 OID 16626)
-- Name: marca pk_marca; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (id_marca);


--
-- TOC entry 2225 (class 2606 OID 16628)
-- Name: modelo pk_modelo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT pk_modelo PRIMARY KEY (id_modelo);


--
-- TOC entry 2227 (class 2606 OID 16630)
-- Name: orden pk_orden; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden
    ADD CONSTRAINT pk_orden PRIMARY KEY (id_orden);


--
-- TOC entry 2229 (class 2606 OID 16632)
-- Name: orden_calendario pk_orden_calendario; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario
    ADD CONSTRAINT pk_orden_calendario PRIMARY KEY (id_orden_calendario);


--
-- TOC entry 2233 (class 2606 OID 16634)
-- Name: orden_trabajo_equipo_detalle pk_orden_trabajo_equipo_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle
    ADD CONSTRAINT pk_orden_trabajo_equipo_detalle PRIMARY KEY (id_orden_trabajo_equipo_detalle);


--
-- TOC entry 2235 (class 2606 OID 16636)
-- Name: parte pk_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY parte
    ADD CONSTRAINT pk_parte PRIMARY KEY (id_parte);


--
-- TOC entry 2237 (class 2606 OID 16638)
-- Name: paso pk_paso; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY paso
    ADD CONSTRAINT pk_paso PRIMARY KEY (id_paso);


--
-- TOC entry 2239 (class 2606 OID 16640)
-- Name: prioridad pk_prioridad; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY prioridad
    ADD CONSTRAINT pk_prioridad PRIMARY KEY (id_prioridad);


--
-- TOC entry 2241 (class 2606 OID 16642)
-- Name: procedimiento pk_procedimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY procedimiento
    ADD CONSTRAINT pk_procedimiento PRIMARY KEY (id_procedimiento);


--
-- TOC entry 2243 (class 2606 OID 16644)
-- Name: responsable pk_rsponsable; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY responsable
    ADD CONSTRAINT pk_rsponsable PRIMARY KEY (id_responsable);


--
-- TOC entry 2245 (class 2606 OID 16646)
-- Name: solicitud pk_solicitud; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud);


--
-- TOC entry 2247 (class 2606 OID 16648)
-- Name: sub_tipo_mantenimiento pk_sub_tipo_mantenimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY sub_tipo_mantenimiento
    ADD CONSTRAINT pk_sub_tipo_mantenimiento PRIMARY KEY (id_sub_tipo_mantenimiento);


--
-- TOC entry 2249 (class 2606 OID 16650)
-- Name: tipo_mantenimiento pk_tipo_mantenimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_mantenimiento
    ADD CONSTRAINT pk_tipo_mantenimiento PRIMARY KEY (id_tipo_mantenimiento);


--
-- TOC entry 2251 (class 2606 OID 16652)
-- Name: tipo_parte pk_tipo_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_parte
    ADD CONSTRAINT pk_tipo_parte PRIMARY KEY (id_tipo_parte);


--
-- TOC entry 2253 (class 2606 OID 16654)
-- Name: tipo_responsable pk_tipo_responsable; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_responsable
    ADD CONSTRAINT pk_tipo_responsable PRIMARY KEY (id_tipo_responsable);


--
-- TOC entry 2255 (class 2606 OID 16656)
-- Name: unidad pk_unidad; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY unidad
    ADD CONSTRAINT pk_unidad PRIMARY KEY (id_unidad);


--
-- TOC entry 2256 (class 2606 OID 16657)
-- Name: diagnostico_parte fk_diagnostico_parte_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte
    ADD CONSTRAINT fk_diagnostico_parte_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico) MATCH FULL;


--
-- TOC entry 2257 (class 2606 OID 16662)
-- Name: diagnostico_parte fk_diagnostico_parte_parte; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY diagnostico_parte
    ADD CONSTRAINT fk_diagnostico_parte_parte FOREIGN KEY (id_parte) REFERENCES parte(id_parte) MATCH FULL;


--
-- TOC entry 2258 (class 2606 OID 16667)
-- Name: equipo_detalle fk_equipo_detalle_marca; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle
    ADD CONSTRAINT fk_equipo_detalle_marca FOREIGN KEY (id_marca) REFERENCES marca(id_marca) MATCH FULL;


--
-- TOC entry 2259 (class 2606 OID 16672)
-- Name: equipo_detalle fk_equipo_detalle_modelo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_detalle
    ADD CONSTRAINT fk_equipo_detalle_modelo FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo) MATCH FULL;


--
-- TOC entry 2260 (class 2606 OID 16677)
-- Name: equipo_parte fk_equipo_parte_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY equipo_parte
    ADD CONSTRAINT fk_equipo_parte_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo) MATCH FULL;


--
-- TOC entry 2261 (class 2606 OID 16682)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_estado; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado) MATCH FULL;


--
-- TOC entry 2262 (class 2606 OID 16687)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_mantenimiento_detalle; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_mantenimiento_detalle FOREIGN KEY (id_mantenimiento_detalle) REFERENCES mantenimiento_detalle(id_mantenimiento_detalle) MATCH FULL;


--
-- TOC entry 2263 (class 2606 OID 16692)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_responsable; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_responsable FOREIGN KEY (id_responsable) REFERENCES responsable(id_responsable) MATCH FULL;


--
-- TOC entry 2264 (class 2606 OID 16697)
-- Name: mantenimiento_detalle fk_mantenimiento_detalle_orden_trabajo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY mantenimiento_detalle
    ADD CONSTRAINT fk_mantenimiento_detalle_orden_trabajo_equipo FOREIGN KEY (id_oden_trabajo) REFERENCES orden_trabajo_equipo(id_orden_trabajo) MATCH FULL;


--
-- TOC entry 2267 (class 2606 OID 16702)
-- Name: orden_calendario fk_orden_calendario_calendario; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario
    ADD CONSTRAINT fk_orden_calendario_calendario FOREIGN KEY (id_fecha) REFERENCES calendario(id_fecha) MATCH FULL;


--
-- TOC entry 2268 (class 2606 OID 16707)
-- Name: orden_calendario fk_orden_calendario_orden; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_calendario
    ADD CONSTRAINT fk_orden_calendario_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden) MATCH FULL;


--
-- TOC entry 2265 (class 2606 OID 16712)
-- Name: orden fk_orden_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden
    ADD CONSTRAINT fk_orden_solicitud FOREIGN KEY (id_solicitud) REFERENCES solicitud(id_solicitud) MATCH FULL;


--
-- TOC entry 2273 (class 2606 OID 16717)
-- Name: orden_trabajo_equipo_detalle fk_orden_trabajo_equipo_detalle_equipo_detalle; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle
    ADD CONSTRAINT fk_orden_trabajo_equipo_detalle_equipo_detalle FOREIGN KEY (id_equipo, id_parte) REFERENCES equipo_detalle(id_equipo, id_parte) MATCH FULL;


--
-- TOC entry 2274 (class 2606 OID 16722)
-- Name: orden_trabajo_equipo_detalle fk_orden_trabajo_equipo_detalle_orden_trabajo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo_detalle
    ADD CONSTRAINT fk_orden_trabajo_equipo_detalle_orden_trabajo_equipo FOREIGN KEY (id_orden_trabajo) REFERENCES orden_trabajo_equipo(id_orden_trabajo) MATCH FULL;


--
-- TOC entry 2269 (class 2606 OID 16727)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo) MATCH FULL;


--
-- TOC entry 2270 (class 2606 OID 16732)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_orden; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden) MATCH FULL;


--
-- TOC entry 2271 (class 2606 OID 16737)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_prioridad; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_prioridad FOREIGN KEY (id_prioridad) REFERENCES prioridad(id_prioridad) MATCH FULL;


--
-- TOC entry 2272 (class 2606 OID 16742)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_tipo_mantenimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_tipo_mantenimiento FOREIGN KEY (id_tipo_mantenimiento) REFERENCES tipo_mantenimiento(id_tipo_mantenimiento) MATCH FULL;


--
-- TOC entry 2266 (class 2606 OID 16747)
-- Name: orden fk_orden_unidad; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY orden
    ADD CONSTRAINT fk_orden_unidad FOREIGN KEY (id_unidad) REFERENCES unidad(id_unidad) MATCH FULL;


--
-- TOC entry 2275 (class 2606 OID 16752)
-- Name: parte fk_parte_tipo_parte; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY parte
    ADD CONSTRAINT fk_parte_tipo_parte FOREIGN KEY (id_tipo_parte) REFERENCES tipo_parte(id_tipo_parte) MATCH FULL;


--
-- TOC entry 2276 (class 2606 OID 16757)
-- Name: paso fk_paso_procedimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY paso
    ADD CONSTRAINT fk_paso_procedimiento FOREIGN KEY (id_procedimiento) REFERENCES procedimiento(id_procedimiento) MATCH FULL;


--
-- TOC entry 2277 (class 2606 OID 16762)
-- Name: procedimiento fk_procedimiento_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY procedimiento
    ADD CONSTRAINT fk_procedimiento_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico) MATCH FULL;


--
-- TOC entry 2278 (class 2606 OID 16767)
-- Name: responsable fk_responsable_tipo_responsable; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY responsable
    ADD CONSTRAINT fk_responsable_tipo_responsable FOREIGN KEY (id_tipo_responsable) REFERENCES tipo_responsable(id_tipo_responsable) MATCH FULL;


--
-- TOC entry 2279 (class 2606 OID 16772)
-- Name: tipo_mantenimiento fk_tipo_mantenimiento_sub_tipo_mantenimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY tipo_mantenimiento
    ADD CONSTRAINT fk_tipo_mantenimiento_sub_tipo_mantenimiento FOREIGN KEY (id_sub_tipo_mantenimiento) REFERENCES sub_tipo_mantenimiento(id_sub_tipo_mantenimiento) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-06-08 21:52:41 CST

--
-- PostgreSQL database dump complete
--

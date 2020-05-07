--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-29 17:17:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1959 (class 1262 OID 49152)
-- Name: municipalidad; Type: DATABASE; Schema: -; Owner: postgres
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 174 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 174
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 49156)
-- Name: automotor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE automotor (
    patente text NOT NULL,
    valor numeric(11,2),
    anio integer,
    propietario integer
);


ALTER TABLE public.automotor OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 49170)
-- Name: contribuyente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contribuyente (
    numero integer NOT NULL,
    razon_social text
);


ALTER TABLE public.contribuyente OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 49162)
-- Name: inmueble; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inmueble (
    circunscripicon integer NOT NULL,
    manzana integer NOT NULL,
    lote integer NOT NULL,
    valor numeric(11,2)
);


ALTER TABLE public.inmueble OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 49165)
-- Name: propietario_inmueble; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE propietario_inmueble (
    circunscripicon integer,
    manzana integer,
    lote integer,
    propietario integer
);


ALTER TABLE public.propietario_inmueble OWNER TO postgres;

--
-- TOC entry 1951 (class 0 OID 49156)
-- Dependencies: 170
-- Data for Name: automotor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO automotor VALUES ('AAA 123', 87000.00, 2013, 5);
INSERT INTO automotor VALUES ('BBB 234', 127000.00, 2012, 6);
INSERT INTO automotor VALUES ('CCC 511', 45000.00, 2015, NULL);
INSERT INTO automotor VALUES ('DDD 234', 340000.00, 2015, 5);


--
-- TOC entry 1954 (class 0 OID 49170)
-- Dependencies: 173
-- Data for Name: contribuyente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO contribuyente VALUES (1, 'POPEYE');
INSERT INTO contribuyente VALUES (2, 'HIJITUS');
INSERT INTO contribuyente VALUES (3, 'GOMEZ');
INSERT INTO contribuyente VALUES (4, 'ANDREANI');
INSERT INTO contribuyente VALUES (5, 'LA BARCA SA');
INSERT INTO contribuyente VALUES (6, 'JUAN ARDILES');


--
-- TOC entry 1952 (class 0 OID 49162)
-- Dependencies: 171
-- Data for Name: inmueble; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inmueble VALUES (1, 2, 34, 1000000.00);
INSERT INTO inmueble VALUES (1, 2, 35, 2000000.00);
INSERT INTO inmueble VALUES (1, 3, 36, 3000000.00);


--
-- TOC entry 1953 (class 0 OID 49165)
-- Dependencies: 172
-- Data for Name: propietario_inmueble; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO propietario_inmueble VALUES (1, 2, 34, 1);
INSERT INTO propietario_inmueble VALUES (1, 2, 34, 5);
INSERT INTO propietario_inmueble VALUES (1, 2, 35, 3);


--
-- TOC entry 1836 (class 2606 OID 49169)
-- Name: pk_automotor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY automotor
    ADD CONSTRAINT pk_automotor PRIMARY KEY (patente);


--
-- TOC entry 1840 (class 2606 OID 49177)
-- Name: pk_contrbuyente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contribuyente
    ADD CONSTRAINT pk_contrbuyente PRIMARY KEY (numero);


--
-- TOC entry 1838 (class 2606 OID 49189)
-- Name: pk_inmueble; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inmueble
    ADD CONSTRAINT pk_inmueble PRIMARY KEY (circunscripicon, manzana, lote);


--
-- TOC entry 1841 (class 2606 OID 49178)
-- Name: fk_contrbuyente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY automotor
    ADD CONSTRAINT fk_contrbuyente FOREIGN KEY (propietario) REFERENCES contribuyente(numero);


--
-- TOC entry 1842 (class 2606 OID 49183)
-- Name: fk_contrbuyente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY propietario_inmueble
    ADD CONSTRAINT fk_contrbuyente FOREIGN KEY (propietario) REFERENCES contribuyente(numero);


--
-- TOC entry 1843 (class 2606 OID 49190)
-- Name: fk_inmueble; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY propietario_inmueble
    ADD CONSTRAINT fk_inmueble FOREIGN KEY (circunscripicon, manzana, lote) REFERENCES inmueble(circunscripicon, manzana, lote);


--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-04-29 17:17:07

--
-- PostgreSQL database dump complete
--


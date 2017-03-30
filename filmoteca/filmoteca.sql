--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: seq_actor_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_actor_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_actor_id OWNER TO postgres;

--
-- Name: seq_actor_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_actor_id', 66, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE actor (
    id integer DEFAULT nextval('seq_actor_id'::regclass),
    nombre text,
    pais integer
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: seq_director_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_director_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_director_id OWNER TO postgres;

--
-- Name: seq_director_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_director_id', 28, true);


--
-- Name: director; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE director (
    id integer DEFAULT nextval('seq_director_id'::regclass) NOT NULL,
    nombre text,
    pais integer
);


ALTER TABLE public.director OWNER TO postgres;

--
-- Name: seq_pais_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_pais_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_pais_id OWNER TO postgres;

--
-- Name: seq_pais_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_pais_id', 18, true);


--
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    id integer DEFAULT nextval('seq_pais_id'::regclass) NOT NULL,
    nombre text
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- Name: pelicula; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pelicula (
    id integer NOT NULL,
    nombre text,
    director integer,
    anio integer,
    pais integer NOT NULL
);


ALTER TABLE public.pelicula OWNER TO postgres;

--
-- Name: pelicula_actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pelicula_actor (
    pelicula integer,
    actor integer
);


ALTER TABLE public.pelicula_actor OWNER TO postgres;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO actor VALUES (21, 'Malcom McDowell', 3);
INSERT INTO actor VALUES (17, 'Shelley Duvall', 5);
INSERT INTO actor VALUES (23, 'Geena Davis', 5);
INSERT INTO actor VALUES (59, 'Kim Basinger', 5);
INSERT INTO actor VALUES (65, 'Bruno Gantz', 9);
INSERT INTO actor VALUES (66, 'China Zorrilla', 8);
INSERT INTO actor VALUES (1, 'Tom Hulce', 5);
INSERT INTO actor VALUES (2, 'Emilio Dissi', 4);
INSERT INTO actor VALUES (3, 'Soledad Villamil', 4);
INSERT INTO actor VALUES (4, 'Tim Robbins', 5);
INSERT INTO actor VALUES (5, 'Eric Roberts', 5);
INSERT INTO actor VALUES (6, 'Al Pacino', 5);
INSERT INTO actor VALUES (7, 'Anthony Hopkings', 16);
INSERT INTO actor VALUES (8, 'Gaston Pauls', 4);
INSERT INTO actor VALUES (9, 'Cate Blanchett', 15);
INSERT INTO actor VALUES (10, 'Nicole Kidmann', 15);
INSERT INTO actor VALUES (11, 'Bruce Willis', 5);
INSERT INTO actor VALUES (12, 'Luis Brandoni', 4);
INSERT INTO actor VALUES (13, 'Kevin Bacon', 5);
INSERT INTO actor VALUES (14, 'Jonathan Price', 16);
INSERT INTO actor VALUES (15, 'Miguel Bose', 1);
INSERT INTO actor VALUES (16, 'Sean Penn', 5);
INSERT INTO actor VALUES (19, 'Mercedes Moran', 4);
INSERT INTO actor VALUES (20, 'Marlon Brando', 5);
INSERT INTO actor VALUES (22, 'Cameron Diaz', 5);
INSERT INTO actor VALUES (24, 'Johnny Depp', 5);
INSERT INTO actor VALUES (25, 'Daniel Day Lewis', 3);
INSERT INTO actor VALUES (26, 'Michael Keaton', 5);
INSERT INTO actor VALUES (27, 'Ralph Fiennes', 3);
INSERT INTO actor VALUES (28, 'Keir Dullea', 5);
INSERT INTO actor VALUES (29, 'Edward Norton', 5);
INSERT INTO actor VALUES (30, 'Jodie Foster', 5);
INSERT INTO actor VALUES (31, 'Marisa Paredes', 1);
INSERT INTO actor VALUES (32, 'Gary Lockwood', 5);
INSERT INTO actor VALUES (33, 'Michelle Pfeiferr', 5);
INSERT INTO actor VALUES (34, 'Cecilia Roth', 4);
INSERT INTO actor VALUES (35, 'Brad Pitt', 5);
INSERT INTO actor VALUES (36, 'Paul Newmann', 5);
INSERT INTO actor VALUES (37, 'Naomi Watts', 15);
INSERT INTO actor VALUES (38, 'Patrick Magee', 3);
INSERT INTO actor VALUES (39, 'Pete Postlethwaite', 3);
INSERT INTO actor VALUES (40, 'Alec Baldwin', 5);
INSERT INTO actor VALUES (41, 'Robert Duvall', 5);
INSERT INTO actor VALUES (42, 'Robert De Niro', 5);
INSERT INTO actor VALUES (43, 'Jack Nicholson', 5);
INSERT INTO actor VALUES (44, 'Vincent Cassel', 2);
INSERT INTO actor VALUES (45, 'Ricardo Darin', 4);
INSERT INTO actor VALUES (46, 'Gino Reni', 4);
INSERT INTO actor VALUES (47, 'Kevin Spacey', 5);
INSERT INTO actor VALUES (48, 'Guillermo Francella', 4);
INSERT INTO actor VALUES (49, 'Monica Belucci', 18);
INSERT INTO actor VALUES (50, 'F Murray Abraham', 5);
INSERT INTO actor VALUES (51, 'James Caan', 1);
INSERT INTO actor VALUES (52, 'Christian Bale', 3);
INSERT INTO actor VALUES (53, 'Leonardo Di Caprio', 5);
INSERT INTO actor VALUES (54, 'Benicio del Toro', 17);
INSERT INTO actor VALUES (55, 'Hector Alterio', 4);
INSERT INTO actor VALUES (56, 'Jon Voight', 5);
INSERT INTO actor VALUES (57, 'Orlando Bloom', 3);
INSERT INTO actor VALUES (58, 'Susan Sarandon', 5);
INSERT INTO actor VALUES (60, 'Berugo Carambula', 8);
INSERT INTO actor VALUES (61, 'Tom Cruise', 5);
INSERT INTO actor VALUES (62, 'Eduardo Blanco', 4);
INSERT INTO actor VALUES (63, 'Owen Willson', 5);
INSERT INTO actor VALUES (64, 'Victoria Abril', 1);


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO director VALUES (1, 'Terry Gilliam', 3);
INSERT INTO director VALUES (2, 'Andrei Konchalovsky', 10);
INSERT INTO director VALUES (3, 'Ridley Scott', 3);
INSERT INTO director VALUES (4, 'Fabian Bielinski', 4);
INSERT INTO director VALUES (5, 'Jim Sheridan', 11);
INSERT INTO director VALUES (6, 'Garry Marshall', 5);
INSERT INTO director VALUES (7, 'Mary Harron', 12);
INSERT INTO director VALUES (8, 'Martin Scorsese', 5);
INSERT INTO director VALUES (9, 'David Fincher', 5);
INSERT INTO director VALUES (10, 'Tim Burton', 5);
INSERT INTO director VALUES (12, 'Juan Jose Campanella', 4);
INSERT INTO director VALUES (13, 'Clint Eastwood', 5);
INSERT INTO director VALUES (14, 'Sergio Renan', 4);
INSERT INTO director VALUES (15, 'Jonathan Demme', 5);
INSERT INTO director VALUES (16, 'Francis Ford Coppola', 5);
INSERT INTO director VALUES (17, 'Carlos Galettini', 4);
INSERT INTO director VALUES (18, 'Pedro Almodovar', 1);
INSERT INTO director VALUES (19, 'John Lasseter', 5);
INSERT INTO director VALUES (20, 'Brian De Palma', 5);
INSERT INTO director VALUES (21, 'Alejandro González Iñárritu', 13);
INSERT INTO director VALUES (22, 'Stanley Kubrik', 5);
INSERT INTO director VALUES (23, 'Milos Forman', 14);
INSERT INTO director VALUES (24, 'Brett Rattnet', 5);
INSERT INTO director VALUES (25, 'Bryan Singer', 5);
INSERT INTO director VALUES (26, 'Gore Verbinski', 5);
INSERT INTO director VALUES (27, 'Gaspar Noe', 4);
INSERT INTO director VALUES (11, 'Christopher Nolan', 3);
INSERT INTO director VALUES (28, 'Sam Mendes', 3);


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pais VALUES (1, 'España');
INSERT INTO pais VALUES (2, 'Francia');
INSERT INTO pais VALUES (3, 'Inglaterra');
INSERT INTO pais VALUES (4, 'Argentina');
INSERT INTO pais VALUES (5, 'Estados Unidos');
INSERT INTO pais VALUES (6, 'Alemania');
INSERT INTO pais VALUES (7, 'Israel');
INSERT INTO pais VALUES (8, 'Uruguay');
INSERT INTO pais VALUES (9, 'Suiza');
INSERT INTO pais VALUES (10, 'Rusia');
INSERT INTO pais VALUES (11, 'Irlanda');
INSERT INTO pais VALUES (12, 'Canada');
INSERT INTO pais VALUES (13, 'Mejico');
INSERT INTO pais VALUES (14, 'Checoslovaquia');
INSERT INTO pais VALUES (15, 'Australia');
INSERT INTO pais VALUES (16, 'Gales');
INSERT INTO pais VALUES (17, 'Puerto Rico');
INSERT INTO pais VALUES (18, 'Italia');


--
-- Data for Name: pelicula; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pelicula VALUES (31, 'Batman renace', 5, 2012, 5);
INSERT INTO pelicula VALUES (1, 'La naranja mecanica', 22, 1971, 5);
INSERT INTO pelicula VALUES (2, 'Amadeus', 23, 1984, 5);
INSERT INTO pelicula VALUES (3, 'Taxi Driver', 8, 1976, 5);
INSERT INTO pelicula VALUES (4, 'El Padrino', 16, 1972, 5);
INSERT INTO pelicula VALUES (5, 'El Padrino II', 16, 1974, 5);
INSERT INTO pelicula VALUES (6, 'La Tregua', 14, 1974, 4);
INSERT INTO pelicula VALUES (7, 'El secreto de sus ojos', 12, 2009, 4);
INSERT INTO pelicula VALUES (8, 'Los bañeros más locos del mundo', 17, 1987, 4);
INSERT INTO pelicula VALUES (9, 'Todo sobre mi madre', 18, 1999, 1);
INSERT INTO pelicula VALUES (10, '2001 Odisea al espacio', 22, 1968, 5);
INSERT INTO pelicula VALUES (11, 'El Resplandor', 22, 1980, 5);
INSERT INTO pelicula VALUES (12, 'Escape en tren', 2, 1985, 5);
INSERT INTO pelicula VALUES (13, 'Atrapado sin salida', 23, 1975, 5);
INSERT INTO pelicula VALUES (14, 'Tacones Lejanos', 18, 1991, 1);
INSERT INTO pelicula VALUES (15, 'American Psycho', 7, 2000, 5);
INSERT INTO pelicula VALUES (16, 'El Silencio de los Inocentes', 15, 1991, 5);
INSERT INTO pelicula VALUES (17, 'Dragon Rojo', 24, 2002, 5);
INSERT INTO pelicula VALUES (18, 'El club de la pelea', 9, 1999, 5);
INSERT INTO pelicula VALUES (19, 'Thelma y Louise', 3, 1991, 5);
INSERT INTO pelicula VALUES (20, 'Río Místico', 13, 2003, 5);
INSERT INTO pelicula VALUES (21, 'Irreversibe', 27, 2002, 2);
INSERT INTO pelicula VALUES (22, '12 Monos', 1, 1995, 5);
INSERT INTO pelicula VALUES (23, 'Mision Imposible', 20, 1996, 1);
INSERT INTO pelicula VALUES (24, 'Ojos Bien Cerrados', 22, 1999, 5);
INSERT INTO pelicula VALUES (25, 'Nueve Reinas', 4, 2000, 4);
INSERT INTO pelicula VALUES (26, 'El mismo amor, la misma lluvia', 12, 1999, 4);
INSERT INTO pelicula VALUES (27, 'Luna de avellaneda', 12, 2004, 4);
INSERT INTO pelicula VALUES (28, 'Beetlejuice', 10, 1988, 5);
INSERT INTO pelicula VALUES (29, 'Batman', 10, 1989, 5);
INSERT INTO pelicula VALUES (30, 'Cars', 19, 2006, 5);
INSERT INTO pelicula VALUES (32, 'El aviador', 8, 2004, 5);
INSERT INTO pelicula VALUES (33, 'Pandillas de Nueva York', 8, 2002, 5);
INSERT INTO pelicula VALUES (34, 'En el nombre del padre', 5, 1993, 3);
INSERT INTO pelicula VALUES (35, 'Los sospechosos de siempre', 25, 1995, 5);
INSERT INTO pelicula VALUES (36, 'Belleza americana', 28, 1999, 5);
INSERT INTO pelicula VALUES (37, 'Mi pie izquierdo', 5, 1989, 3);
INSERT INTO pelicula VALUES (38, 'Brazil', 1, 1985, 3);
INSERT INTO pelicula VALUES (39, 'Piratas del Caribe', 26, 2003, 5);
INSERT INTO pelicula VALUES (40, 'Miedo y asco en las vegas', 1, 1998, 5);
INSERT INTO pelicula VALUES (41, '21 gramos', 21, 2003, 5);
INSERT INTO pelicula VALUES (42, 'Sacrface', 20, 1983, 5);
INSERT INTO pelicula VALUES (43, 'Frankie y Johnny', 6, 1991, 5);


--
-- Data for Name: pelicula_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pelicula_actor VALUES (4, 51);
INSERT INTO pelicula_actor VALUES (5, 41);
INSERT INTO pelicula_actor VALUES (7, 48);
INSERT INTO pelicula_actor VALUES (8, 60);
INSERT INTO pelicula_actor VALUES (14, 15);
INSERT INTO pelicula_actor VALUES (17, 27);
INSERT INTO pelicula_actor VALUES (19, 58);
INSERT INTO pelicula_actor VALUES (20, 13);
INSERT INTO pelicula_actor VALUES (26, 62);
INSERT INTO pelicula_actor VALUES (27, 62);
INSERT INTO pelicula_actor VALUES (28, 26);
INSERT INTO pelicula_actor VALUES (29, 26);
INSERT INTO pelicula_actor VALUES (30, 26);
INSERT INTO pelicula_actor VALUES (33, 22);
INSERT INTO pelicula_actor VALUES (35, 54);
INSERT INTO pelicula_actor VALUES (39, 24);
INSERT INTO pelicula_actor VALUES (41, 37);
INSERT INTO pelicula_actor VALUES (4, 41);
INSERT INTO pelicula_actor VALUES (1, 21);
INSERT INTO pelicula_actor VALUES (2, 50);
INSERT INTO pelicula_actor VALUES (3, 42);
INSERT INTO pelicula_actor VALUES (4, 20);
INSERT INTO pelicula_actor VALUES (5, 6);
INSERT INTO pelicula_actor VALUES (6, 55);
INSERT INTO pelicula_actor VALUES (7, 45);
INSERT INTO pelicula_actor VALUES (8, 46);
INSERT INTO pelicula_actor VALUES (9, 34);
INSERT INTO pelicula_actor VALUES (10, 28);
INSERT INTO pelicula_actor VALUES (11, 43);
INSERT INTO pelicula_actor VALUES (12, 56);
INSERT INTO pelicula_actor VALUES (13, 43);
INSERT INTO pelicula_actor VALUES (14, 64);
INSERT INTO pelicula_actor VALUES (15, 52);
INSERT INTO pelicula_actor VALUES (16, 7);
INSERT INTO pelicula_actor VALUES (17, 7);
INSERT INTO pelicula_actor VALUES (18, 29);
INSERT INTO pelicula_actor VALUES (19, 23);
INSERT INTO pelicula_actor VALUES (20, 16);
INSERT INTO pelicula_actor VALUES (21, 49);
INSERT INTO pelicula_actor VALUES (22, 11);
INSERT INTO pelicula_actor VALUES (23, 56);
INSERT INTO pelicula_actor VALUES (24, 10);
INSERT INTO pelicula_actor VALUES (25, 45);
INSERT INTO pelicula_actor VALUES (26, 45);
INSERT INTO pelicula_actor VALUES (27, 45);
INSERT INTO pelicula_actor VALUES (28, 23);
INSERT INTO pelicula_actor VALUES (29, 43);
INSERT INTO pelicula_actor VALUES (30, 63);
INSERT INTO pelicula_actor VALUES (31, 52);
INSERT INTO pelicula_actor VALUES (32, 53);
INSERT INTO pelicula_actor VALUES (33, 53);
INSERT INTO pelicula_actor VALUES (34, 39);
INSERT INTO pelicula_actor VALUES (33, 25);
INSERT INTO pelicula_actor VALUES (34, 25);
INSERT INTO pelicula_actor VALUES (35, 39);
INSERT INTO pelicula_actor VALUES (36, 47);
INSERT INTO pelicula_actor VALUES (37, 25);
INSERT INTO pelicula_actor VALUES (38, 42);
INSERT INTO pelicula_actor VALUES (39, 57);
INSERT INTO pelicula_actor VALUES (40, 24);
INSERT INTO pelicula_actor VALUES (41, 16);
INSERT INTO pelicula_actor VALUES (42, 6);
INSERT INTO pelicula_actor VALUES (43, 6);
INSERT INTO pelicula_actor VALUES (1, 38);
INSERT INTO pelicula_actor VALUES (2, 1);
INSERT INTO pelicula_actor VALUES (3, 30);
INSERT INTO pelicula_actor VALUES (4, 6);
INSERT INTO pelicula_actor VALUES (5, 42);
INSERT INTO pelicula_actor VALUES (6, 12);
INSERT INTO pelicula_actor VALUES (7, 3);
INSERT INTO pelicula_actor VALUES (8, 2);
INSERT INTO pelicula_actor VALUES (9, 31);
INSERT INTO pelicula_actor VALUES (10, 32);
INSERT INTO pelicula_actor VALUES (11, 17);
INSERT INTO pelicula_actor VALUES (12, 5);
INSERT INTO pelicula_actor VALUES (14, 31);
INSERT INTO pelicula_actor VALUES (16, 30);
INSERT INTO pelicula_actor VALUES (17, 29);
INSERT INTO pelicula_actor VALUES (18, 35);
INSERT INTO pelicula_actor VALUES (19, 35);
INSERT INTO pelicula_actor VALUES (20, 4);
INSERT INTO pelicula_actor VALUES (21, 44);
INSERT INTO pelicula_actor VALUES (22, 35);
INSERT INTO pelicula_actor VALUES (23, 61);
INSERT INTO pelicula_actor VALUES (24, 61);
INSERT INTO pelicula_actor VALUES (25, 8);
INSERT INTO pelicula_actor VALUES (26, 3);
INSERT INTO pelicula_actor VALUES (27, 19);
INSERT INTO pelicula_actor VALUES (28, 40);
INSERT INTO pelicula_actor VALUES (29, 59);
INSERT INTO pelicula_actor VALUES (30, 36);
INSERT INTO pelicula_actor VALUES (32, 9);
INSERT INTO pelicula_actor VALUES (35, 47);
INSERT INTO pelicula_actor VALUES (38, 14);
INSERT INTO pelicula_actor VALUES (39, 14);
INSERT INTO pelicula_actor VALUES (40, 54);
INSERT INTO pelicula_actor VALUES (41, 54);
INSERT INTO pelicula_actor VALUES (42, 33);
INSERT INTO pelicula_actor VALUES (43, 33);


--
-- Name: pk_director; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY director
    ADD CONSTRAINT pk_director PRIMARY KEY (id);


--
-- Name: pk_pais; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (id);


--
-- Name: pk_pelicula; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pelicula
    ADD CONSTRAINT pk_pelicula PRIMARY KEY (id);


--
-- Name: fk_director; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pelicula
    ADD CONSTRAINT fk_director FOREIGN KEY (director) REFERENCES director(id);


--
-- Name: fk_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pelicula
    ADD CONSTRAINT fk_pais FOREIGN KEY (pais) REFERENCES pais(id);


--
-- Name: fk_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT fk_pais FOREIGN KEY (pais) REFERENCES pais(id);


--
-- Name: fk_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY director
    ADD CONSTRAINT fk_pais FOREIGN KEY (pais) REFERENCES pais(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


BEGIN;

CREATE TABLE campeonato (
	anio integer,
	nombre text NOT NULL,
	CONSTRAINT pk_campeonato 
		PRIMARY KEY (anio)
);

CREATE TABLE equipo (
	numero_inscripcion integer,
	nombre text NOT NULL,
	barrio text NOT NULL,	
	CONSTRAINT pk_equipo
		PRIMARY KEY (numero_inscripcion)
);

CREATE TABLE jugador (
	dni integer,
	nombre text NOT NULL,
	CONSTRAINT pk_jugador 
		PRIMARY KEY (dni)
);

CREATE TABLE fecha (
	campeonato integer,
	numero integer,
	dia date,
	CONSTRAINT pk_fecha 
		PRIMARY KEY (campeonato, numero),
	CONSTRAINT fk_campeonato 
		FOREIGN KEY (campeonato)
		REFERENCES campeonato (anio)
);

CREATE TABLE partido (
	campeonato integer,
	fecha integer,
	numero integer,
	dia date,
	hora time,
	CONSTRAINT pk_partido
		PRIMARY KEY (campeonato, fecha, numero),
	CONSTRAINT fk_fecha
		FOREIGN KEY (campeonato, fecha)
		REFERENCES fecha (campeonato, numero)
);

CREATE TABLE gol (
	campeonato integer,
	fecha integer,
	partido integer,
	minuto integer,
	en_contra boolean NOT NULL DEFAULT false,
	goleador integer NOT NULL,
	asistente integer,
	
	CONSTRAINT pk_gol
		PRIMARY KEY (campeonato, fecha, partido, minuto),
	CONSTRAINT fk_partido
		FOREIGN KEY (campeonato, fecha, partido)
		REFERENCES partido (campeonato, fecha, numero),
	CONSTRAINT fk_goleador
		FOREIGN KEY (goleador)
		REFERENCES jugador (dni),

	CONSTRAINT fk_asistente
		FOREIGN KEY (asistente)
		REFERENCES jugador (dni)
		
);





ROLLBACK;
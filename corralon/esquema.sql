CREATE DATABASE ejemplo;

CREATE TABLE localidad (
	codigo int,
	nombre text,
	CONSTRAINT pk_localidad PRIMARY KEY (codigo)
	
);



CREATE TABLE cliente (
	numero_documento integer,
	localidad int ,
	domicilio text,
	CONSTRAINT pk_cliente PRIMARY KEY (numero_documento),
	CONSTRAINT fk_localidad FOREIGN KEY (localidad) REFERENCES localidad(codigo)
);

ALTER TABLE cliente ADD COLUMN nombre text NOT NULL;

CREATE TABLE producto (
	tipo text,
	codigo int,
	nombre text NOT NULL,
	precio numeric NOT NULL,
	CONSTRAINT pk_producto PRIMARY KEY (tipo, codigo),
	CONSTRAINT chk_tipo CHECK (tipo IN ('H', 'C', 'M'))
);

CREATE TABLE venta (
	id serial,
	cliente int NOT NULL,
	tipo_producto text NOT NULL,
	codigo_producto int NOT NULL,
	cantidad numeric CHECK (cantidad > 0),
	CONSTRAINT pk_venta PRIMARY KEY (id),
	CONSTRAINT fk_cliente 
		FOREIGN KEY (cliente) 
		REFERENCES cliente (numero_documento),
	CONSTRAINT fk_producto
		FOREIGN KEY (tipo_producto, codigo_producto)
		REFERENCES producto (tipo, codigo)
);


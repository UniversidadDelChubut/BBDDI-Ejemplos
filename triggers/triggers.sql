BEGIN;

CREATE TABLE pedido (
	numero int,
	nombre_cliente text,
	importe numeric (11,2),
	CONSTRAINT pk_pedido 
		PRIMARY KEY (numero)
);


CREATE TABLE detalle_pedido (
	pedido int,
	renglon int,
	producto text,
	cantidad int,
	importe numeric(11,2),
	CONSTRAINT pk_detalle_pedido 
		PRIMARY KEY (pedido, renglon),
	CONSTRAINT fk_pedido
		FOREIGN KEY (pedido)
		REFERENCES pedido(numero)
);

CREATE FUNCTION numerar_renglon() RETURNS TRIGGER AS $$
	DECLARE
		renglones int;
	BEGIN
		SELECT COUNT (*) INTO renglones FROM detalle_pedido WHERE pedido = NEW.pedido; 
		IF (renglones >= 5) THEN
			RAISE EXCEPTION 'UN PEDIDO NO PUEDE TENER MAS DE 5 RENGLONES';
		END IF; 
	
		IF NEW.renglon IS NULL THEN
			SELECT COALESCE (MAX (renglon) +1, 1) INTO NEW.renglon FROM detalle_pedido WHERE pedido = NEW.pedido;
			RETURN NEW; 
		END IF;
	END;
$$ LANGUAGE 'plpgsql'; 


CREATE TRIGGER numerar_renglon BEFORE INSERT ON detalle_pedido FOR EACH ROW EXECUTE PROCEDURE numerar_renglon();  


CREATE FUNCTION totales_pedido() RETURNS TRIGGER AS $$
	BEGIN
		UPDATE pedido 
		SET importe = (SELECT SUM (importe) FROM detalle_pedido WHERE pedido = NEW.pedido) 
		WHERE numero = NEW.pedido; 
		RETURN NEW;
	END;
$$ LANGUAGE 'plpgsql'; 

CREATE TRIGGER totales_pedido AFTER INSERT ON detalle_pedido FOR EACH ROW EXECUTE PROCEDURE totales_pedido();  


INSERT INTO pedido VALUES (1, 'EL ZORZAL', 0);
INSERT INTO detalle_pedido (pedido, producto, cantidad, importe) VALUES

	(1, 'CAMISA', 2, 3499.98),
	(1, 'TALADRO', 1, 4500),
	(1, 'PAN POR KILO', 1, 120),
	(1, 'SABANA', 2, 3000),
	(1, 'MONITOR', 1, 22000)
	;

SELECT * FROM pedido;
SELECT * FROM detalle_pedido;
	
END;

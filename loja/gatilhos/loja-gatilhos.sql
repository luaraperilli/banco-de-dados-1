CREATE OR REPLACE FUNCTION verificavenda() RETURNS TRIGGER AS $$
DECLARE statusCliente cliente.status%TYPE;
BEGIN
	SELECT status INTO statusCliente FROM cliente WHERE codigo = NEW.cliente_codigo; -- SELECT status INTO statusCliente: copia o valor do status para o statusCliente para que eu possa manipulá-lo
	IF (statusCliente = 'I') THEN
		RAISE EXCEPTION 'Venda cancelada';
		RETURN NULL;
		END IF;
		RETURN NEW;
		END;
$$ Language plpgsql;

CREATE TRIGGER statusVenda BEFORE
INSERT
    ON venda FOR EACH ROW
EXECUTE PROCEDURE verificavenda ();

INSERT INTO venda VALUES (3, 2, 1, 100);
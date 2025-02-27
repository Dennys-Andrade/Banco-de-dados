CREATE TABLE IF NOT EXISTS CLIENTES (
	id serial PRIMARY KEY,
	nome varchar(40) not null,
	email varchar(100) NOT NULL,
	telefone varchar(20),
	idade int)


INSERT INTO CLIENTES (NOME,EMAIL,TELEFONE, IDADE) VALUES
('Beatriz', 'beatriz.silva@example.com', '887-5544', 15),
('Ana Rosa', 'ana.rosa@example.com', '995-5547', 80),
('Klayton', 'klayton.machado@example.com', '988-9065', 40),
('thamires', 'thamires.neves@example.com', '778-5514', 24),
('diego', 'diego.cabral@example.com', '889-6589', 21);

CREATE TABLE IF NOT EXISTS PRODUTOS (
	CODIGO SERIAL PRIMARY KEY,
	NOME VARCHAR(100) NOT NULL,
	PRECO NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL
);


INSERT INTO PRODUTOS (NOME, PRECO, QUANTIDADE) VALUES
    ('Banana', 10.50, 6),
    ('Maca', 07.75, 4),
    ('Laranja', 19.90, 3);



CREATE TABLE  IF NOT EXISTS ITENS(
	ID SERIAL,
	CODIGO_PRODUTO INTEGER,
	ID_CLIENTE INTEGER,
	QUANTIDADE INTEGER NOT NULL,
	CONSTRAINT ITENS_PK PRIMARY KEY (ID),
	CONSTRAINT ITENS_PRODUTO_FK FOREIGN KEY (CODIGO_PRODUTO)
	REFERENCES PRODUTOS (CODIGO),
	CONSTRAINT ITENS_CLIENTES_FK FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTES (ID)
);




INSERT INTO ITENS (CODIGO_PRODUTO, ID_CLIENTE, QUANTIDADE) VALUES
    (2, 1, 10),
    (3, 4, 5),
    (1, 5, 4),
    (3, 2, 6),
    (1, 3, 3);


CREATE OR REPLACE VIEW IDADE_PRODUTO AS
SELECT  
    CLIENTES.IDADE AS IDADE,
    PRODUTOS.NOME AS NOME_DO_PRODUTO
FROM 
    CLIENTES
JOIN 
    ITENS ON CLIENTES.ID = ITENS.ID_CLIENTE
JOIN 
    PRODUTOS ON ITENS.CODIGO_PRODUTO = PRODUTOS.CODIGO;

SELECT * FROM IDADE_PRODUTO;



CREATE OR REPLACE VIEW CLIENTE_PRODUTO_QUANTIDADE AS
SELECT  
    CLIENTES.NOME AS NOME_DO_CLIENTE,
    PRODUTOS.NOME AS NOME_DO_PRODUTO,
    ITENS.QUANTIDADE AS QUANTIDADE_COMPRADA
FROM 
    CLIENTES
JOIN 
    ITENS ON CLIENTES.ID = ITENS.ID_CLIENTE
JOIN 
    PRODUTOS ON ITENS.CODIGO_PRODUTO = PRODUTOS.CODIGO;

SELECT * FROM CLIENTE_PRODUTO_QUANTIDADE;


CREATE OR REPLACE VIEW CLIENTE_PRODUTO AS
SELECT  
    CLIENTES.NOME AS NOME_DO_CLIENTE,
    PRODUTOS.NOME AS NOME_DO_PRODUTO
FROM 
    CLIENTES
JOIN 
    ITENS ON CLIENTES.ID = ITENS.ID_CLIENTE
JOIN 
    PRODUTOS ON ITENS.CODIGO_PRODUTO = PRODUTOS.CODIGO;

SELECT * FROM CLIENTE_PRODUTO;
















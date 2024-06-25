CREATE TABLE IF NOT EXISTS clientes (
    id INT PRIMARY KEY ,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefone VARCHAR(20),
    idade INT

INSERT INTO clientes (id, nome, email, telefone, idade) VALUES
(1, 'Fannie', 'fglastonbury0@360.cn', '632-538-6403', 30),
(2, 'Marsha', 'mbunstone1@goodreads.com', '572-441-8667', 25),
(3, 'Alverta', 'astearne2@samsung.com', '754-442-8022', 40),
(4, 'Kendall', 'krosenfarb3@networkadvertising.org', '962-660-3726', 35),
(5, 'Roderick', 'raxleby4@rediff.com', '533-706-2279
', 28);

	
CREATE TABLE IF NOT EXISTS produtos (
    codigo INT PRIMARY KEY ,
    nome VARCHAR(40) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL

	INSERT INTO produtos (codigo,nome, preco, quantidade) VALUES
(1,'Camiseta', 29.99, 50),
(2,'Calça Jeans', 79.90, 30),
(3,'Tênis Esportivo', 129.99, 20);


CREATE TABLE IF NOT EXISTS itens (
    id SERIAL PRIMARY KEY ,
    codigo_produto INT NOT NULL,
    id_cliente INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)


INSERT INTO itens (codigo_produto, id_cliente, quantidade) VALUES
(1, 1, 2),    
(2, 2, 1),    
(3, 3, 3),    
(1, 4, 1),    
(2, 5, 2)


CREATE VIEW CLIENTES_COMPRAS_DETALHADAS AS
SELECT 
    C.id AS cliente_id,
    C.nome AS cliente_nome,
    P.nome AS produto_nome,
    I.quantidade,
    (I.quantidade * P.preco) AS preco_total
FROM 
    clientes C
JOIN 
    itens I ON C.id = I.id_cliente
JOIN 
    produtos P ON I.codigo_produto = P.codigo;

CREATE VIEW PRODUTOS_MAIS_VENDIDOS AS
SELECT 
    P.nome AS produto_nome,
    SUM(I.quantidade) AS quantidade_vendida,
    P.quantidade AS quantidade_estoque,
    (P.quantidade - SUM(I.quantidade)) AS quantidade_restante
FROM 
    produtos P
LEFT JOIN 
    itens I ON P.codigo = I.codigo_produto
GROUP BY 
    P.nome, P.quantidade
ORDER BY 
    quantidade_vendida DESC;



--EXERCICIO 18/06/2024

--1. Adicionar um novo cliente*:
   -- Adicione um novo cliente com os seguintes dados: nome, email, telefone e idade.

INSERT INTO clientes (id, nome, email, telefone, idade)
VALUES (7, 'DENNYS', 'DENNYSDJ@GMAIL.COM', '33333333', 56);



--2. Adicionar um novo produto*:
   --Adicione um novo produto com os seguintes dados: nome, preço e quantidade. 

INSERT INTO PRODUTOS (CODIGO, NOME, PRECO, QUANTIDADE) VALUES
(4,'MAÇA', 5.00, 20);

--3. 	adicionar um novo item de venda*:
   --Adicione um novo item de venda relacionando um produto e um cliente existentes com uma quantidade específica.

INSERT INTO ITENS (CODIGO_PRODUTO, ID_CLIENTE, QUANTIDADE) VALUES
( 2, 7, 12);


--4. Atualizar o telefone de um cliente*:
   --- Atualize o telefone de um cliente específico usando seu email como referência.

UPDATE CLIENTES
SET telefone = '11555666'
WHERE email = 'DENNYSDJ@GMAIL.COM';

SELECT * FROM clientes;

--5. *Atualizar o preço e a quantidade de um produto*:
 -- Atualize o preço e a quantidade de um produto específico usando o nome do produto como referência.

UPDATE  PRODUTOS
SET  preco = (22.00), quantidade = 2 
WHERE nome = 'Camiseta';

SELECT * FROM PRODUTOS;

--6. *Atualizar a quantidade de um item de venda*:
   -- Atualize a quantidade de um item de venda específico usando seu ID como referência.

UPDATE  ITENS
SET   quantidade = 2
WHERE id = 6;

SELECT * FROM ITENS;



--7. *Deletar um cliente específico*:
--  Delete um cliente específico usando seu email como referência.

DELETE FROM itens WHERE id = 1;

DELETE FROM clientes WHERE email ='fglastonbury0@360.cn';



--8. *Deletar um produto específico*:
 -- Delete um produto específico usando o nome do produto como referência.


DELETE FROM itens WHERE codigo_produto = 2;

	DELETE FROM produtos WHERE nome = 'Calça Jeans';

SELECT * FROM produtos;








--9. *Deletar um item de venda específico*:
 -- Delete um item de venda específico usando seu ID como referência.


DELETE FROM itens WHERE id = 3;


SELECT * FROM itens;




CREATE TABLE IF NOT EXISTS clientes (
    id INT PRIMARY KEY ,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefone VARCHAR(20),
    idade INT

INSERT INTO clientes (id, nome, email, telefone, idade) VALUES
(1, 'Fannie', 'fglastonbury0@360.cn', '632-538-6403', 30),
(2, 'Marsha', 'mbunstone1@goodreads.com', '572-441-8667', 25),
(3, 'Alverta', 'astearne2@samsung.com', '754-442-8022', 40),
(4, 'Kendall', 'krosenfarb3@networkadvertising.org', '962-660-3726', 35),
(5, 'Roderick', 'raxleby4@rediff.com', '533-706-2279
', 28);

	
CREATE TABLE IF NOT EXISTS produtos (
    codigo INT PRIMARY KEY ,
    nome VARCHAR(40) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL

	INSERT INTO produtos (codigo,nome, preco, quantidade) VALUES
(1,'Camiseta', 29.99, 50),
(2,'Calça Jeans', 79.90, 30),
(3,'Tênis Esportivo', 129.99, 20);


CREATE TABLE IF NOT EXISTS itens (
    id SERIAL PRIMARY KEY ,
    codigo_produto INT NOT NULL,
    id_cliente INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)


INSERT INTO itens (codigo_produto, id_cliente, quantidade) VALUES
(1, 1, 2),    
(2, 2, 1),    
(3, 3, 3),    
(1, 4, 1),    
(2, 5, 2)
	

--10. *Criar uma view que exibe todos os clientes com suas respectivas idades e telefones*:
    -- Crie uma view que mostra o nome, idade e telefone de todos os clientes.





 CREATE OR REPLACE VIEW TOTAL_DE_CLIENTES AS
	SELECT 
		c.nome AS Nome, 
		c.idade AS Idade,
		c.telefone AS Telefone
	FROM clientes c
	GROUP BY 
	Nome, Idade, Telefone;

SELECT * FROM TOTAL_DE_CLIENTES;


	

--11. *Criar uma view que exibe todos os produtos com seus preços e quantidades em estoque*:
    -- Crie uma view que mostra o nome, preço e quantidade de todos os produtos.

CREATE OR REPLACE VIEW TOTAL_DE_PRODUTOS AS
	SELECT 
		p.nome AS Produto,
		p.preco AS Preco,
		p.quantidade AS Quantidade
	FROM produtos p
	GROUP BY
	Produto, Preco, Quantidade;

SELECT * FROM TOTAL_DE_PRODUTOS;




	
--12. *Criar uma view que exibe o total vendido por cada cliente*:
    -- Crie uma view que mostra o nome do cliente e o total vendido por ele.


CREATE OR REPLACE VIEW cliente_total AS
SELECT
c.nome,
(i.quantidade * p.preco) AS Total
FROM itens i
JOIN produtos p ON p.codigo = i.codigo_produto
JOIN clientes c ON c.id = id_cliente;



SELECT * FROM cliente_total;

--### Desafios Adicionais

--13. **Adicionar um novo cliente e uma nova compra para esse cliente**:
    -- Adicione um novo cliente com dados fictícios.
INSERT INTO CLIENTES (ID, nome ,
    email ,
    telefone ,
    idade ) VALUES 
		(9, 'MARIA TERESA', 'terezamaria@gmail.com', '345677888',32);
	
INSERT INTO ITENS (codigo_produto ,
    id_cliente ,
    quantidade ) VALUES 
(3,9,3);


INSERT INTO CLIENTES (ID, nome ,
    email ,
    telefone ,
    idade ) VALUES 
		(10, 'XUXUZINHO ', 'xuxuzinho@gmail.com', '345678899',33);




--14. **Atualizar o nome e o email de um cliente específico**:
    -- Atualize o nome e o email de um cliente usando seu ID como referência.

UPDATE  CLIENTES
SET  nome = 'JENOVEVA', email = 'jenoveva@gmail.com' 
WHERE id = 7;

SELECT * FROM clientes;


--15. **Deletar todos os itens de venda de um produto específico**:
    -- Delete todos os itens de venda de um produto específico usando o código do produto como referência.

DELETE FROM itens WHERE codigo_produto = 1;

	
select  * from  ITENS ;


--16. **Adicionar múltiplos clientes**:
   -- Adicione três novos clientes com dados fictícios em uma única instrução `INSERT`.

INSERT INTO clientes 
(id ,
    nome ,
    email ,
    telefone,
    idade) VALUES (
	 11, 'Joazinho da silva', 'joaozinho@gmail.com', 345567899, 19
	), (12, 'Groelandia luquete', 'groelandia@gmail.com', 234567774, 20), (13,'Osvania Princesa', 'osvaninha@gmail.com' 2344567677,21 );



	


--17. **Adicionar múltiplos produtos**:
   -- Adicione dois novos produtos com dados fictícios em uma única instrução `INSERT`.

INSERT INTO produtos (codigo,nome, preco, quantidade) VALUES
(5,'pinto de borracha', 5.99, 11),
(6,'PANO DE PRATO', 900.90, 60);




--18. **Adicionar múltiplos itens de venda**:
   --- Adicione três novos itens de venda relacionando diferentes produtos e clientes existentes em uma única instrução `INSERT`.

INSERT INTO itens (codigo_produto, id_cliente, quantidade) VALUES
(3, 2, 2),    
(6, 3,1),    
(4, 4, 2);


--### Desafios de `UPDATE`

---19. **Atualizar a idade de todos os clientes acima de 30 anos**:
   -- Aumente a idade de todos os clientes que têm mais de 30 anos em 1 ano.

UPDATE  CLIENTES
SET  idade = idade + 1 
WHERE idade >= 30;

SELECT * FROM clientes;


--20. **Atualizar o preço de todos os produtos com quantidade menor que 10**:
   -- Aumente o preço de todos os produtos com quantidade menor que 10 em 10%.

UPDATE  produtos
SET  preco = preco * 1.1 
WHERE quantidade <= 30;





--21. **Atualizar o nome de todos os produtos para incluir uma palavra-chave**:
   -- Adicione a palavra "Promoção" ao início do nome de todos os produtos.

UPDATE produtos
SET nome = CONCAT ('Promoção ', nome);

select * from produtos;

--### Desafios de `DELETE`

--22. **Deletar todos os clientes com idade menor que 18 anos**:
   -- Delete todos os clientes que têm menos de 18 anos.

DELETE FROM clientes 
WHERE idade < 18;

select * from clientes;


--23. **Deletar todos os produtos com preço maior que 50**:
   -- Delete todos os produtos cujo preço é maior que 50.

DELETE FROM produtos
WHERE preco > 50;





--24. **Deletar todos os itens de venda de clientes específicos**:
   -- Delete todos os itens de venda de clientes com email específico.

DELETE FROM itens
WHERE id_cliente IN (select id from clientes WHERE email= 'DENNYSDJ@GMAIL.COM');


select * from itens;
select * from clientes;


--### Desafios de Criação de `VIEWS`

--25. **Criar uma view que exibe o estoque total de produtos vendidos**:
    -- Crie uma view que mostra o nome do produto e o total vendido em relação ao estoque.



CREATE VIEW MAIS_VENDIDOS AS
SELECT ID_CLIENTE, TOTAL_QUANTIDADE
FROM (
    SELECT ID_CLIENTE, SUM(QUANTIDADE) AS TOTAL_QUANTIDADE
    FROM ITENS
    GROUP BY ID_CLIENTE
) AS SUBCONSULTA
ORDER BY TOTAL_QUANTIDADE DESC;





SELECT * FROM MAIS_VENDIDOS;

SELECT * FROM SEM_COMPRAS;


--26. **Criar uma view que exibe os clientes que não fizeram compras**:
    -- Crie uma view que mostra o nome e email dos clientes que não têm itens de venda associados.

INSERT INTO cliente 

CREATE VIEW clientes_sem_vendas AS
SELECT c.nome, c.email
FROM clientes c
LEFT JOIN itens i ON c.id = i.id_cliente
WHERE i.id IS NULL;

SELECT * FROM clientes_sem_vendas;
--27. **Criar uma view que exibe os produtos não vendidos**:
    -- Crie uma view que mostra o nome e preço dos produtos que não foram vendidos (quantidade de vendas igual a zero).


CREATE VIEW produtos_nao_vendidos AS
SELECT p.nome, p.preco
FROM produtos p
LEFT JOIN itens i ON p.codigo = i.codigo_produto
WHERE i.id IS NULL;

SELECT * FROM produtos_nao_vendidos;


--### Desafios Adicionais

--28. **Adicionar uma nova coluna em uma tabela e atualizar dados**:
    -- Adicione uma nova coluna `data_de_cadastro` à tabela `clientes` e preencha-a com a data atual para todos os clientes.

ALTER TABLE clientes
ADD COLUMN data_de_cadastro DATE;

UPDATE clientes
SET data_de_cadastro = CURRENT_DATE;

SELECT * FROM clientes;




--29. **Atualizar o preço dos produtos com base em uma condição**:
    -- Aumente o preço de todos os produtos em 5% se a quantidade em estoque for menor que 20.


UPDATE produtos
SET preco = preco * 1.05
WHERE quantidade < 20;

SELECT * FROM produtos;




--30. **Deletar registros duplicados em uma tabela**:
    -- Encontre e delete registros duplicados na tabela `clientes`, mantendo apenas um registro por cliente com base no email.

DELETE FROM clientes
WHERE id IN (
    SELECT id
    FROM (
        SELECT id,
               email,
               ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
        FROM clientes
    ) t
    WHERE t.rn > 1
);




--31. **Criar uma view que exibe a média de vendas por produto**:
    -- Crie uma view que mostra o nome do produto e a média de itens vendidos por produto.


CREATE VIEW media_vendidos AS
SELECT p.nome AS nome_produto, AVG(i.quantidade) AS media_itens_vendidos
FROM produtos p
JOIN itens i ON p.codigo = i.codigo_produto
GROUP BY p.nome;

select * from media_vendidos;



--32. **Adicionar um novo cliente e realizar múltiplas compras para esse cliente**:
    -- Adicione um novo cliente com dados fictícios.
    -- Adicione três novos itens de venda para esse cliente, relacionando diferentes produtos.


INSERT INTO clientes (id, nome, email, telefone, idade, data_de_cadastro) 
VALUES (6, 'João da Silva', 'joao.silva@example.com', '1234567890', 32, CURRENT_DATE);

INSERT INTO itens (codigo_produto, id_cliente, quantidade) VALUES
(4, 6, 2),   
(6, 6, 1),   
(3, 6, 1);   

SELECT * FROM clientes WHERE id = 6;

SELECT * FROM itens WHERE id_cliente = 6;


--33. **Atualizar o email de todos os clientes para um novo domínio**:
    -- Atualize o email de todos os clientes para um novo domínio, por exemplo, mude `@example.com` para `@novodominio.com`.

UPDATE clientes
SET email = REPLACE(email, 'hello@example.com', 'wow@novodominio.com');

SELECT * FROM clientes;



--34. **Deletar produtos que não foram vendidos nos últimos 6 meses**:
    -- Delete todos os produtos que não têm itens de venda associados nos últimos 6 meses.


DELETE FROM produtos
WHERE NOT EXISTS (
    SELECT 1
    FROM itens
    WHERE itens.codigo_produto = produtos.codigo
    AND itens.data_venda >= CURRENT_DATE - INTERVAL '6 months'
);







--35. **Criar uma view que exibe a proporção de vendas por cliente**:
    -- Crie uma view que mostra o nome do cliente e a proporção do total de vendas em relação ao total de vendas de todos os clientes.


CREATE VIEW PROPORCAO_VENDAS_POR_CLIENTE AS
    SELECT 
        C.ID AS ID_CLIENTE, 
        C.NOME AS NOME_CLIENTE,
        TO_CHAR((SUM(I.QUANTIDADE * P.PRECO) * 100.0 / 
            (SELECT SUM(I2.QUANTIDADE * P2.PRECO) 
             FROM ITENS I2 
             JOIN PRODUTOS P2 ON I2.CODIGO_PRODUTO = P2.CODIGO)), '00.00%') AS PROPORCAO_VENDAS
    FROM 
        CLIENTES C
    JOIN 
        ITENS I ON C.ID = I.ID_CLIENTE
    JOIN 
        PRODUTOS P ON I.CODIGO_PRODUTO = P.CODIGO
    GROUP BY 
        C.ID, C.NOME;
 
	



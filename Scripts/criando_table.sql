--Modelo de esquema
--Um modelo de esquema, também conhecido como modelo de dados é uma representação lógica da estrutura
--de um banco de dados. Ele define a forma como os dados são organizados, armazenados e relacionados entre si. 
--Em outras palavras, um esquema de banco de dados define a estrutura, as tabelas, os campos e as relações que 
--existem dentro do banco de dados.
--Um esquema de tabelas é uma parte importante de um esquema de banco de dados. Ele define a estrutura das tabelas
--e os relacionamentos entre elas dentro do banco de dados. O esquema de tabelas especifica os nomes das tabelas, os nomes e os tipos de dados das colunas, as restrições de integridade e as chaves primárias e estrangeiras.
-- Exemplo:

--Tabela "Clientes":
--id
--name
--email
--address
--Tabela "Pedidos":
--id
--clienteID
--date
--total
--Tabela "Produtos":
--id
--name
--price

--Criando uma tabela no SQL
--Para criar uma tabela no banco de dados, precisamos criar uma consulta SQL
--com as definições do schema da tabela.

CREATE TABLE Clientes (
  ID            INTEGER,
  Nome          TEXT,
  Email         TEXT,
  Endereço      TEXT
)
CREATE TABLE Pedidos (
  ID            INTEGER,
  ClienteID     TEXT,
  Data          TEXT,
  Total         REAL
)
CREATE TABLE Produtos (
  ID            INTEGER,
  Nome          TEXT,
  Preço         REAL
)

--Conferindo as tabelas criadas
--Para conferir as tabelas criadas no banco de dados, podemos usar o seguinte
--comando no SQLite

SELECT 
	name
FROM 
	sqlite_schema
WHERE type ='table'
      AND name NOT LIKE 'sqlite_%';
      
     
     
     
select
	DISTINCT p.product_category_name DESC,
	MAX(oi.price)
FROM products p left join order_items oi ON oi.product_id = p.product_id 
WHERE   p.product_category_name = 'bebes' 
 
     


select
	DISTINCT p.product_category_name DESC,
	MAX(oi.price),
	MIN(oi.price),
	SUM(oi.price)
FROM products p left join order_items oi ON oi.product_id = p.product_id 
WHERE   p.product_category_name = 'flores' 
 

SELECT
	c.customer_id ,
	o.order_purchase_timestamp
FROM customer c left join orders o  ON o.customer_id = c.customer_id 
where  




select 
	op.payment_type ,
	op.payment_installments ,
    op.payment_sequential
	
from order_payments op 
WHERE op.payment_sequential = 10
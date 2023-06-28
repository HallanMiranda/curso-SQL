--SLIDE (9)
SELECT
  oi.product_id,
  AVG( oi.price ) AS avg_price
FROM order_items oi
WHERE oi.product_id IN ( SELECT p.product_id
             FROM products p
             WHERE p.product_category_name IN ( 'perfumaria', 'artes' ) )

--Qual a utilidade das Subqueries?
--Em algumas situações, é necessário realizar algumas operação em tabelas, 
--a fim de prepará-las antes de anexá-las a outras.
             
--Existem algumas formas de utilizar subqueries:
             
--1. Subquery como uma nova coluna da consulta ( Subquery no SELECT )
--2. Subquery como filtro de uma consulta ( Subquery no WHERE )
--3. Subquery como fonte de dados da consulta principal ( Subquery no FROM )

-- Conclusao
--1. Subqueries são consultas dentro de outras consultas.
--2. Usadas para preparar uma tabela antes de ser utilizada. 
--3. Pode ser usada para:
--a. Criar uma nova coluna.
--b. Criar uma filtro
--c. Criar uma fonte de dados para a consulta principal.
             
-- media de avaliacoes por categ do produto.
select
product_id

-- Adicionando uma nova coluna .
select
  oi.product_id ,
  (select p.product_category_name
   from products p 
   where p.product_id  = oi.product_id ) as product_category_name 
from order_items oi 
limit 10;
   
-- msm coisa

SELECT 
  oi.product_id ,
  p.product_category_name  as product_category
FROM order_items oi left join products p on (p.product_id = oi.product_id)
LIMIT 10;

-- ADD uma nova coluna como resultado de uma operacao:
SELECT 
  oi.product_id ,
  (SELECT p.product_category_name
  FROM products p
  WHERE p.product_id = p.product_id)as product_category
FROM order_items oi 
LIMIT 10;

-- media de precos de categoria e media por produto por categoria
SELECT 
  p.product_category_name  ,
  ( SELECT AVG(oi.price)FROM order_items oi ) AS avg_price_all ,
  ( SELECT AVG(oi2.price) FROM order_items oi2 WHERE oi2.product_id = p.product_id ) as avg_category
FROM products p 
LIMIT 20;







-- Tela COALESCE
SELECT
	o.order_id ,
	o.customer_id ,
	o.order_status ,
	or2.review_comment_title ,
	COALESCE (or2.review_comment_title, 'vazio') AS full_text,
	o.order_status|| "-" ||COALESCE(or2.review_comment_title, 'vazio') 
FROM orders o inner join order_reviews or2 ON (or2.order_id = o.order_id)
LIMIT 50;
-- UPPERCASELOWER--
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    or2.review_comment_title,
    COALESCE(or2.review_comment_title, 'vazio') AS full_text,
    UPPER(o.order_status || '-' || COALESCE(or2.review_comment_title, 'vazio')) AS new_case,
    LOWER(o.order_status || '-' || COALESCE(or2.review_comment_title, 'vazio')) AS new_caseII
FROM
    orders o
INNER JOIN
    order_reviews or2 ON or2.order_id = o.order_id
LIMIT 50;

-- SUBSTRING
SELECT
    o.order_status,
    or2.review_comment_title,
    LOWER(o.order_status || '-' || COALESCE(or2.review_comment_title, 'vazio')) AS new_caseII,
    SUBSTRING(or2.review_comment_title, 5, 3)
FROM
    orders o
LEFT JOIN
    order_reviews or2 ON or2.order_id = o.order_id
LIMIT 100;


--A Tabela temporária
--Na engenharia de software, uma prática comum é o agrupamento de instruções em pequenas unidades úteis e fáceis de
--compreender e reutilizar chamada de funções.
--Mesmo o SQL tendo suas funções e procedimentos, elas não são a ferramenta correta para construir unidades compreensíveis e de reutilização. Para tornar as consultas reutilizáveis, no ano de 1992 o SQL introduziu um conceito chamada de “View” ou “Table View”.
--A “table view” se comporta como uma tabela normal. Ela possui colunas, linhas, um nome e um schema para armazenar informação, porém, a “table view” existe somente em tempo de execução da query, ou seja, a “table view” não fica armazenada no disco rígido, ela não é materializada. Uma vez que a query terminar sua execução, a “table view” desaparece.
--Para construir uma “table view”, você pode usar a clause WITH.
--2. Clause WITH
--A clause WITH permite você criar uma tabela temporária ou “table view” para organizar tabelas previamente, antes da
--tabela final, assim como fazem as subqueries.

WITH table_name AS ( SQL query
...
...
)
-- SQL query
-- Exemplo: Conte quantos parcelas tem cada pedido.

WITH payments AS ( 
	SELECT
        op.order_id,
        SUM( op.payment_installments ) AS parcelas 
    FROM order_payments op
    GROUP BY op.order_id
) 

SELECT
    pa.order_id,
    pa.parcelas 
FROM payments pa

-- Criando múltiplas views
-- Você pode construir quantas “table views” precisar em tempo de execução da consulta. Você pode unir as views, adicionar
-- tabelas materializadas junto das views e etc, antes da tabela final.
-- Exemplo 1
-- Conte quantos parcelas e quantos produtos cada pedido possui.

WITH payments AS ( SELECT
                       op.order_id,
					   SUM( op.payment_installments ) AS parcelas 
				   FROM order_payments op
				   GROUP BY op.order_id
),products AS ( SELECT
   					oi.order_id,
					COUNT( oi.product_id ) AS produtos 
				FROM order_items oi
 				GROUP BY oi.order_id
)SELECT
     pa.order_id, 
     pa.parcelas, 
     pr.produtos
FROM payments pa INNER JOIN products pr ON ( pr.order_id = pa.order_id )

-- Exemplo 2:
-- Calcule o número de dias que se passaram desde a primeira compra de cada categoria, para cada uma das compras
-- posteriores. Por exemplo, se um produto foi comprado no dia seguinte após a primeira compra da categoria, 
-- esse produto tem 1 dia de tempo pós início.

--WITH table_temp AS ( 
SELECT
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	FIRST_VALUE( oi.shipping_limit_date ) OVER ( PARTITION BY p.product_category_name ORDER BY oi.shipping_limit_date ) AS cat_
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id )
WHERE p.product_category_name IS NOT NULL )


SELECT
product_category_name,
price,
STRFTIME( '%Y-%m-%d', shipping_limit_date ) AS shipping_limit_date,
STRFTIME( '%Y-%m-%d', first_purchase ) AS first_purchase,
CAST( ( JULIANDAY( shipping_limit_date ) - JULIANDAY( first_purchase ) ) AS INTEGER ) AS days
FROM table_temp






-- Exercícios.

-- Crie uma consulta SQL usando a cláusula WITH para calcular o total de vendas para cada categoria e exiba o resultado

-- Crie uma consulta usando a cláusula WITH para calcular a receita total por mês e exiba o mês com a maior receita.

-- Crie uma consulta usando duas cláusulas WITH para calcular o total de vendas por estado e, em seguida, por cidade, e exiba os resultados.

-- Crie uma consulta SQL com as seguintes colunas: 1) Categoria, 2)Preço, 3)Date limite de envio, 4) Primeira compra, 5) Número de dias que o produto foi comprado a partir da primeira compra dentro da mesma categoria.




































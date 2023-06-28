-- Qual o número de pedido com o tipo de pagamento igual a “boleto”?
SELECT 
COUNT( o.order_id ) AS count_id
FROM orders o 
WHERE o.order_id IN (SELECT DISTINCT op.order_id FROM order_payments op WHERE op.payment_type = 'boleto')

--2. Refaça o exercício 01 usando união de tabelas.
SELECT 
	COUNT(o.order_id) AS count_id ,
	op.payment_type 
FROM orders o LEFT JOIN order_payments op ON (op.order_id = o.order_id)
WHERE op.payment_type = 'boleto'


-- 3. Cria uma tabela que mostre a média de avaliações por dia, a média de preço
--    por dia, a soma dos preços por dia, o preço mínimo por dia, o número de pedidos
--    por dia e o número de clientes únicos que compraram no dia.
SELECT 
	AVG(or2.review_score) AS media_avaliacao
FROM order_reviews or2 

SELECT 
	AVG(oi.price) AS media_price,
	SUM(oi.price) as soma_price,
	MIN(oi.price) as min_price_price,
	MAX(oi.price) as max__price,
	COUNT(oi.order_id) as contagem_pedidos
FROM order_items oi 


SELECT
	DATE(o.order_purchase_timestamp) ,
	COUNT(DISTINCT o.customer_id) as contagem_clientes
FROM orders o 
WHERE DATE(o.order_purchase_timestamp = '2016-10-16') 

SELECT
    t1.AS media_avaliacao ,
    t2.AS media_price ,
	t2.AS soma_price ,
	t2.AS min_price_price ,
	t2.AS max__price ,
	t2.AS contagem_pedidos ,
    t3.AS data_,
	t3.AS contagem_clientes 
FROM (SELECT AVG(or2.review_score) AS media_avaliacao
      FROM order_reviews or2) AS t1 LEFT JOIN (SELECT 
	                                               AVG(oi.price) AS media_price,
	                                               SUM(oi.price) as soma_price,
							       			       MIN(oi.price) as min_price_price,
									    	       MAX(oi.price) as max__price,
								 			       COUNT(oi.order_id) as contagem_pedidos
										       FROM order_items oi ) AS t2 ON (t1.date_ = T2.date_)
							        LEFT JOIN (SELECT 
											       DATE(o.order_purchase_timestamp), 
											       COUNT(DISTINCT o.customer_id) as contagem_clientes
                                               FROM orders o
                                               WHERE DATE(o.order_purchase_timestamp) ) AS t3 ON (t3.date_ = T1.date_)
WHERE t1.date_ BETWEEN '2016-10-02' AND '2016-10-09'delete321


-- 4. Eu gostaria de saber, por categoria, a quantidade de produtos, o tamanho médio
--    do produto, o tamanho médio da categoria alimentos e o tamanho médio geral.

SELECT
    p.product_category_name,
    COUNT( DISTINCT p.product_id ) AS produto,
    AVG( DISTINCT p.product_length_cm ) AS avg_length,
    ( SELECT AVG( DISTINCT p2.product_length_cm ) FROM products p2 WHERE p2.product_category_name ='alimentos' ) AS avg_length_ali,
    ( SELECT AVG( DISTINCT p2.product_length_cm ) FROM products p2 WHERE p2.product_category_name ='alimentos' ) AS avg_length_all
FROM products p
GROUP BY p.product_category_name

-- 5. Qual o nome da categoria de produto com o maior preço de venda? Encontre a 
--    categoria do produto somente com Subqueries.

SELECT DISTINCT p.product_category_name
FROM products p
WHERE p.product_id = ( SELECT product_id
                       FROM ( SELECT product_id,
                                  MAX( max_product ) AS max_all 
                                  FROM ( SELECT
                                            product_id,
                                            MAX( price ) as max_product 
                                            FROM order_items oi
                                            GROUP BY product_id ) ) )


a
1
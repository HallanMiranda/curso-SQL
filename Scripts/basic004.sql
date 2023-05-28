-- As perguntas do CEO:
-- 1. Qual o número de clientes únicos de todos os estados?

SELECT
  c.customer_id ,
  c.customer_state,
  COUNT( DISTINCT c.customer_id ) AS numero_clientes
FROM customer c
GROUP BY c.customer_state

-- 2. Qual o número de cidades únicas de todos os estados?
SELECT
  c.customer_id ,
  c.customer_state,
  COUNT( DISTINCT c.customer_city ) AS numero_city
FROM customer c
GROUP BY c.customer_state

-- 3. Qual o número de clientes únicos por estado e por cidade?
SELECT 
	COUNT(DISTINCT c.customer_unique_id),
	c.customer_city ,
	c.customer_state 
FROM customer c 
GROUP BY c.customer_city , c.customer_state 

-- 4. Qual o número de clientes por cidade e por estado?
SELECT 
	COUNT(DISTINCT c.customer_id) ,
	c.customer_city,
	c.customer_state 
FROM customer c 
GROUP BY c.customer_state, c.customer_city  

-- 5. Qual o número total de pedidos únicos acima de R$ 3.500 por cada vendedor?
SELECT 
	oi.seller_id ,
	COUNT ( DISTINCT oi.order_id ) As order_uniq_seller_max3500
FROM order_items oi 
WHERE price > 3.500
GROUP BY oi.seller_id 

-- 6. Qual o número total de pedidos únicos, a data mínima e máxima de envio, o valor
--    máximo, mínimo e médio do frete dos pedidos acima de R$ 1.100 por cada vendedor? 
SELECT 
    COUNT(DISTINCT oi.order_id) AS order_uniq_total,
    MAX(oi.shipping_limit_date) AS max_date,
    MIN(oi.shipping_limit_date) AS min_date,
    MAX(oi.freight_value) AS max_frete,
    MIN(oi.freight_value) AS min_frete,
    AVG(oi.freight_value) AS mean_frete
FROM order_items oi
WHERE oi.price > 1100
GROUP BY oi.seller_id

-- 7. Qual o valor médio, máximo e mínimo do preço de todos os pedidos de cada produto?
SELECT 
	oi.product_id ,
	AVG( oi.price ),
	MAX( oi.price ),
	MIN( oi.price ) 
FROM order_items oi 
GROUP BY order_id

-- 8. Qual a quantidade de vendedores distintos que receberam algum pedido antes do
--    dia 23 de setembro de 2016 e qual foi o preço médio desses pedidos?
SELECT
  oi.shipping_limit_date,
  COUNT( seller_id ) AS vendedores,
  AVG( oi.price )    AS preco_medio
FROM order_items oi
WHERE shipping_limit_date < '2016-09-23 00:00:00'
GROUP by oi.shipping_limit_date

-- 10.Qual a quantidade de pedidos por tipo de pagamentos? 
SELECT 
	op.payment_type,
	COUNT( op.order_id ) AS qtd_pedidos
FROM order_payments op 
GROUP BY op.payment_type

-- 11.Qual a quantidade de pedidos, a média do valor do pagamento e o número máximo
--    de parcelas por tipo de pagamentos?
SELECT 
	op.payment_type ,
	COUNT(op.order_id),
	AVG(op.payment_value) ,
	MAX(op.payment_installments) 
FROM order_payments op  
GROUP BY op.payment_type 

-- 12.Qual a valor mínimo, máximo, médio e as soma total paga por cada tipo de 
--    pagamento e número de parcelas disponíveis?
SELECT 
	op.payment_type ,
	MIN(op.payment_value) AS valor_min,
	MAX(op.payment_value)AS valor_max,
	AVG(op.payment_value) AS valor_mean,
	SUM(op.payment_value) AS soma_total,
	COUNT(DISTINCT  op.payment_installments) AS qtd_parcelas 
FROM order_payments op 
GROUP BY op.payment_type 

-- 14.Qual a média de pedidos por cliente?
SELECT 
	DISTINCT o.customer_id ,
	AVG( o.order_id ) AS mean_order 
FROM orders o 
GROUP BY o.customer_id 

-- 15.Qual a quantidade de pedidos realizados por cada status do pedido,
--  a partir do dia 23 de Setembro de 2016?
SELECT 
	o.order_status,
	COUNT( o.order_id ) AS qtd_pessoas
FROM orders o 
WHERE o.order_approved_at > '2016-09-23 00:00:00'
GROUP BY order_status 

-- 16.Qual a quantidade de pedidos realizados por dia, a partir do dia
-- 23 de Setembro de 2016?
SELECT 
	o.order_approved_at,
	COUNT( o.order_id ) 
FROM orders o 
WHERE o.order_approved_at > '2016-09-23 00:00:00'
GROUP BY  o.order_approved_at

-- 17.Quantos produtos estão cadastrados na empresa por categoria?
SELECT 
	p.product_category_name, 
	COUNT( p.product_id ) 
FROM products p 
GROUP BY p.product_category_name 

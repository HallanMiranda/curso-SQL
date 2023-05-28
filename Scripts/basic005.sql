-- As perguntas do CEO: Operadores de Comparação 5

-- 1. Qual o número de clientes únicos do estado de São Paulo?
SELECT 
	c.customer_state ,
	COUNT(customer_unique_id ) 
FROM customer c 
WHERE c.customer_state = 'SP'


-- 2. Qual o número total de pedidos únicos feitos no dia 08 
--    de Outubro de 2016.
SELECT 
  COUNT( DISTINCT order_id ),
  oi.shipping_limit_date
FROM order_items oi
WHERE DATE( shipping_limit_date ) = '2016-10-08'


-- 3. Qual o número total de pedidos únicos feitos a partir 
--    do dia 08 de Outubro de 2016 .
SELECT
	COUNT(DISTINCT oi.order_id) ,
	oi.shipping_limit_date 
FROM order_items oi 
WHERE DATE( oi.shipping_limit_date ) > '2016-10-08'

--4. Qual o número total de pedidos únicos feitos a partir do 
--   dia 08 de Outubro de 2016 incluso.
SELECT
  COUNT( DISTINCT order_id )
FROM order_items oi
WHERE DATE( shipping_limit_date ) >= '2016-10-08'

--5. Qual o número total de pedidos únicos, a data mínima e máxima 
--   de envio, o valor máximo, mínimo e médio do frete dos pedidos abaixo
--   de R$ 1.100 por cada vendedor?
SELECT 
	oi.seller_id, 
	COUNT(DISTINCT oi.order_id) as qtd_uniq_order,
	MIN(oi.shipping_limit_date) as min_date,
	MAX(oi.shipping_limit_date) as max_date,
	MAX(oi.freight_value)as max_value,
	MIN(oi.freight_value) as min_value,
	AVG(oi.freight_value) as mean_value 
FROM order_items oi 
WHERE oi.freight_value < 1.100


--6. Qual o número total de pedidos únicos, a data mínima e máxima de
--   envio, o valor máximo, mínimo e médio do frete dos pedidos abaixo 
--   de R$ 1.100 incluso por cada vendedor?
SELECT 
	COUNT( DISTINCT oi.seller_id ) as vendedor, 
	COUNT( DISTINCT oi.order_id ) as qtd_uniq_order,
	MIN(oi.shipping_limit_date) as min_date,
	MAX(oi.shipping_limit_date) as max_date,
	MAX(oi.freight_value) as max_value,
	MIN(oi.freight_value) as min_value,
	AVG(oi.freight_value) as mean_value 
FROM order_items oi 
WHERE oi.freight_value < 1.100  
GROUP BY oi.seller_id 




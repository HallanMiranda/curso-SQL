-- PA Bond As perguntas do CEO:

-- 1. Qual o número de clientes únicos nos estado de
--    Minas Gerais ou Rio de Janeiro?
SELECT 
	c.customer_state ,
	COUNT( DISTINCT c.customer_id )
FROM customer c 
WHERE c.customer_state = 'MG' 
	  OR c.customer_state = 'RJ'

-- 2. Qual a quantidade de cidades únicas dos vendedores no estado de São Paulo
--    ou Rio de Janeiro com a latitude maior que -24.54 e longitude menor que -45.63?

SELECT 
	g.geolocation_state ,
	COUNT(DISTINCT g.geolocation_city) AS total_city
FROM geolocation g  
WHERE g.geolocation_state = 'SP' OR g.geolocation_state = 'RJ'
	AND (g.geolocation_lat > -24.54 AND g.geolocation_lng < -45.63)
	GROUP BY g.geolocation_state

-- 3. Qual o número total de pedidos únicos, o número total de produtos e o 
--    preço médio dos pedidos com o preço de frete maior que R$ 20 e a data 
--    limite de envio entre os dias 1 e 31 de Outubro de 2016?

SELECT
	COUNT(DISTINCT oi.order_id) AS total_pedidos ,
	COUNT(oi.product_id) AS product_total, 
	AVG(oi.price) as mean_price
FROM order_items oi 
WHERE oi.freight_value > 20
	AND oi.price > 10 AND oi.price < 100
	AND ( oi.shipping_limit_date> '2016-10-01' AND oi.shipping_limit_date < '2016-10-31')
	

-- 4. Mostre a quantidade total dos pedidos e o valor total do pagamento, para pagamentos 
--    entre 1 e 5 prestações ou um valor de pagamento acima de R$ 5000.
SELECT
	COUNT( DISTINCT oi.order_id ) AS pedidos, 
	COUNT( oi.product_id ) AS produtos, 
	AVG( oi.price ) AS preco_medio
FROM order_items oi 
WHERE freight_value > 20
	AND oi.price > 10 AND oi.price < 100
AND oi.shipping_limit_date >= '2016-10-01' AND oi.shipping_limit_date <= '2016-10-31'

-- 5. Qual a quantidade de pedidos com o status em processamento ou cancelada acontecem com
--    a data estimada de entrega maior que 01 de Janeiro de 2017 ou menor que 23 de Novembro de 2016?

SELECT 
	COUNT(o.order_id),
	o.order_status,
	o.order_estimated_delivery_date 
FROM orders o 
WHERE o.order_status = 'canceled' OR o.order_status = 'processing'
AND o.order_estimated_delivery_date > '2017-01-01' OR o.order_estimated_delivery_date < '2016-11-23'

-- 6. Quantos produtos estão cadastrados nas categorias: perfumaria, brinquedos, esporte lazer,n
--    cama mesa e banho e móveis de escritório que possuem mais de 5 fotos, um 
-- peso maior que 5 g,
-- um altura maior que 10 cm,
-- uma largura maior que 20 cm ?

SELECT
product_category_name , 
COUNT( DISTINCT product_id )
FROM products p
WHERE (
product_category_name = 'perfumaria'
OR product_category_name = 'brinquedos'
OR product_category_name = 'esporte_lazer'
OR product_category_name = 'cama_mesa_banho' 
OR product_category_name = 'moveis_escritorio')
AND product_photos_qty > 5 AND product_weight_g > 5 
AND product_height_cm > 10 AND product_width_cm > 20
GROUP BY product_category_name



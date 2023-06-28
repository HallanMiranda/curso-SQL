-- 1. Qual o número de clientes únicos nos estado de Minas Gerais ou Rio de Janeiro?
SELECT 
	c.customer_state AS Estados,
	COUNT(c.customer_unique_id )
FROM customer c 
WHERE c.customer_state = 'MG' or c.customer_state = 'RJ'

-- 2. Qual a quantidade de cidades únicas dos vendedores no estado de São Paulo ou 
--   Rio de Janeiro com a latitude maior que -24.54 e longitude menor que -45.63?
SELECT 
	COUNT( DISTINCT g.geolocation_city) as city_uniq,
	g.geolocation_state,
	g.geolocation_lat,
	g.geolocation_lng 
FROM geolocation g 
WHERE g.geolocation_state ='SP' OR g.geolocation_state = 'RJ'
	AND g.geolocation_lat > -24.54 AND g.geolocation_lng < -45.63
GROUP BY g.geolocation_state

-- 3. Qual o número total de pedidos únicos, o número total de produtos e o preço médio
--   dos pedidos com o preço de frete maior que R$ 20 e a data limite de envio entre os
--   dias 1 e 31 de Outubro de 2016?

SELECT 
	COUNT( DISTINCT oi.order_id ),
	COUNT(oi.product_id),
	AVG(oi.price)
FROM order_items oi 
WHERE freight_value > 20 
    AND oi.price > 10 AND oi.price < 100
	AND oi.shipping_limit_date >= '2016-10-01' 
	AND oi.shipping_limit_date <= '2016-10-30' 

-- 4. Mostre a quantidade total dos pedidos e o valor total do pagamento, para 
--    pagamentos entre 1 e 5 prestações ou um valor de pagamento acima de R$ 5000.


-- 5. Qual a quantidade de pedidos com o status em processamento ou cancelada acontecem 
--    com a data estimada de entrega maior que 01 de Janeiro de 2017 ou menor que 23 de Novembro de 2016?


-- 6. Quantos produtos estão cadastrados nas categorias: perfumaria, brinquedos, esporte lazer, 
--    cama mesa e banho e móveis de escritório que possuem mais de 5 fotos, um peso maior que 5 g, 
--    um altura maior que 10 cm, uma largura maior que 20 cm?

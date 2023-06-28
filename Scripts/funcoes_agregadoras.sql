-- 1. Qual o número de clientes únicos do estado de Minas Gerais?
SELECT 
	COUNT( DISTINCT c.customer_id ),
	c.customer_state 
FROM customer c 
WHERE c.customer_state = 'MG'

--2. Qual a quantidade de cidades únicas dos vendedores do estado de Santa Catarina?
SELECT 
	COUNT(DISTINCT s.seller_city ), 
	s.seller_state = 'SC'
FROM sellers s 
WHERE s.seller_state = 'SC'

-- 3. Qual a quantidade de cidades únicas de todos os vendedores da base?
SELECT 
	COUNT(DISTINCT g.geolocation_city) 
FROM geolocation g 

-- 4. Qual o número total de pedidos únicos acima de R$ 3.500
SELECT
	COUNT( DISTINCT o.order_id )
FROM orders o 

-- 5. Qual o valor médio do preço de todos os pedidos?
SELECT
	oi.order_id,
	AVG(oi.price) 
FROM order_items oi 

-- 6. Qual o maior valor de preço entre todos os pedidos?
SELECT
	oi.order_id,
	MAX(oi.price) 
FROM order_items oi 
 
-- 7. Qual o menor valor de preço entre todos os pedidos?
SELECT
	oi.order_id,
	MIN(oi.price) 
FROM order_items oi  


--8. Qual a quantidade de produtos distintos vendidos abaixo do preço de R$ 100.00?
SELECT
	COUNT( oi.product_id),
FROM order_items oi 
WHERE oi.price  < 100

--9. Qual a quantidade de vendedores distintos que receberam algum pedido antes do dia 23
--   de setembro de 2016?
SELECT 
	COUNT(oi.seller_id ),
	oi.order_id,
	oi.shipping_limit_date 
FROM order_items oi 
WHERE oi.shipping_limit_date < '2016-09-23 00:00:00'

--10. Quais os tipos de pagamentos existentes?
SELECT 
	COUNT( DISTINCT op.payment_type) 
FROM order_payments op 


--11. Qual o maior número de parcelas realizado?
SELECT
	MAX(op.payment_installments) 
FROM order_payments op 

--12. Qual o menor número de parcelas realizado?

SELECT
	MIN(op.payment_installments) 
FROM order_payments op 

--13. Qual a média do valor pago no cartão de crédito?
SELECT
	op.payment_type, 
	AVG(op.payment_value) 
FROM order_payments op 
WHERE op.payment_type = 'credit_card'
  
--14. Quantos tipos de status para um pedido existem?
SELECT 
	COUNT( DISTINCT o.order_status )
FROM orders o 

--15. Quais os tipos de status para um pedido?
SELECT 
	DISTINCT o.order_status 
FROM orders o 

--16. Quantos clientes distintos fizeram um pedido?
SELECT
	COUNT( DISTINCT o.customer_id ),
	o.order_id
FROM orders o 

  
--17. Quantos produtos estão cadastrados na empresa?


--18. Qual a quantidade máxima de fotos de um produto?


--19. Qual o maior valor do peso entre todos os produtos?


--20. Qual a altura média dos produtos?
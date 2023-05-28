-- As perguntas do CEO:

-- Funções Agregadoras 3
-- 1. Qual o número de clientes únicos do 
--    estado de Minas Gerais?
SELECT
	COUNT( DISTINCT c.customer_unique_id ) as clientes_unicos_MG2,
	c.customer_state 
FROM customer c
WHERE c.customer_state = 'MG'

-- 2.Qual a quantidade de cidades únicas dos vendedores 
--   do estado de Santa Catarina?
SELECT 
	COUNT(DISTINCT s.seller_city) as citys_unique, 
	s.seller_id, 
	s.seller_state 
FROM sellers s 
WHERE s.seller_state = 'SC'

-- 3. Qual a quantidade de cidades únicas de todos os vendedores da base?
SELECT 
	COUNT( DISTINCT s.seller_city ),
	s.seller_id
FROM sellers s 


-- 4. Qual o número total de pedidos únicos acima de R$ 3.500
SELECT COUNT(*) AS total_pedidos_acima_3500
FROM (
    SELECT DISTINCT oi.order_id
    FROM order_items oi
    WHERE oi.price > 3500
) subquery

-- 5. Qual o valor médio do preço de todos os pedidos?

SELECT AVG(oi.price) AS price_medio
FROM order_items oi  

-- 6. Qual o maior valor de preço entre todos os pedidos?
SELECT MAX(oi.price) AS price_max 
FROM order_items oi 

-- 7. Qual o menor valor de preço entre todos os pedidos?
SELECT MIN(oi.price) AS preco_minimo
FROM order_items oi

-- 8. Qual a quantidade de produtos distintos vendidos abaixo do preço de R$ 100.00?
SELECT COUNT( oi.product_id ) AS vendas_menor_100 
FROM order_items oi 
WHERE oi.price < 100

-- 9. Qual a quantidade de vendedores distintos que receberam algum pedido antes do dia 23
--    de setembro de 2016?
SELECT
  COUNT( seller_id )
FROM order_items oi
WHERE shipping_limit_date < '2016-09-23 00:00:00'

-- 10. Quais os tipos de pagamentos existentes?
SELECT DISTINCT op.payment_type
FROM order_payments op


-- 11. Qual o maior número de parcelas realizado?
SELECT
  MAX( payment_installments )
FROM order_payments op

-- 12. Qual o menor número de parcelas realizado?
SELECT MIN( payment_installments )
FROM order_payments op

-- 13. Qual a média do valor pago no cartão de crédito?
SELECT 
	AVG(payment_value)
FROM order_payments op 
WHERE payment_type = 'credit_card'

-- 14. Quantos tipos de status para um pedido existem?
SELECT COUNT( DISTINCT order_status)
FROM orders o

-- 15. Quais os tipos de status para um pedido?
SELECT DISTINCT order_status
FROM orders o

-- 16. Quantos clientes distintos fizeram um pedido?
SELECT 
	COUNT( o.customer_id ),
	o.order_id 
FROM orders o 

-- 17. Quantos produtos estão cadastrados na empresa?
SELECT COUNT(DISTINCT p.product_id) 
FROM products p 

-- 18. Qual a quantidade máxima de fotos de um produto?
SELECT SUM( product_photos_qty ),
p.product_category_name 
FROM products p 
WHERE p.product_category_name = 'instrumentos_musicais'

-- 19. Qual o maior valor do peso entre todos os produtos?
SELECT
	MAX(DISTINCT product_weight_g) 
FROM products p 

-- 20. Qual a altura média dos produtos?

SELECT
  AVG( DISTINCT product_height_cm  )
FROM products p
-- Resposta: 52.67 cm
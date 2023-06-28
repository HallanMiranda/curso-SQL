-- 1. Qual o número de clientes únicos de todos os estados?
SELECT 
	COUNT( DISTINCT c.customer_unique_id) As total_cliente,
 	c.customer_state as Estados
FROM customer c 
group by c.customer_state 

-- 2. Qual o número de cidades únicas de todos os estados?
SELECT 
	COUNT(DISTINCT c.customer_city) as N_Citys,
	c.customer_state as Estados
FROM customer c 
group by c.customer_state 

-- 3. Qual o número de clientes únicos por estado e por cidade?
SELECT 
	COUNT( DISTINCT c.customer_id),
	c.customer_state, 
	c.customer_city 
FROM customer c 
GROUP BY c.customer_state, c.customer_city  

-- 4. Qual o número de vendas únicos por cidade e por estado?
SELECT 
	COUNT( DISTINCT s.seller_id),
	s.seller_state, 
	s.seller_city
FROM sellers s 
GROUP BY s.seller_state , s.seller_city

-- 5. Qual o número total de pedidos únicos acima de R$ 3.500 por cada vendedor?
SELECT 
	oi.seller_id, 
	COUNT(DISTINCT oi.order_id ),
	oi.price 
FROM order_items oi 
Group by oi.seller_id 

-- 6. Qual o número total de pedidos únicos, a data mínima e máxima de envio, o valor máximo,
-- mínimo e médio do frete dos pedidos acima de R$ 1.100 por cada vendedor?
SELECT 
	COUNT(DISTINCT oi.order_id) as pedidos_unicos,
	MAX(oi.shipping_limit_date),
	MIN(oi.shipping_limit_date),
	MAX(oi.freight_value),
	MIN(oi.freight_value),
	AVG(oi.freight_value),
	oi.price 
FROM order_items oi 
WHERE oi.price > 1100
GROUP BY oi.seller_id 

---7. Qual o valor médio, máximo e mínimo do preço de todos os pedidos de cada produto?
SELECT 
FROM order_items oi 
WHERE 
-- 8. Qual a quantidade de vendedores distintos que receberam algum pedido antes do dia 23 
--de setembro de 2016 e qual foi o preço médio desses pedidos?


-- 10. Qual a quantidade de pedidos por tipo de pagamentos?
 
-- 11. Qual a quantidade de pedidos, a média do valor do pagamento e o número máximo de parcelas
-- por tipo de pagamentos?


-- 12. Qual a valor mínimo, máximo, médio e as soma total paga por cada tipo de pagamento 
-- e número de parcelas disponíveis?


-- 14. Qual a média de pedidos por cliente?


--15. Qual a quantidade de pedidos realizados por cada status do pedido, a partir do dia 23
--    de Setembro de 2016?
 
--16. Qual a quantidade de pedidos realizados por dia, a partir do dia 23 de Setembro de 2016?


--17. Quantos produtos estão cadastrados na empresa por categoria?

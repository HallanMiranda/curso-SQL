-- As perguntas do CEO:
-- 1. Qual o número de clientes únicos do estado de São Paulo?
SELECT COUNT(DISTINCT c.customer_id),
		c.customer_state 
FROM customer c 
WHERE c.customer_state = 'SP'

-- 2. Qual o número total de pedidos únicos feitos no dia 08 
--    de Outubro de 2016.
SELECT 
	COUNT(DISTINCT oi.order_id),
	o.
FROM orders o 

-- 3. Qual o número total de pedidos únicos feitos a partir
--  do dia 08 de Outubro de 2016 .

SELECT
	COUNT(DISTINCT oi.order_id) 
FROM  order_items oi 
-- 4. Qual o número total de pedidos únicos feitos a partir
--    do dia 08 de Outubro de 2016 incluso.

-- 5. Qual o número total de pedidos únicos, a data mínima e máxima de envio,
--    o valor máximo, mínimo e médio do frete dos pedidos abaixo de 
--    R$ 1.100 por cada vendedor?


-- 6. Qual o número total de pedidos únicos, a data mínima e máxima de envio, 
-- o valor máximo, mínimo e médio do frete dos pedidos abaixo de 
-- R$ 1.100 incluso por cada vendedor?

S
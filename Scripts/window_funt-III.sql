-- Controle do tamanho da janela: PRECEDING, CURRENT, FOLLOWING 
-- A função PRECEDING, considera X linhas antes da linha atual.
-- A função CURRENT, considera até a linha atual.
-- A função FOLLOWING, considera X linhas depois da atual

-- Calcular a média móvel do preco, considerando os últimos 3 dias até o momento atual.
SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG( oi.price ) OVER ( ORDER BY o.order_purchase_timestamp
	                       ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ) AS media_movel 
FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )

-- Calcular a média móvel do preco, considerando os últimos -- 3 dias até o dia de amanhã.
SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG( oi.price ) OVER ( ORDER BY o.order_purchase_timestamp
                           ROWS BETWEEN 2 PRECEDING AND 1 FOLLOWING ) AS media_movel 
FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )


-- UNBOUNDED PRECEDING, UNBOUNDED FOLLOWING
-- A função UNBOUNDED PRECEDING não considera limites para o início antes da linha atual, enquanto que a função
-- UNBOUNDED FOLLOWING não considera limite para o fim depois da linha atual.

-- Calcular a média móvel do preco, considerando o -- passado histórico
SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG( oi.price ) OVER ( ORDER BY o.order_purchase_timestamp
						   ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS media_movel
FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )

SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG( oi.price ) OVER ( ORDER BY o.order_purchase_timestamp
						   ROWS BETWEEN UNBOUNDED PRECEDING AND 1 FOLLOWING ) AS media_movel 
FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )


-- Exercícios
-- Cria uma consulta que liste a categoria, o preço do produto e classificação de cada produto dentro da sua
-- categoria do mais caro ao mais barato, a partir do dia 01 de Junho de 2018.

-- Crie uma consulta que exiba a data de compra, o valor de cada venda e o total acumulado de vendas 
-- até aquela data.

-- Crie uma consulta que lista a data da compra, o número de produtos vendidos e o crescimento das vendas 
-- com relação ao dia anterior.

-- Crie uma consulta que exiba o estado do cliente, a categoria, a quantidade de produtos vendidos e o percentual 
-- de vendas em relação ao total vendido no estado.
















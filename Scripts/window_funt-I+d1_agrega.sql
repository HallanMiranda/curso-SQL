--Anatomia - A sintaxe da Windows Function é da seguinte forma:

--Criar uma agregacao envolvendo outa coluna
SELECT 
	<columns_1>,<columns_2>,
	<window_function> (expresion) OVER ( PARTITION BY <partition_1> )
	                                     <order_list>
	                                     ROWS frame_cause )
FROM <table_name>

-- Significado das expressões 
--<window_function>: É o nome da função de janela que você quer usar

-- ( expression ): É o nome da coluna que você quer aplicar a operação. 
---Algumas windows function não dependem da coluna.
--OVER: É somente para identificar que é uma windows function_.
--PARTITION BY: Divide as linhas em partições, então nós podemos especificar quais linhas aplicar a operação matemática.

-- <partition_list>: É o nome da coluna (s) que nós queremos seguimentar. 
--ORDER BY: É usado para ordenar as linhas dentro da agregação. 

-- order_list: É o nome das colunas da ordenação.

--ROWS: Indica os limites da janela

--frame_cluse: Usado para determinar os limites de linhas dentro da janela.

-- Agregação. AVG()
-- Calcula o preço médio de uma coluna por categoria  GROUP BY 
SELECT
p.product_category_name,
AVG ( oi.price ) AS avg_price
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id )
WHERE p.product_category_name IS NOT NULL GROUP BY p.product_category_name
 -- R: produto_catg + media _price

-- Windows Function 
SELECT
	p.product_category_name,
	oi.price,
	AVG ( oi.price ) OVER ( PARTITION BY p.product_category_name ) AS avg_price
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL
--R: produto_catg + price_produt + media _price por  product_category_name 

-- MAX()
-- Retorna o maior valor de uma coluna:
-- Calcular o preço médio por categoria e por tipo de pagamento GROUP BY 
SELECT
	p.product_category_name, 
	op.payment_type,
	MAX ( oi.price ) AS avg_price
FROM order_items oi INNER JOIN products p  ON ( p.product_id = oi.product_id ) 
					INNER JOIN order_payments op ON ( op.order_id = oi.order_id)
WHERE p.product_category_name IS NOT NULL             
GROUP BY p.product_category_name, op.payment_type
-- R: product_category_name + payment_type + avg_price :

-- Windows Function 
SELECT
	p.product_category_name,
	op.payment_type,
	MAX ( oi.price ) OVER ( PARTITION BY p.product_category_name, op.payment_type ) AS avg_price
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
					INNER JOIN order_payments op ON ( op.order_id = oi.order_id)
WHERE p.product_category_name IS NOT NULL
--R:product_category_name + payment_type + avg_price ordenado crescente ASC 

-- MIN() :Retorna o menor valor de uma coluna
-- Encontrar a data da primeira compra por categoria e tipo de pagamento GROUP BY 
SELECT
	p.product_category_name,
	op.payment_type,
	oi.shipping_limit_date,
	MIN ( oi.shipping_limit_date ) OVER ( PARTITION BY p.product_category_name, op.payment_type
                                   ORDER BY oi.shipping_limit_date ) AS first_purchase 
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id )
					INNER JOIN order_payments op ON ( op.order_id = oi.order_id) 
WHERE p.product_category_name IS NOT NULL
-- R: product_category_name - payment_type - shipping_limit_date - first_purchase

-- Ranqueamento ROW_NUMBER()- Mostra o número da linha, começando com 1 até o valor da última linha de acordo
-- com a ordenação definida dentro da função janela. Essa função não recebe parâmetros dentro do parênteses.
SELECT
	p.product_category_name,
	oi.price,
	ROW_NUMBER() OVER (PARTITION BY p.product_category_name ORDER BY oi.price DESC ) AS price_rank
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL
-- R: product_category_name + price + price_rank 
-- ROW_NUMBER(): ele ranckeia de forma sequencial 1=1,2=1,3=2 sera RK 1,2,3 msm que tenha a AVG tenha o msm valor

 -- RANK( ) - Se a coluna ranqueada possuir valor iguais, ambos valores recebem o mesmo número do ranking
 -- e o próximo valor recebe o valor do ranking somado ao número de repetições.
SELECT
	p.product_category_name,
	oi.price,
	RANK() OVER (PARTITION BY p.product_category_name ORDER BY oi.price DESC ) AS price_rank
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL
-- R: product_category_name + price + price_rank
-- RANK( ):ele ranckeia de forma sequencial 1=1,2=1,3=2 sera RK 1,1,2 de forma que se o valor AVG se repetir a sequencia tbm se repete

-- DENSE_RANK( ) Se a coluna ranqueada possuir valor iguais, ambos valores recebem o mesmo número do ranking
-- e o próximo valor recebe o valor seguinte do ranking.
SELECT
	p.product_category_name,
	oi.price,
	DENSE_RANK() OVER (PARTITION BY p.product_category_name ORDER BY oi.price DESC ) AS price_rank
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL
-- R: product_category_name + price + price_rank

-- PERCENT_RANK( ) Essa função mostra o valor percentual do ranking para cada uma das linhas.
SELECT
p.product_category_name,
oi.price,
PERCENT_RANK() OVER (PARTITION BY p.product_category_name ORDER BY oi.price DESC ) AS price_rank
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) WHERE p.product_category_name IS NOT NULL

-- NTILE() Divide os valores da coluna em buckets.
SELECT
p.product_category_name,
oi.price,
NTILE(4) OVER (PARTITION BY p.product_category_name ORDER BY oi.price DESC ) AS price_rank
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) WHERE p.product_category_name IS NOT NULL


-- LAG() Causa um deslocamento adiantado, avançando os valores da coluna.
SELECT
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	LAG( oi.shipping_limit_date ) OVER ( PARTITION BY p.product_category_name
ORDER BY oi.shipping_limit_date DESC ) AS lag FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id )
WHERE p.product_category_name IS NOT NULL

-- LEAD() Causa um deslocamento atrasando, recuando os valores da coluna.
SELECT
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	LEAD( oi.shipping_limit_date ) OVER ( PARTITION BY p.product_category_name ORDER BY oi.shipping_limit_date DESC ) AS
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL


-- FIRST_VALUE() Retorna o menor valor dentro da segmentação da janela
SELECT
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	LEAD( oi.shipping_limit_date ) OVER ( PARTITION BY p.product_category_name ORDER BY oi.shipping_limit_date DESC ) AS product_category 
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL

-- LAST_VALUE() Retorna o maior valor dentro da segmentação da janela
SELECT
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	LAST_VALUE( oi.shipping_limit_date ) OVER ( PARTITION BY p.product_category_name ORDER BY oi.shipping_limit_date DESC ) AS p_product_category
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL

-- NTH_VALUE() Desloca os valores da coluna para a Nth posição
SELECT
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	NTH_VALUE( oi.shipping_limit_date, 2 ) OVER ( PARTITION BY p.product_category_name ORDER BY oi.shipping_limit_date DESC) AS ASC_
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id ) 
WHERE p.product_category_name IS NOT NULL

--Exercícios
--Cria uma consulta que liste a categoria, o id do produto, o preço e classificação de cada produto dentro da sua
--categoria, com base no preço no seu preço médio.

-- Crie uma consulta que exiba a data de compra, o valor de cada venda e o total acumulado
-- de vendas até aquela data.

-- Crie uma consulta que exiba a data de compra, o valor de cada venda e a média móvel 
-- dos últimos três valores de venda incluindo o valor atual.

-- Crie uma consulta que lista a data da compra, o número de produtos vendidos 
-- e o crescimento das vendas com relação ao dia anterior.

--  Crie uma consulta que exiba o estado do cliente, a categoria, a quantidade de 
--  produtos vendidos e o percentual de vendas em relação ao total vendido no estado.











































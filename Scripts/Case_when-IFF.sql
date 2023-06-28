

-- selecionando colunas 
SELECT 
	c.customer_id ,
	c.customer_city ,
	c.customer_state
FROM customer c 

-- novas colunas com operacoes matematicoas  
SELECT
	oi.price ,
	oi.freight_value ,
	oi.price + oi.freight_value AS volor_total ,
	oi.price + (0.10 * oi.price) AS valor_c_juros
FROM order_items oi 
LIMIT 10;

-- novas coluanas coom condicionais

-- Usando condicional CASE WHEN
SELECT
CASE WHEN <coluna> <condicional>THEN <verdadeiro> ELSE <falso> END AS nome da nova coluna

-- CASE  WHEN (quando) oi price(minha col) for < que 100.0  THEN (se isso for ved)entao crie uma linha com a palavra 'barato' 
-- ELSE: (se nao) é 'caro' coloca para finalizar END e AS 'nome da coluna nova'
-- Fica assim:
SELECT
	oi.price ,
	CASE 
		WHEN oi.price < 100.0 THEN 'barato'
		ELSE 'caro'
	END AS status_
FROM order_items oi 
LIMIT 10;

-- Usando a funcao IIF
SELECT 
IIF (<coluna> <condicional> <verdadeiro>, <falso>) AS nome da nova coluna
-- IIF temos tres condicoes(condicional, true , false)
-- Fica assim:

SELECT
	oi.price ,
	IIF( oi.price < 100.0 , 'barato' , 'caro' ) AS status
FROM order_items oi 
LIMIT 10;

-- CASE WHEN Aninhado

SELECT 
	oi.price,
	CASE 
		WHEN oi.price < 20  THEN 'super_barato'
		WHEN oi.price < 100 THEN 'barato'
		WHEN oi.price > 150 AND oi.price < 180 THEN 'normal'
	    ELSE 'caro' 
	END AS status_
FROM  order_items oi 
LIMIT 10;

 Exercícios
--4.1 Crie uma consulta que exiba o código do produto e a categoria de cada produto
-- com base no seu preço:
--  Preço abaixo de 50.     Categoria A
--  Preço entre 50 e 100.   Categoria B
--  Preço entre 100 e 500.  Categoria C
--  Preço entre 500 e 1500. Categoria D
--  Preço acima de 1500.    Categoria E


--4.2 Calcule a quantidade de produtos para cada uma das categorias criadas no exercícios anterior.


--4.3 Selecione os seguintes categorias de produtos: 
--livros técnicos, pet shop, pc gamer, tablets impressão imagem,
-- fashion esports, perfumaria, telefonia, beleza saude, ferramentas jardim.
--Crie uma primeira coluna mostrandoo novo preço da categoria, segundo os valores abaixo:
--Livros técnicos - 10% de desconto 
--Pet shop - 20% de desconto
--PC gamer - 50% de aumento 
--Tablets - 10% de aumento 
--Fashion Esports - 5% de aumento
--Crie uma segunda coluna mostrando se a categoria sofreu ou não alteração de preço:

 --4.4 Crie uma coluna que mostra o status de entrega do pedido.
 -- Se a coluna estiver vazia, o status é de pendente.
--“order_delivered_customer_date” - pendente
--“order_delivered_customer_date” menor que o dia 01 de Junho de 2017 - entregue)
--“order_delivered_customer_date” maior que o dia 01 de Junho de 2017 - programado
















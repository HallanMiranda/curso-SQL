-- Verificar o tipo de coluna no SQLite

-- Comando para verificar tabela inteira.
PRAGMA table_info( order_items )
-- Comando para verificar todos os elementos da coluna
SELECT typeof(oi.order_items)
FROM order_items oi 
LIMIT 10;

-- mudar tip de col . Para mudar  type col deve -se usar o operador :
CAST(<coluna>AS<novo_type>)
--Tipos de colunas
null - representacao vazio
integer - valor inteiro
real
text
blob

--Comando para verificar todos os elementos da coluna
SELECT 
	SUM( CAST(oi.price AS INTEGER) ) AS preco_total,
	SUM(CAST(oi.price AS REAL) )     AS preco_total
FROM order_items oi 

--Podemos usar as operações matemática sobre as colunas e obter resultado únicos, como por
--exemplo.
SELECT
  COUNT( oi.order_id )          AS numero_pedidos,
  COUNT( oi.product_id )        AS numero_produtos,
  MIN( oi.shipping_limit_date ) AS aprovacao_minima,
  MAX( oi.shipping_limit_date ) AS aprovacao_maxima,
  AVG( freight_value )          AS preco_medio_entrega
FROM order_items oi

--3. Operações em colunas com condicionais:
--As operações em colunas com condicionais permite que você faça um segundo filtro após o filtro
--da clause WHERE, de maneira independente.
--3.1 Exemplos

SELECT
  p.product_category_name,
  COUNT( oi.product_id ) AS produto,
  AVG( oi.price ) AS preco_medio,
  AVG( CASE
          WHEN oi.price < 1.0 THEN oi.price
          ELSE 10*oi.price
       END ) AS price
FROM order_items oi INNER JOIN products p ON ( p.product_id = oi.product_id )
WHERE oi.price < 3.5
GROUP BY p.product_category_name





















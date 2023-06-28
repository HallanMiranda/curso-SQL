--Funções de manipulação 
-- COALESCE: A função COALESCE retorna o primeiro elemento não vazio. 
-- Na prática, essa função é usada para substituir dados faltantes.

-- Exemplo:
SELECT
  COALESCE(coluna1, coluna2, coluna3) AS valor_final
FROM tabela;

-- Aplicação
SELECT
  o.order_id ,
  o.customer_id ,
  o.order_status ,
  or2.review_comment_title,
  o.order_status || "-" || COALESCE( or2.review_comment_title, "VAZIO")  AS teste
FROM orders o LEFT JOIN order_reviews or2 ON ( o.order_id = or2.order_id )
LIMIT 100

-- LOWER & UPPER: A função LOWER converte uma string de caracteres para letras minúsculas, enquanto a
-- função UPPER converte uma string de caracteres para letras maiúsculas.
SELECT
  LOWER(coluna) AS coluna_minuscula
FROM tabela;

SELECT
  UPPER(coluna) AS coluna_maiuscula
FROM tabela;
--Aplicação
SELECT
  o.order_id ,
  o.customer_id ,
  o.order_status ,
  or2.review_comment_title,
  UPPER( o.order_status || "-" || COALESCE( or2.review_comment_title, "vazio") ) AS teste
FROM orders o LEFT JOIN order_reviews or2
LIMIT 100

-- SUBSTRING: A função SUBSTRING extra um parte do texto. Você precisa indicar o texto, o inicio do
-- recorte e o número de caracteres que você quer recortar. Essa função é muito utilizada para limpar texto.
-- Exemplo:
SELECT
  SUBSTRING(coluna, 1, 5) AS substring_coluna
FROM tabela;

-- Aplicação
SELECT
  o.order_status ,
  or2.review_comment_title,
  LOWER( o.order_status || "-" || COALESCE( or2.review_comment_title, "VAZIO") ) AS teste,
  SUBSTRING( or2.review_comment_title, 5, 3 )
FROM orders o LEFT JOIN order_reviews or2
LIMIT 100  

-- REPLACE: A função REPLACE substitui uma string ( texto ) por uma nova string (texto). Nessa função, 
você precisa passar o texto, a palavra antiga e a palavra nova que substituirá a antiga
-- Aplicação

SELECT
  o.order_status ,
  or2.review_comment_title,
  LOWER( o.order_status || "-" || COALESCE( or2.review_comment_title, "VAZIO") ) AS teste,
  REPLACE( or2.review_comment_title, 'recomendo', 'super recomendo' ) AS colunas
FROM orders o LEFT JOIN order_reviews or2 ON (or2.order_id = o.order_id )
LIMIT 100

-- ROUND: A função ROUND arredonda os números decimais de acordo com o número de casas decimais escolhida. 
-- Você precisa passar o valor decimal e o número de casas após a vírgula.
-- Aplicação
SELECT
  oi.price,
  ROUND( oi.price, 0 ) AS new_price ,    -- numero inteiro
  ROUND( oi.price, 1 ) AS new_price_one -- numero decimal
FROM order_items oi






























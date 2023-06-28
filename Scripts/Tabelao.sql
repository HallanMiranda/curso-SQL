


--Analisar a cardinalidade da tabela.
--Modelo de negócio E-commerce
--1. Um pedido pode ter mais de um produto?

--2. Um produto pode ter mais de uma forma de pagamento? 
--3. Um pedido pode ter mais de uma avaliação?
--4. A avaliação é para o produto ou para o pedido?

--Validar a duplicidade da união.
--1. Descobrir a cardinalidade das tabelas individuais antes de fazer a união entre elas. 
--2. Validar a duplicidade das linhas após a união das tabelas.



-- Mais de uma linha com o msm cod de order id?
SELECT COUNT(o.order_id)
FROM orders o 
GROUP BY o.order_id 
HAVING COUNT(o.order_id) >1

-- Existe mais de um produto por pedido ? obs conta o produto agrupado ple pedido

SELECT 
  oi.order_id ,
  COUNT(oi.product_id) 
FROM order_items oi
GROUP BY order_id 
HAVING COUNT(product_id) >1
LIMIT 10;


SELECT COUNT(oi.product_id)
FROM orders o  left join order_items oi  on (o.order_id  = oi.order_id)
GROUP BY o.order_id 
HAVING COUNT(oi.product_id) > 1


SELECT
  o.order_id ,
  COUNT(o.order_id)
FROM orders o  left join order_items oi  on (o.order_id  = oi.order_id)
GROUP BY o.order_id 
HAVING COUNT(o.order_id) > 1


-- olha um pedido em especial qual o cd do ped e quantos inten ele tem ?



SELECT *
FROM orders o left join order_items oi  on (o.order_id  = oi.order_id)
WHERE o.order_id =  '00526a9d4ebde463baee25f386963ddc'

-- Montar a grande tabela da empresa Olist, a partir da união de todas as tabelas.
SELECT
  o.order_id,
  o.order_status,
  oi.product_id,
  p.product_category_name,
  or2.review_score,
  op.payment_value,
  op.payment_type,
  s.seller_city,
  g.geolocation_lat,
  g.geolocation_lng
FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )
              LEFT JOIN order_reviews or2 ON ( or2.order_id = o.order_id )
              LEFT JOIN order_payments op ON ( op.order_id = o.order_id )
              LEFT JOIN products p ON ( p.product_id = oi.product_id )
              LEFT JOIN sellers s ON ( s.seller_id = oi.seller_id )
              LEFT JOIN geolocation g ON ( g.geolocation_zip_code_prefix = s.seller_zip_code_prefix )
LIMIT 20;








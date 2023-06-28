-- calcular a media de avaliacoes,
-- preco medio, 
-- preco total, 
-- menor e maior preco de clientes unicos
-- por dia que acontecem no dia 02 de outubro de 2016.

SELECT
  DATE(or2.review_creation_date) AS date_,
  AVG(or2.review_score) AS avg_reviws
FROM order_reviews or2 
GROUP BY DATE(or2.review_creation_date)

SELECT 
  DATE(oi.shipping_limit_date) AS date_,
  AVG(oi.price) AS avg_price,
  SUM(oi.price) AS sum_price,
  MAX(oi.price) AS max_price,
  MIN(oi.price) AS min_price
FROM order_items oi 
GROUP BY DATE(oi.shipping_limit_date)

SELECT 
  DATE(o.order_purchase_timestamp) ,
  COUNT(DISTINCT o.customer_id) AS cliente_unq
FROM orders o 
GROUP BY DATE(o.order_purchase_timestamp) 


SELECT
  t1.date_,
  t1.avg_reviws,
  t2.date_,
  t2.avg_price,
  t2.sum_price,
  t2.max_price,
  t2.min_price,
  t3.customer_unique
FROM ( SELECT
           DATE(or2.review_creation_date) AS date_,
           AVG(or2.review_score) AS avg_reviews
       FROM order_reviews or2 
       GROUP BY DATE(or2.review_creation_date) ) AS t1 LEFT JOIN  ( SELECT 
 																        DATE(oi.shipping_limit_date) AS date_,
 																        AVG(oi.price) AS avg_price,
 																        SUM(oi.price) AS sum_price,
 															            MAX(oi.price) AS max_price,
 														                MIN(oi.price) AS min_price
															       FROM order_items oi 
															       GROUP BY DATE(oi.shipping_limit_date) ) AS t2 ON ( t1.date_ = t2.date_ )
		 											   LEFT JOIN ( SELECT 
                                                                       DATE(o.order_purchase_timestamp) ,
                                                                       COUNT(DISTINCT o.customer_id) AS customer_unique
                                                                   FROM orders o 
                                                                   GROUP BY DATE(o.order_purchase_timestamp) ) AS t3 ON ( t3.date_= t1.date_)
WHERE t1.date_ BETWEEN '2016-10-02' AND '2016-10-09'



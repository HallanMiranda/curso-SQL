--MEdia de Avaliacao de produto

SELECT 
FROM 
WHERE 

-- Media de Prece do produto

SELECT AVG(oi.price) AS avg_price 
FROM order_items oi 
WHERE oi.order_id  IN (SELECT o.order_id
   					   FROM orders o 
					   WHERE o.order_status = 'delivered')
					   
					   

SELECT AVG(oi.price) 
FROM orders o LEFT JOIN order_items oi ON (oi.order_id = o.order_id)
WHERE o.order_status = 'delivered'



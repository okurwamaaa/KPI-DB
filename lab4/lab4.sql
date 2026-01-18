SELECT category_id, COUNT(*) as product_count
FROM product
GROUP BY category_id
ORDER BY product_count DESC;

SELECT seller_id, AVG(price) as average_price
FROM product
GROUP BY seller_id;

SELECT SUM(amount) as total_revenue
FROM payment
WHERE status = 'SUCCESS';

SELECT category_id, AVG(price) as avg_price
FROM product
GROUP BY category_id
HAVING AVG(price) > 500;

SELECT b.first_name, b.last_name, o.id as order_id, o.status, o.total_amount
FROM buyer b
JOIN orders o ON b.id = o.buyer_id;

SELECT c.name as category_name, p.name as product_name, p.price
FROM category c
LEFT JOIN product p ON c.id = p.category_id
ORDER BY c.name;

SELECT o.id as order_id, b.last_name, s.city, s.tracking_number, s.status
FROM orders o
JOIN buyer b ON o.buyer_id = b.id
JOIN shipment s ON o.id = s.order_id;

SELECT name, price 
FROM product
WHERE price > (SELECT AVG(price) FROM product);

SELECT first_name, last_name, phone
FROM buyer
WHERE id IN (SELECT buyer_id FROM orders);

SELECT p.name, 
       (SELECT COUNT(*) FROM order_item oi WHERE oi.product_id = p.id) as times_sold
FROM product p;
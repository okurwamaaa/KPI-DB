INSERT INTO users (id, email, password_hash) VALUES 
(6, 'new_client@mail.com', 'secure_pass_1');

INSERT INTO buyer (user_id, first_name, last_name, phone) VALUES 
(6, 'Max', 'Verstappen', '+380998887766');

INSERT INTO product (seller_id, category_id, name, description, price, stock_quantity, sku) VALUES 
(1, 1, 'Sony WH-1000XM5', 'Best noise cancelling headphones', 350.00, 50, 'SONY-WH5');

UPDATE product 
SET price = 900.00 
WHERE id = 1;

UPDATE orders 
SET status = 'DELIVERED' 
WHERE id = 3;

UPDATE buyer 
SET phone = '+380000000001' 
WHERE last_name = 'Verstappen';

DELETE FROM review 
WHERE id = 2;

DELETE FROM product 
WHERE sku = 'NON-EXISTENT-SKU';

SELECT id, name, price, stock_quantity 
FROM product 
WHERE price > 1000 
ORDER BY price DESC;

SELECT * FROM orders 
WHERE buyer_id = 1;

SELECT id, email, created_at 
FROM users 
WHERE created_at > '2025-01-01';
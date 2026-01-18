INSERT INTO users (id, email, password_hash) VALUES 
(1, 'admin@marketplace.com', 'hash123'),
(2, 'seller1@shop.com', 'hash456'),
(3, 'seller2@tech.com', 'hash789'),
(4, 'buyer1@mail.com', 'hashabc'),
(5, 'buyer2@test.com', 'hashdef');

INSERT INTO administrator (user_id, full_name, access_level) VALUES (1, 'Ivan Adminov', 'SUPER');

INSERT INTO seller (user_id, store_name, tax_id, iban, is_verified) VALUES 
(2, 'Best Gadgets', '12345678', 'UA12345678901234567890', true),
(3, 'Tech World', '87654321', 'UA09876543210987654321', true);

INSERT INTO buyer (user_id, first_name, last_name, phone) VALUES 
(4, 'Petro', 'Petrenko', '+380501112233'),
(5, 'Oksana', 'Koval', '+380979998877');

INSERT INTO address (user_id, country, city, street_line, zip_code, is_default) VALUES
(4, 'Ukraine', 'Kyiv', 'Khreshchatyk 1', '01001', true),
(4, 'Ukraine', 'Lviv', 'Rynok Sq 10', '79000', false),
(5, 'Ukraine', 'Odesa', 'Deribasivska 5', '65000', true);

INSERT INTO category (id, name, parent_id) VALUES 
(1, 'Electronics', NULL),
(2, 'Smartphones', 1),
(3, 'Laptops', 1),
(4, 'Clothing', NULL),
(5, 'Men Shoes', 4);

INSERT INTO product (seller_id, category_id, name, description, price, stock_quantity, sku) VALUES 
(1, 2, 'iPhone 15', 'Latest Apple smartphone', 1000.00, 10, 'IPH-15-BLK'),
(1, 2, 'Samsung S24', 'Android flagship', 950.00, 15, 'SAM-S24-GRY'),
(2, 3, 'MacBook Pro', 'Professional laptop', 2000.00, 5, 'MBP-M3-14'),
(2, 3, 'Dell XPS 15', 'Windows ultrabook', 1800.00, 8, 'DELL-XPS-15'),
(1, 2, 'Xiaomi 14', 'Budget flagship', 700.00, 20, 'MI-14-WHT');

INSERT INTO product_price_history (product_id, price, changed_at) VALUES
(1, 1100.00, '2025-10-01 10:00:00'),
(2, 1050.00, '2025-11-15 12:00:00'),
(3, 2200.00, '2025-09-01 08:00:00');

INSERT INTO orders (id, buyer_id, total_amount, status) VALUES 
(1, 1, 1950.00, 'PAID'),
(3, 1, 2000.00, 'PENDING'),
(4, 2, 1800.00, 'SHIPPED');

INSERT INTO order_item (order_id, product_id, quantity, price_at_purchase) VALUES 
(1, 1, 1, 1000.00),
(1, 2, 1, 950.00),
(3, 3, 1, 2000.00),
(4, 4, 1, 1800.00);

INSERT INTO payment (order_id, amount, status) VALUES 
(1, 1950.00, 'SUCCESS'),
(3, 2000.00, 'PENDING'),
(4, 1800.00, 'SUCCESS');

INSERT INTO shipment (order_id, country, city, street_line, zip_code, tracking_number, status) VALUES 
(1, 'Ukraine', 'Kyiv', 'Khreshchatyk 1', '01001', 'NP204502395', 'SHIPPED'),
(3, 'Ukraine', 'Kyiv', 'Lesi Ukrainky 10', '01133', NULL, 'PENDING'),
(4, 'Ukraine', 'Odesa', 'Nova Poshta 5', '65000', 'NP999902395', 'SHIPPED');

INSERT INTO review (product_id, buyer_id, rating, comment) VALUES 
(1, 1, 5, 'Great phone! Excellent camera.'),
(2, 1, 4, 'Good Android phone, but battery life is average.'),
(4, 2, 5, 'Best Laptop I ever had!');
INSERT INTO users (id, email, password_hash) VALUES 
(1, 'admin@marketplace.com', 'hash123'),
(2, 'seller1@shop.com', 'hash456'),
(4, 'buyer1@mail.com', 'hashabc');

INSERT INTO buyer (user_id, first_name, last_name, phone) VALUES 
(4, 'Petro', 'Petrenko', '+380501112233');

INSERT INTO seller (user_id, store_name, tax_id, iban, is_verified) VALUES 
(2, 'Best Gadgets', '12345678', 'UA12345678901234567890', true);

INSERT INTO category (id, name) VALUES (1, 'Electronics');

INSERT INTO product (seller_id, category_id, name, description, price, stock_quantity, sku) VALUES 
(1, 1, 'iPhone 15', 'Latest smartphone', 1000.00, 10, 'IPH-15');

INSERT INTO orders (id, buyer_id, total_amount, status) VALUES 
(1, 1, 1000.00, 'PAID');

INSERT INTO order_item (order_id, product_id, quantity, price_at_purchase) VALUES 
(1, 1, 1, 1000.00);
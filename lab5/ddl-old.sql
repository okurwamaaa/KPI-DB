DROP TABLE IF EXISTS denormalized_orders;

CREATE TABLE denormalized_orders (
    order_id SERIAL PRIMARY KEY,
    buyer_full_name VARCHAR(255),
    buyer_email VARCHAR(255),
    buyer_phone VARCHAR(50),
    product_name VARCHAR(255),
    category_name VARCHAR(255),
    product_price DECIMAL(10, 2),
    quantity INT,
    order_date TIMESTAMP,
    shipping_city VARCHAR(100),
    shipping_address VARCHAR(255),
    shipping_zip VARCHAR(20)
);
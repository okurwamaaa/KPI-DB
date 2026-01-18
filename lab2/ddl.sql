CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE buyer (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE REFERENCES users(id),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE seller (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE REFERENCES users(id),
    store_name VARCHAR(255) NOT NULL,
    tax_id VARCHAR(50) NOT NULL UNIQUE,
    iban VARCHAR(50) NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE
);

CREATE TABLE administrator (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE REFERENCES users(id),
    full_name VARCHAR(255),
    access_level VARCHAR(50) CHECK (access_level IN ('SUPER', 'MODERATOR'))
);

CREATE TABLE address (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    street_line VARCHAR(255) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INT REFERENCES category(id)
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    seller_id INT NOT NULL REFERENCES seller(id),
    category_id INT NOT NULL REFERENCES category(id),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    sku VARCHAR(100) UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    version INT DEFAULT 1,
    deleted_at TIMESTAMP
);

CREATE TABLE product_price_history (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL REFERENCES product(id),
    price DECIMAL(10, 2) NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    buyer_id INT NOT NULL REFERENCES buyer(id),
    total_amount DECIMAL(12, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_item (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(id),
    product_id INT NOT NULL REFERENCES product(id),
    quantity INT NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(10, 2) NOT NULL
);

CREATE TABLE payment (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(id),
    amount DECIMAL(12, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shipment (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL UNIQUE REFERENCES orders(id),
    country VARCHAR(100),
    city VARCHAR(100),
    street_line VARCHAR(255),
    zip_code VARCHAR(20),
    tracking_number VARCHAR(100),
    status VARCHAR(50) DEFAULT 'PENDING'
);

CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL REFERENCES product(id),
    buyer_id INT NOT NULL REFERENCES buyer(id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
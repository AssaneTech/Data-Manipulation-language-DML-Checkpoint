-- Create the database
CREATE DATABASE ddl_checkpoint_db;
USE ddl_checkpoint_db;

-- Creating the product table
CREATE TABLE product (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(20) NOT NULL,
    price INT CHECK (price > 0)
);

-- Creating the customer table
CREATE TABLE customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_tel VARCHAR(20) NOT NULL
);

-- Creating the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    order_date DATE DEFAULT CURDATE(), -- because sysdate does'nt work here
    quantity INT CHECK (quantity > 0),
    total_amount INT CHECK (total_amount > 0),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- Inserting values into the product table
INSERT INTO product VALUES
('P01', 'Samsung Galaxy S20', 'Smartphone', 3299),
('P02', 'ASUS Notebook', 'PC', 4599);

-- Inserting values into the customer table
INSERT INTO customer VALUES
('CO1', 'ALI', '71321009'),
('CO2', 'ASMA', '77345823');

-- Inserting values into the orders table
INSERT INTO orders (customer_id, product_id, order_date, quantity, total_amount) VALUES
('CO1', 'P01', NULL, 2, 9198),
('CO2', 'P02', '2020-05-28', 1, 3299);
CREATE DATABASE IF NOT EXISTS mysql_labs;

CREATE TABLE mysql_labs.users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    birth_date DATE
    );

CREATE TABLE mysql_labs.products (
    product_id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(30) NOT NULL,
    product_description VARCHAR(60) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    product_stock INT NOT NULL
    );

CREATE TABLE mysql_labs.orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES mysql_labs.users(id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES mysql_labs.products(product_id)
    );

-- Insert users
INSERT INTO mysql_labs.users (first_name, last_name, email, birth_date) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '1990-05-15'),
('Bob', 'Smith', 'bob.smith@example.com', '1985-11-23'),
('Carol', 'Davis', 'carol.davis@example.com', '2002-07-30'),
('David', 'Wilson', 'david.wilson@example.com', '1998-12-11'),
('Eva', 'Brown', 'eva.brown@example.com', '1975-03-09');

-- Insert products
INSERT INTO mysql_labs.products (product_id, product_name, product_description, product_price, product_stock) VALUES
(1, 'Laptop', '15-inch laptop with 16GB RAM', 1200.00, 10),
(2, 'Smartphone', 'Latest model smartphone', 800.00, 25),
(3, 'Headphones', 'Noise-cancelling headphones', 150.00, 40),
(4, 'Coffee Maker', 'Automatic coffee maker', 120.00, 15),
(5, 'Desk Chair', 'Ergonomic office chair', 300.00, 5);

-- Insert orders
INSERT INTO mysql_labs.orders (order_id, user_id, product_id, order_date) VALUES
(1, 1, 1, '2023-05-01'),
(2, 2, 3, '2023-05-03'),
(3, 1, 2, '2023-05-07'),
(4, 3, 5, '2023-05-08'),
(5, 4, 4, '2023-05-09'),
(6, 2, 2, '2023-05-11'),
(7, 5, 1, '2023-05-13');
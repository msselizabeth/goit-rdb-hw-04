-- 1. Create DB and tables
CREATE DATABASE LibraryManagement;
USE LibraryManagement;
-- Tables list
CREATE TABLE authors (
author_id INT PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR(255)
);

CREATE TABLE genres (
genre_id INT PRIMARY KEY AUTO_INCREMENT,
genre_name VARCHAR(255)
);

CREATE TABLE books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255),
publication_year YEAR,
author_id INT,
genre_id INT,
FOREIGN KEY (author_id) REFERENCES authors(author_id),
FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(255),
email VARCHAR(255)
);

CREATE TABLE borrowed_books (
borrow_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT,
user_id INT,
FOREIGN KEY (book_id) REFERENCES books(book_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
borrow_date DATE,
return_date DATE
);

-- 2. Insert values
USE LibraryManagement;

-- Authors
INSERT INTO authors (author_name) VALUES 
('George Orwell'),
('Margaret Atwood');

-- Genres
INSERT INTO genres (genre_name) VALUES 
('Science Fiction'),
('Dystopian Fiction');

-- Books
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES 
('1984', 1949, 1, 2),
('The Handmaid''s Tale', 1985, 2, 2);

-- Users
INSERT INTO users (username, email) VALUES 
('toronto_reader', 'reader@mail.toronto.ca'),
('cs_student', 'student@university.edu');

-- Borrowing history
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES 
(1, 1, '2023-09-01', '2023-09-15'),
(2, 2, '2023-10-10', '2024-03-13');

-- 3. JOIN tables
USE uni_tasks;
SELECT * FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id;

-- 4.
USE uni_tasks;
-- 4.1 
SELECT COUNT(*) AS total_rows
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id;

-- 4.2
SELECT COUNT(*) AS total_rows
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers sh ON o.shipper_id = sh.id

-- 4.3
SELECT * 
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers sh ON o.shipper_id = sh.id
WHERE e.employee_id > 3 AND e.employee_id <= 10

-- 4.4
SELECT 
    c.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS avg_quantity 
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers sh ON o.shipper_id = sh.id
GROUP BY c.name

-- 4.5
SELECT 
    c.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS avg_quantity 
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers sh ON o.shipper_id = sh.id
GROUP BY c.name
HAVING avg_quantity > 21;

-- 4.6 
SELECT 
    c.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS avg_quantity 
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers sh ON o.shipper_id = sh.id
GROUP BY c.name
HAVING avg_quantity > 21
ORDER BY total_rows DESC

-- 4.7
SELECT 
    c.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS avg_quantity 
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN customers cu ON o.customer_id = cu.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers sh ON o.shipper_id = sh.id
GROUP BY c.name
HAVING avg_quantity > 21
ORDER BY total_rows DESC
LIMIT 4 OFFSET 1
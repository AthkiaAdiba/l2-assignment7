-- Active: 1742622175031@@127.0.0.1@5432@bookstore_db@public

-- Creating Books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price NUMERIC(6,2) check (price >= 0) NOT NULL,
    stock INT check (stock >= 0) NOT NULL,
    published_year INT
);




-- Insert values to the books table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Do not Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);



-- creating customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    joined_date DATE DEFAULT now()
);



-- Inserting values to the customers table
INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com ', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');



-- Creating orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    book_id INT REFERENCES books(id),
    quantity INTEGER check(quantity > 0),
    order_date TIMESTAMP DEFAULT now()
);



-- Inserting values to the orders table
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');


-- Problem-1: Find books that are out of stock
SELECT title FROM books
WHERE stock = 0;



-- Problem-2: Retrieve the most expensive book in the store
SELECT * FROM books 
ORDER BY price DESC 
LIMIT 1;


-- Problem-3: Find the total number of orders placed by each customer
SELECT name, count(*) as total_orders FROM customers
JOIN orders on customers.id = orders.customer_id
GROUP BY name;



-- Problem-4: Calculate the total revenue generated from book sales
SELECT sum(price * quantity) as total_revenue FROM books
JOIN orders on books.id = orders.book_id;



-- Problem-5: List all customers who have placed more than one order
SELECT customers.name, count(*) as orders_count FROM customers
JOIN orders on customers.id = orders.customer_id
GROUP BY customers.name
HAVING count(*) > 1;




-- Problem-6: Find the average price of books in the store
SELECT round(avg(price), 2) as avg_book_price FROM books;



-- Problem-7: Increase the price of all books published before 2000 by 10%
UPDATE books
SET price = ROUND(price * 1.10, 2)
WHERE published_year < 2000;



-- Problem-8: Delete customers who haven't placed any orders
DELETE FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
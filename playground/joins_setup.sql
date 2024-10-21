CREATE DATABASE my_playground

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO
    customers (name, email)
VALUES
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Smith', 'bob@example.com'),
    ('Charlie Brown', 'charlie@example.com'),
    -- Customer that won't have orders
    ('Dont Order', 'dont@example.com'),
    ('David Wilson', 'david@example.com');

INSERT INTO
    orders (customer_id, order_date, total_amount)
VALUES
    (1, '2024-10-01', 100.00),
    -- Alice's order
    (1, '2024-10-05', 150.50),
    -- Another order by Alice
    (2, '2024-10-02', 200.00),
    -- Bob's order
    (3, '2024-10-03', 300.00),
    -- Order without customer
    (NULL, '2024-10-03', 1000000.00),
    -- Charlie's order
    (4, '2024-10-04', 250.75);

-- David's order
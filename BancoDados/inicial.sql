CREATE DATABASE IF NOT EXISTS acme;

USE acme;

-- Create the users table
CREATE TABLE users (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('USER', 'ADMIN') DEFAULT 'USER' NOT NULL
);

-- Create the customers table
CREATE TABLE customers (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    image_url VARCHAR(255) NOT NULL
);


-- Create the invoices table
CREATE TABLE invoices (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    customer_id CHAR(36) NOT NULL,
    amount INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create the revenue table
CREATE TABLE revenue (
    month CHAR(4) PRIMARY KEY NOT NULL,
    revenue INT NOT NULL
);

-- Seed users
INSERT INTO users (id, name, email, password, role) VALUES
('410544b2-4001-4271-9855-fec4b6a6442a', 'User', 'user@nextmail.com', '$2b$10$uxTNk4ngbcVCjIxjY2S8EugIsmLEVSeSbqSxtI9QvE9VBC13t2J1G', 'ADMIN');

-- Seed customers
INSERT INTO customers (id, name, email, image_url) VALUES
('3958dc9e-712f-4377-85e9-fec4b6a6442a', 'Delba de Oliveira', 'delba@oliveira.com', '/customers/delba-de-oliveira.png'),
('3958dc9e-742f-4377-85e9-fec4b6a6442a', 'Lee Robinson', 'lee@robinson.com', '/customers/lee-robinson.png'),
('3958dc9e-737f-4377-85e9-fec4b6a6442a', 'Hector Simpson', 'hector@simpson.com', '/customers/hector-simpson.png'),
('50ca3e18-62cd-11ee-8c99-0242ac120002', 'Steven Tey', 'steven@tey.com', '/customers/steven-tey.png'),
('3958dc9e-787f-4377-85e9-fec4b6a6442a', 'Steph Dietz', 'steph@dietz.com', '/customers/steph-dietz.png'),
('76d65c26-f784-44a2-ac19-586678f7c2f2', 'Michael Novotny', 'michael@novotny.com', '/customers/michael-novotny.png'),
('d6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 'Evil Rabbit', 'evil@rabbit.com', '/customers/evil-rabbit.png'),
('126eed9c-c90c-4ef6-a4a8-fcf7408d3c66', 'Emil Kowalski', 'emil@kowalski.com', '/customers/emil-kowalski.png'),
('CC27C14A-0ACF-4F4A-A6C9-D45682C144B9', 'Amy Burns', 'amy@burns.com', '/customers/amy-burns.png'),
('13D07535-C59E-4157-A011-F8D2EF4E0CBB', 'Balazs Orban', 'balazs@orban.com', '/customers/balazs-orban.png');

-- Seed invoices
INSERT INTO invoices (customer_id, amount, status, date) VALUES
('3958dc9e-712f-4377-85e9-fec4b6a6442a', 15795, 'pending', '2022-12-06'),
('3958dc9e-742f-4377-85e9-fec4b6a6442a', 20348, 'pending', '2022-11-14'),
('3958dc9e-787f-4377-85e9-fec4b6a6442a', 3040, 'paid', '2022-10-29'),
('50ca3e18-62cd-11ee-8c99-0242ac120002', 44800, 'paid', '2023-09-10'),
('76d65c26-f784-44a2-ac19-586678f7c2f2', 34577, 'pending', '2023-08-05'),
('126eed9c-c90c-4ef6-a4a8-fcf7408d3c66', 54246, 'pending', '2023-07-16'),
('d6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 666, 'pending', '2023-06-27'),
('50ca3e18-62cd-11ee-8c99-0242ac120002', 32545, 'paid', '2023-06-09'),
('3958dc9e-787f-4377-85e9-fec4b6a6442a', 1250, 'paid', '2023-06-17'),
('76d65c26-f784-44a2-ac19-586678f7c2f2', 8546, 'paid', '2023-06-07'),
('3958dc9e-742f-4377-85e9-fec4b6a6442a', 500, 'paid', '2023-08-19'),
('76d65c26-f784-44a2-ac19-586678f7c2f2', 8945, 'paid', '2023-06-03'),
('3958dc9e-737f-4377-85e9-fec4b6a6442a', 8945, 'paid', '2023-06-18'),
('3958dc9e-712f-4377-85e9-fec4b6a6442a', 8945, 'paid', '2023-10-04'),
('3958dc9e-737f-4377-85e9-fec4b6a6442a', 1000, 'paid', '2022-06-05');

-- Seed revenue
INSERT INTO revenue (month, revenue) VALUES
('Jan', 2000),
('Feb', 1800),
('Mar', 2200),
('Apr', 2500),
('May', 2300),
('Jun', 3200),
('Jul', 3500),
('Aug', 3700),
('Sep', 2500),
('Oct', 2800),
('Nov', 3000),
('Dec', 4800);
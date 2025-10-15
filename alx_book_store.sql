-- Create database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT NOT NULL
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (author_name) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Stephen King');

-- Insert sample data into Customers table
INSERT INTO Customers (customer_name, email, address) VALUES
('John Smith', 'john.smith@email.com', '123 Main St, New York, NY'),
('Emma Johnson', 'emma.johnson@email.com', '456 Oak Ave, Los Angeles, CA'),
('Michael Brown', 'michael.brown@email.com', '789 Pine Rd, Chicago, IL'),
('Sarah Davis', 'sarah.davis@email.com', '321 Elm St, Houston, TX'),
('David Wilson', 'david.wilson@email.com', '654 Maple Dr, Phoenix, AZ');

-- Insert sample data into Books table
INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 12.99, '1997-06-26'),
('A Game of Thrones', 2, 15.99, '1996-08-06'),
('The Hobbit', 3, 11.99, '1937-09-21'),
('Murder on the Orient Express', 4, 9.99, '1934-01-01'),
('The Shining', 5, 13.99, '1977-01-28'),
('Harry Potter and the Chamber of Secrets', 1, 12.99, '1998-07-02'),
('A Clash of Kings', 2, 16.99, '1998-11-16');

-- Insert sample data into Orders table
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2024-01-15'),
(2, '2024-01-16'),
(3, '2024-01-17'),
(1, '2024-01-18'),
(4, '2024-01-19');

-- Insert sample data into Order_Details table
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 3),
(3, 5, 1),
(4, 6, 2),
(5, 7, 1),
(5, 1, 1);

-- Create indexes for better performance
CREATE INDEX idx_books_author_id ON Books(author_id);
CREATE INDEX idx_orders_customer_id ON Orders(customer_id);
CREATE INDEX idx_order_details_order_id ON Order_Details(order_id);
CREATE INDEX idx_order_details_book_id ON Order_Details(book_id);
-- Insert Admins
INSERT INTO Admin (email, password, name) VALUES
('alice@library.com', 'alice123', 'Alice Green'),
('bob@library.com', 'bob123', 'Bob Gray'),
('clara@library.com', 'clara123', 'Clara White');

-- Insert Books
INSERT INTO Book (book_id, title, author, edition, publisher, language, category, isbn, shelf_location, admin_id) VALUES
(1001, 'The Great Gatsby', 'F. Scott Fitzgerald', '1st', 'Scribner', 'English', 'Classic', '9780743273565', 'A1', 1),
(1002, 'To Kill a Mockingbird', 'Harper Lee', '2nd', 'Lippincott', 'English', 'Fiction', '9780061120084', 'A2', 1),
(1003, '1984', 'George Orwell', '1st', 'Secker & Warburg', 'English', 'Dystopian', '9780451524935', 'B1', 2),
(1004, 'The Alchemist', 'Paulo Coelho', '3rd', 'HarperOne', 'English', 'Adventure', '9780061122415', 'C1', 2),
(1005, 'Sapiens', 'Yuval Noah Harari', '1st', 'Penguin', 'English', 'History', '9780099590088', 'D1', 3),
(1006, 'Clean Code', 'Robert C. Martin', '1st', 'Prentice Hall', 'English', 'Programming', '9780132350884', 'E1', 3);

-- Insert Users
INSERT INTO User (email, password, first_name, last_name, phone, address_line1, address_line2, gender, date_of_birth) VALUES
('john.doe@example.com', 'john123', 'John', 'Doe', '9876543210', '123 Main St', 'Apt 4B', 'Male', '1995-06-15'),
('jane.smith@example.com', 'jane123', 'Jane', 'Smith', '9876501234', '456 Elm St', NULL, 'Female', '1998-09-22'),
('ravi.kumar@example.com', 'ravi123', 'Ravi', 'Kumar', '9998887777', '789 MG Road', '', 'Male', '1992-12-03'),
('anita.rai@example.com', 'anita123', 'Anita', 'Rai', '9123456789', '32 Sector 15', 'Near Mall', 'Female', '1997-03-14'),
('sam.wilson@example.com', 'sam123', 'Sam', 'Wilson', '9012345678', 'Plot 8', 'Block B', 'Other', '1994-11-30');

-- Insert Subscription Plans
INSERT INTO Subscription_Plan (plan_name, duration_in_days, fees, max_book_limit, available) VALUES
('Basic', 30, 100.00, 3, TRUE),
('Premium', 90, 250.00, 10, TRUE),
('Student', 60, 150.00, 5, TRUE);

-- Insert Subscription Payments
INSERT INTO Subscription_Payments (payment_id, amount_paid, real_bank_payment_id, payment_mode, payment_date, user_id) VALUES
(501, 100.00, 'TXN001', 'UPI', '2025-07-01', 1),
(502, 250.00, 'TXN002', 'Credit Card', '2025-07-02', 2),
(503, 150.00, 'TXN003', 'Net Banking', '2025-07-03', 3),
(504, 250.00, 'TXN004', 'UPI', '2025-07-04', 4),
(505, 100.00, 'TXN005', 'Cash', '2025-07-05', 5);

-- Insert into takes
INSERT INTO takes (payment_id, user_id, plan_id, start_date, end_date) VALUES
(501, 1, 1, '2025-07-01', '2025-07-31'),
(502, 2, 2, '2025-07-02', '2025-09-30'),
(503, 3, 3, '2025-07-03', '2025-09-01'),
(504, 4, 2, '2025-07-04', '2025-10-02'),
(505, 5, 1, '2025-07-05', '2025-08-04');

-- Insert Book Issues
INSERT INTO Book_Issue (user_id, book_id, status, issue_date, due_date, return_date, fine) VALUES
(1, 1001, 'Issued', '2025-07-06', '2025-07-20', NULL, 0.00),
(2, 1002, 'Returned', '2025-06-25', '2025-07-09', '2025-07-08', 0.00),
(3, 1003, 'Overdue', '2025-06-10', '2025-06-24', NULL, 30.00),
(4, 1004, 'Returned', '2025-07-01', '2025-07-15', '2025-07-14', 0.00),
(5, 1005, 'Lost', '2025-06-15', '2025-06-29', NULL, 500.00);

-- Insert Book Feedback
INSERT INTO Book_Feedback (feedback_id, rating, comment, user_id, book_id) VALUES
(10001, 5, 'Absolutely loved this book!', 1, 1001),
(10002, 4, 'Thought-provoking and deep.', 2, 1002),
(10003, 3, 'A bit slow, but good ideas.', 3, 1003),
(10004, 5, 'Inspirational journey.', 4, 1004),
(10005, 2, 'Hard to follow at times.', 5, 1005),
(10006, 5, 'Best programming book ever!', 1, 1006);

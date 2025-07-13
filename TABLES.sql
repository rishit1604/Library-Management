 -- Admin table
CREATE TABLE Admin (
    admin_id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- Book table
CREATE TABLE Book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    edition VARCHAR(50),
    publisher VARCHAR(100),
    language VARCHAR(50),
    category VARCHAR(50),
    isbn VARCHAR(20) UNIQUE,
    shelf_location VARCHAR(50),
    admin_id INT,
    FOREIGN KEY (admin_id)
        REFERENCES Admin(admin_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- User table
CREATE TABLE User (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone VARCHAR(20),
    address_line1 VARCHAR(150),
    address_line2 VARCHAR(150),
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    date_of_birth DATE
);

-- Book_Issue table
CREATE TABLE Book_Issue (
    issue_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    status VARCHAR(50) DEFAULT 'Issued' CHECK (status IN ('Issued', 'Returned', 'Overdue')),
    issue_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    fine NUMERIC(10, 2) DEFAULT 0.00,
    FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id)
        REFERENCES Book(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Subscription_Plan table
CREATE TABLE Subscription_Plan (
    plan_id SERIAL PRIMARY KEY,
    plan_name VARCHAR(100) UNIQUE NOT NULL,
    duration_in_days INT NOT NULL CHECK (duration_in_days > 0),
    fees DECIMAL(10,2) NOT NULL CHECK (fees >= 0),
    max_book_limit INT NOT NULL CHECK (max_book_limit > 0),
    available BOOLEAN DEFAULT TRUE
);

-- Subscription_Payments table
CREATE TABLE Subscription_Payments (
    payment_id SERIAL PRIMARY KEY,
    amount_paid DECIMAL(10,2) NOT NULL CHECK (amount_paid >= 0),
    real_bank_payment_id VARCHAR(100) UNIQUE NOT NULL,
    payment_mode VARCHAR(50) NOT NULL,
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- takes table (user subscription record)
CREATE TABLE takes (
    payment_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (payment_id)
        REFERENCES Subscription_Payments(payment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (plan_id)
        REFERENCES Subscription_Plan(plan_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Book_Feedback table
CREATE TABLE Book_Feedback (
    feedback_id SERIAL PRIMARY KEY,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    submitted_on DATE DEFAULT CURRENT_DATE,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id)
        REFERENCES Book(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

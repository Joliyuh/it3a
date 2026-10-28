-- Table #1: students table
CREATE TABLE IF NOT EXISTS students (
    -- Primary key for the students table
    student_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Student Name
    student_first_name VARCHAR(50) NOT NULL,
    student_last_name VARCHAR(50) NOT NULL,

    -- Student Course
    student_course VARCHAR(50) NOT NULL,

    -- Student created at timestamp
    student_created_at_ TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- Table #2: books
CREATE TABLE IF NOT EXISTS books (
    -- Primary key for the books table
    book_id INT AUTO_INCREMENT PRIMARY KEY,

    book_title VARCHAR(100) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_category VARCHAR(50) NOT NULL,

    -- Book created at timestamp
    book_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- Table #3: borrow
CREATE TABLE IF NOT EXISTS borrow (
    -- Primary key for the borrow table
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Foreign key references
    book_id INT NOT NULL,
    student_id INT NOT NULL,

    -- Borrow date timestamp
    borrow_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Borrow return date timestamp
    borrow_return_date TIMESTAMP NULL DEFAULT NULL,

    CONSTRAINT fk_borrow_students
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    CONSTRAINT fk_borrow_book
    FOREIGN KEY (book_id)
    REFERENCES books(book_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- Insert statement #1: Insert Students

INSERT INTO students
(student_first_name, student_last_name, student_course, student_created_at_)
VALUES
('Julia Felixa', 'Castaneda', 'BSIT', '2026-08-22 13:15:50'),
('Jomelson', 'Castaneda', 'BSIT', '2026-08-22 13:15:50'),
('Darfe Andres', 'Honor', 'BSIT', '2026-08-22 13:15:50'),
('Danie', 'Honor', 'BSIT', '2026-08-22 13:15:50');


-- Insert statement #2: Insert Books

INSERT INTO books
(book_title, book_author, book_category, book_created_at)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '2026-08-22 13:15:50'),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', '2026-08-22 13:15:50'),
('1984', 'George Orwell', 'Dystopian', '2026-08-22 13:15:50'),
('Pride and Prejudice', 'Jane Austen', 'Romance', '2026-08-22 13:15:50'),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '2026-08-22 13:15:50');


-- Insert statement #3: Insert Borrow Transactions

INSERT INTO borrow
(book_id, student_id, borrow_date, borrow_return_date)
VALUES
(1, 2, '2026-08-22 13:15:50', NULL),
(2, 1, '2026-08-22 13:15:50', NULL),
(3, 3, '2026-08-22 13:15:50', NULL);
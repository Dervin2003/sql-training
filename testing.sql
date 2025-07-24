CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    genre VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO authors (author_id, name, country) VALUES
(1, 'George Orwell', 'United Kingdom'),
(2, 'Haruki Murakami', 'Japan'),
(3, 'J.K. Rowling', 'United Kingdom'),
(4, 'Paulo Coelho', 'Brazil'),
(5, 'Stephen King', 'United States'),
(6, 'Chetan Bhagat', 'India'),
(7, 'Jane Austen', 'United Kingdom'),
(8, 'Mark Twain', 'United States'),
(9, 'Leo Tolstoy', 'Russia'),
(10, 'Khaled Hosseini', 'Afghanistan');

INSERT INTO books (book_id, title, genre, author_id) VALUES
(1, '1984', 'Dystopian', 1),
(2, 'Animal Farm', 'Satire', 1),
(3, 'Kafka on the Shore', 'Fantasy', 2),
(4, 'Norwegian Wood', 'Drama', 2),
(5, 'Harry Potter and the Sorcerers Stone', 'Fantasy', 3),
(6, 'Harry Potter and the Chamber of Secrets', 'Fantasy', 3),
(7, 'The Alchemist', 'Adventure', 4),
(8, 'Brida', 'Spiritual', 4),
(9, 'The Shining', 'Horror', 5),
(10, 'It', 'Horror', 5),
(11, 'Half Girlfriend', 'Romance', 6),
(12, '2 States', 'Romance', 6),
(13, 'Pride and Prejudice', 'Classic', 7),
(14, 'Emma', 'Classic', 7),
(15, 'Adventures of Huckleberry Finn', 'Adventure', 8),
(16, 'The Adventures of Tom Sawyer', 'Adventure', 8),
(17, 'War and Peace', 'Historical Fiction', 9),
(18, 'Anna Karenina', 'Romance', 9),
(19, 'The Kite Runner', 'Drama', 10),
(20, 'A Thousand Splendid Suns', 'Drama', 10);

SELECT * FROM authors;

SELECT * FROM books;

SELECT * FROM books JOIN authors ON books.author_id=authors.author_id;

WITH fantasy_books AS (
    SELECT * FROM books WHERE genre = 'Fantasy'
)
SELECT f.title, a.name AS author_name
FROM fantasy_books f
JOIN authors a ON f.author_id = a.author_id;

CREATE TABLE constraints_test (
	account_no INT UNIQUE,
	user_name VARCHAR(100) NOT NULL,
	balance DECIMAL(10,2),
	CHECK(balance>0),
	account_status VARCHAR(100) DEFAULT 'Active'
)

ALTER TABLE constraints_test ADD index_no SERIAL;

SELECT * FROM constraints_test;

INSERT INTO constraints_test (account_no,user_name,balance)VALUES (1,'Dervin',1); 

SELECT genre,COUNT(title) AS total_books FROM books GROUP BY genre;

SELECT genre,COUNT(title) AS total_books FROM books GROUP BY genre HAVING COUNT(title)>1;

SELECT genre,COUNT(title) AS total_books FROM books WHERE "genre"!='Romance' GROUP BY genre;

SELECT genre,COUNT(title) AS total_books FROM books GROUP BY genre ORDER BY total_books desc;

SELECT * FROM authors a JOIN books b ON a.author_id=b.author_id; 

SELECT name,genre,COUNT(title) AS books_on_genre FROM authors a JOIN books b ON a.author_id=b.author_id GROUP BY name , genre;

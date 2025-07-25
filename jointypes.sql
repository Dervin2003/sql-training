CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    birth_year INT
);

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    release_year INT,
    genre VARCHAR(50),
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

INSERT INTO directors (name, birth_year) VALUES
('Christopher Nolan', 1970),
('Quentin Tarantino', NULL),          
(NULL, 1983),                          
('James Cameron', 1954),
('Unknown Director', NULL);

UPDATE directors SET birth_year = 1970 WHERE name='Unknown Director';

INSERT INTO movies (title, release_year, genre, director_id) VALUES
('Inception', 2010, 'Sci-Fi', 1),
('Pulp Fiction', 1994, NULL, 2),          
('Barbie', 2023, 'Fantasy', NULL),         
(NULL, 1997, 'Action', 4),                 
('Titanic', NULL, 'Romance', 4),           
('Untitled Project', NULL, NULL, NULL);

SELECT * FROM directors;

SELECT * FROM movies;

SELECT m.title, d.name AS director FROM movies m INNER JOIN directors d ON m.director_id = d.director_id;

SELECT m.title, d.name AS director FROM movies m LEFT JOIN directors d ON m.director_id = d.director_id;

SELECT m.title, d.name AS director FROM movies m RIGHT JOIN directors d ON m.director_id = d.director_id;

SELECT m.title, d.name AS director FROM movies m FULL OUTER JOIN directors d ON m.director_id = d.director_id;

SELECT m.title, d.name AS director FROM movies m CROSS JOIN directors d;

SELECT d1.name AS director1, d2.name AS director2 FROM directors d1 JOIN directors d2 ON d1.birth_year = d2.birth_year WHERE d1.director_id <> d2.director_id;

SELECT m.title, d.name AS director FROM movies m FULL JOIN directors d ON m.director_id = d.director_id;

SELECT title, COALESCE(genre, 'Unknown') AS genre_display FROM movies;

SELECT * FROM movies NATURAL JOIN directors;

SELECT d.name AS director, COUNT(m.movie_id) AS movie_count FROM directors d LEFT JOIN movies m ON d.director_id = m.director_id GROUP BY d.name;

SELECT m.title,
       d.name AS director,
       CASE
           WHEN m.release_year IS NULL THEN 'Upcoming'
           WHEN m.release_year < 2000 THEN 'Classic'
           ELSE 'Recent'
       END AS category
FROM movies m
LEFT JOIN directors d ON m.director_id = d.director_id;

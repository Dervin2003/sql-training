CREATE TABLE employees(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	role VARCHAR(50),
	salary INTEGER
);

INSERT INTO employees (name,role,salary) VALUES
('Dervin','Developer',20000),
('Abishek','Senior Developer',50000);

INSERT INTO employees (name,role,salary) VALUES
('Aravind','Developer',20000);

INSERT INTO employees (name, role, salary) VALUES
('Aravind', 'Developer', 20000),
('Bhavya', 'Designer', 18000),
('Charan', 'Tester', 17000),
('Divya', 'Manager', 30000),
('Eshwar', 'Developer', 22000),
('Farhan', 'HR', 19000),
('Geetha', 'Support', 16000),
('Harsha', 'Developer', 25000),
('Indira', 'Tester', 17500),
('Jayanth', 'Team Lead', 32000);
  
INSERT INTO employees (name, role, salary) VALUES
('Harini', 'Developer', 24000),
('Hemanth', 'Designer', 20000),
('Hemalatha', 'HR', 19500),
('Hitesh', 'Support', 18500),
('Gaurav', 'Developer', 23000),
('Ganesh', 'Manager', 31000),
('Gita', 'Tester', 18000),
('Gokul', 'Team Lead', 29000),
('Gayathri', 'HR', 20000);


SELECT * FROM employees;

DELETE FROM employees WHERE id=2;

UPDATE employees SET id=2 WHERE name='Abishek';

SELECT name,role FROM employees WHERE salary=20000;

SELECT name,role FROM employees WHERE salary>20000;

SELECT * FROM employees WHERE name LIKE 'H%';

SELECT * FROM employees WHERE name ILIKE 'g%';

ALTER TABLE employees ADD joining DATE;

UPDATE employees SET salary=100000 WHERE role='HR';

SELECT * FROM employees WHERE role='HR';

UPDATE employees SET joining='2025-07-02' WHERE name='Dervin';

SELECT DISTINCT role FROM employees;

SELECT role,COUNT(*) AS total from employees GROUP BY role;

SELECT 5<>10

SELECT 'true'=true

SELECT * FROM employees;

SELECT role,MIN(salary) AS max_salary FROM employees GROUP BY role;

SELECT name,role,MAX(salary) AS max_salary FROM employees GROUP BY role,name HAVING MAX(salary)>=50000;

SELECT ROUND(AVG(salary),2) AS average_salary FROM employees;

SELECT AGE(NOW(),'2003-04-05') AS your_age;

SELECT name,DATE_PART('year',joining)AS joining_year FROM employees;

SELECT * FROM employees WHERE salary BETWEEN 20000 AND 50000;
--1
USE employees;
--2 
SELECT first_name, last_name, emp_no FROM employees WHERE first_name IN ('Irena','Vidya','Maya');
    -- 709 rows returned
--3
SELECT first_name, last_name, emp_no FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
    -- 709 rows returned, it matches the rows returned in Q2
--4
SELECT first_name, last_name, emp_no FROM employees WHERE first_name IN ('Irena','Vidya','Maya') AND gender = 'M';
    -- 441 rows returned
--5
SELECT first_name, last_name, emp_no FROM employees WHERE last_name LIKE 'E%';
    -- 7330 rows returned
--6
SELECT first_name, last_name, emp_no FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
SELECT first_name, last_name, emp_no FROM employees WHERE last_name LIKE '%E';
    -- 30723 people have names that start or end with e, 24,292 end with e
--7
SELECT first_name, last_name, emp_no FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
SELECT first_name, last_name, emp_no FROM employees WHERE last_name LIKE '%E';
    -- 899 people with last names that start and end with e. 24,292 people whos names end with e.
--8
SELECT first_name, last_name, emp_no, hire_date FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
    -- 135,214 people hired in the 90s
--9
SELECT first_name, last_name, emp_no, birth_date FROM employees WHERE birth_date LIKE '%12-25';
    -- 842 employees born on christmas
--10
SELECT first_name, last_name, emp_no, birth_date, hire_date FROM employees WHERE birth_date LIKE '%12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';
    -- 362 employees born on christmas and hired in the 90s
--11
SELECT first_name, last_name, emp_no FROM employees WHERE last_name LIKE '%q%';
    --1873 people with q in their last name
--12
SELECT first_name, last_name, emp_no FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
    -- 547 people found
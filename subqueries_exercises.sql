--1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT * 
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE hire_date in (SELECT hire_date FROM employees WHERE emp_no = 101010)
AND dept_emp.to_date > CURDATE();
--2 Find all titles held by current employees with first name Aamod
SELECT *
FROM titles
JOIN employees ON titles.emp_no = employees.emp_no
WHERE first_name IN (SELECT first_name FROM employees WHERE first_name = 'Aamod') AND titles.to_date > CURDATE();
--3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (SELECT emp_no FROM dept_emp WHERE to_date LIKE '9999%');
  --59900t
--4 Find all current department managers that are female. List their name. 
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date > CURDATE()) AND gender = 'F'
-- Isamu	Legleitner
-- Karsten	Sigstam
-- Leon	DasSarma
-- Hilary	Kambil
--5
SELECT first_name, last_name, salary
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no
WHERE salary > (SELECT AVG(salary) from salaries) AND to_date > CURDATE();
    -- 154543 employees are paid over the average 
--6 how many current salaries are within 1 STDEV of current highest salary. what % of all salaries is this?
SELECT COUNT(salary)
FROM salaries
WHERE salary BETWEEN ((SELECT MAX(salary) FROM salaries) - (SELECT stddev(salary) FROM salaries)) AND (SELECT MAX(salary) FROM salaries)
AND to_date > CURDATE();
  --78 are within 1 stddev
SELECT ((SELECT COUNT(salary)
FROM salaries
WHERE salary BETWEEN ((SELECT MAX(salary) FROM salaries) - (SELECT stddev(salary) FROM salaries)) AND (SELECT MAX(salary) FROM salaries)
AND to_date > CURDATE()) / (SELECT COUNT(salary) FROM salaries WHERE to_date > CURDATE()) * 100) as percent
 --.03% are within 1 stddev
--7
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date > CURDATE()) AND gender = 'F'
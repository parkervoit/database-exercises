-- JOIN example database
--1
USE join_example_db;
SELECT * FROM users
LEFT JOIN roles ON users.role_id = roles.id
UNION
SELECT * FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
--2
SELECT users.name as 'user_name', roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;
    -- prediction : there will be 4 results
    -- result : 4 rows returned
SELECT users.name as 'user_name', roles.name as role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
    -- prediction : there will be 6 results
    --result : 6 rows returned
SELECT users.name as 'user_name', roles.name as role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
    -- prediction : there will be 5 results
    -- result : 5 returned
--3
SELECT users.name as 'user_name', roles.name as role_name, 
(SELECT COUNT(*) FROM roles WHERE roles.id = users.role_id) as counts
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY user_name, role_name, counts;

--Employees Database
--1
USE employees;
--2. write a query that shows each dept. along with name of current manager
SELECT dept.dept_name AS "Department Name", (CONCAT(first_name, ' ', last_name)) AS "Name" 
FROM departments AS dept
JOIN dept_manager ON dept.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > CURDATE()
ORDER BY dept_name ASC;
--3. find the name of all depts. currently managed by women
SELECT dept.dept_name AS "Department Name", (CONCAT(first_name, ' ', last_name)) AS "Name" 
FROM departments AS dept
JOIN dept_manager ON dept.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > CURDly ATE() AND employees.gender = 'F'
ORDER BY dept_name ASC;
--4 Find the current titles of employees currently working in customer service
SELECT titles.title, COUNT(employees.emp_no)
FROM departments AS dept
JOIN dept_emp ON dept.dept_no = dept_emp.dept_no AND dept_emp.dept_no = 'd009'
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN titles ON employees.emp_no = titles.emp_no AND titles.to_date > CURDATE()
GROUP BY titles.title;
--5. Find the current salary of all current managers
SELECT dept.dept_name AS "Department Name", (CONCAT(first_name, ' ', last_name)) AS "Name" , s.salary AS 'Salary'
FROM salaries AS s
JOIN dept_manager AS managers ON s.emp_no = managers.emp_no AND s.to_date > CURDATE()
JOIN employees AS emp ON emp.emp_no = managers.emp_no AND managers.to_date > CURDATE()
JOIN departments AS dept ON managers.dept_no = dept.dept_no
ORDER BY dept_name;
--6 Find the number of current employees in each department
SELECT dept.dept_no, dept_name, COUNT(*) AS num_employees
FROM departments AS dept
JOIN dept_emp ON dept.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE()
GROUP BY dept.dept_no
ORDER BY dept.dept_no;
--7 Which department has the highest Salary?
SELECT departments.dept_name, AVG(salaries.salary) AS average_salary
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE()
JOIN salaries ON dept_emp.emp_no = salaries.emp_no AND salaries.to_date > CURDATE() 
GROUP BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1;
--8 Who is the highest paid employee in the Marketing dept?
SELECT emp.first_name AS first_name, emp.last_name AS last_name
FROM employees AS emp
JOIN dept_emp AS de ON emp.emp_no = de.emp_no AND de.dept_no = 'd001'
JOIN departments AS dept ON de.dept_no = dept.dept_no
JOIN salaries AS s ON emp.emp_no = s.emp_no AND s.to_date > CURDATE()
ORDER BY s.salaries DESC
LIMIT 1;
--9. Which current department manager has the highest salary?
SELECT emp.first_name AS first_name, emp.last_name AS last_name, s.salary AS salary, dept.dept_name AS dept_name
FROM employees AS emp
JOIN dept_manager AS dm ON emp.emp_no = dm.emp_no AND dm.to_date > CURDATE()
JOIN salaries AS s ON emp.emp_no = s.emp_no
JOIN departments AS dept ON dm.dept_no = dept.dept_no
GROUP BY first_name, last_name, salary, dept_name
ORDER BY salary DESC
LIMIT 1;
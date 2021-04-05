use employees;
select * from employees;
-- 1. Write a query that returns all employees, dept_no, from_date, to_date,
-- and a new column named is_current employee that is a 1 if theyre still with the company, 0 if theyre not
SELECT dept_emp.emp_no, 
       dept_no, from_date, 
       to_date, 
       IF (to_date = '9999-01-01', TRUE, FALSE) AS is_current_employee
FROM dept_emp
  JOIN (
    SELECT emp_no, MAX(to_date) AS cur_date FROM dept_emp GROUP BY dept_emp.emp_no
  ) AS cur_job ON dept_emp.emp_no = cur_job.emp_no AND to_date = cur_date;
--2. Write a query that returns all employee names (previous and current), and a new column 'alpha gorup
-- that returns 'A-H', 'I-Q`, or `R-Z`
SELECT CONCAT(first_name, ' ' , last_name) AS full_name, 
    CASE
	WHEN SUBSTR(last_name, 1, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H') THEN 'A-H'
	WHEN SUBSTR(last_name, 1, 1) IN ('I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q') THEN 'I-Q'
	WHEN SUBSTR(last_name, 1, 1) IN ('R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z') THEN 'R-Z'
	ELSE 'not a latin alphabet character'
	END AS alpha_group
FROM employees
ORDER BY alpha_group, full_name;
--3. How many employees (current or previous) were born in each decade?
-- Lists employees names by decade
SELECT emp_no, CONCAT(first_name, ' ', last_name) AS full_name,
    CASE
    WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s'
    WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s'
    ELSE 'not born in 50s or 60s'
    END AS decade
FROM employees
ORDER BY decade DESC;
-- lists amount of employees by decade
SELECT COUNT(*),
    CASE
    WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s'
    WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s'
    ELSE 'not born in 50s or 60s'
    END AS decade
FROM employees
GROUP BY decade;
--4.
-- finds averages by department
SELECT departments.dept_name, AVG(salary) AS avg_salary
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > CURDATE()
GROUP BY dept_no;
-- Second (correct) attempt using case statements 
SELECT
	CASE
	WHEN dept_name = 'Customer Service' THEN 'Customer Service'
	WHEN dept_name = 'Finance' OR dept_name ='Human Resources' THEN 'Finance & HR'
	WHEN dept_name = 'Production' OR dept_name = 'Quality Management' THEN 'Prod & QM'
	WHEN dept_name = 'Research' OR dept_name = 'Development' THEN 'R&D'
	WHEN dept_name = 'Sales' OR dept_name = 'Marketing' THEN 'Sales & Marketing'
	ELSE 'dept doesnt exist'
	END AS dept_groups,
	AVG(salary) AS avg_sal
FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
GROUP BY dept_groups;

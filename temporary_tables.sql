--1Using the example from the lesson, re-create the employees_with_departments table.
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT employees.employees.emp_no AS emp_no, employees.employees.first_name AS first_name, employees.employees.last_name AS last_name, employees.departments.dept_no AS dept_no, employees.departments.dept_name AS dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);
    --a.Add a column named full_name to this table.
    ALTER TABLE employees_with_departments ADD full_name VARCHAR(200)
    --b.Update the table so that full name column contains the correct data
    UPDATE employees_with_departments SET full_name = CONCAT(first_name,' ',last_name);
    --c.Remove the first_name and last_name columns from the table.
    ALTER TABLE employees_with_departments DROP first_name;
    ALTER TABLE employees_with_departments DROP last_name;
    --d.What is another way you could have ended up with this same table?
    SELECT emp_no, CONCAT(first_name,' ',last_name) AS full_name, dept_no, dept_name 
    FROM employees_with_departments;
--2. Create a temporary table based on the payment table from the sakila database. 
CREATE TEMPORARY TABLE payment AS
SELECT sakila.payment.payment_id AS payment_ID, sakila.payment.customer_id AS customer_ID,
sakila.payment.staff_id AS staff_ID, sakila.payment.rental_id as rental_ID, sakila.payment.amount AS amount,
sakila.payment.payment_date AS payment_date, sakila.payment.last_update AS last_update 
FROM sakila.payment;
 --Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment.
ALTER TABLE payment ADD cents int(10);
UPDATE payment SET cents = amount * 100;
ALTER TABLE payment DROP amount;
--3.Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. 
CREATE TEMPORARY TABLE hist_sal AS
SELECT avg(salary) as avg_s, STDDEV(salary) as stddev
FROM employees.salaries;
SELECT * FROM hist_sal; 

CREATE TEMPORARY TABLE cur_sal AS
SELECT dept_name, avg(salary) as current_sal
FROM employees.salaries
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE employees.dept_emp.to_date > CURDATE() AND employees.salaries.to_date > CURDATE()
GROUP BY dept_name;

ALTER TABLE cur_sal ADD histavg float;
ALTER TABLE cur_sal ADD stddev float;
ALTER TABLE cur_sal ADD zscore float;

UPDATE cur_sal SET histavg = (SELECT avg_s FROM hist_sal);
UPDATE cur_sal SET stddev = (SELECT stddev FROM hist_sal);
UPDATE cur_sal SET zscore = (current_sal - histavg) / stddev; 

SELECT * from cur_sal
ORDER BY zscore DESC;
-- In terms of salary, what is the best department right now to work for? The worst?
    --The best is Sales and the worst is HR
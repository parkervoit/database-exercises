--2. Finds all employees who's last names start and end with e, puts thier first and last name in a column named full_name
SELECT CONCAT(first_name ," ", last_name) AS full_name
FROM employees 
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

--3. Takes results from 2 and returns them in all caps
SELECT UPPER (CONCAT(first_name ," ", last_name)) AS full_name
FROM employees 
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

--4. Find all employees hired in 90s and born on christmas, then find how many days they,ve been at the company.
SELECT DATEDIFF(NOW(), hire_date) AS DaysWorked, first_name, last_name
FROM employees 
WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';

--5. find the smallest and largest current salary from the salaries table
SELECT MAX(salary), MIN(salary) 
FROM salaries
WHERE salary LIKE '%9999';
--6. Create a unique username using first letter of first name, first 4 of last name, underscore, month and last 2 digits of birth date
SELECT LOWER(
            CONCAT(
                SUBSTR(first_name,1,1),
                SUBSTR(last_name,1,4),
                "_",
                SUBSTR(birth_date,6,2),
                SUBSTR(birth_date,3,2)
                )
            )
        first_name,
        last_name,
        birth_date,
FROM employees;
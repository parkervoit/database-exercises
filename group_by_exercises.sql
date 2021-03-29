--2. Use distinct to find titles. How many unique titles are there?
SELECT DISTINCT title FROM titles;
    -- 7 unique titles
--3 Find all employees with last names beginning and ending with e using groupby
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY last_name;
--4 Find all unique combinations of first and last names beginning and ending with e
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY first_name, last_name;
--5. Find unique last names that have q but not qu
SELECT last_name 
FROM employees 
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
    --names are Linqvist, Chleq, and Qiwen
--6. Add a count query to code in 5 
SELECT last_name, COUNT(*)
FROM employees 
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(*)DESC;
--7. find all employees with the first names Irena, Vidya, or Maya. Use group and count to find the number and gender of employees with that name.
SELECT first_name, gender, COUNT(*)
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
GROUP BY first_name, gender
ORDER BY COUNT(*);
--8.generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT LOWER(
            CONCAT(
                SUBSTR(first_name,1,1),
                SUBSTR(last_name,1,4),
                "_",
                SUBSTR(birth_date,6,2),
                SUBSTR(birth_date,3,2)
                )
            ) AS user,
        COUNT(*)
FROM employees
GROUP BY user
HAVING COUNT(*) > 1
ORDER BY COUNT(*);
    -- there are 13251 duplicate usernames
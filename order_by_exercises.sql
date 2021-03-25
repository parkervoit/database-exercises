USE employees; 
-- 2 
SELECT first_name, last_name, emp_no 
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name;
    -- 1st name is Irena Reutenauer, last is Vidya Simmen 
-- 3 
SELECT first_name, last_name, emp_no 
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name, last_name;
    -- 1st name is Irena Acton, last is Vidya Zweizig
--4
SELECT first_name, last_name, emp_no 
FROM employees 
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name, first_name;
    -- 1st name is Irena Acton, last name is Maya Zyda
--5
SELECT first_name, last_name, emp_no 
FROM employees 
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no;
    -- 899 employees returned, 1st is Ramzi Erde, Last is Tadahiro Erde
--6
SELECT first_name, last_name, emp_no 
FROM employees 
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY hire_date DESC;
    -- 899 employees returned, newest is Teiji ELdridge,  oldest is Serge Erde
--7
SELECT first_name, last_name, emp_no, birth_date, hire_date 
FROM employees 
WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date ASC, hire_date ASC;
    -- 362 employees returned, oldest hired last is Khun Bernini, youngest hired first is Douadi Pettis
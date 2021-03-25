--2
SELECT DISTINCT last_name 
FROM employees
ORDER BY last_name DESC
LIMIT 10;
/*  Zykh
    Zyda
    Zwicker
    Zweizig
    Zumaque
    Zultner
    Zucker
    Zuberek
    Zschoche
    Zongker*/
--3
SELECT first_name, last_name, emp_no, hire_date 
FROM employees 
WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date
LIMIT 5;
/* the 5 employees are:
    Alselm	Cappello
    Utz	Mandell
    Bouchung	Schreiter
    Baocai	Kushner
    Petter	Stroustrup*/
--4
SELECT first_name, last_name, emp_no, hire_date 
FROM employees 
WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
/* the tenth page of employees is:
    Pranay	Narwekar
    Marjo   Farrow
    Ennio	Karcich
    Dines	Lubachevsky
    Ipke	Fontan 
   Limit sets how many results per page and ultimately the page "length", offset is how you set which page to start at */

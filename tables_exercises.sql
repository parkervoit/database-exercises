--3
USE employees;
--4
SHOW TABLES;
--5-8
DESCRIBE employees;
--9
DESCRIBE dept_emp;
--10
SHOW CREATE TABLE dept_manager;

/*6. emp_no
7. first_name, last_name, gender
8.birth_date, hire_date
9. the emp_no, because it is contained in both of them
10.
CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1*/

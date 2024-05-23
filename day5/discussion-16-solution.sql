--[1]  Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name".

SELECT first_name "First Name",last_name "Last Name" FROM employees ;

--[2]  Write a query to get unique department ID from employee table.

SELECT DISTINCT department_id FROM  employees;

--[3]  Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).

SELECT first_name,last_name,salary,salary*0.15 PF FROM employees 

--[4] Write a query to get the maximum and minimum salary from employees table.

SELECT MAX(salary),MIN(salary) FROM employees;

--[5] Write a query to get the average salary and number of employees in the employees

SELECT AVG(salary),COUNT(*) FROM employees;

--[6] Write a query get all first name from employees table in upper case.

SELECT UPPER(first_name) FROM employees;

--[7] Write a query to get the first 3 characters of first name from employees

SELECT SUBSTR(first_name,1,3) FROM employees;

--[8] Write a query to select first 10 records from a table.

SELECT * FROM employees LIMIT 10;

--[9] Write a query to get monthly salary (round 2 decimal places) of each and every employee.

SELECT ROUND(salary/12,2) FROM employees;

--[10] Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.

SELECT first_name, last_name, department_id FROM employees WHERE department_id IN (30, 100) ORDER BY department_id ASC;
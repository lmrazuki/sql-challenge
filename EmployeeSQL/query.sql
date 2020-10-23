-- Show a list of employee data with their Salary
SELECT
	employees.first_name, 
	employees.last_name, 
	employees.hire_date,
	employees.sex,
	salaries.salary
FROM Employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- Show all employees hired in 1986
SELECT
	employees.first_name, 
	employees.last_name, 
	employees.hire_date
FROM Employees
WHERE hire_date LIKE '%1986%';


-- Create junction table
CREATE TABLE dept_junction AS
	SELECT * FROM Dept_Emp
	JOIN Departments USING(dept_no)

-- Find Managers and display their information
SELECT
	dept_junction.dept_no,
	dept_junction.dept_name,
	employees.first_name, 
	employees.last_name, 
	employees.emp_no
FROM Employees
INNER JOIN dept_junction ON
Employees.emp_no = dept_junction.emp_no
WHERE employees.emp_no IN
	(SELECT emp_no FROM Dept_Manager)
;

-- List the department of each employee
SELECT
	employees.emp_no,
	dept_junction.dept_name,
	employees.first_name, 
	employees.last_name
FROM Employees
INNER JOIN dept_junction ON
Employees.emp_no = dept_junction.emp_no
;

-- Find employees named Hercules with last name starting with B
SELECT
	employees.first_name, 
	employees.last_name, 
	employees.sex
FROM Employees
WHERE 
first_name LIKE 'Hercules' 
AND last_name LIKE '%B%';

-- List all employees in Sales dept.
SELECT
	employees.emp_no,
	dept_junction.dept_name,
	employees.first_name, 
	employees.last_name
FROM Employees
INNER JOIN dept_junction ON
Employees.emp_no = dept_junction.emp_no
WHERE dept_junction.dept_name = 'Sales'
;

-- List all employees in Sales or Development dept.
SELECT
	employees.emp_no,
	dept_junction.dept_name,
	employees.first_name, 
	employees.last_name
FROM Employees
INNER JOIN dept_junction ON
Employees.emp_no = dept_junction.emp_no
WHERE 
	dept_junction.dept_name = 'Sales'
	OR dept_junction.dept_name = 'Development'
;

-- Examine the frequency of surnames
SELECT last_name, COUNT(first_name) AS "Surname_Count"
FROM Employees
GROUP BY last_name
ORDER BY "Surname_Count" DESC;
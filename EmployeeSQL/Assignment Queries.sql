-- DATA ANALYSIS
-- List the employee number, last name, first name, sex, and salary of each employee.

CREATE VIEW "Employee Salaries"
AS
SELECT employees.emp_no AS "Employee #"
	,employees.first_name AS "First Name"
    ,employees.last_name AS "Last Name"
	,employees.sex AS "Sex"
	,salaries.salary AS "Salary"
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

CREATE VIEW "1986 Hires"
AS
SELECT first_name AS "First Name"
	,last_name AS "Last Name"
	,hire_date AS "Hired"
FROM employees
WHERE hire_date BETWEEN '1986-01-01'
		AND '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

CREATE VIEW "Department Managers"
AS
SELECT departments.dept_no AS "Department #"
    ,departments.dept_name AS "Department"
	,dept_manager.emp_no AS "Employee #"
	,employees.first_name AS "First Name"
	,employees.last_name AS "Last Name"
FROM dept_manager
INNER JOIN departments ON (dept_manager.dept_no = departments.dept_no)
INNER JOIN employees ON (dept_manager.emp_no = employees.emp_no)
ORDER BY "Department #"
	,"Last Name";

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW "Employee Departments"
AS
SELECT departments.dept_no AS "Department #"
	,departments.dept_name AS "Department"
	,dept_emp.emp_no AS "Employee #"
	,employees.first_name AS "First Name"
	,employees.last_name AS "Last Name"
FROM departments
INNER JOIN dept_emp ON (departments.dept_no = dept_emp.dept_no)
INNER JOIN employees ON (dept_emp.emp_no = employees.emp_no)
ORDER BY "Department"
	,"Last Name";

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

CREATE VIEW "Employees named Hercules B_"
AS
SELECT employees.first_name AS "First Name"
	,employees.last_name AS "Last Name"
	,employees.sex as "Sex"
FROM employees
WHERE employees.first_name = 'Hercules'
	AND employees.last_name LIKE 'B%'
ORDER BY "Last Name";

-- List each employee in the Sales department, including their employee number, last name, and first name.

CREATE VIEW "Sales Employees"
AS
SELECT departments.dept_name AS "Department"
	,employees.emp_no AS "Employee #"
	,employees.first_name AS "First Name"
	,employees.last_name AS "Last Name"
FROM departments
INNER JOIN dept_emp ON (departments.dept_no = dept_emp.dept_no)
INNER JOIN employees ON (dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales'
ORDER BY "Department"
	,"Last Name";

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

CREATE VIEW "Employees in Sales or Development"
AS
SELECT departments.dept_name AS "Department"
	,employees.emp_no AS "Employee #"
	,employees.first_name AS "First Name"
	,employees.last_name AS "Last Name"
FROM departments
INNER JOIN dept_emp ON (departments.dept_no = dept_emp.dept_no)
INNER JOIN employees ON (dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development'
ORDER BY "Department"
	,"Last Name";

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

CREATE VIEW "Common Last Names"
AS
SELECT employees.last_name AS "Last Name"
	,COUNT(last_name) AS "Count"
FROM employees
GROUP BY employees.last_name
ORDER BY "Count" DESC;
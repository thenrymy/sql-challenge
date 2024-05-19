-- List_1 the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW List_1 AS
SELECT 	e.emp_no,
		e.last_name,
		e.first_name,
		e.sex,
		s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no;
SELECT * FROM List_1;

-- List_2 the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW List_2 AS
SELECT 	first_name,
		last_name,
		hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
SELECT * FROM List_2;

-- List_3 the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW List_3 AS
SELECT 	dm.dept_no,
		d.dept_name,
		dm.emp_no,
		e.last_name,
		e.first_name
FROM dept_manager AS dm
LEFT JOIN departments AS d
ON dm.dept_no = d.dept_no
LEFT JOIN employees AS e
ON dm.emp_no = e.emp_no;
SELECT * FROM List_3;

-- List_4 the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW List_4 AS
SELECT 	e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no;
SELECT * FROM List_4;

-- List_5 the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW List_5 AS
SELECT 	first_name,
		last_name,
		sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
SELECT * FROM List_5;

-- List_6 each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW List_6 AS
SELECT 	e.emp_no,
		e.last_name,
		e.first_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
SELECT * FROM List_6;

-- List_7 each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW List_7 AS
SELECT 	e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';
SELECT * FROM List_7;

-- List_8 the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW List_8 AS
SELECT last_name, COUNT(last_name) AS number_of_same_last_name
FROM employees
GROUP BY last_name
ORDER BY number_of_same_last_name DESC;
SELECT * FROM List_8;
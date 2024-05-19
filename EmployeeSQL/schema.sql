-- Drop table if exist
DROP TABLE departments CASCADE;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees CASCADE;
DROP TABLE salaries;
DROP TABLE titles;

-- Tables order titles, employees, salaries, departments, dept_emp, dept_manager

-- Create Table titles and display
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR (30) NOT NULL);
SELECT * FROM titles;

-- Create Table employees and display
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));
SELECT * FROM employees;

-- Create Table salaries and display
CREATE TABLE salaries (
	salary_id SERIAL PRIMARY KEY,
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
SELECT * FROM salaries;

-- Create Table departments and display
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL);
SELECT * FROM departments;

-- Create Junction Table dept_emp and display
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no));
SELECT * FROM dept_emp;

-- Create Table dept_manager and display
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no));
SELECT * FROM dept_manager;
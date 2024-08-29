-- Create database tables

CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(255)
);


CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(255)
);


CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(10),
	birth_date VARCHAR(255),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(10),
	hire_date VARCHAR(255),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(10), 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_manager(
	dept_no VARCHAR(255),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
----------------------------------------------------------------

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dptmgr.dept_no, departments.dept_name, dptmgr.emp_no, employees.last_name, employees.first_name
FROM dept_manager as dptmgr
JOIN employees 
ON dptmgr.emp_no = employees.emp_no
JOIN departments 
ON dptmgr.dept_no = departments.dept_no;

--4.List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT dept_emp.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp 
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT last_name, first_name, sex 
FROM employees
WHERE first_name LIKE 'Hercules'AND last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp 
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name LIKE 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp 
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'


--8.List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Last Name Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency Count" DESC;
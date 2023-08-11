-- Data Analysis
--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no "Employee Number", e.last_name "Last Name", e.first_name "First Name", e.sex "Sex", s.salary "Salary"
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
ORDER BY e.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name "First Name", last_name "Last Name", hire_date "Hire Date"
FROM employees 
WHERE hire_date between '1986-01-01' and '1986-12-31'
ORDER BY hire_date;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no "Department Number", d.dept_name "Department Name", dm.emp_no "Employee Number", e.last_name "Last Name", e.first_name "First Name"
FROM employees e, dept_manager dm, departments d
WHERE d.dept_no = dm.dept_no
AND e.emp_no = dm.emp_no
ORDER BY d.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no "Department Number", e.emp_no "Employee Number", e.last_name "Last Name", e.first_name "First Name", d.dept_name "Department Name"
FROM employees e, departments d, dept_emp de
WHERE e.emp_no = de.emp_no
AND d.dept_no = de.dept_no
ORDER BY d.dept_no, e.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name "First Name", last_name "Last Name", sex "Sex"
FROM employees 
WHERE first_name = 'Hercules'
AND last_name like 'B%'
ORDER BY last_name;

--6. List each employee in the Sales department, including their employee number, last name, and first name.
--Sales Dept Number = d007
SELECT e.emp_no "Emplypee Number", e.first_name "First Name", e.last_name "Last Name", d.dept_name "Department Name"
FROM employees e, dept_emp de, departments d
WHERE e.emp_no = de.emp_no
AND d.dept_no = de.dept_no
AND d.dept_name = 'Sales'
ORDER BY e.emp_no;

--7. List each employee in the Sales and Development departments, including their employee number, last name , first name, and department name.
SELECT e.emp_no "Emplypee Number", e.first_name "First Name", e.last_name "Last Name", d.dept_name "Department Name"
FROM employees e, dept_emp de, departments d
WHERE e.emp_no = de.emp_no
AND d.dept_no = de.dept_no
AND d.dept_name in ('Sales','Development')
ORDER BY e.emp_no;

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name "Last Name", count(last_name) as "Count By Last Name" 
FROM employees
GROUP BY last_name
ORDER BY "Count By Last Name"  DESC

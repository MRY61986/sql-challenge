-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    e.sex, 
    s.salary
FROM Employees e
JOIN Salaries s 
	ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name, 
    last_name, 
    hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

 --or I could use this one.

SELECT 
    first_name, 
    last_name, 
    hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    d.dept_no, 
    d.dept_name, 
    dm.emp_no AS manager_emp_no, 
    e.last_name AS manager_last_name, 
    e.first_name AS manager_first_name
FROM Departments d
JOIN Dept_Manager dm 
	ON d.dept_no = dm.dept_no
JOIN Employees e 
	ON dm.emp_no = e.emp_no;

--Here's an alternate to that join

SELECT 
    d.dept_no, 
    d.dept_name, 
    dm.emp_no AS manager_emp_no, 
    e.last_name AS manager_last_name, 
    e.first_name AS manager_first_name
FROM Departments d
JOIN Dept_Manager dm 
	USING d.dept_no 
JOIN Employees e 
	USING dm.emp_no ;


-- 4. List the department number for each employee along with that employee's employee number, last name, first name, and department name.
SELECT 
    de.dept_no, 
    d.dept_name, 
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM Dept_Emp de
JOIN Employees e 
	ON de.emp_no = e.emp_no
JOIN Departments d 
	ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    first_name, 
    last_name, 
    sex
FROM Employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM Dept_Emp de
JOIN Employees e 
	ON de.emp_no = e.emp_no
JOIN Departments d 
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name
FROM Dept_Emp de
JOIN Employees e 
	ON de.emp_no = e.emp_no
JOIN Departments d 
	ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;

-- Drop tables in reverse order of dependencies
DROP TABLE IF EXISTS Dept_Emp CASCADE;
DROP TABLE IF EXISTS Dept_Manager CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;

-- Recreate the schema
SELECT * 
FROM Titles;

-- Titles Table
CREATE TABLE Titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR NOT NULL
);

-- Employees Table
CREATE TABLE Employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

-- Departments Table
CREATE TABLE Departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

-- Salaries Table
CREATE TABLE Salaries (
    emp_no INTEGER PRIMARY KEY,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Dept_Emp Table
CREATE TABLE Dept_Emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Dept_Manager Table
CREATE TABLE Dept_Manager (
    dept_no VARCHAR NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

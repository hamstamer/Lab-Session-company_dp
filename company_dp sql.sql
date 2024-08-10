CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INTEGER REFERENCES departments(department_id)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100)
);

CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(employee_id),
    project_id INTEGER REFERENCES projects(project_id),
    hours_worked INTEGER
);


INSERT INTO departments (department_name) VALUES
('Human Resources'),
('Engineering'),
('Marketing');


INSERT INTO employees (first_name, last_name, department_id) VALUES
('John', 'Doe', 2),
('Jane', 'Smith', 1),
('Alice', 'Johnson', 3),
('Bob', 'Williams', 2);


INSERT INTO projects (project_name) VALUES
('Project Alpha'),
('Project Beta'),
('Project Gamma');




INSERT INTO assignments (employee_id, project_id, hours_worked) VALUES
(1, 1, 40),
(2, 2, 35),
(3, 3, 20),
(4, 1, 25),
(1, 3, 15);

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e1.employee_id, e1.first_name, e1.last_name
FROM Employees e1
JOIN Employees e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id <> e2.employee_id;

SELECT e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
FROM Employees e
FULL OUTER JOIN Departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.first_name, e.last_name, p.project_id, p.project_name
FROM Employees e
CROSS JOIN Projects p;

SELECT e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
FROM Employees e
NATURAL JOIN Departments d;


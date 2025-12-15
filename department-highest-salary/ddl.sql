CREATE TABLE IF NOT EXISTS Employee (
	id int,
	name varchar(255),
	salary int,
	departmentId int
);
TRUNCATE TABLE Employee;

CREATE TABLE IF NOT EXISTS Department (
	id int,
	name varchar(255)
);
TRUNCATE TABLE Department;

INSERT INTO Employee (id, name, salary, departmentId) VALUES
('1', 'Joe', '70000', '1'),
('2', 'Jim', '90000', '1'),
('3', 'Henry', '80000', '2'),
('4', 'Sam', '60000', '2'),
('5', 'Max', '90000', '1')
;

INSERT INTO Department (id, name) VALUES
('1', 'IT'),
('2', 'Sales')
;

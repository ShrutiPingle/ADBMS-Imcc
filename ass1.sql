CREATE DATABASE CompanyDB;
use CompanyDB;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    JoinDate DATE
);
select*from Employees;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);
select*from Departments;

ALTER TABLE Employees ADD Email VARCHAR(100);
select*from Employees;

ALTER TABLE Departments ADD dept_location VARCHAR(100);
select*from Departments;

ALTER TABLE Employees ADD Phone VARCHAR(15) NOT NULL;
select*from Employees;

ALTER TABLE Employees MODIFY COLUMN EmpName VARCHAR(100);
DESC Employees;

ALTER TABLE Departments DROP PRIMARY KEY;
DESC Departments;

ALTER TABLE Departments ADD PRIMARY KEY (DeptID);
ALTER TABLE Employees ADD COLUMN DeptID INT;
ALTER TABLE Employees ADD CONSTRAINT fk_dept FOREIGN KEY (DeptID) REFERENCES Departments(DeptID);

ALTER TABLE Employees RENAME COLUMN EmpName TO EmployeeName;

ALTER TABLE Employees ADD Age INT, 
ADD CONSTRAINT chk_age_salary CHECK (Age >= 18 AND Salary >= 10000);

ALTER TABLE Employees DROP COLUMN Phone;


ALTER TABLE Employees RENAME TO EmployeeDetails;

ALTER TABLE EmployeeDetails DROP CONSTRAINT chk_age_salary;
DESC EmployeeDetails;

ALTER TABLE EmployeeDetails DROP FOREIGN KEY fk_dept;
DROP TABLE Departments;
SHOW TABLES;

DROP DATABASE CompanyDB;
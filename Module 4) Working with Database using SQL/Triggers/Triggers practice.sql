
-- Create the database
CREATE DATABASE IF NOT EXISTS triggers_1;

-- Switch to the newly created database
USE triggers_1;

-- Create the Employee table
CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Populate the Employee table with provided data
INSERT INTO Employee (EmployeeID, Name, Salary) VALUES
(1, 'Aarav Patel', 50000),
(2, 'Aisha Kumar', 60000),
(3, 'Amit Sharma', 75000),
(4, 'Ananya Choudhury', 55000),
(5, 'Arjun Reddy', 80000),
(6, 'Avni Gupta', 65000),
(7, 'Dev Verma', 70000),
(8, 'Dia Singh', 60000),
(9, 'Ishaan Saxena', 85000),
(10, 'Jiya Khan', 70000);

-- Create the Employee table
CREATE TABLE IF NOT EXISTS backup (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- create  trigger backup_info
-- before  delete 
-- on Employee
-- for each row 
-- begin 
-- insert into backup values (:old.EmployeeID, :old.Name, :old.Salary);
-- end;

DELIMITER //

CREATE TRIGGER backup_info
BEFORE DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO backup (EmployeeID, Name, Salary) VALUES (OLD.EmployeeID, OLD.Name, OLD.Salary);
END;
//

DELIMITER ;

select * from employee;
select * from backup;

delete from employee
where employeeid=3;
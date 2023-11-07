create database HR;
use hr;
select * from employees;
select * from departments;

-- 1) Display all information in the tables EMP and DEPT.
select * from employees as e
join departments as d
on e.department_id=d.department_id
order by e.employee_id;

-- 2) Display only the hire date and employee name for each employee.
select hire_date, concat_ws(" ",first_name,last_name) as ename from employees;

-- 3) Display the ename concatenated with the job ID, 
-- separated by a comma and space, and name the column Employee and Title
select concat_ws(" , ",first_name,last_name,job_id) as Title  from employees;

-- 4) Display the hire date, name and department number for all clerks.
select e.hire_date, concat_ws(" ",e.first_name,e.last_name) as Ename,e.department_id from employees as e
inner join jobs as j
on e.job_id=j.job_id
where j.job_title like "%clerk";

-- 5) Create a query to display all the data from the EMP table. 
-- Separate each column by a comma. Name the column THE OUTPUT
select concat_ws(",",employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,salary,manager_id) from employees;

-- 6) Display the names and salaries of all employees with a salary greater than 2000.
select first_name,last_name ,salary from employees
where salary>2000;

-- 7) Display the names and dates of employees with the column headers "Name" and "StartDate"
select concat_ws(" ",first_name,last_name)as Name, hire_date as  StartDate from employees;

-- 8) Display the names and hire dates of all employees in the order they were hired.
select concat_ws(' ',first_name,last_name) as Name, hire_date as StartDate from employees
order by hire_date;

-- 9) Display the names and salaries of all employees in reverse salary order.
select first_name,salary from employees
order by salary desc;

-- 10) Display 'ename" and "deptno"” who are all earned commission and display salary in reverse order. 
select concat_ws(' ',first_name,last_name) as ename, department_id as deptno,salary from employees
where commission_pct is not null
order by salary desc;

-- 11) Display the last name and job title of all employees who do not have a manager
select e.last_name,j.job_title from employees as e 
join jobs as j
where e.manager_id is null;

-- 12) Display the last name, job, and salary for all employees whose job is sales representative
 -- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
 select last_name,job_title,salary from emp_details_view
 where job_title in ("sales representative","stock clerk")
 and salary not in(2500,3500,5000);
 

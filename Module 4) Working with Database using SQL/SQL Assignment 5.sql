-- Database Name: HR
use hr;
-- 1. Write a query to display the last name and hire date of any employee in the same 
-- department as SALES. 
select e.last_name, e.hire_date,d.department_name from employees as e
join departments as d
on e.department_id = d.department_id
where d.department_name = "sales"; 

-- 2. Create a query to display the employee numbers and last names of all employees who 
-- earn more than the average salary. Sort the results in ascending order of salary. 
select employee_id , last_name,salary from employees
where (select avg(salary) from employees) < salary
order by salary;

select avg(salary) from employees; 

-- 3. Write a query that displays the employee numbers and last names of all employees who 
-- work in a department with any employee whose last name contains a' u 
select employee_id,last_name from employees 
where last_name like "%u%";

-- 4. Display the last name, department number, and job ID of all employees whose 
-- department location is ATLANTA. 
select e.first_name, e.last_name,e.department_id,e.job_id 
from employees as e
join departments as d
on d.department_id = e.department_id
join locations as l
on d.location_id = l.location_id
where l.city='Bombay';
 

-- 5. Display the last name and salary of every employee who reports to FILLMORE. 

There is no data about managers name and last name the table  

-- 6. Display the department number, last name, and job ID for every employee in the 
-- OPERATIONS department. 
select e.department_id,e.last_name,e.job_id  from employees as e
join departments as d
on e.department_id=d.department_id
where d.department_name = "Operations";

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all 
-- employees who earn more than the average salary and who work in a department with any 
-- employee with a 'u'in their name. 
select employee_id,last_name,salary from employees
where salary > (select avg(salary) from employees ) 
and concat(first_name,last_name) like '%u%'; 

select avg(salary) from employees; 

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept. 
select concat_ws(" ",e.first_name,e.last_name) as full_name, job_title from employees as e
join jobs as j
on j.job_id = e.job_id
where job_title like "%sales%";

-- 9. Write a compound query to produce a list of employees showing raise percentages, 
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
-- given a 15% raise, and employees in department 6 are not given a raise. 

there is no such a column like department_no in the dataset 
if it was there query should be 

select e.fist_name,e.salary,e.dept_no,e.department_name,
	CASE
    WHEN dept_no IN (1,3) THEN  '5%'
	WHEN dept_no = 2 Then  '10%'
    WHEN dept_no IN (4,5) THEN '15%'
    WHEN dept_no = 6 THEN 'NO RAISE'
    ELSE 'NA'
    END AS 'RAISE_PERCENTAGE'
FROM employees as e
join departments as d
on e.department_id = d.department_id
group by dept_no;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
-- names and salaries.
select last_name,salary from employees
order by salary desc
limit 3;
 
-- 11. Display the names of all employees with their salary and commission earned. Employees 
-- with a null commission should have O in the commission column 
select concat_ws(" ",first_name,last_name) as full_name,salary ,
case
	when commission_pct is null then 0
    else commission_pct
    end Commission_earned
from employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and 
-- department information.
-- There is no data about managers name and last name the table  
-- but, if it was there the query will be 

select e.first_name,e.salary,d.department_name -- replace e.first_name with managers name if it was there 
from  employees as e
join departments as d
on e.department_id=d.department_id
order by salary desc
limit 3;



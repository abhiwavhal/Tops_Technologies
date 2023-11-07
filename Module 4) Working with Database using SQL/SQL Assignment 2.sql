-- 1) Display the maximum, minimum and average salary and commission earned
select max(salary) as MaxSalary,min(salary) as Min_salary, avg(salary) as Avg_Salary,avg(commission_pct) as Avg_Commission from employees;
 
 
 -- 2)  Display the department number, total salary payout and total commission payout for each department.
 select d.department_id,sum(e.salary),sum(e.commission_pct) from departments as d join employees as e
 on e.department_id=d.department_id
 group by d.department_id;
 
 -- 3) Display the department number and number of employees in each department.
select  d.department_name,count(e.first_name) from employees as e
join departments as d on d.department_id = e.department_id 
group by d.department_name;
 
 -- 4) Display the department name and total salary of employees in each department.
select d.department_name,sum(e.salary) from departments as d 
join employees as e
on d.department_id =e.department_id
group by d.department_name;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name
select first_name,last_name from employees
where commission_pct is null;

-- 6) Display the employees name, department id and commission. If an Employee doesn't
-- earn the commission, then display as 'No commission’. Name the columns appropriately
select first_name,last_name,department_id ,commission_pct, 
case
	when commission_pct is not null then commission_pct
    else "No commission"
    end as commission_pct
from employees;
    
-- 7) Display the employee's name, salary and commission multiplied by 2. [f an Employee
-- doesn't earn the commission, then display as 'No commission. Name the columns appropriately
select first_name,last_name ,salary,
case
	when commission_pct is not null then commission_pct * 2
    else "No commission"
    end as commission_pct
from employees;

-- 8) Display the employee's name, department id who have the first name same as another
-- employee in the same department


-- 9) Display the sum of salaries of the employees working under each Manager.
select sum(salary),manager_id from employees
group by manager_id;

-- 10) Select the Managers name, the count of employees working under and the departmentID of the manager.
select count(e.employee_id),d.manager_id from employees as e join departments as d
on e.department_id=d.department_id
group by d.department_id;

-- 11) Select the employee name, department id, and the salary. Group the result with the
-- manager name and the employee last name should have second letter 'a'
select first_name,department_id,salary from employees
where last_name like "_a%";

-- 12)  Display the average of sum of the salaries and group the result with the department id.
-- Order the result with the department id.


-- 13) Select the maximum salary of each department along with the department id
select max(e.salary),d.department_name from employees as e
join departments as d on d.department_id = e.department_id
group by d.department_name;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
select first_name,last_name,
case
when commission_pct is not null then salary * 0.1
else '1'
end as commission_pct
from employees;
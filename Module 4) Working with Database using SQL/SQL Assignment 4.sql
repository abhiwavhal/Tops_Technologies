-- 1. Write a query to display the last name, department number, department name for all  employees. 
select e.last_name, d.department_id, d.department_name from employees as e
join departments as d
on e.department_id=d.department_id;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the 
-- department in the output. 

select distinct(d.department_name) ,l.city, l.location_id from departments as d
join locations as l
on d.location_id=l.location_id;

-- since this dataset is not containing departmnet number   
-- if it was there the query will be like 

select distinct(d.department_name) ,l.city, l.location_id from departments as d
join locations as l
on d.location_id=l.location_id
where d.department_number=4;

-- 3. Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission. 
select e.last_name,d.department_name,l.location_id,l.city from employees as e
join departments as d
on e.department_id = d.department_id
join locations as l
on l.location_id = d.location_id
where e.commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' 
-- in their last name 
select e.last_name ,d.department_name from employees as e
join departments as d 
on e.department_id=d.department_id 
where e.last_name like "%a" or e.last_name like "%a%" or e.last_name like "a%";

-- 5. Write a query to display the last name,job,department number and department name for 
-- all employees who work in ATLANTA. 
select e.last_name ,j.job_title,d.department_id,d.department_name 
from employees as e
join departments as d
on e.department_id=e.department_id
join jobs as j
on e.job_id=j.job_id
join locations as l
on l.location_id=d.location_id
where l.city ="ATLANTA";
-- 0 rows as output as there is no city who is = "ATLANTA" in dataset

-- 6. Display the employee last name and employee number along with their manager's last 
-- name and manager number. 

select last_name ,employee_id , manager_id from employees
where manager_id is not null; 

-- since there is no managers last_name 
-- if it wass there then query looks like

select last_name ,employee_id , manager_last_name, manager_id from employees
where manager_id is not null; 

-- 7. Display the employee last name and employee number along with their manager's last 
-- name and manager number (including the employees who have no manager). 

-- since there is no managers last_name 
-- if it wass there then query looks like

select last_name ,employee_id , manager_last_name, manager_id from employees
where manager_id is not null; 

-- 8. Create a query that displays employees last name,department number,and all the 
-- employees who work in the same department as a given employee. 


-- 9. Create a query that displays the name,job,department name,salary,grade for all 
-- employees. Derive grade based on salary(>=5000=A, >=3000=B,<3000=C) 
select e.first_name ,e.last_name , j.job_title , d.department_name , e.salary ,
case 
	when salary >= 5000 then "A"
    when salary >= 3000 then "B"
    else "C"
    end as Grade
from employees as e
join departments as d
on e.department_id=d.department_id
join jobs as j 
on j.job_id=e.job_id;

-- 10. Display the names and hire date for all employees who were hired before their 
-- managers along withe their manager names and hire date. Label the columns as Employee 
-- name, emp_hire_date,manager name,man_hire_date



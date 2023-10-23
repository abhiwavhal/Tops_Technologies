use hr;
/* Quetions 1 1. Display all information in the tables EMP and DEPT. */
 
select * from employees;
select * from departments;

/* Quetions  Display only the hire date and employee name for each employee.*/

select hire_date , first_name,last_name from employees;

/*  3. Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title */

select  concat_ws(" , ",employee_id, first_name, job_id) as details from employees ;

use hr;

select * from employees;
select * from jobs;
/*4.  Display the hire date, name and department number for all clerks. */

select e.hire_date, e.first_name || ' ' || last_name as full_name , e.department_id
FROM employees as e
JOIN jobs as j 
ON e.job_id = j.job_id
WHERE j.job_title LIKE '% Clerk';

/* Q 5.  Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT */

select  concat_ws(", ",employee_id, first_name, last_name, email, phone_number, hire_date, 
job_id, salary, commission_pct, manager_id, department_id) as "THE OUTPUT" from employees ;


/* 6. Display the names and salaries of all employees with a salary greater than 2000. */ 

select concat_ws(" ",first_name, last_name) as full_name , salary from employees
where salary >2000;

/* 7. Display the names and dates of employees with the column headers "Name" and "Start 
Date" */

select concat_ws(" ",first_name, last_name) as Name, hire_date as "Start Date" from employees;  

/* 8. Display the names and hire dates of all employees in the order they were hired. */

select concat_ws(" ",first_name, last_name) as Name, hire_date as "Start Date" 
from employees
order by hire_date;  

/* 9. Display the names and salaries of all employees in reverse salary order. */

select concat_ws(" ",first_name, last_name) as Name, hire_date as "Start Date" 
from employees
order by hire_date desc; 

/* 10. Display 'ename" and "deptno" who are all earned commission and display salary in 
reverse order.***/

select concat_ws(" ",first_name, last_name) as Name,  salary from employees
where commission_pct is not null
order by salary desc;

/* 11. Display the last name and job title of all employees who do not have a manager**/

select e.last_name ,j.job_title from employees as e ,jobs as j
where manager_id is null;

/* 12. Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 */

select e.last_name , j.job_title , e.salary from employees as e , jobs as j
where salary not in (2500,3500,5000);


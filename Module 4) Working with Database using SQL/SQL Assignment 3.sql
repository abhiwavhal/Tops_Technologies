use hr;

-- 1) Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.
select substring(last_name,2,4) as subs_tring
from employees; 

-- 2) Write a query that displays the employee's first name and last name along with a" in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined.
select first_name,last_name,concat_ws("-",first_name,last_name)as full_name,
 date_format(HIRE_DATE,"%m"),monthname(hire_date) as month_joined 
from employees ;

-- 3) Write a query to display the employee's last name and if half of the salary is greater than
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 1500 each. Provide each column an appropriate label.
select last_name, 1500 as bonus,
case 
	when (salary /2 )>10000 then salary * 1.10 + 1500
    else salary * 1.11 + 1500
    end salary_and_Bonus
from employees;

-- 4)  Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
-- department id, salary and the manager name all in Upper case, if the Manager name
-- consists of 'z' replace it with '$!

select concat(substring(employee_id,1,2),'00',substring(employee_id,4),'E') as emp_id_new from employees;


-- 5) Write a query that displays the employee's last names with the first letter capitalized and
-- all other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees’ last names

select concat(Upper(substring(last_name,1,1)),lower(substring(last_name,2))) as new_last_name, length(last_name) as length from employees
where last_name like "J%" or last_name like  "A%" or last_name like "M%"
order by last_name;

-- 6) Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY
select last_name,concat('$',LPAD(FORMAT(salary,0),15,'$')) as SALARY from employees;
 
 -- 7) Display the employee's name if it is a palindrome
select first_name from employees
where first_name = reverse(first_name);
 
 -- 8) Display First names of all employees with initcaps. 
 select concat(upper(substring(first_name,1,1)),lower(substring(first_name,2))) as initacaps from employees;
 
 -- 9) From LOCATIONS table, extract the word between first and second space from the
-- STREET ADDRESS column.
select substring(street_address,position(' ' in street_address ),position(' ' in street_address )) as sub_string from locations;

-- 10) Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name.
select lower(concat(substring(first_name,1,1),last_name,'@systechusa.com')) as e_mail_address_ from employees;

-- 11) Display the names and job titles of all employees with the same job as sales.
select e.first_name,e.last_name,j.job_title from employees as e join jobs as j 
on e.job_id=j.job_id
where j.job_title like "sales%";

-- 12) Display the names and department name of all employees working in the same city as Trenna.

select e.first_name,e.last_name,d.department_name,l.city from employees as e 
join departments as d 
on e.department_id=d.department_id
join locations as l
on l.location_id=d.location_id
where l.city = "trenna";


-- 13) Display the name of the employee whose salary is the lowest.
select first_name , last_name,salary  from employees
where salary =(select min(salary) from employees);


-- 14) Display the names of all employees except the lowest paid.

select first_name,last_name from employees
where employee_id != (select employee_id  from employees
where salary =(select min(salary) from employees));




/* 1) Display the maximum, minimum and average salary and commission earned. */

select max(salary) ,min(salary) ,avg(salary) from employees;

/*2) Display the department number, total salary payout and total commission payout for 
each department.*/ 

select department_id, sum(salary),sum(commission_pct) from employees 
group by department_id; 

/*3) Display the department number and number of employees in each department. */

select department_id, count(employee_id) from employees 
group by department_id; 

/*4) Display the department number and total salary of employees in each department. */

select department_id, sum(salary) from employees 
group by department_id; 

/*5) Display the employee's name who doesn't earn a commission. Order the result set 
without using the column name */

select concat_ws(' ',first_name,last_name) from employees
where commission_pct is null
order by first_name;

/*6) Display the employees name, department id and commission. If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately*/
SELECT
    employee.empname,
    department.deptid,
    CASE
        WHEN employee.commission > 0 THEN employee.commission
        ELSE 'No commission'
    END AS commission
FROM
    employee 
LEFT JOIN
    department  ON employee.empid = department.deptid;


/*7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
doesn't earn the commission, then display as 'No commission. Name the columns 
appropriately*/
SELECT
    empname,salary,
    CASE
        WHEN commission > 0 THEN commission * 2 
        ELSE 'No commission'
    END AS commission
FROM employee ;

/*9) Display the sum of salaries of the employees working under each Manager. */

select sum(salary),managername from employee
group by managername;

/*10) Select the Managers name, the count of employees working under and the department 
ID of the manager. */

select employee.managername,count(employee.empname),department.deptname from
department join employee on department.deptid = employee.empid
group by department.deptname;

/*11) Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a! */

select employee.empname,department.deptid,employee.salary,managername from
employee join department on department.deptid = employee.empid
where employee.managername like '_a%' and employee.emplastname like '_a%';

/*13) Select the maximum salary of each department along with the department id */

select max(employee.salary),department.deptname from employee
join department on department.deptid = employee.empid
group by department.deptname;

/*14) Display the commission, if not null display 10% of salary, if null display a default value 1*/

select empname,salary,
case
when commission > 0 then salary * 0.1
else '1'
end as commission
from employee;

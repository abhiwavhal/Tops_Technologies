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



/*7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
doesn't earn the commission, then display as 'No commission. Name the columns 
appropriately*/
/*8) Display the employee's name, department id who have the first name same as another 
employee in the same department*/
/*9) Display the sum of salaries of the employees working under each Manager. */
/*10) Select the Managers name, the count of employees working under and the department 
ID of the manager. */
/*11) Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a! */
/*12) Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id. */
/*13) Select the maximum salary of each department along with the department id */
/*14) Display the commission, if not null display 10% of salary, if null display a default value 1*/

-- Date Function
use hr;
-- 1) Find the date difference between the hire date and resignation_date for all the 
-- employees. Display in no. of days, months and year(1 year 3 months 5 days).
-- Emp_ID Hire Date Resignation_Date
-- 1 1/1/2000 7/10/2013
-- 2 4/12/2003 3/8/2017
-- 3 22/9/2012 21/6/2015
-- 4 13/4/2015 NULL
-- 5 03/06/2016 NULL
-- 6 08/08/2017 NULL
-- 7 13/11/2016 NULL 

select
    e.employee_id,
    e.hire_date,
    j.end_date,
    concat_ws(" ",floor(datediff(j.end_date,e.hire_date) / 365 )," ",'YEAR ',
    floor((datediff(j.end_date,e.hire_date) % 365 ) / 30) ," ", 'MoNTHS ',
    datediff(j.end_date,e.hire_date) % 30 ," ",'DAYS') as days
	-- datediff(resignation_date_emp,hiredate) % 30 ," ",'DAYS') AS DateFormated 
    -- floor(datediff(day, e.hire_date, isnull(j.end_date, getdate()))) as days,
    -- floor(datediff(month, e.hire_date, isnull(j.end_date, getdate()))) as months,
    -- floor(datediff(year, e.hire_date, isnull(j.end_date, getdate()))) as years
from employees as e
join job_history as j
on j.employee_id=e.employee_id
;

-- 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900) 
select e.hire_date,date_format(e.hire_date,"%m/%d/%Y") as new_hire_date ,
 j.end_date,date_format(j.end_date,"%M %D, %Y") as new_end_date from employees as e
 join job_history as j
 on j.employee_id=e.employee_id
 ;

-- 3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 months) 
-- Use Getdate() as input date for the below three questions. 
select concat_ws(" ",e.first_name,e.last_name) as full_name,
concat_ws(" ",
	floor(datediff(j.end_date,e.hire_date) / 365)," ","Years"," and ",
    floor((datediff(j.end_date,e.hire_date) % 365 ) / 30 )," ","Months"
) as Total_Experience
from employees as e
join job_history as j
on j.employee_id=e.employee_id
 ;

-- 4) Display the count of days in the previous quarter 

    
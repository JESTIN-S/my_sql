show tables;
show databases;
drop table job;
create database  if not exists ammu;
describe employee;
select Job_Id from employee;
select  location_id from department;
select salary from employee;
desc department;
select First_Na me from employee; 
ALTER TABLE employee rename column `hire Date` to hire_date; 
alter table employee rename column `First_Na me` to First_Name;
alter table employee rename column `depart ment_Id` to department_Id;
UPDATE employee SET hire_date = DATE_FORMAT(STR_TO_DATE(hire_date, '%d-%b-%y'), '%Y-%m-%d');
alter table employee modify hire_date date; 
ALTER TABLE employee RENAME COLUMN  `Last_Na me` TO Last_Name;
ALTER TABLE department rename COLUMN `NAME` TO D_NAME;
select*from employee;
select*from department;
select*from job;
select* from location;
select *from my_sql where id %2=0;
create temporary table mmm(select*from my_sql);
delete from my_sql;
set autocommit=off;
commit;
create table my_sql (select*from mmm);
rollback;
select*from my_sql;
drop table my_sql; 
-- Simple Queries:
-- 1. List all the employee details.
select* from employee;
-- 2. List all the department details.
select* from department;
-- 3. List all job details.
-- 4. List all the locations.
-- 5. List out the First Name, Last Name, Salary, Commission for all Employees.
-- 6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
-- 7. List out the annual salary of the employees with their names only. 
--- WHERE Condition:
-- 1. List the details about "Smith".
   select*from employee where Last_Name ='smith';
-- 2. List out the employees who are working in department 20.
   select*from employee where department_Id=20;
-- 3. List out the employees who are earning salaries between 3000 and4500.
   select*from employee where salary between 3000 and 4500;
-- 4. List out the employees who are working in department 10 or 20
    select*from employee where department_Id=10 or 20;
-- 5. Find out the employees who are not working in department 10 or 30.
   select * from employee where department_Id <> 30 and 10;
-- 6. List out the employees whose name starts with 'S'
    select * from employee where last_name like 's%';
-- 7. List out the employees whose name starts with 'S' and ends with 'H'.
    select * from employee where last_name like  's%' and '%h';
-- 8. List out the employees whose name length is 4 and start with 'S'.
   select * from employee where length(last_name) ='4' and  Last_Name like 's%';
-- 9. List out employees who are working in department 10 and draw salaries more than 3500.
   select* from employee where department_Id =10 and Salary >=3500;
-- 10. List out the employees who are not receiving commission
   select* from employee;

 ---  ORDER_BY Clause:
-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
   SELECT EMPLOYEE_ID,LAST_NAME FROM employee ORDER BY employee_ID ASC;
-- 2. List out the Employee ID and Name in descending order based on salary.
   SELECT * FROM department AS DEE INNER JOIN (SELECT Department_Id,Salary FROM employee ) AS TA ON DEE.Department_Id=TA.Department_Id order by SALARY ;
   SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE ORDER BY SALARY DESC;
-- 3. List out the employee details according to their Last Name in ascending-order.
   select *FROM employee ORDER by Last_Name asc;
-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
   select *FROM employee ORDER by Last_Name asc ,department_Id desc;
   
--- GROUP_BY and HAVING Clause:
-- 1. How many employees are in different departments in the organization?
select *from department;
select count(d.department_id) as total,d.department_Id,d.D_NAME from employee as e join department as d on e.Department_Id=d.Department_Id group by department_Id,D_NAME order by total desc  ;
   select count(department.Department_Id), department.Department_Id,department.D_NAME from employee join department on employee.Department_Id=department.Department_Id group by Department_Id,d_name;
   SELECT DEPARTMENT_ID, COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY DEPARTMENT_ID;
-- 2. List out the department wise maximum salary, minimum salary and average salary of the employees.
   select MAX(SALARY),MIN(SALARY),AVG(SALARY),department_Id FROM employee group by Department_Id;
-- 3. List out the job wise maximum salary, minimum salary and average salary of the employees.
   select max(Salary),min(Salary),avg(Salary),Designation from job inner join employee on job.job_id=employee.job_Id group by Designation;
   SELECT JOB_ID, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE GROUP BY JOB_ID;
-- 4. List out the number of employees who joined each month in ascendingorder.
   select count(hire_date), monthname(hire_date) from employee group by monthname(hire_date) order by count(hire_date) asc ;
-- 5. List out the number of employees for each month and year in ascending order based on the year and month.
   select count(hire_date),year(hire_date),month(hire_date) from employee group by month(hire_date),year(hire_date) order by month(hire_date),year(hire_date) asc ;
-- 6. List out the Department ID having at least four employees.
   SELECT DEPARTMENT_ID FROM EMPLOYEE GROUP BY DEPARTMENT_ID HAVING COUNT(EMPLOYEE_ID) >= 4;
-- 7. How many employees joined in the month of January?
   select count(employee_id) from employee  group by monthname(employee_id) having month(hire_date)=1;
   select count(*) from employee where month(hire_date)=1;
-- 8. How many employees joined in the month of January or September?
   select count(employee_id) from employee group by monthname(hire_date)having monthname(hire_date)in('january','september');
   select count(*) from employee where monthname(hire_date) = ('january','september');
-- 9. How many employees joined in 1985?
   select count(employee_id) from employee group by year(hire_date) having year(hire_date) = 1985;
   select count(employee_id) from employee where year(hire_date) = 1985 group by year(hire_date);
-- 10. How many employees joined each month in 1985?
   select count(employee_id) from employee group by month(hire_date) having year(hire_date) =1985;
-- 11. How many employees joined in March 1985?
   SELECT COUNT(*) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEE GROUP BY MONTH(hire_date), YEAR(hire_date) HAVING MONTH(hire_date) = 3 AND YEAR(hire_date) = 1985;
   select count(employee_id) from employee group by month(hire_date),year(hire_date) having year(hire_date) =1985 and monthname(hire_date)='march';
-- 12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
   select count(employee_id) from employee group by month(hire_date) having year(hire_date) =1985 and monthname(hire_date)='april';
   select count(employee_id),month(hire_date) from employee group by month(hire_date) having hire_date =1985-04-20;
--- SUBQUWERS
-- 1). List out employees with their department names.
    SELECT D_NAME,department_ID FROM department WHERE Department_Id IN(select Department_Id from employee);
-- 2). Display employees with their designations.
   select * from employee where job_id in(select job_id from job);
-- 3). Display the employees with their department names and regional groups.
   select * from location where location_id in(select location_id from department where department_id  in(select department_id from employee));
-- 4). How many employees are working in different departments? Display with department names.
   select count(department_id),D_name from department where department_id in(select distinct(Department_Id) from employee ) group by department_id,d_name ;
-- 5). How many employees are working in the sales department?
   select count(department_id) from employee where department_id in (select department_id from department where d_name='sales');
-- 6). Update the salaries of employees who are working as clerks on the basis of 10%.
   update employee set salary=salary*1.10 where job_id in(select  job_id from job where designation='clerk');
-- 7). Delete the employees who are working in the accounting department.
   delete from  employee where department_id in (select department_id from department where d_name='accounting');
-- 8). Display the second highest salary drawing employee details.
   select * from (select * from employee order by salary desc limit 2)t order by salary asc  limit 1;
 -- 9). Display the nth highest salary drawing employee details.
   select max(salary) from employee where department_Id=30;
-- 10). List out the employees who earn more than every employee in department 30.
   select salary from employee where salary>(select max(salary) from employee where department_Id=30);
-- 11). List out the employees who earn more than the lowest salary in department.Find out whose department has no employees.
   select* from department where Department_Id not in(select distinct(department_Id) from employee where salary>(select min(salary) from employee));
   select salary from employee where salary!=(select min(salary) from employee);
-- 12). Find out which department has no employees.
   select * from department where Department_Id not in (select Department_Id from employee) ;
   select * from employee;
   select * from department;
-- 13). Find out the employees who earn greater than the average salary for their department.
   select * from employee where salary>= (select avg(salary) from employee);
   select*from employee;
    --- joins
-- 1. List out employees with their department names.
   select First_Name,D_NAME from department as dep cross join employee as emp on dep.Department_Id=emp.Department_Id;
-- 2. Display employees with their designations.
   select  first_name,designation from job join employee as emp on job.job_id=emp.Job_Id;
-- 3. Display the employees with their department names and regional groups.
   select D_NAME,First_Name,City from department as dep cross join employee as emp on dep.Department_Id=emp.Department_Id join location on location.Location_ID=dep.Location_Id;
-- 4. How many employees are working in different departments? Display with department names.
   select count(*),D_NAME from department as dep  join employee as emp on dep.Department_Id=emp.Department_Id group by D_NAME;
-- 5. How many employees are working in the sales department?
   select count(*),D_NAME from department as dep  join employee as emp on dep.Department_Id=emp.Department_Id where D_NAME='sales' group by D_NAME;
   select count(*),D_NAME from department as dep  join employee as emp on dep.Department_Id=emp.Department_Id group by D_NAME having D_NAME='sales';
-- 6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.
   select count(*),D_NAME from department as dep  join employee as emp on dep.Department_Id=emp.Department_Id group by D_NAME having count(*)>=5;
-- 7. How many jobs are there in the organization? Display with designations.
   select count(*)from employee as d  right join job as e on d.job_id=e.job_id right join department as ddd on ddd.Department_Id=d.department_Id where Last_Name is null;
-- 8. How many employees are working in "New York"?
   select count(*) from department as dep cross join employee as emp on dep.Department_Id=emp.Department_Id join location on location.Location_ID=dep.Location_Id where city='new york';
-- 9. Display the employee details with salary grades. Use conditional statement to create a grade column.
   select *, if(Salary>2800,'A',IF( SALARY>2700,'B',IF(SALARY>2000,'C',IF(SALARY>1500,'D',IF(SALARY>1000,'E','F'))))) AS GRADE FROM employee;
   select *, CASE WHEN Salary>2800 THEN 'A'  WHEN Salary>2700 THEN 'B' WHEN Salary>2000 THEN 'C' WHEN Salary>1500 THEN 'D' WHEN Salary>1000 THEN 'E'ELSE 'F' END GRADE FROM EMPLOYEE;
-- 10. List out the number of employees grade wise. Use conditional statementto create a grade column.
   select COUNT(*), if(Salary>2800,'A',IF( SALARY>2700,'B',IF(SALARY>2000,'C',IF(SALARY>1500,'D',IF(SALARY>1000,'E','F'))))) AS GRADE FROM employee group by GRADE;
-- 11. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
   select *, if(Salary>2800,'A',IF( SALARY>2700,'B',IF(SALARY>2000,'C',IF(SALARY>1500,'D',IF(SALARY>1000,'E','F'))))) AS GRADE FROM employee WHERE Salary between 2000 AND 5000;
-- 12. Display all employees in sales or operation departments
---- workout 
   SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID IN(SELECT department_Id FROM department WHERE D_NAME IN('SALES','OPERATIONS'));
    select* from employee;
    select department_id from department where department_id=max(department_id);
    SELECT* FROM department;
    SELECT * FROM Employee AS Emp INNER JOIN 
(SELECT Department_ID, AVG(Salary) AS AvgSal FROM Employee GROUP BY Department_ID) AS ASD
ON Emp.Department_ID=ASD.Department_ID
WHERE Salary >= AvgSal;
select avg(salary) from employee;
select sum(rainfaul ),city from table_a where rainhaul>= (select avg(rainfaul) from table_a)group by city;
select avg(product),oid,max(QUANTITY) from test_four group by oid having max(QUANTITY)>avg(product);
select `name`,degeree  from my_sql where degeree='mca' group by degeree,`name`;
select* from my_sql;
create view yyy as(select*from my_sql);
select*from yyy;
drop view yyy;
create index xyz on my_sql(id);
desc my_sql;
drop index xyz on my_sql(id) ;
    show tables;
DROP INDEX xyz ON my_sql;
select age+ amount as dd from my_sql where age+ amount >300;
select age,floor(avg(amount)) from my_sql group by age;
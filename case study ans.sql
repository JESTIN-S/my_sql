 -- Consider yourself to be Sam and you have been given the below tasks to complete using the Table – STUDIES, SOFTWARE and PROGRAMMER
 select*from programmer;
describe programmer;
alter table programmer modify column dob date;
UPDATE programmer SET DOJ= STR_TO_DATE(DOJ,'%y-%m-%d');
-- 1)Find out the selling cost average for packages developed in Pascal:
   select avg(scost),DEVELOPIN FROM software where DEVELOPIN='PASCAL';
-- 2)Display the names and ages of all programmers:
   UPDATE PROGRAMMER SET DOB = DATE_FORMAT(dob, '%d/%m/%Y');
   SELECT  Pname, TIMESTAMPDIFF(YEAR( DOB),now()) AS age FROM PROGRAMMER;
   select year(dob)from programmer;
-- 3)Display the names of those who have done the DAP Course
   select pname,course from studies where course='dap';
-- 4)Display the names and date of birth of all programmers born in January.
   select * from programmer where monthname(dob)='january';
   SELECT  Pname, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS age FROM PROGRAMMER;
-- 5)What is the highest number of copies sold by a package?
   (select max(sold) into @k from software);
   select * from software where sold = @k;
-- 6)Display lowest course fee.
   ALTER TABLE studies RENAME COLUMN `COURSE FEE` TO COURSE_FEE;
   select min(COURSE_FEE) from studies;
-- 7)How many programmers have done the PGDCA Course?
   select count(course) from studies where course='pgdca';
-- 8)How much revenue has been earned through sales of packages developed in C?
   select sum(scost)*sold from software where DEVELOPIN='c' group by sold;
-- 9)Display the details of the software developed by Ramesh select
   select * from software as s join programmer as p on s.pname=p.pname join studies as f on s.pname=f.pname where f.PNAME='ramesh';
-- 10). How many programmers studied at Sabhari?
   select*from studies where INSTITUTE='sabhari';
-- 11). Display details of packages whose sales crossed the 2000 mark.
   select scost*sold  from software where scost*sold>2000;
-- 12). Display the details of packages for which development costs have been recovered.
    
-- 13). What is the cost of the costliest software development in Basic?
   select  *from software where DEVELOPIN='basic';
-- 14). How many packages have been developed in dBase?
   select count(DEVELOPIN) from software where DEVELOPIN='dbase';
-- 15). How many programmers studied in Pragathi?
   select count(pname) from studies where INSTITUTE='pragathi';
-- 16). How many programmers paid 5000 to 10000 for their course?
   select *from studies where COURSE_FEE between 5000 and 10000;
-- 17). What is the average course fee?
   select avg(COURSE_FEE) from studies;
-- 18). Display the details of the programmers knowing C.
   select pname from software where DEVELOPIN='c';
-- 19). How many programmers know either COBOL or Pascal?
   select*from software where DEVELOPIN ='pascal' or DEVELOPIN='cobol';
-- 20). How many programmers don’t know Pascal and C?
   select count(PNAME) from software where DEVELOPIN !='pascal' and DEVELOPIN !='c';
-- 21). How old is the oldest male programmer?
   select *from programmer where timestampdiff(year,dob,curdate())in(select min(timestampdiff(year,dob,curdate())) from programmer where GENDER='m') ;
-- 22). What is the average age of female programmers?
   select avg(timestampdiff(year,dob,now())) from programmer where gender='f';
-- 23). Calculate the experience in years for each programmer and display with their names in descending order.
   select*, timestampdiff(year,doj,now()) as Expirience from programmer order by Expirience desc;
-- 24). Who are the programmers who celebrate their birthdays during the current month?
    select*, monthname(dob) from programmer where month(dob)=8;
-- 25). How many female programmers are there?
   select count(pname) from programmer where gender='f';
-- 26). What are the languages studied by male programmers?
   select * from software where pname in (select pname from programmer where gender='m');
-- 27). What is the average salary?
   select avg(salary)from programmer;
-- 28). How many people draw a salary between 2000 to 4000?
   select * from programmer where salary between 2000 and 4000;
-- 29). Display the details of those who don’t know Clipper, COBOL or Pascal.
   select * from software where DEVELOPIN !='clipper' and DEVELOPIN !='cobol' and DEVELOPIN !='pascal';
-- 30). Display the cost of packages developed by each programmer.
   select DEVELOPIN, sum(scost) from software group by DEVELOPIN;
-- 31). Display the sales value of the packages developed by each programmer.
   select DEVELOPIN, sum(sold*scost) from software group by DEVELOPIN;
-- 32). Display the number of packages sold by each programmer.
   select count(DEVELOPIN),DEVELOPIN from software group by DEVELOPIN;
-- 33)Display the sales cost of the packages developed by each programmer language wise.
   select sold*scost ,developin,pname from software order by TITLE desc;
-- 34). Display each language name with the average development cost, average selling cost and average price per copy.
select * from software where sold*scost in (select avg(sold*scost) from software);
-- 35). Display each programmer’s name and the costliest and cheapest packages developed by him or her.
select max(COURSE_FEE),min(COURSE_FEE),gender from programmer as f join studies as k on f.pname=k.pname group by gender;
-- 36). Display each institute’s name with the number of courses and the average cost per course.
   select institute,count(course),avg(course_fee) from studies group by INSTITUTE;
-- 37). Display each institute’s name with the number of students.
   select institute,count(pname) from studies group by INSTITUTE;
-- 38). Display names of male and female programmers along with their gender.
   select pname,if(gender='f','female','male') from programmer;  
-- 39). Display the name of programmers and their packages.
   select pname,DEVELOPIN from software;
-- 40). Display the number of packages in each language except C and C++.
   select count(DEVELOPIN) from software where pname in (select pname from programmer where prof1 != 'c'and prof2 !='c') and DEVELOPIN not in('c','c++');
-- 41). Display the number of packages in each language for which development cost is less than 1000.
   select count(developin),title from software where dcost<1000 group by TITLE ;
-- 42). Display the average difference between SCOST and DCOST for each package.
   select avg(dcost-scost ),developin from software group by DEVELOPIN;
-- 43). Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.
   select sold*scost as amount,dcost,pname from software where sold*scost<=dcost ;
-- 44). Display the highest, lowest and average salaries for those earning more than 2000.
   select max(salary),min(salary),avg(salary) from programmer where salary>=2000;
-- 45). Who is the highest paid C programmer?
   select *from studies where course_fee in (select max(course_fee) from studies where pname in (select pname from software where DEVELOPIN='c'));
-- 46). Who is the highest paid female COBOL programmer?
   select *from software where pname in (select pname from programmer where gender='f') and developin='cobol';
-- 47). Display the names of the highest paid programmers for each language.
   select max(course_fee),developin from studies as d join  software f on d.pname=f.pname group by DEVELOPIN ;
-- 48). Who is the least experienced programmer?
   select*,timestampdiff(year,doj,curdate()) as experience from programmer where timestampdiff(year,doj,curdate()) in (select min(timestampdiff(year,doj,curdate()))from programmer);
-- 49). Who is the most experienced male programmer knowing PASCAL?
   select*,timestampdiff(year,doj,curdate()) as experience from programmer where timestampdiff(year,doj,curdate()) in (select max(timestampdiff(year,doj,curdate()))from programmer);
-- 50). Which language is known by only one programmer?
   select * from software where DEVELOPIN in (select developin  from software  group by DEVELOPIN having count(developin)=1);
-- 51). Who is the above programmer referred in 50?
   select timestampdiff(year,dob,curdate()) as h from programmer where timestampdiff(year,dob,curdate())>'50';
-- 52). Who is the youngest programmer knowing dBase?
   select* from programmer where timestampdiff( year,dob,now()) = (select min(timestampdiff( year,dob,now())) from programmer) and prof2='dbase' ;
-- 53). Which female programmer earning more than 3000 does not know C,C++, Oracle or dBase?
     select*from programmer where gender ='f' and prof1 not in('c','c++','oracle') and prof2 not in('c','c++','oracle');
-- 54). Which institute has the most number of students?
   SELECT institute FROM STUDIES WHERE COURSE_FEE IN (SELECT MAX(COURSE_FEE) FROM studies);
-- 55). What is the costliest course?
   select pname from studies where COURSE_FEE in (select max(COURSE_FEE) from studies);
-- 56). Which course has been done by the most number of students?
   select COUNT(*),COURSE FROM studies GROUP BY COURSE ORDER BY COUNT(*) DESC LIMIT 1 ;
-- 57). Which institute conducts the costliest course?
   SELECT * FROM STUDIES WHERE COURSE_FEE IN (SELECT MAX(COURSE_FEE) FROM studies);
-- 58). Display the name of the institute and the course which has below average course fee.
   select*from studies where COURSE_FEE <=(select avg(course_fee)from studies);
-- 59). Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.
   select * from studies where COURSE_FEE between ((select avg(course_fee)from studies) +1000) and ((select avg(course_fee)from studies) -1000);
-- 60). Which package has the highest development cost?
   SELECT* FROM programmer WHERE SALARY IN (select MAX(SALARY)FROM programmer);
-- 61). Which course has below average number of students?
   SELECT COUNT(PNAME) K,COURSE FROM studies GROUP BY COURSE HAVING COUNT(PNAME)<2;
-- 62). Which package has the lowest selling cost?
   select*from software where scost =(select min(scost) from software);
-- 63). Who developed the package that has sold the least number of copies?
   select*from software where sold =(select min(sold) from software);
-- 64). Which language has been used to develop the package which has the highest sales amount?
   select*from software where scost in (select max(scost) from software);
-- 65). How many copies of the package that has the least difference between development and selling cost were sold?
   select dcost - scost as selling_cost from software order by selling_cost desc limit 1;
-- 66). Which is the costliest package developed in Pascal?
   select* from software where sold*scost in(select max(sold*scost) from software where DEVELOPIN='pascal');
-- 67). Which language was used to develop the most number of packages?
   select count(DEVELOPIN) as hiest_number,DEVELOPIN,TITLE from software group by DEVELOPIN,TITLE order by hiest_number desc limit 1  ;
-- 68). Which programmer has developed the highest number of packages?
   select count(DEVELOPIN) as hiest_number,DEVELOPIN from software group by DEVELOPIN order by hiest_number desc limit 1  ;
-- 69). Who is the author of the costliest package?
   select* from software where sold*scost in( select max(sold*scost) from software);
-- 70). Display the names of the packages which have sold less than the average number of copies.
   select avg (sold*scost)into @k from software;
   select * from software where scost<@k;
-- 71). Who are the authors of the packages which have recovered more than double the development cost?
   select *  from software where scost*sold<= dcost*2;
-- 72). Display the programmer names and the cheapest packages developed by them in each language.
   select pname,DEVELOPIN,scost from software where scost in (select min(scost) from software group by DEVELOPIN) order by scost asc limit 5;
-- 73). Display the language used by each programmer to develop the highest selling and lowest selling package.
   select max(scost*sold),min(scost*sold) from software where SCOST*sold in(select scost*sold  from software);
-- 74). Who is the youngest male programmer born in 1965?
   select pname,year(dob) from programmer where gender='m'and year(dob) in (1965 );
-- 75). Who is the oldest female programmer who joined in 1992?
   select date(dob),pname,gender from programmer where gender='f'and year(doj)=1992 order by date(dob);
-- 76). In which year was the most number of programmers born?
   select year(dob),count(year(dob))as most_number from programmer group by year(dob) order by most_number desc limit 1;
-- 77). In which month did the most number of programmers join?
   SELECT count(pname) d,month(DOJ)FROM programmer GROUP BY MONTH(DOJ) order by d desc limit 1;
-- 78). In which language are most of the programmer’s proficient?
   SELECT count(developin) d,developin FROM software group by DEVELOPIN order by d desc limit 1;
-- 79). Who are the male programmers earning below the average salary of female programmers?
   SELECT SALARY,PNAME FROM PROGRAMMER WHERE SALARY<=(SELECT AVG(SALARY) FROM programmer WHERE GENDER='F')AND GENDER='M';
-- 80)Who are the female programmers earning more than the highest paid?
   select * from software as s join programmer as p on s.pname=p.pname join studies as f on s.pname=f.pname WHERE GENDER='F'AND SALARY<COURSE_FEE;
-- 81). Which language has been stated as the proficiency by most of the programmers?
   SELECT COUNT(DEVELOPIN) K,PNAME FROM software GROUP BY PNAME HAVING K>1 order by K DESC LIMIT 1;
-- 82). Display the details of those who are drawing the same salary.
   SELECT*FROM PROGRAMMER WHERE SALARY=3000;
-- 83). Display the details of the software developed by the male programmers earning more than 3000.
   select* from programmer p join software s on p.pname=s.pname join studies f on p.pname=f.pname where gender='m'and SALARY>3000;
-- 84). Display the details of the packages developed in Pascal by the female programmers.
   select * from programmer where pname in(select pname from software where DEVELOPIN='pascal')and gender='f';
-- 85). Display the details of the programmers who joined before 1990.
   select year(dob),pname from programmer where year(dob)<1990;
-- 86). Display the details of the software developed in C by the female programmers at Pragathi.
   select * from studies where pname in(select pname from software where pname in (select PNAME from programmer where gender='f')and DEVELOPIN='c')and institute='pragathi';
-- 87). Display the number of packages, number of copies sold and sales value of each programmer institute wise.
   select s.pname,abu.total_cost,s.INSTITUTE,ABU.COPIES_SOLD,ABU.DEVELOPIN from studies s join (select SCOST*sold total_cost,pname,count(DEVELOPIN) COPIES_SOLD,DEVELOPIN from software  group by DEVELOPIN,total_cost,pname) abu on s.pname=abu.pname order by INSTITUTE ;
-- 88). Display the details of the software developed in dBase by male programmers who belong to the institute in which the most number of programmers studied.
   SELECT COUNT(*)FROM STUDIES WHERE PNAME IN (SELECT PNAME FROM SOFTWARE WHERE DEVELOPIN='DBASE' AND PNAME IN(SELECT PNAME FROM  programmer WHERE GENDER="M"));
-- 89). Display the details of the software developed by the male programmers born before 1965 and female programmers born after 1975.
   select * from programmer where (year(dob)<1965 and gender='m')or year(dob)>1975 and gender='f';
-- 90). Display the details of the software that has been developed in the  language which is neither the first nor the second proficiency of the programmers.
   select * from software s join programmer f on s.pname=f.pname where DEVELOPIN not in(PROF1,PROF2) ;
-- 91). Display the details of the software developed by the male students at Sabhari.
   select * from studies where pname like 'sabhari%';
-- 92). Display the names of the programmers who have not developed any packages.
  (select pname from programmer)except(select pname from software) ;
-- 93). What is the total cost of the software developed by the programmers of Apple?
   select scost*sold from software where title='apple' ;
-- 94). Who are the programmers who joined on the same day?
   SELECT PNAME, sum(salary) FROM programmer group by fomated;
   create temporary table je(select*from programmer);
-- 95) . Who are the programmers who have the same Prof2?
   select * from software s  right join programmer p on s.pname=p.pname where DEVELOPIN=prof2;
-- 96)Display the total sales value of the software institute wise.
   select sum(scost*sold) j,INSTITUTE from software ss join studies s on ss.pname=s.pname group by INSTITUTE;
-- 97)which instuts does the person who developed the costliest package study
   select t.pname,k.INSTITUTE,j from studies k join(select pname, scost*sold j from software order by j  desc limit 1 )T on k.pname=T.pname;
-- 98)Which language listed in Prof1, Prof2 has not been used to develop any package?
   select *from programmer p left join software s on p.pname=s.pname where DEVELOPIN is null;
-- 99) How much does the person who developed the highest selling package earn and what course did he/she undergo?
   select * from studies k join(select pname, scost*sold j from software order by j  desc limit 1 )T on k.pname=T.pname;
-- 100)What is the average salary for those whose software sales is more than 50,000?
   select avg(salary) from programmer where pname in(select pname from software where SCOST*sold>=50000 );
-- 101). How many packages were developed by students who studied in institutes that charge the lowest course fee?
   select count(title) from software where pname in (select pname from studies where institute = (select INSTITUTE from studies order by COURSE_FEE limit 1));
-- 102)How many packages were developed by the person who developed the cheapest package? Where did he/she study?
   select PNAME,count(developin) n,sum(scost)  d from software group by pname order by d asc limit 1;
-- 103). How many packages were developed by female programmers earning more than the highest paid male programmer?
   select count(DEVELOPIN), sum(SCOST),gender,DEVELOPIN from programmer h join software s on h.pname=s.pname group by DEVELOPIN,gender ;
-- 104) How many packages are developed by the most experienced programmers from BDPS?
   select*,timestampDIFF(YEAR,DOB,CURDATE()) AS AGE from programmer d join studies j on d.pname=j.pname where INSTITUTE='BDPS' ORDER BY AGE DESC;
-- 105) List the programmers (from the software table) and the institutes they studied at.
   select pname,INSTITUTE from studies where pname in (select pname from software);
-- 106. List each PROF with the number of programmers having that PROF and the number of the packages in that PROF.

-- 107)List the programmer names (from the programmer table) and the number of packages each has developed
   select g.pname,f.o from programmer  g join (select count(developin) o,pname from software group by PNAME) f on g.pname=f.pname;
DESCRIBE studies;


show fields FROM studies;
ALTER TABLE PROGRAMMER modify DOB DATETIME ;
select*from programmer;
select*from software;
  select*from studies;
 describe programmer; 
desc studies;
select COURSE FEE FROM studies;
ALTER TABLE studies RENAME COLUMN `COURSE FEE` TO COURSE_FEE; 
SELECT COURSE_FEE  from studies;
SELECT DATE_FORMAT(STR_TO_DATE('12-Apr-66', '%d-%b-%y'), '%Y-%m-%d');
select*,case when month(doj) in (1,2,3) then 'summer' when month(doj) in (4,5,6) then 'winter'when month(doj) in (7,8,9) then 'normal' else null end year_of_years from programmer;
select*,case when gender='f' then 'female' when gender='m' then 'male' else null end name  from programmer;
SELECT *, SALARY/10 FROM programmer WHERE GENDER='M' AND PROF2='DBASE' ;
SELECT *
FROM studies
WHERE COURSE_FEE IN (
    SELECT AVG(course_fee) FROM studies
) + 1000
OR COURSE_FEE IN (
    SELECT AVG(course_fee) FROM studies
) - 1000;
     select* from studies where pname in (select pname from programmer where year(dob) in(select year(dob) from programmer where year(dob) between '1965' and '1970' )) and course_fee >=1400 and course='dca';
create database abi;



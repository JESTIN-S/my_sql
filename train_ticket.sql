select* from train_ticket;
drop table train_ticket;
describe train_ticket;
select * from train_ticket;	
-- the date in string so we change date formet and modify date data type																																			
UPDATE train_ticket SET Journey_Date = STR_TO_DATE(JOURNEY_DATE, '%d-%m-%Y');
alter table train_ticket modify column Journey_Date DATE;
-- 1).	Display total seats across all trains on journey_date 12/03/2013
     select * from train_ticket where DATE(Journey_Date)="2023-05-13";  
-- 2).	Display maximum and minimum number of seats for train_no 222
    select max(seats),min(seats) from train_ticket where train_no="222";
-- 3).	Display class wise total seats
    select sum(seats),class from train_ticket group by class;
-- 4).	Concatenate Class and Seats and display the results
	select class,seats from train_ticket;
-- 5).	Display the current date and time
	select current_timestamp();select now();select curdate(),current_time();
-- 6).	Display Number of Months between Journey date and current date
      select timestampdiff(month,journey_date,now()) from train_ticket;
-- 7).	How to find Whether the character A is a available in the class
      select class from train_ticket where class like '%A';
-- 8).	Display the month and year alone from each date
      select month(journey_date),month(journey_date),dayofmonth(journey_date),monthname(journey_date) from train_ticket;
-- 9).	Display the journey date from 1 year from the current date
      select timestampdiff(year,journey_date,now() )from train_ticket;
-- 10).	Display the last date of the month for the train number 222 and class 1A
      select date(journey_date) from train_ticket where train_no=222 and class='1A';

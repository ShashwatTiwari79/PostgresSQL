select * from covid_data limit 20;
select distinct country_region from covid_data;
select name from employees;
alter table employees add phone varchar(50)
update employees set phone = '9234331522' where name = 'Shashwat';
Alter table employees rename to Shashwat;
drop table shashwat;
select * from shashwat;
truncate table employees;
select * from country_wise_latest where "WHO Region" = 'Europe'
select * from country_wise_latest where "1 week change" < 500;
select * from country_wise_latest where "Country/Region" Like 'C%';
select * from country_wise_latest where "Country/Region" Like 'C%' and "Confirmed" < 1000;
select * from country_wise_latest where "Country/Region" like 'C%' or "Country/Region" Like 'B%';
select * from country_wise_latest where "WHO Region" in ('Americas','Europe')
select * from country_wise_latest where "Active" between 1000 and 2000;
select * from country_wise_latest  where "1 week % increase" IS NULL;
select * from country_wise_latest where "Country/Region" not in ('Americas','Europe')
select * from country_wise_latest where "WHO Region" is not NULL;
select distinct "WHO Region" from country_wise_latest;
select count(distinct "Country/Region") from country_wise_latest;
select * from country_wise_latest ORDER BY "Active";
select * from country_wise_latest limit 20;
select * from country_wise_latest limit 20 offset 40;
select min("1 week change") from country_wise_latest;
select max("1 week change") from country_wise_latest;
select min("1 week change") as minium_change_in_week from country_wise_latest;
select count("Country/Region") from country_wise_latest;
select count("Confirmed") from country_wise_latest where "WHO Region" = "Europe";
select sum("1 week % increase") from country_wise_latest;
select avg("Confirmed")::numeric(10,2) from country_wise_latest;
select * from country_wise_latest where "WHO Region" like 'E___pe';
select * from country_wise_latest where "WHO Region" in ('Europe','Americas','Africa');
select * from country_wise_latest where "WHO Region" not in ('Europe','Americas','Africa');
select * from country_wise_latest where "Country/Region" in ( select "Country/Region" From country_wise_latest where "Confirmed"<100);
select * from country_wise_latest where "Active" between 100 and 200;
select * from country_wise_latest where "Country/Region" between 'Malaysia' and 'Thailand';


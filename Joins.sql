--INNER JOIN--
select "Country/Region" , "WHO Region" , "Active"
From country_wise_latest c
Inner Join covid_data v on c."WHO Region"=v."who_region";
--LEFT JOIN--
select "Country/Region", "Date" , "No. of countries"
from country_wise_latest c
left join day_wise d
on c."New cases"=d."New cases";
--RIGHT JOIN--
select "Date" , "No. of countries","Country/Region" , "WHO Region"
from day_wise d
right join country_wise_latest c
on d."New cases" = c."New cases"
--FULL JOIN--
select "Country/Region" , "WHO Region" , "Date"
from day_wise d
full join country_wise_latest c
on d."Active"=c."Active";


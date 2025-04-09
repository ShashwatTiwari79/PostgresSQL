
--Using JOINS to combine the covid_deaths and covid_vaccine table:

CREATE TABLE covid_vaccine (
    id SERIAL PRIMARY KEY,
    "Country/Region" VARCHAR(100),
	Continent VARCHAR(100),
    Date DATE,
    People_vaccinated BIGINT,          
    People_fully_vaccinated BIGINT,    
    Vaccines TEXT                      
);

INSERT INTO covid_vaccine ("Country/Region", Date, People_vaccinated, People_fully_vaccinated, Vaccines) VALUES
('India', '2021-12-20', 32095958, 31420042, 'Covaxin'),
('USA', '2021-06-07', 51744209, 29696222, 'AstraZeneca, Covaxin, Moderna'),
('Brazil', '2021-05-22', 29940019, 21053080, 'Sinopharm, Sinovac, Moderna'),
('UK', '2021-09-03', 42835856, 19255922, 'Sinopharm, Pfizer/BioNTech, Sputnik V'),
('Russia', '2021-08-01', 71888907, 67254980, 'Moderna, Sinopharm'),
('France', '2021-12-04', 2336961, 2010072, 'AstraZeneca, Sinopharm'),
('Germany', '2021-03-09', 45784782, 17216543, 'Sinopharm'),
('Italy', '2021-04-01', 37861529, 16696305, 'Johnson&Johnson, Sputnik V, Sinovac'),
('Canada', '2021-06-11', 36451668, 6973469, 'Moderna, Sputnik V, Sinopharm'),
('Australia', '2021-02-16', 28271812, 5347802, 'Johnson&Johnson, Covaxin, Moderna'),
('Japan', '2021-10-03', 85256419, 45114282, 'AstraZeneca, Pfizer/BioNTech'),
('China', '2021-12-27', 33950722, 18860949, 'Johnson&Johnson, Sinopharm, Sputnik V'),
('South Africa', '2021-01-28', 60756794, 30802573, 'AstraZeneca, Sinopharm'),
('Mexico', '2021-07-09', 38819399, 17144752, 'Johnson&Johnson, Sputnik V'),
('Spain', '2021-02-06', 90174564, 66170088, 'Moderna, Covaxin, Sinovac'),
('Indonesia', '2021-08-18', 49968904, 19203397, 'Pfizer/BioNTech, Sputnik V'),
('Turkey', '2021-12-23', 53611439, 34632934, 'Johnson&Johnson, Moderna'),
('Argentina', '2021-09-05', 73644938, 71103845, 'Pfizer/BioNTech'),
('Saudi Arabia', '2021-10-27', 33514620, 12301217, 'Sinopharm, Sputnik V, Sinovac'),
('South Korea', '2021-04-26', 32015334, 20578233, 'Moderna, AstraZeneca'),
('Egypt', '2021-01-11', 67109882, 33376442, 'Johnson&Johnson, Covaxin, Pfizer/BioNTech'),
('Nigeria', '2021-06-13', 54725869, 31841587, 'Pfizer/BioNTech, Sinovac'),
('Pakistan', '2021-07-06', 25253849, 16276082, 'AstraZeneca'),
('Bangladesh', '2021-12-12', 20200094, 15342295, 'Moderna, Pfizer/BioNTech'),
('Poland', '2021-03-07', 35984096, 19873393, 'Covaxin, Sinovac');



SELECT v."Country/Region", w."Population",
MAX(v.People_vaccinated) AS total_people_vaccinated,
ROUND(MAX(v.People_vaccinated) * 100.0 / NULLIF (w."Population", 0), 2) AS percent_vaccinated
FROM covid_vaccine v
JOIN worldometer w ON v."Country/Region" = w."Country/Region"
GROUP BY 
v."Country/Region", w."Population"
ORDER BY 
 percent_vaccinated DESC
LIMIT 20;

SELECT "Country/Region",Vaccines,
COUNT(*) AS record_count
FROM covid_vaccine
WHERE "Country/Region" = 'India'
GROUP BY "Country/Region", Vaccines;

SELECT "Country/Region",
 MAX(People_vaccinated) AS total_vaccinated,
 MAX(People_fully_vaccinated) AS total_fully_vaccinated,
 ROUND(MAX(People_fully_vaccinated) * 100.0 / NULLIF(MAX(People_vaccinated), 0), 2) AS percent_fully_vaccinated
FROM  covid_vaccine
GROUP BY "Country/Region"
ORDER BY 
percent_fully_vaccinated DESC
LIMIT 20;
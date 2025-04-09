--#1
--Globally--
SELECT 
  ROUND(SUM("TotalDeaths") * 100.0 / SUM("TotalCases"), 2) AS global_death_percent
FROM 
  worldometer;
--locally--
SELECT 
  "Country/Region" AS country,
  "TotalCases",
  "TotalDeaths",
  ROUND("TotalDeaths" * 100.0 / NULLIF("TotalCases", 0), 2) AS local_death_percent
FROM 
  worldometer
ORDER BY 
  local_death_percent DESC;

--#2
--globally--
  SELECT 
  ROUND(SUM("TotalCases") * 100.0 / SUM("Population"), 2) AS global_infection_percent
FROM 
  worldometer;
--locally--
 SELECT 
  "Country/Region" AS country,
  "TotalCases",
  "Population",
  ROUND("TotalCases" * 100.0 / NULLIF("Population", 0), 2) AS local_infection_percent
FROM 
  worldometer
ORDER BY 
  local_infection_percent DESC;

--#3
select "Country/Region" ,
max("TotalCases") as most_infected_countries
from worldometer
group by "Country/Region"
order by most_infected_countries DESC
limit 10;

--#4
SELECT 
  "Country/Region",
  SUM(COALESCE("TotalDeaths", 0)) AS highest_death_count
FROM 
  worldometer
GROUP BY 
  "Country/Region"
ORDER BY 
  highest_death_count DESC
LIMIT 10;

--#5(by continent)
SELECT "Continent" AS continent,
  ROUND(AVG(COALESCE("NewDeaths", 0)), 2) AS avg_daily_deaths
FROM worldometer
GROUP BY 
"Continent"
ORDER BY 
  avg_daily_deaths DESC;
--#5(by country)
SELECT "Country/Region", 
SUM(COALESCE("TotalDeaths", 0)) AS highest_death_count
FROM worldometer
GROUP BY 
  "Country/Region"
ORDER BY 
  highest_death_count DESC
LIMIT 10;

--#6
SELECT 
  "Country/Region" AS country,
  "TotalCases",
  "Population",
  ROUND(("TotalCases" * 100.0) / NULLIF("Population", 0), 2) AS infection_percent
FROM worldometer
WHERE "Population" IS NOT NULL AND "TotalCases" IS NOT NULL
ORDER BY 
  infection_percent DESC
LIMIT 10;
     
	     
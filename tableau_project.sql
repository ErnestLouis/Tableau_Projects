/*
Queries used for Tableau Project

*/

--Table 1
--DISPLAYS WORLDWIDE STATS
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS INT)) AS total_deaths, SUM(cast(new_deaths AS INT))/SUM(new_cases)*100 AS death_percentage
FROM Covid19Project..Covid_Deaths
WHERE continent IS NOT NULL
ORDER BY 1,2


--Table 2
--In order to remain consistent with the rows not included in the above query are removed 
-- European Union is part of Europe

SELECT location, SUM(cast(new_deaths AS INT)) AS total_deaths
FROM Covid19Project..Covid_Deaths
WHERE continent IS NULL
AND location NOT IN ('World', 'European Union', 'International','Upper middle income','Lower middle income','Low income','High income')
GROUP BY location
ORDER BY 2 desc

--Table 3

--SELECT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION
SELECT Location, population,MAX(total_cases) AS highest_case_count,MAX(ROUND((total_cases/population)*100,3)) as case_percentage--to get percentage rounded 3 decimal places
FROM Covid19Project..Covid_deaths
Group BY Location, Population
ORDER BY case_percentage desc

--Table 4
SELECT Location, population,date,MAX(total_cases) AS highest_case_count,MAX(ROUND((total_cases/population)*100,3)) as case_percentage--to get percentage rounded 3 decimal places
FROM Covid19Project..Covid_deaths
Group BY Location, Population,date
ORDER BY case_percentage desc

-- # World Life Expectancy Project (Data Cleaning)

SELECT * 
FROM world_life_expectancy
;

-- Identify duplicates
SELECT country, year, CONCAT(country,year), COUNT(CONCAT(country,year))
FROM world_life_expectancy
GROUP BY country, year, CONCAT(country,year)
HAVING COUNT(CONCAT(country,year)) > 1
;

-- Remove duplicates
SELECT *
FROM (
	SELECT Row_ID, 
	CONCAT(Country, Year),
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year))AS Row_Num
	FROM world_life_expectancy
) AS Row_Table
WHERE Row_Num > 1
;

DELETE FROM world_life_expectancy
WHERE 
	Row_ID IN (
    SELECT Row_ID
FROM (
	SELECT Row_ID, 
	CONCAT(Country, Year),
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year))AS Row_Num
	FROM world_life_expectancy
) AS Row_Table
WHERE Row_Num > 1
)
;

-- Find and update empty rows in Status column

SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE Status <> ''
;

SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing'
;

UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE COUNTRY IN (
	SELECT DISTINCT(Country)
	FROM world_life_expectancy
	WHERE Status = 'Developing')
    ;
    
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developing'
;

SELECT *
FROM world_life_expectancy
WHERE Country = 'United States of America'
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developed'
;

SELECT *
FROM world_life_expectancy;

SELECT *
FROM world_life_expectancy
WHERE `Lifeexpectancy` = '';

-- Calculate missing Life Expectancy values by finding the avg between the years before and after

SELECT t1.Country, t1.Year, t1.`Lifeexpectancy`,
t2.Country, t2.Year, t2.`Lifeexpectancy`, 
t3.Country, t3.Year, t3.`Lifeexpectancy`,
ROUND((t2.`Lifeexpectancy` + t3.`Lifeexpectancy`)/2,1)
FROM world_life_expectancy t1
JOIN  world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN  world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
WHERE t1.`Lifeexpectancy` = ''
;

UPDATE world_life_expectancy t1
JOIN  world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN  world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
SET t1.`Lifeexpectancy` = ROUND((t2.`Lifeexpectancy` + t3.`Lifeexpectancy`)/2,1)
WHERE t1.`Lifeexpectancy` = ''
;

-- # World Life Expectancy Project (Exploratory Data Analysis)
-- Data cleaning
-- Find insights + trends

SELECT *
FROM world_life_expectancy;

-- Lowest + highest life expectancy -- how each country has increased their life expectancy
SELECT Country,
MIN(`Lifeexpectancy`),
MAX(`Lifeexpectancy`),
ROUND(MAX(`Lifeexpectancy`) - MIN(`Lifeexpectancy`),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Lifeexpectancy`) <> 0
AND MAX(`Lifeexpectancy`) <> 0
ORDER BY Life_Increase_15_Years ASC
;

SELECT Year, ROUND(AVG(`Lifeexpectancy`),2)
FROM world_life_expectancy
WHERE `Lifeexpectancy` <> 0
GROUP BY Year
ORDER BY Year
;

-- Correlation between life expectancy + GDP 
-- Lower GDP are fairly correlated with lower life expectancy
-- Low GDP countries have a 10 year lower life expectancy than high GDP countries

SELECT *
FROM world_life_expectancy;

SELECT Country, ROUND(AVG(`Lifeexpectancy`),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY GDP ASC
;

SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Lifeexpectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Lifeexpectancy` ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy
;

-- Average Life expectancy between Developed and Developing Country Statues

SELECT Status
FROM world_life_expectancy
GROUP BY Status
;

SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Lifeexpectancy`),1)
FROM world_life_expectancy
GROUP BY Status
;

-- Correlation between Life expectancy and BMI
-- Lower BMI, lower life expectancy

SELECT Country, 
ROUND(AVG(`Lifeexpectancy`),1) AS Life_Exp, 
ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND BMI > 0
ORDER BY BMI ASC
;

-- Correlation between adult mortality and life expectancy

SELECT *
FROM world_life_expectancy
;

SELECT Country, 
Year,
`Lifeexpectancy`,
`AdultMortality`,
SUM(`AdultMortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%United%'
;

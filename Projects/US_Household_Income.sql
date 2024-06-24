-- # US Household Income Data Cleaning

SELECT * 
FROM US_Project.us_household_income;

SELECT * 
FROM US_Project.us_household_income_statistics;

SELECT COUNT(id)
FROM US_Project.us_household_income;

SELECT COUNT(id)
FROM US_Project.us_household_income_statistics;

-- Identify Duplicates

SELECT id, COUNT(id)
FROM US_Project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

-- Remove Duplicates

SELECT *
FROM (
	SELECT row_id,
	id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM US_Project.us_household_income
    ) duplicates
    WHERE row_num > 1
;

DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM US_Project.us_household_income
		) duplicates
    WHERE row_num > 1)
;

SELECT DISTINCT State_Name
FROM US_Project.us_household_income
;

UPDATE US_Project.us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE US_Project.us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT *
FROM US_Project.us_household_income
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT Type, COUNT(Type)
FROM US_Project.us_household_income
GROUP BY Type;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

SELECT ALand, AWater
FROM US_Project.us_household_income
WHERE ALand = 0 OR ALand = '' OR ALand IS NULL
 ;
 
-- # US Household Income Exploratory Data Analysis
 
SELECT * 
FROM US_Project.us_household_income;

SELECT * 
FROM US_Project.us_household_income_statistics;

-- Most Area of Land/Water By State

-- Top 10 By Land Area
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM US_Project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

-- Top 10 By Water Area
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM US_Project.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;


SELECT * 
FROM US_Project.us_household_income u
JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id;
    
SELECT * 
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0;

SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0;

-- Average Mean + Median Household Income by State
SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 10
;

-- Average Household Income by Type
SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 3 DESC
LIMIT 20
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20
;

SELECT * 
FROM US_Project.us_household_income u
JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id;

-- Average Household Income by City Level
SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY 3 DESC
    ;

    

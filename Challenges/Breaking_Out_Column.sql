-- Moderate Level: 25 points

-- The addresses in this table are in a very strange format. We actually need them broken out into street address, city, state, and zip code, but currently it's pretty unusable. Write a query to break out this column into street, city, state, and zip_code with those names exactly.

SELECT
  SUBSTRING_INDEX(address,'- ',1) AS street,
  SUBSTRING_INDEX(SUBSTRING_INDEX(address,'- ',2),'- ',-1) AS city,
  SUBSTRING_INDEX(SUBSTRING_INDEX(address,'- ',-2),'- ',1) AS state_,
  SUBSTRING_INDEX(address,'- ',-1) AS zip_code
FROM addresses;

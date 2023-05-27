-- lets operating bit smaller database
-- May 2021 trips take first 100000 rows

-- change column Covered_distance_m to decimal
alter table BiketripsMay2021 alter column Covered_distance_m decimal;

-- delete all distances between 0m - 250m
delete from [BiketripsMay2021] where Covered_distance_m between 0 and 250;

-- delete all Duration_sec under 180s = 3min
delete from [BiketripsMay2021] where Duration_sec between 0 and 180;

-- testquery
select duration_sec from BiketripsMay2021 where return_station_name='Pasilan asema';

-- Take first 100000 rows
DELETE FROM BiketripsMay2021
WHERE Departure NOT IN (
  SELECT TOP (1000) WITH TIES Departure
  FROM BiketripsMay2021
  ORDER BY Departure ASC
)

-- make unique ID for all trips by growing ID number
ALTER TABLE dbo.BiketripsMay2021 ADD ID INT IDENTITY(1,1) NOT NULL;

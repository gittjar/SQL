-- tehdään taulu pienemmällä datamäärällä
-- May 2021 matkat ja joista 1000 ekaa matkaa kehitystä varten

-- poista kaikki matkat joiden pituus 0m
delete from [BiketripsMay2021] where Covered_distance_m='0';

-- vaihda kolumnin covered distance tyypiksi decimal
alter table BiketripsMay2021 alter column Covered_distance_m decimal;
GO

-- testikysely
select duration_sec from BiketripsMay2021 where return_station_name='Pasilan asema';

-- Pienennetään kehitystä varten taulukko
-- Otetaan 1000 ekaa riviä, muut deletoidaan
DELETE FROM BiketripsMay2021
WHERE Departure NOT IN (
  SELECT TOP (1000) WITH TIES Departure
  FROM BiketripsMay2021
  ORDER BY Departure ASC
)

-- AZURE SQL
-- CITYBIKE

CREATE TABLE citybikestations (
    FID int,
    ID int,
    Nimi varchar(100),
    Namn varchar(100),
    Name varchar(100),
    Osoite varchar(100),
    Adress varchar(100),
    Kaupunki varchar(100),
    Stad varchar(100),
    Operaattor varchar(100),
    Kapasiteet tinyint,
    x decimal(8,6),
    y decimal(9,6)
);

-- Set station to Helsinki where rest of stations are NULL
-- ESPOO OK
update Station set Kaupunki='Helsinki' where Kaupunki IS NULL;
update Station set Operaattor='Citybike Finland' where Operaattor IS NULL;

--  AZURE SQL
--  CREATING JARNOS RECORDS DATABASE
--

CREATE DATABASE JarnosRecordsDB;
Go

SELECT Name from sys.databases;
Go

Use JarnosRecordsDB;

CREATE TABLE Records (
    Id INT IDENTITY PRIMARY KEY NOT NULL,
    ArtistName NVARCHAR(150),
    RecordName NVARCHAR(250),
    Published smalldatetime,
    Genre NVARCHAR(50),
    Label NVARCHAR(150),
    RecordImage VARBINARY (max),
    ExtraInformation NVARCHAR
)
Go

-- Create subtables

-- Genre
CREATE TABLE Genre (
Id INT IDENTITY PRIMARY KEY NOT NULL,
GenreName NVARCHAR(50)
)
ALTER TABLE Records ADD GenreId INT
ALTER TABLE Records ADD CONSTRAINT FK_Genre
FOREIGN KEY (GenreId)
REFERENCES Genre(Id)

-- ArtistName
CREATE TABLE ArtistName (
Id INT IDENTITY PRIMARY KEY NOT NULL,
ArtistName NVARCHAR(150)
)
ALTER TABLE Records ADD ArtistNameId INT
ALTER TABLE Records ADD CONSTRAINT FK_ArtistName
FOREIGN KEY (ArtistNameId)
REFERENCES ArtistName(Id)

-- show tables
select schema_name(t.schema_id) as schema_name,
       t.name as table_name,
       t.create_date,
       t.modify_date
from sys.tables t
order by schema_name,
         table_name;

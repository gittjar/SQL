--  Azure SQL
--  CREATING JARNOS RECORDS DATABASE
--

CREATE DATABASE JarnosRecordsDB;
Go

SELECT Name from sys.databases;
Go

Use JarnosRecordsDB;

CREATE TABLE RECORDS (
    Id INT IDENTITY PRIMARY KEY NOT NULL,
    ArtistName NVARCHAR(150),
    RecordName NVARCHAR(250),
    Published smalldatetime,
    RecordImage VARBINARY (max),
    ExtraInformation NVARCHAR
)
Go

-- Create subtables
-- GENRE

CREATE TABLE GENRES (
   GID INT NOT NULL,
   GenreName VARCHAR (50) NOT NULL,
   RECORD_ID INT NOT NULL
);

-- LABEL

CREATE TABLE LABELS (
    LID INT NOT NULL,
    LabelName VARCHAR (100) NOT NULL,
    RECORD_ID INT NOT NULL
)

-- show tables
select schema_name(t.schema_id) as schema_name,
       t.name as table_name,
       t.create_date,
       t.modify_date
from sys.tables t
order by schema_name,
         table_name;

-- Adds Metallica album 
INSERT INTO Records (ArtistName, RecordName, Published) VALUES ('Metallica', 'Black Album', '08-12-1991');

Insert Into Genres (GID, GenreName, RECORD_ID) values (101, 'Heavy Metal', 1);
INSERT INTO Labels (LID, LabelName, RECORD_ID) VALUES (201, 'Elektra Records', 1);

-- inner join multiple tables
select Id,ArtistName,RecordName,GenreName,LabelName from records inner join
genres on records.Id = genres.RECORD_ID inner join labels on
records.Id = labels.RECORD_ID;

-- drop database JarnosRecordsDB;

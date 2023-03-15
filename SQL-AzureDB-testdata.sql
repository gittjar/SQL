-- SQL Server Azure commands :: feed your database with companydata!
-- RUN THESE >

create table companytaulu(
Id integer not null primary key,
companyname varchar(80) not null,
industry varchar(80) not null,
founded int not null,
hq varchar(80) not null,
countryid varchar(4) not null
);

insert into companytaulu values(1,'Apple','Technology',1976,'Cupertino','USA');
insert into companytaulu values(2,'Microsoft','Software',1975,'Redmond','USA');
insert into companytaulu values(3,'Total','Energy and Petroleum',1924,'Courbevoie','FRA');
insert into companytaulu values(4,'Nestle','Food',1866,'Vevey','SUI');
insert into companytaulu values(5,'Daimler','Automobiles',1883,'Stuttgart','GER');
insert into companytaulu values(6,'Maersk','Freight Transport',1904,'Copenhagen','DEN');
insert into companytaulu values(7,'Burger King','Fast food restaurant',1954,'Miami-Dade County','USA');
insert into companytaulu values(8,'UPM','Paper, Pulp and Bioenergy',1996,'Helsinki','FIN');
insert into companytaulu values(9,'Kone','Elevators and automatic doors',1910,'Espoo','FIN');
insert into companytaulu values(10,'SAAB','Aerospace and defence',1937,'Stockholm','SWE');

select * from companytaulu;


-- CREATE LOGIN
-- Commands >
--
USE master;
CREATE LOGIN UserName1 WITH password='VaikeaSalasana2';
GO

-- CREATE USER FOR TESTIDB
-- USE This user for connectionstring
-- Datawriter can insert, delete and update database data
-- Server=tcp:yourdatabasenamehere.database.windows.net,1433;Initial Catalog=testiDB;Persist Security Info=False;User ID=UserName1;Password=VaikeaSalasana2;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
-- Commands >
-- 
Use testiDB;
CREATE USER UserName1 from LOGIN UserName1;
GO
EXEC sp_addrolemember 'db_datawriter', 'UserName1';
GO

-- drop user UserName1;

-- Select users and see their priviledges etc.
--
select name as username,
       create_date,
       modify_date,
       type_desc as type,
       authentication_type_desc as authentication_type
from sys.database_principals
where type not in ('A', 'G', 'R', 'X')
       and sid is not null
order by username;

--
-- 

SELECT    roles.principal_id                            AS RolePrincipalID
  ,    roles.name                                    AS RolePrincipalName
  ,    database_role_members.member_principal_id    AS MemberPrincipalID
  ,    members.name                                AS MemberPrincipalName
 FROM sys.database_role_members AS database_role_members  
 JOIN sys.database_principals AS roles  
  ON database_role_members.role_principal_id = roles.principal_id  
 JOIN sys.database_principals AS members  
  ON database_role_members.member_principal_id = members.principal_id;  
 GO

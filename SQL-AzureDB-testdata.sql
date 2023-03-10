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

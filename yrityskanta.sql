-- creates database
-- works in MariaDb
--
drop database if exists yrityskanta;
create database yrityskanta;

use yrityskanta;

create table osasto (
    osastoId integer not null primary key,
    osastonNimi varchar(30) not null,
    osastonSijainti varchar(15) not null
);

create table henkilo (
    henkiloId integer not null primary key,
    etunimi varchar(20) not null,
    sukunimi varchar(35) not null,
    palkka decimal(6,2) not null,
    osastonumero integer not null,
    foreign key(osastonumero) references osasto(osastoId)
);

create table osastopaallikko (
    osastoId integer not null,
    henkiloId integer not null,
    primary key (osastoId,henkiloId),
    foreign key (osastoId) references osasto(osastoId),
    foreign key (henkiloId) references henkilo(henkiloId)
);

insert into osasto values(1,'ict','kellari');
insert into osasto values(2,'hallinto','kattohuoneisto');
insert into osasto values(3,'huolto','verstas');
insert into osasto values(4,'vartijat','katutaso');
insert into osasto values(5,'kuljetus','autotalli');


insert into henkilo values(1,'Matti','Makinen',3950,1);
insert into henkilo values(2,'Mikko','Guggenheim',3600,2);
insert into henkilo values(3,'Marja','Ahola',5400,2);
insert into henkilo values(4,'Tarja','Nieminen',6400,4);
insert into henkilo values(5,'Heikki','Eskola',3400,3);
insert into henkilo values(6,'Pekka','Virtanen',3590,1);
insert into henkilo values(7,'Pekka','Vanhanen',3790,3);
insert into henkilo values(8,'Mauno','McDonald',3570,2);


insert into osastopaallikko values(1,6);
insert into osastopaallikko values(2,3);
insert into osastopaallikko values(3,3);
insert into osastopaallikko values(4,3);

-- different queries

use yrityskanta;

select * from osasto;
select * from henkilo;

select * from henkilo inner join osasto on henkilo.osastonumero=osasto.osastoId;
select sukunimi,etunimi,osastonNimi,osastonSijainti from henkilo inner join osasto on osastonumero=osastoId;

select sukunimi,etunimi,osastonNimi,osastonSijainti from henkilo inner join osasto on osastonumero=osastoId
order by osastonNimi asc,sukunimi asc,etunimi asc;

select * from henkilo inner join osasto on osastonumero=osastoId where osastonNimi='ict' order by sukunimi asc;

select round(avg(palkka),2) as 'ict keskipalkka' from henkilo
where osastonumero=1;

select etunimi,sukunimi,osastonNimi from henkilo inner join
osasto on osastonumero=osastoId where palkka = (select min(palkka) from henkilo)
order by sukunimi asc,etunimi asc;

select etunimi,sukunimi,osastonNimi from henkilo inner join
osasto on osastonumero=osastoId where palkka = (select max(palkka) from henkilo)
order by sukunimi asc,etunimi asc;

select etunimi,sukunimi,osastonNimi,palkka from henkilo inner join
osasto on osastonumero=osastoId where palkka < (select avg(palkka) from henkilo)
order by sukunimi asc,etunimi asc;

select etunimi,sukunimi,osastonNimi,palkka, case
when palkka > (select avg(palkka) from henkilo) then 'yli keskitason'
when palkka < (select avg(palkka) from henkilo) then 'alle keskitason'
else 'keskitasolla' end as 'palkkataso' from henkilo inner join
osasto on osastonumero=osastoId;

select osastonNimi, sukunimi from osasto
left join henkilo on osastoId=osastonumero;

select etunimi,sukunimi,osastonNimi as 'tämän osaston päällikkö'
from henkilo inner join osastopaallikko on henkilo.henkiloId=osastopaallikko.henkiloId
inner join osasto on osastopaallikko.osastoId=osasto.osastoId;

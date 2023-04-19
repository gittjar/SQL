-- MARIA DB

drop database if exists henkilostokanta;
create database henkilostokanta;

use henkilostokanta;

create table henkilo(
    henkiloNro integer not null primary key,
    etunimi varchar(20) not null,
    sukunimi varchar(30) not null,
    osasto varchar(15),
    palkka decimal(6,2)
);

-- CREATE USER FOR TIETOKANTA

drop user if exists 'yllapito'@'localhost';
create user 'yllapito'@'localhost' identified by 'salainen';
grant all privileges on henkilostokanta.* to 'yllapito'@'localhost';

insert into henkilo values(1,'Matti','Virtanen','ict',3500);
insert into henkilo values(2,'Mari', 'Nieminen','hallinto',5000);
insert into henkilo values(3,'Mikko', 'Peltonen','ict',4500);
insert into henkilo values(4,'Pekka', 'Peltonen','markkinointi',6000);
insert into henkilo values(5,'Hanna-Liisa', 'Aaltonen','hallinto',7000);
insert into henkilo values(6,'Hanna-Liisa', 'Hämäläinen','talousosasto',8000);

--
-- 
--

use henkilostokanta;

select sukunimi,count(*) from henkilo group by sukunimi;

select sukunimi,count(*) as lkm from henkilo 
group by sukunimi having count(*)>1;

select sukunimi,count(*) as lkm from henkilo 
group by sukunimi having lkm>1;

select sukunimi,count(*) as lkm from henkilo 
group by sukunimi having lkm>1 
order by lkm desc;

select sukunimi,etunimi from henkilo 
where sukunimi in ('Virtanen','Peltonen') 
order by sukunimi asc, etunimi asc;

select sukunimi,etunimi from henkilo 
where sukunimi not in ('Aaltonen','Hämäläinen') 
order by sukunimi asc, etunimi asc;

select sukunimi,etunimi from henkilo 
where sukunimi='Peltonen' or sukunimi='Aaltonen' 
order by sukunimi asc, etunimi asc;

select etunimi,sukunimi from henkilo where palkka between 4500 and 7000;

select etunimi,sukunimi,palkka from henkilo where palkka between 4500 and 7000;

select etunimi,sukunimi,palkka from henkilo 
where palkka between 4500 and 7000 
order by palkka desc;

select etunimi,sukunimi,palkka from henkilo
where palkka > 4500 and palkka <7000
order by palkka desc;

--
-- WILDCARDS
--

select etunimi from henkilo where etunimi like 'M%';
select etunimi from henkilo where etunimi like 'M_t%';

select * from henkilo where osasto like '%c%';
select * from henkilo where osasto like '___';
select * from henkilo where etunimi like '_e%';
select * from henkilo where etunimi like '%a';
select * from henkilo where etunimi like 'P%a';
select * from henkilo where etunimi like 'Hanna_Liisa';
select * from henkilo where etunimi like 'Hanna\_Liisa';
select * from henkilo where etunimi like 'Hanna\_%';
select * from henkilo where etunimi like 'Hanna_%';
select * from henkilo where etunimi like 'Hanna%';

select etunimi,sukunimi,palkka from henkilo
where palkka < (select avg(palkka) from henkilo);

select avg(palkka) from henkilo;

select round(avg(palkka),2) as keskipalkka from henkilo;

select etunimi,sukunimi,palkka from henkilo
where palkka > (select avg(palkka) from henkilo);

select etunimi,sukunimi,palkka, case
    when palkka >=7000 then 'huipputulot'
    else '-' end as kommentti
from henkilo;

select etunimi,sukunimi,palkka, case
    when palkka >=7000 then 'huipputulot'
    end as kommentti
from henkilo;

select etunimi,sukunimi,palkka, case
    when palkka=(select min(palkka) from henkilo) then 'pienin'
    when palkka=(select max(palkka) from henkilo) then 'suurin'
    else '' end as huomautus
from henkilo;

select etunimi,sukunimi,palkka, case
    when palkka=(select min(palkka) from henkilo) then 'pienin'
    when palkka=(select max(palkka) from henkilo) then 'suurin'
    else '' end as huomautus
from henkilo
order by palkka asc;


select rand();
select etunimi, rand() as sat from henkilo;
select etunimi, rand() as sat from henkilo order by sat;
  
select current_date;
select year(current_date);
select day(current_date);
select month(current_date);
select year(current_date)-1990;
select current_timestamp;
select current_time;

select coalesce(max(henkiloNro),0)+1 from henkilo;

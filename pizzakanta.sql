--MariaDb
drop database if exists pizzakanta;
create database pizzakanta;

use pizzakanta;

create table pizza(
    pizzaId integer not null primary key,
    pizzanNimi varchar(50) not null
);

create table raaka_aine(
    raaka_aineId integer not null primary key,
    raaka_aineNimi varchar(40) not null
);

create table pizzan_raaka_aineet(
    pizzaNumero integer not null,
    raaka_aineNumero integer not null,
    primary key(pizzaNumero,raaka_aineNumero),
    foreign key (pizzaNumero) references pizza(pizzaId),
    foreign key (raaka_aineNumero) references raaka_aine(raaka_aineId)
);

drop user if exists 'pizzadude'@'localhost';
create user 'pizzadude'@'localhost' identified by 'pizzaisgod';

grant all privileges on pizzakanta.* to 'pizzadude'@'localhost';

insert into pizza values(1,'Margarita');
insert into pizza values(2,'Special Opera');
insert into pizza values(3,'Kebab Tulinen');
insert into pizza values(4,'Jarnos Favpizza');

insert into raaka_aine values(1,'jauheliha');
insert into raaka_aine values(2,'pepperoni');
insert into raaka_aine values(3,'kebab');
insert into raaka_aine values(4,'ananas');
insert into raaka_aine values(5,'jalapeno');
insert into raaka_aine values(6,'tomaatti');
insert into raaka_aine values(7,'paprika');
insert into raaka_aine values(8,'oliivi');
insert into raaka_aine values(9,'tonnikala');
insert into raaka_aine values(10,'kinkku');

select * from pizza;
select * from raaka_aine;

                                    -- p  a                       
insert into pizzan_raaka_aineet values( 1, 1);
insert into pizzan_raaka_aineet values( 1, 2);

insert into pizzan_raaka_aineet values( 2, 1);
insert into pizzan_raaka_aineet values( 2, 3);
insert into pizzan_raaka_aineet values( 2, 7);

insert into pizzan_raaka_aineet values( 3, 3);
insert into pizzan_raaka_aineet values( 3, 5);
insert into pizzan_raaka_aineet values( 3, 4);

insert into pizzan_raaka_aineet values( 4, 1);
insert into pizzan_raaka_aineet values( 4, 5);
insert into pizzan_raaka_aineet values( 4, 6);
insert into pizzan_raaka_aineet values( 4, 7);
insert into pizzan_raaka_aineet values( 4, 8);
insert into pizzan_raaka_aineet values( 4, 9);    

select * from pizzan_raaka_aineet;

-- kyselyitä

select * from pizza
inner join pizzan_raaka_aineet on pizzaNumero=pizzaId
inner join raaka_aine on raaka_aineNumero=raaka_aineId
where pizzanNimi='Margarita';

select pizzanNimi, raaka_aineNimi from pizza
inner join pizzan_raaka_aineet on pizzaNumero=pizzaId
inner join raaka_aine on raaka_aineNumero=raaka_aineId
where pizzanNimi='Margarita';

select distinct pizzanNimi as "Pizzan nimi", raaka_aineNimi as "Täytteet" from pizza
inner join pizzan_raaka_aineet on pizzaNumero=pizzaId
inner join raaka_aine on raaka_aineNumero=raaka_aineId;

SELECT count(DISTINCT pizzanNimi) as "Pizzojen lukumäärä" FROM pizza;

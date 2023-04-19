-- Azure SQL

-- case select
select companyname, founded, case when founded < 1960 then 'Founded before 1960'
when founded = 1960 then 'Founded 1960'
else 'Founded after 1960'
end as PerustettuInformation
from companytaulu;

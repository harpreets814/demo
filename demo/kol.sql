use count ;
-- this my comment what yu can do 
SELECT job_title,avg(min_salary) 
from jobs2_20
where min_salary>2
group by job_title
having avg(min_salary) >200;









alter table  countries1_20
ADD CONSTRAINT chk_region
CHECK (region_id>2);
create table harry(
telly int(2) not null,
malla varchar(4) unique,
primary key (telly),
foreign key (malla)
references raja(malla)
);
alter table countries1_20
modify telly int(2);

start transaction ;
update harry
set telly =10
where telly=1;

savepoint sp1;

update harry set telly =20 where telly =20;
rollback to sp1;

commit;
select* from students 
where name like 's%';
alter table countries1_20
rename column country_id  to yu;
rename table countries1_20 to yui;
insert into countries_20(country_name)
values(1);
select concat('hello','','world');
select sign(-8.5) from dual;
select sqrt(25) from dual ;

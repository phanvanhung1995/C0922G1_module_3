create database student_managerment;

create table class(
  id int, 
  name varchar(50)
);

insert into class(id, name) value(1, 'hung'), 
(2, 'hau'), 
(3, 'vu');
select 
  * 
from 
  class;
  
create table teacher(
  id int, 
  name varchar(50), 
  age int, 
  country varchar(150)
);
insert into teacher value(1, 'congnt', 31, 'da nang'), 
(2, 'chanh', 35, 'hue');

select 
  * 
from 
  teacher;

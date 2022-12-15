create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
  c_id int primary key, 
  c_name varchar(50), 
  c_age datetime
);

create table oder (
  o_id int primary key, 
  c_id int, 
  o_date datetime, 
  o_total_primer double, 
  foreign key (c_id) references customer(c_id)
);

create table product (
  p_id int primary key, 
  p_name varchar(50), 
  p_price double
);

create table oder_detail (
  o_id int, 
  p_id int, 
  od_qty varchar(50), 
  primary key (o_id, p_id), 
  foreign key (o_id) references oder (o_id), 
  foreign key (p_id) references product (p_id)
);

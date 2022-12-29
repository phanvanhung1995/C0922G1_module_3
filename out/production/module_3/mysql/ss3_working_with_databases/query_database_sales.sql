create database query_database_sales;
use sales_manager;
-- thêm dữ liệu customer
insert into customer 
values 
  (1, 'minh quan', 10), 
  (2, 'ngoc oanh', 20), 
  (3, 'hong ha', 50);

 -- thêm dữ liệu oder : 
insert into oder 
values 
  (1, 1, '2006/03/23', Null), 
  (2, 2, '2006/03/21', Null), 
  (3, 1, '2006/03/16', Null);
  
-- thêm dữ liệu cho product :
insert into product 
values 
  (1, 'May Giat', 3), 
  (2, 'Tu Lanh', 5), 
  (3, 'Dieu Hoa', 7), 
  (4, 'Quat', 1), 
  (5, 'Bep Dien', 2);
  
-- thêm dữ liệu oder_detail
insert into oder_detail 
values 
  (1, 1, 3), 
  (1, 3, 7), 
  (1, 4, 2), 
  (2, 1, 1), 
  (3, 1, 8), 
  (2, 5, 4), 
  (2, 3, 3);
  
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
  o_id, 
  o_date, 
  o_total_primer 
from 
  oder;
  
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được
-- mua bởi các khách
select 
  c_name, 
  p_name 
from 
  customer c 
  join oder o on c.c_id = o.c_id 
  join oder_detail od on o.o_id = od.o_id 
  join product p on p.p_id = od.p_id;
  
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select 
  distinct c_name 
from 
  customer c 
  inner join oder o on c.c_id = o.c_id 
  inner join oder_detail od on o.o_id = od.o_id 
  inner join product p on p.p_id = od.p_id;
  
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn 
-- được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
select 
 o.o_id,o_date, 
  (p_price * od_qty) as sum 
from 
  oder_detail od 
  join product p on od.p_id = p.p_id 
  join oder o on od.o_id = o.o_id;

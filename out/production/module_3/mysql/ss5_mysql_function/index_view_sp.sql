create database index_view_store_procedure;
use index_view_store_procedure;

create table products (
  id int primary key, 
  product_code int, 
  product_name varchar(50), 
  product_price int, 
  product_amount int, 
  product_description varchar(100), 
  product_status varchar(150)
);

insert into products (
  id, product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    1, 11, 'coca cola', 10000, 10, 'nuoc ngot co ga', 
    'ngon hon khi dung lanh'
  ), 
  (
    2, 12, 'number one', 12000, 20, 'nuoc tang luc', 
    'ngon hon khi dung lanh'
  ), 
  (
    3, 13, 'sting', 8000, 100, 'nuoc ngot', 
    'ngon hon khi dung lanh'
  );
  
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_product_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_product_name_price on products(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
explain 
select 
  * 
from 
  products 
where 
  product_code = 11;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_products as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  products;
  
-- Tiến hành sửa đổi view
-- đổi tên sản phẩm 1 thành sting dâu
update 
  w_products 
set 
  product_name = 'sting_dau' 
where 
  product_code = 11;
  
-- Tiến hành xoá view
-- xóa sản phẩm có tên sting
delete from 
  w_products 
where 
  product_name = 'sting';
  
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // create procedure get_all_products() begin 
select 
  * 
from 
  products;
end // delimiter;
call get_all_products();

-- Tạo store procedure thêm một sản phẩm mới
delimiter // create procedure add_products(
  id int, 
  product_code int, 
  product_name varchar(50), 
  product_price int, 
  product_amount int, 
  product_description varchar(100), 
  product_status varchar(150)
) begin insert into products (
  id, product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    id, product_code, product_name, product_price, 
    product_amount, product_description, 
    product_status
  );
end // delimiter;
call add_products(
  4, 13, 'sting', 8000, 100, 'nuoc ngot', 
  'ngon hon khi dung lanh'
);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // create procedure edit_products(
  new_id int, 
  new_product_code int, 
  new_product_name varchar(50), 
  new_product_price int, 
  new_product_amount int, 
  new_product_description varchar(100), 
  new_product_status varchar(150)
) begin 
update 
  products 
set 
  product_code = new_product_code, 
  product_name = new_product_name, 
  product_price = new_product_price, 
  product_amount = new_product_amount, 
  product_description = new_product_description, 
  product_status = new_product_status 
where 
  id = new_id;
end // delimiter;
call edit_products(
  4, 14, 'sting_dau', 9000, 200, 'nuoc_ngot', 
  'ngon_hon'
);

-- Tạo store procedure xoá sản phẩm theo id
delimiter // create procedure delete_products (new_id int) begin 
delete from 
  products 
where 
  id = new_id;
end // delimiter;
call delete_products(4);

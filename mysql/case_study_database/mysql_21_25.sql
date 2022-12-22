use furama_resort_management;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as 
select n.* from nhan_vien n
join hop_dong h on h.ma_nhan_vien = n.ma_nhan_vien
where dia_chia regexp 'liên Chiểu' and h.ngay_lam_hop_dong regexp '2020-07-14';

-- 22.	Thông qua khung nhìn v_nhan_ vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với 
-- tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
select * from v_nhan_vien;
update v_nhan_vien 
set dia_chia = 'Huế' ;
-- 23.	Tạo Stored Procedure sp_xoa_khachv_nhan_vien_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_delete_khach_hang (new_ma_khach_hang int)
begin 
delete from khach_hang
where ma_khach_hang = new_ma_khach_hang;
end //
delimiter ;

call sp_delete_khach_hang(6);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với
-- yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(
  new_ma_hop_dong int , new_ngay_lam_hop_dong datetime, 
  new_ngay_ket_thuc datetime, new_tien_dat_coc double, 
  new_ma_nhan_vien int, new_ma_khach_hang int, 
  new_ma_dich_vu int)
  begin
  insert into hop_dong (ma_hop_dong,ngay_lam_hop_dong, ngay_ket_thuc,tien_dat_coc, ma_nhan_vien,ma_khach_hang,
  ma_dich_vu) 
  values 
  (new_ma_hop_dong,new_ngay_lam_hop_dong, new_ngay_ket_thuc,new_tien_dat_coc, new_ma_nhan_vien,new_ma_khach_hang,
  new_ma_dich_vu) ;
  end //
  delimiter ;
  
-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng 
-- bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.


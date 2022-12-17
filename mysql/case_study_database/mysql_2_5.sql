use furama_resort_management;

-- 2.  Hiển thị thông tin của tất cả nhân viên có trong hệ thống
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select 
  * 
from 
  nhan_vien 
where 
  ho_ten regexp '^H|^T|^K' 
  and char_length(ho_ten) <= 15;
  
-- 3.  Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select 
  * 
from 
  khach_hang 
where 
  round(
    datediff(
      curdate(), 
      ngay_sinh
    )/ 365, 
    0
  ) between 18 
  and 50 
  and dia_chi like '%Đà Nẵng' 
  or dia_chi like '%Quảng Trị';
  
-- 4.  Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select 
  * 
from 
  khach_hang;
select 
  * 
from 
  loai_khach;
select 
  * 
from 
  hop_dong;
select 
  ho_ten, 
  count(h.ma_khach_hang) as so_lan_dat 
from 
  khach_hang k 
  join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
  join hop_dong h on h.ma_khach_hang = k.ma_khach_hang 
where 
  l.ten_loai_khach = "Diamond" 
group by 
  k.ma_khach_hang 
order by 
  count(k.ma_khach_hang);
  
-- 5.  Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
-- ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau:
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select 
  k.ma_khach_hang, 
  k.ho_ten, 
  l.ten_loai_khach, 
  h.ma_hop_dong, 
  d.ten_dich_vu, 
  h.ngay_lam_hop_dong, 
  h.ngay_ket_thuc, 
  sum(
    d.chi_phi_thue + ho.so_luong * di.gia
  ) as tong_tien 
from 
  khach_hang k 
  join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
  join hop_dong h on k.ma_khach_hang = h.ma_khach_hang 
  join dich_vu d on d.ma_dich_vu = h.ma_dich_vu 
  join hop_dong_chi_tiet ho on ho.ma_hop_dong = h.ma_hop_dong 
  join dich_vu_di_kem di on di.ma_dich_vu_di_kem = ho.ma_dich_vu_di_kem 
group by 
  h.ma_hop_dong, 
  k.ma_khach_hang 
order by 
  k.ma_khach_hang;

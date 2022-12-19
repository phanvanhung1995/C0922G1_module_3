use furama_resort_management;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select d.ma_dich_vu_di_kem, d.ten_dich_vu_di_kem, d.gia, d.don_vi, d.trang_thai
from dich_vu_di_kem d
join hop_dong_chi_tiet ho on ho.ma_dich_vu_di_kem = d.ma_dich_vu_di_kem
join hop_dong h on h.ma_hop_dong = ho.ma_hop_dong
join khach_hang k on k.ma_khach_hang = h.ma_khach_hang
join loai_khach l on l.ma_loai_khach = k.ma_loai_khach
where l.ten_loai_khach like 'Diamond' and k.dia_chi regexp 'Vinh||Quảng Ngãi' ;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
-- so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select h.ma_hop_dong, n.ho_ten, k.ho_ten, k.so_dien_thoai, d.ten_dich_vu,
 sum(ho.so_luong) as so_luong_dich_vu_di_kem, h.tien_dat_coc
from hop_dong h 
join nhan_vien n on n.ma_nhan_vien = h.ma_nhan_vien
join khach_hang k on k.ma_khach_hang = h.ma_khach_hang
join dich_vu d on d.ma_dich_vu = h.ma_dich_vu
join hop_dong_chi_tiet ho on ho.ma_hop_dong = h.ma_hop_dong
where h.ngay_lam_hop_dong between '2020-09-01' and '2020-12-31'
group by h.ma_hop_dong, n.ho_ten, k.ho_ten, k.so_dien_thoai, d.ten_dich_vu,h.tien_dat_coc
order by h.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng
-- đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select di.ma_dich_vu_di_kem, di.ten_dich_vu_di_kem, di.gia, di.don_vi,di.trang_thai,max(ho.so_luong) as so_luong
from dich_vu_di_kem di 
join hop_dong_chi_tiet ho on ho.ma_dich_vu_di_kem = di.ma_dich_vu_di_kem
group by di.ma_dich_vu_di_kem, di.ten_dich_vu_di_kem, di.gia, di.don_vi,di.trang_thai
order by so_luong desc
limit 1;
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem,
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

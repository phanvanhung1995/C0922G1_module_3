use furama_resort_management;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select h.ngay_lam_hop_dong,d.ma_dich_vu, d.ten_dich_vu, d.dien_tich,d.chi_phi_thue,l.ten_loai_dich_vu
  from dich_vu d
  join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu 
  join hop_dong h on h.ma_dich_vu = d.ma_dich_vu
  where h.ngay_lam_hop_dong not between '2021-01-01' and now()
  group by d.ma_dich_vu;
  
  -- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich,
  -- so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
  -- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
  -- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
  select  d.ma_dich_vu, d.ten_dich_vu, d.dien_tich,d.so_nguoi_toi_da,d.chi_phi_thue,
  l.ten_loai_dich_vu 
  from dich_vu d 
  join loai_dich_vu l on l.ma_loai_dich_vu = d.ma_loai_dich_vu
  join hop_dong h on h.ma_dich_vu = d.ma_dich_vu
  where h.ngay_lam_hop_dong between '2020-01-01' and '2020-12-30' 
  and h.ngay_lam_hop_dong not between '2021-01-01' and now()
  group by d.ma_dich_vu ;
  
  -- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống,
  -- với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- c1 :
select ho_ten from khach_hang 
group by khach_hang.ho_ten;

-- c2 : 
select distinct ho_ten from khach_hang ;

-- c3 : 
select 
  ho_ten 
from 
  khach_hang 
union 
select 
  ho_ten 
from 
  khach_hang;
  
  -- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng
  -- với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
  
  
use furama_resort_management;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set sql_safe_updates = 0;
delete from nhan_vien n
where n.ma_nhan_vien not in (select ma_nhan_vien from hop_dong group by ma_nhan_vien);
set sql_safe_updates = 1;
select * from nhan_vien ;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
create view w_khach_hang as 
select 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    ifnull(dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia),
            dv.chi_phi_thue) as tong_tien
from
    khach_hang kh
        left join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
        left join
    hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
        left join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        left join
    dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        left join
    dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
group by kh.ma_khach_hang , hd.ma_hop_dong
order by kh.ma_khach_hang asc;
-- Sử dụng view lấy điều kiện
select kh.ma_khach_hang from w_khach_hang 
where tong_tien > 1000000 and ten_loai_khach regexp 'Platinium';
-- update
update khach_hang 
set ma_loai_khach = 1 
where ma_khach_hang 
in (select ma_khach_hang from w_khach_hang where tong_tien > 1000000 and ten_loai_khach regexp 'Platinium');

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  hd.ngay_lam_hop_dong 
from 
  khach_hang kh 
  join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
where 
  year(ngay_lam_hop_dong) < 2021 ;
set 
  sql_safe_updates = 0;
delete from 
  khach_hang kh 
where 
  kh.ma_khach_hang in (
    select 
      hd.ma_khach_hang 
    from 
      hop_dong hd 
    where 
      year(ngay_lam_hop_dong) < 2021
  ) ;
  select * from hop_dong;
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

UPDATE dich_vu_di_kem dvdk
SET gia = gia * 2
WHERE dvdk.ma_dich_vu_di_kem IN (SELECT hdct.ma_dich_vu_di_kem
                                 FROM hop_dong_chi_tiet hdct
                                 GROUP BY hdct.ma_dich_vu_di_kem
                                 HAVING SUM(hdct.so_luong >= 10));
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT nv.ma_nhan_vien AS id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
FROM nhan_vien nv
UNION ALL
SELECT kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
FROM khach_hang kh;
SET
SQL_SAFE_UPDATES = 1;

create database from_edr_to_table;
use from_edr_to_table;

create table don_dat_hang(
  so_dat_hang int primary key, ngay_dat_hang datetime
);

create table vat_tu(
  ma_vat_tu int primary key, 
  ten_vat_tu varchar(50)
);

-- mqh giữa vật tư và đơn đặt hàng
create table hoa_don_ban(
  vat_tu_ma_vat_tu int, 
  don_dat_hang_so_dat_hang int, 
  primary key (
    vat_tu_ma_vat_tu, don_dat_hang_so_dat_hang
  ), 
  foreign key (don_dat_hang_so_dat_hang) references don_dat_hang(so_dat_hang), 
  foreign key (vat_tu_ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_xuat(
  so_phieu_xuat int primary key, ngay_xuat datetime
);

-- mqh giữa vật tư và xuất hàng
create table hoa_don_xuat(
  phieu_xuat_so_phieu_xuat int, 
  vat_tu_ma_vat_tu int, 
  so_luong_xuat int, 
  dơn_gia_xuat double, 
  primary key (
    phieu_xuat_so_phieu_xuat, vat_tu_ma_vat_tu
  ), 
  foreign key (phieu_xuat_so_phieu_xuat) references phieu_xuat(so_phieu_xuat), 
  foreign key (vat_tu_ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
  so_phieu_nhap int primary key, nhay_nhap datetime
);

-- mqh giữa vật tư và nhập hàng
create table hoa_don_nhap(
  phieu_nhap_so_phieu_nhap int, 
  vat_tu_ma_vat_tu int, 
  SLNhap int, 
  DGNhap double, 
  primary key (
    phieu_nhap_so_phieu_nhap, vat_tu_ma_vat_tu
  ), 
  foreign key (phieu_nhap_so_phieu_nhap) references phieu_nhap(so_phieu_nhap), 
  foreign key (vat_tu_ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table nha_cung_Cap(
  ma_nha_cung_cap int primary key, 
  ten_nha_cung_cap varchar(50), 
  dia_chi varchar(100)
);

-- sdt đa trị nên lập 1 mqh riêng
create table sdt(
  nha_cung_cap_ma_nha_cung_cap int,
  sdt varchar(10)
);

-- mqh giữa đơn đặt hàng và nhà cung cấp
create table hoa_don_mua(
  nha_cung_cap_ma_nha_cung_cap int, 
  don_dat_hang_so_dat_hang int, 
  primary key (
    nha_cung_cap_ma_nha_cung_cap, don_dat_hang_so_dat_hang
  ), 
  foreign key (don_dat_hang_so_dat_hang) references don_dat_hang(so_dat_hang), 
  foreign key (nha_cung_cap_ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

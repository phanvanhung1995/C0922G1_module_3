create database query_data_with_database ;
use student_managerment ;

-- thêm dữ liệu vào bảng class
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

-- Thêm dữ liệu vào trong bảng Student 
INSERT INTO Student
VALUES (1,'Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student 
VALUES (2,'Hoa', 'Hai phong', null,1, 1);
INSERT INTO Student 
VALUES (3,'Manh', 'HCM', '0123123123', 0, 2);

-- Thêm dữ liệu nhanh vào trong bảng Subject 
INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
-- Thêm dữ liệu vào trong bảng Mark :
INSERT INTO mark (sub_id, student_id, mark, exemtimes)
VALUES (1, 1, 8, 1),
       (3, 2, 10, 2),
       (2, 3, 12, 1);
       
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student_name like 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where start_date like '%-12-%' ;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0 ;
update student
set class_id = 2
where student_name = 'Hung';
set sql_safe_updates = 1 ;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
-- nếu trùng sắp theo tên tăng dần.
select student_name,  mark, sub_name from
  mark m join student s on s.student_id = m.student_id 
  join subject su on m.sub_id = su.sub_id 
  order by m.mark desc, s.student_name asc;
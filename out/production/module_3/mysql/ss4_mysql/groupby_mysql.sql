use student_managerment;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select 
  * 
from 
  subject 
where 
  credit = (
    select 
      max(credit) 
    from 
      subject
  );
  
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select 
  * 
from 
  subject s 
  left join mark m on s.sub_id = m.sub_id 
where 
  m.mark = (
    select 
      max(mark) 
    from 
      mark
  );
  
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
-- xếp hạng theo thứ tự điểm giảm dần
select 
  s.student_name, 
  avg(m.mark) as avg 
from 
  student s 
  left join mark m on m.student_id = s.student_id 
group by 
  s.student_name 
order by 
  avg desc;

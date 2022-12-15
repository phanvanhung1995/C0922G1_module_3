create database student_managerment;
use student_managerment ;

create table class(
classID int primary key auto_increment ,
className varchar(60) not null,
startDate datetime not null,
status bit 
);

create table student( 
studentID int primary key auto_increment,
studentName varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
classID int not null
);

create table subject (
subID int primary key auto_increment,
subName varchar(30) not null ,
credit tinyint not null default 1 check ( credit >=1),
status bit default 1
);

create table mark (
markID int not null primary key auto_increment,
subID int not null unique,
studentID int not null unique,
mark float default 0 check ( mark between 0 and 100 ),
exemtimes tinyint default 1,
foreign key (subID) references subject(subID),
foreign key (studentID) references student(studentID)
);

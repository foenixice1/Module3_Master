create database quanlysinhvien;
use quanlysinhvien;
create table class(
classID int not null auto_increment primary key,
className varchar(60) not  null,
startDate datetime not null,
status bit
);

create table student(
studentID int not null auto_increment primary key,
studentName varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
classID int not null,
foreign key (classid) references class (classid)
);
create table subject(
subid int not null auto_increment primary key,
subName varchar(30) not null,
creadit tinyint not null default 1 check (creadit >= 1),
status bit default 1
);
create table mark(
markid int not null auto_increment primary key,
subid int not null,
studentid int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
unique (subid,studentid),
foreign key (subid) references subject (subid),
foreign key (studentid) references student (studentid)
);
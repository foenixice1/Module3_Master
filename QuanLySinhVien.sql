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

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
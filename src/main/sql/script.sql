create database student_management;

use student_management;

create table Class (
	id int auto_increment primary key,
    name varchar(50)
);

insert into class (name) values
	('Java Backend'),
    ('Java Frontend'),
    ('PHP Backend');

create table Student (
	id int auto_increment primary key,
    name varchar(20),
    score int,
    class_id int,
    foreign key (class_id) references Class (id)
);

insert into student (name, score, class_id) values
	('Thang', 96, 1),
	('Dung', 96, 2),
	('Tri', 96, 3),
	('Tung', 96, 1);
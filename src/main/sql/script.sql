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
    
    
    
delimiter $
create procedure list_students()
begin
	select * from student;
end $
delimiter ;

delimiter $
create procedure add_student(
    in in_name varchar(20),
    in in_score int,
    in in_class_id int
)
begin
	insert into student (name, score, class_id) values
		(in_name, in_score, in_class_id);
end $
delimiter ;

delimiter $
create procedure update_student(
	in in_id int,
	in in_name varchar(20),
    in in_score int,
    in in_class_id int
)
begin
	update student
    set 
		name = in_name,
        score = in_score,
        class_id = in_class_id
	where id = in_id;
end $
delimiter ;

delimiter $
create procedure delete_student (in in_id int)
begin
	delete from student
    where id = in_id;
end $
delimiter ;

delimiter $
create procedure find_student (in in_id int)
begin
	select name, score, class_id 
    from student
    where id = in_id;
end $
delimiter ;

delimiter $
create procedure list_classes ()
begin
	select * from class;
end $
delimiter ;
















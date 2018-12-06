create table Club(
	id int unsigned not null auto_increment primary key, 
    name varchar(31) not null,
    createdate timestamp not null default current_timestamp,
    leader int unsigned,
    constraint foreign key fk_leader_info (leader) references info (id)
    );   

create table Subjectname(
	id int unsigned not null auto_increment primary key, 
    subject varchar(31) not null,
    createdate timestamp not null default current_timestamp,
	professor int unsigned,
    constraint foreign key fk_professor_info (professor) references Prof (id)
    );   


create table Enroll(
	id int unsigned not null auto_increment primary key, 
    subjectname int unsigned not null,
    createdate timestamp not null default current_timestamp,
    student int unsigned not null,
    constraint foreign key fk_student_Enroll (student) references info (id),
    constraint foreign key fk_subjectname_Enroll (subjectname) references Subjectname (id)
    );   

create table Enrollpre(
	id int unsigned not null auto_increment primary key, 
    subjectname int unsigned not null,
    createdate timestamp not null default current_timestamp,
    student int unsigned not null
    );   



create table Prof(
	id int unsigned not null auto_increment primary key, 
    name varchar(31) not null,
    likecnt int unsigned not null default 0,
    createdate timestamp not null default current_timestamp
    );   



insert into Club(name, leader) values('요트부', 550);
insert into Club(name, leader) values('미술부', 400);
insert into Club(name, leader) values('체육부', 300);

select c.*, i.name as 'student name' from Club c inner join info i on c.leader=i.id;

insert into Prof(name, likecnt) select name, ceil(rand() * 100) from info order by rand() limit 100; 
insert into Subjectname(subject, professor) values ('영어', 1);  
insert into Subjectname(subject, professor) values ('수학', 2);  
insert into Subjectname(subject, professor) values ('과학', 3);  
insert into Subjectname(subject, professor) values ('국어', 4);  
insert into Subjectname(subject, professor) values ('사회', 5);
insert into Subjectname(subject, professor) values ('교육', 6);
insert into Subjectname(subject, professor) values ('철학', 7);
insert into Subjectname(subject, professor) values ('윤리', 8);
insert into Subjectname(subject, professor) values ('화학', 9);  
insert into Subjectname(subject, professor) values ('컴퓨터', 10);  
  

select i.*, e.name as 'student name' from info i inner join Enroll e on i.name=i.id;
select s.*, p.name as 'professor name' from Subjectname s inner join Prof p on s.professor=p.id;


insert into Enroll(student, subjectname) select student, subjectname from Enrollpre order by rand() limit 1000; 
select info.id, Subjectname.id from info, Subjectname;  


insert into Enrollpre(student, subjectname) select id, ceil(rand()*10) from info order by rand() limit 9999; 

select student,count(*) from Enroll group by student;
SELECT DISTINCT student, subjectname FROM Enroll;
SELECT student, subjectname FROM Enroll GROUP BY student, subjectname;


DELETE from Enroll where id not in (SELECT * from (select min(id) from Enroll GROUP BY student, subjectname) as tempTable);

SELECT student, subjectname FROM Enroll GROUP BY student, subjectname;
SELECT DISTINCT student, subjectname FROM Enrollpre;
select count(*) from Enrollpre;
select * from Enrollpre;
select * from Enroll;
select count(*) from Enroll;


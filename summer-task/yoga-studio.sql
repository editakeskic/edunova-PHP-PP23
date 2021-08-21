drop database if EXISTS yogastudio;
CREATE database yogastudio;
use yogastudio;

create table teachers(
	id int(11) not null primary key auto_increment,
	name varchar(50) not null,
	surname varchar(50) not null,
	email varchar(100) not null,
	oib char(11),
	iban varchar(32)
);

create table groups(
    id int not null primary key auto_increment,
    name varchar(50) not null,
    yogastyle int null, 
    teachers int not null
);

create table members(
    id int not null primary key auto_increment,
    name varchar(50) not null,
	surname varchar(50) not null,
	email varchar(100) not null,
	oib char(11),
    membershipprice decimal(18,2),
    membershipend datetime,
    membershiptype varchar(50) not null,
    description varchar(300)
);

create table groups_members(
    groups int not null,    
	members int not null
);

create table timetable(
    id int not null primary key auto_increment,
    dateofpractice datetime,
    hourofpractice time,
    groups int not null
);

alter table groups add foreign key (teachers) references teachers(id);

alter table groups_members add foreign key (groups) references groups(id);
alter table groups_members add foreign key (members) references members(id);

alter table timetable add foreign key (groups) references groups(id);
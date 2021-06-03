drop database if exists kindergarden;
create database kindergarden;
use kindergarden;

create table childrengroups(
	id int(11) not null	primary key auto_increment,
	name varchar(50) not null,
    teachers int not null,
    startdate datetime
);

create table teachers(
	id int(11) not null primary key auto_increment,
	person int not null,
	iban varchar(32)	
);

create table children(
	id int(11) not null primary key auto_increment,
	person int not null,
	childrengroups int not null
);

create table person(
    id int not null primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(100)
);

alter table childrengroups add foreign key (teachers) references teachers(id);

alter table children add foreign key (childrengroups) references childrengroups(id);

  
alter table children add foreign key (person) references person(id);

alter table teachers add foreign key (person) references person(id);

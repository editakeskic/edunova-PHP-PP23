DROP database IF EXISTS animalrightsgroup;
create database animalrightsgroup;
use animalrightsgroup;

create table members(
	id int(11) not null primary key auto_increment,
	firstname varchar(50) not null,
	lastname varchar(50) not null,
	email varchar(100),
	iban varchar(32)
);

create table animals(
	id int(11) not null,
	name varchar(50) not null,
	rooms int not null,
	members int not null
);
	
	
create table rooms(
	id int(11) not null primary key auto_increment,
	name varchar(50) not null
);

alter table animals add foreign key (rooms) references rooms(id);

alter table animals add foreign key (members) references members(id);


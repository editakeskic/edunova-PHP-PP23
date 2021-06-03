drop database if exists hairdressers;
create database hairdressers;
use hairdressers;

create table employee(
	id int(11) not null primary key auto_increment,
	person int not null,
	iban varchar(32)
);

create table client(
	id int(11) not null primary key auto_increment,
	person int not null
);

create table service(
	id int(11) NOT null primary key auto_increment,
    name varchar(50) NOT null,
    description varchar(300),
    price decimal(18,2)
);

create table person(
    id int not null primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(100)
);

create table visit(
	service int not null,
	client int not null,
	employee int not null,
	dateofvisit datetime
);

alter table visit add foreign key (employee) references employee(id);
alter table visit add foreign key (client) references client(id);
alter table visit add foreign key (service) references service(id);

  
alter table client add foreign key (person) references person(id);

alter table employee add foreign key (person) references person(id);
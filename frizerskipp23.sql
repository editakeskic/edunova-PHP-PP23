drop database if exists frizerski;
create database frizerski;
use frizerski;

create table djelatnik(
	sifra int(11) not null primary key auto_increment,
	osoba int not null,
	iban varchar(32)
);

create table klijent(
	sifra int(11) not null primary key auto_increment,
	osoba int not null
);

create table usluga(
	sifra int(11) NOT null primary key auto_increment,
    naziv varchar(50) NOT null,
    opis varchar(300),
    cijena decimal(18,2)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(100)
);

create table posjet(
	usluga int not null,
	klijent int not null,
	djelatnik int not null,
	datumposjeta datetime

);

alter table posjet add foreign key (djelatnik) references djelatnik(sifra);
alter table posjet add foreign key (klijent) references klijent(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);

  
alter table klijent add foreign key (osoba) references osoba (sifra);

alter table djelatnik add foreign key (osoba) references osoba (sifra);

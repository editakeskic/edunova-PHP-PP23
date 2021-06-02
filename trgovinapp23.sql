drop database if exists trgovina;
create database trgovina;
use trgovina;

create table stavka(
	racun int not null,
	proizvod int(11),
	kolicina decimal(18,2)
);

create table racun(
	sifra int(11) not null primary key auto_increment,
	osoba int not null,
	datum datetime,
	rednibroj varchar(100),
	operater int(11) NOT null
);

create table proizvod(
	sifra int(11) NOT null primary key auto_increment,
    naziv varchar(50) NOT null,
    cijena decimal(18,2)
);

create table operater(
    sifra int(11) not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50)
);

alter table stavka add foreign key (racun) references racun(sifra);
alter table stavka add foreign key (proizvod) references proizcod(sifra);

  
alter table racun add foreign key (operater) references operater (sifra);


# ZADATAK 3

# 0. Kreirajte tablice (16) i veze između tablica. (6)

# 1. U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka. (7)

# 2. U tablici svekar postavite svim zapisima kolonu suknja na 
# vrijednost Osijek. (4)

# 3. U tablici punica obrišite sve zapise čija je vrijednost kolone 
# kratkamajica jednako AB. (4)

# 4. Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone 
# lipa nije 9,10,20,30 ili 35. (6)

# 5. Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te 
# kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice 
# ostavljena različito od 91 te da su vrijednosti kolone haljina iz tablice 
# prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice 
# snasa silazno. (10)

# 6. Prikažite kolone haljina i lipa iz tablice prijatelj čiji se primarni ključ 
# ne nalaze u tablici prijatelj_brat. (5)

# ---------------------------------------------------------------------------------------

# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists zadatak3;
create database zadatak3;
use zadatak3;

create table svekar(
	sifra int not null primary key auto_increment,
	novcica decimal(16,8) not null,
	suknja varchar(44) not null,
	bojakose varchar(36),
	prstena int,
	narukvica int not null,
	cura int not null
);

create table cura(
	sifra int not null primary key auto_increment,
	dukserica varchar(49),
	maraka decimal(13,7),
	drugiputa datetime,
	majica varchar(49),
	novcica decimal(15,8),
	ogrlica int not null
);

create table brat(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	ogrlica int not null,
	ekstrovertno bit not null
);

create table prijatelj_brat(
	sifra int not null primary key auto_increment,
	prijatelj int not null,
	brat int not null
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	kuna decimal(16,10),
	haljina varchar(37),
	lipa decimal(13,10),
	dukserica varchar(31),
	indiferentno bit not null
);

create table ostavljena(
	sifra int not null primary key auto_increment,
	kuna decimal(17,5),
	lipa decimal(15,6),
	majica varchar(36),
	modelnaocala varchar(31) not null,
	prijatelj int
);

create table snasa(
	sifra int not null primary key auto_increment,
	introvertno bit,
	kuna decimal(15,6) not null,
	eura decimal(12,9) not null,
	treciputa datetime,
	ostavljena int not null
);

create table punica(
	sifra int not null primary key auto_increment,
	asocijalno bit,
	kratkamajica varchar(44),
	kuna decimal(13,8) not null,
	vesta varchar(32) not null,
	snasa int
);

alter table svekar add foreign key (cura) references cura(sifra);

alter table prijatelj_brat add foreign key (brat) references brat(sifra);

alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table punica add foreign key (snasa) references snasa(sifra);


# 1. U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka. (7)

insert into brat(ogrlica,ekstrovertno) values
(1,1),
(2,1),
(3,0);

insert into prijatelj(indiferentno) values
(1),
(0),
(0);

insert into prijatelj_brat(prijatelj,brat) values
(1,1),
(2,2),
(3,3);

insert into ostavljena(modelnaocala) values
(1),
(2),
(3);

insert into snasa(kuna,eura,ostavljena) values
(100.50,15,1),
(105.0,10,3),
(10.50,1,2);


# 2. U tablici svekar postavite svim zapisima kolonu suknja na 
# vrijednost Osijek. (4)

insert into cura(ogrlica) values
(1),
(2),
(3);

insert into svekar(novcica,suknja,narukvica,cura) values
(10.50,'alfa',1,1),
(11.50,'beta',1,2),
(12.50,'gama',1,3);

select * from svekar;

update svekar set suknja='Osijek';


# 3. U tablici punica obrišite sve zapise čija je vrijednost kolone 
# kratkamajica jednako AB. (4)

insert into punica(kuna,vesta) values
(10,'alfa'),
(11,'beta'),
(12,'gamma'),
(13,'delta');

update punica set kratkamajica='AB' where sifra=2;

select * from punica;

delete from punica where kratkamajica='AB';


# 4. Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone 
# lipa nije 9,10,20,30 ili 35. (6)

update ostavljena set majica='kratka';
update ostavljena set lipa='50';

select majica from ostavljena where lipa not like (9 or 10 or 20 or 30 or 35);


# 5. Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te 
# kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice 
# ostavljena različito od 91 te da su vrijednosti kolone haljina iz tablice 
# prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice 
# snasa silazno. (10)

select b.ekstrovertno, pu.vesta, s.kuna
from brat b 
inner join prijatelj_brat pb on b.sifra=pb.brat
inner join prijatelj p on pb.prijatelj=p.sifra 
inner join ostavljena o on p.sifra=o.prijatelj
inner join snasa s on o.sifra=s.ostavljena 
inner join punica pu on s.sifra=pu.snasa
where o.lipa not like (91) and p.haljina like '%ba%'
order by s.kuna desc;


# 6. Prikažite kolone haljina i lipa iz tablice prijatelj čiji se primarni ključ 
# ne nalaze u tablici prijatelj_brat. (5)

select p.haljina, p.lipa
from prijatelj p 
left join prijatelj_brat pb on p.sifra=pb.prijatelj 
where p.sifra is null;

# vrijeme = 47 min

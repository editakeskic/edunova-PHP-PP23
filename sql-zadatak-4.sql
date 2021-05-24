# ZADATAK 4

# 0. Kreirajte tablice (16) i veze između tablica. (6)

# 1. U tablice becar, snasa i zena_mladic unesite po 3 retka. (7)

# 2. U tablici punac postavite svim zapisima kolonu majica na 
# vrijednost Osijek. (4)

# 3. U tablici prijatelj obrišite sve zapise čija je vrijednost kolone 
# prstena veće od 17. (4)

# 4. Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone 
# treciputa nepoznate. (6)

# 5. Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te 
# kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
# treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz 
# tablice zena različite od 29. Podatke posložite po kratkamajica iz 
# tablice becar silazno. (10)

# 6. Prikažite kolone lipa i prstena iz tablice zena čiji se primarni ključ 
# ne nalaze u tablici zena_mladic. (5)

# ---------------------------------------------------------------------------------------

# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists zadatak4;
create database zadatak4;
use zadatak4;

create table punac(
	sifra int not null primary key auto_increment,
	treciputa datetime,
	majica varchar(46),
	jmbag char(11) not null,
	novcica decimal(18,7) not null,
	maraka decimal(12,6) not null,
	ostavljen int not null
);

create table ostavljen(
	sifra int not null primary key auto_increment,
	modelnaocala varchar(43),
	introvertno bit,
	kuna decimal(14,10)
);

create table mladic(
	sifra int not null primary key auto_increment,
	kuna decimal(15,9),
	lipa decimal(18,5),
	nausnica int,
	stilfrizura varchar(49),
	vesta varchar(34) not null
);

create table zena_mladic(
	sifra int not null primary key auto_increment,
	zena int not null,
	mladic int not null
);

create table zena(
	sifra int not null primary key auto_increment,
	suknja varchar(39) not null,
	lipa decimal(18,7),
	prstena int not null
);

create table snasa(
	sifra int not null primary key auto_increment,
	introvertno bit,
	treciputa datetime,
	haljina varchar(44) not null,
	zena int not null
);

create table becar(
	sifra int not null primary key auto_increment,
	novcica decimal(14,8),
	kratkamajica varchar(48) not null,
	bojaociju varchar(36) not null,
	snasa int not null
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	eura decimal(16,9),
	prstena int not null,
	gustoca decimal(16,5),
	jmbag char(11) not null,
	suknja varchar(47) not null,
	becar int not null
);

alter table punac add foreign key (ostavljen) references ostavljen(sifra);

alter table zena_mladic add foreign key (zena) references zena(sifra);

alter table zena_mladic add foreign key (mladic) references mladic(sifra);

alter table snasa add foreign key (zena) references zena(sifra);

alter table becar add foreign key (snasa) references snasa(sifra);

alter table prijatelj add foreign key (becar) references becar(sifra);


# 1. U tablice becar, snasa i zena_mladic unesite po 3 retka. (7)

insert into mladic(vesta) values
('alfa'),
('beta'),
('gama');

insert into zena(suknja,prstena) values
('alfa',1),
('beta',2),
('gama',3);

insert into zena_mladic(zena,mladic) values
(1,1),
(2,2),
(3,3);

insert into snasa(haljina,zena) values
('alfa',1),
('alfa',2),
('beta',3);

insert into becar(kratkamajica,bojaociju,snasa) values
('alfa','a',1),
('alf','a',3),
('al','a',2);


# 2. U tablici punac postavite svim zapisima kolonu majica na 
# vrijednost Osijek. (4)

insert into ostavljen(sifra) values
(1),
(2),
(3);

insert into punac(jmbag,novcica,maraka,ostavljen) values
(12345678910,10.50,5.5,1),
(12345678911,1050,55,2),
(12345678912,100,50,3);

select * from punac;

update punac set majica='Osijek';


# 3. U tablici prijatelj obrišite sve zapise čija je vrijednost kolone 
# prstena veće od 17. (4)

insert into prijatelj(prstena,jmbag,suknja,becar) values
(1,12345678910,'alfa',1),
(2,12345678910,'al',2),
(18,12345678910,'alf',3);

select * from prijatelj;

delete from prijatelj where prstena>17;


# 4. Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone 
# treciputa nepoznate. (6)

select haljina from snasa where treciputa is null;


# 5. Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te 
# kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
# treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz 
# tablice zena različite od 29. Podatke posložite po kratkamajica iz 
# tablice becar silazno. (10)

select m.nausnica, p.jmbag, b.kratkamajica
from mladic m 
inner join zena_mladic zm on m.sifra=zm.mladic 
inner join zena z on zm.zena=z.sifra 
inner join snasa s on z.sifra=s.zena 
inner join becar b on s.sifra=b.snasa 
inner join prijatelj p on b.sifra=p.becar 
where s.treciputa='not null' and z.lipa not like 29
order by b.kratkamajica desc;


# 6. Prikažite kolone lipa i prstena iz tablice zena čiji se primarni ključ 
# ne nalaze u tablici zena_mladic. (5)

select z.lipa, z.prstena
from zena z
left join zena_mladic zm on z.sifra=zm.zena 
where z.sifra is null;

# vrijeme = 40 min

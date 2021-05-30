# ZADATAK 1

# 0. Kreirajte tablice (16) i veze između tablica. (6)

# 1. U tablice muskarac, zena i sestra_svekar unesite po 3 retka. (7)

# 2. U tablici cura postavite svim zapisima kolonu gustoca 
# na vrijednost 15,77. (4)

# 3. U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna 
# veće od 15,78. (4)

# 4. Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone 
# hlace sadrže slova ana. (6)

# 5. Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te 
# hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz 
# tablice zena počinju slovom a te da su vrijednosti kolone haljina iz 
# tablice sestra sadrže niz znakova ba. Podatke posložite po hlace iz 
# tablice muskarac silazno. (10)

# 6. Prikažite kolone haljina i maraka iz tablice sestra čiji se primarni 
# ključ ne nalaze u tablici sestra_svekar. (5)

# ---------------------------------------------------------------------------------------

drop database if exists zadatak1;
create database zadatak1;
use zadatak1;

create table sestra(
	sifra int not null primary key auto_increment,
	introvertno bit,
	haljina varchar(31) not null,
	maraka decimal(16,6),
	hlace varchar(46) not null,
	narukvica int not null
);

create table zena(
	sifra int not null primary key auto_increment,
	treciputa datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(44) not null,
	haljina varchar(44),
	sestra int not null
);

create table muskarac(
	sifra int not null primary key auto_increment,
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal(14,5) not null,
	zena int not null
);

create table mladic(
	sifra int not null primary key auto_increment,
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiputa datetime,
	asocijalno bit,
	ekstrovertno bit not null,
	dukserica varchar(48) not null,
	muskarac int 

);

create table svekar(
	sifra int not null primary key auto_increment,
	bojaociju varchar(40) not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal(13,8),
	eura decimal(12,7),
	majica varchar(35)
);

create table sestra_svekar(
	sifra int not null primary key auto_increment,
	sestra int not null,
	svekar int not null
);

create table punac(
	sifra int not null primary key auto_increment,
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null
);

create table cura(
	sifra int not null primary key auto_increment,
	novcica decimal(16,5) not null,
	gustoca decimal(18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar(36),
	punac int
);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table muskarac add foreign key (zena) references zena(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

alter table cura add foreign key (punac) references punac(sifra);


# 1. U tablice muskarac, zena i sestra_svekar unesite po 3 retka. (7)

insert into sestra(haljina, hlace, narukvica) values
('crvena', 'crna',1),
('zuta','žuta',2),
('zelena','zelena',3);

insert into svekar(bojaociju) values
('plava'),
('zelena'),
('smeđa');

insert into sestra_svekar(sestra,svekar) values
(1,1),
(2,2),
(3,3);

insert into zena(kratkamajica,jmbag,bojaociju,sestra) values
('bijela',12312312311,'plava',1),
('crna',1231231222,'smeđa',2),
('zelena',12312333333,'plava',2);

insert into muskarac(bojaociju,maraka,zena) values
('zelena',100.00,1),
('smeđa',150.00,2),
('zelena',100.00,3);


# 2. U tablici cura postavite svim zapisima kolonu gustoca 
# na vrijednost 15,77. (4)

insert into punac(hlace) values
('bijela'),
('crna'),
('crna');

insert into cura(novcica,gustoca,ogrlica) values
(122.00,10,1),
(112.00,11,1),
(100.00,10,2);

update cura set gustoca=15.77;

select * from cura;


# 3. U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna 
# veće od 15,78. (4)

insert into mladic(suknja,kuna,ekstrovertno,dukserica) values
('plava',100.00,1,'plava'),
('bijela',15.78,1,'bijela'),
('plava',10.00,0,'crna'),
('bijela',15.00,0,'bijela');

delete from mladic where kuna=15.78;

select * from mladic;


# 4. Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone 
# hlace sadrže slova ana. (6)

update zena set hlace='banana' where sifra=1;
update zena set hlace='ananas' where sifra=2;
update zena set hlace='jabuka' where sifra=3;

select kratkamajica 
from zena where hlace like '%ana%';


# 5. Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te 
# hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz 
# tablice zena počinju slovom a te da su vrijednosti kolone haljina iz 
# tablice sestra sadrže niz znakova ba. Podatke posložite po hlace iz 
# tablice muskarac silazno. (10)

update mladic set asocijalno=1 where sifra=1;
update mladic set asocijalno=1 where sifra=2;
update mladic set asocijalno=0 where sifra=3;

update muskarac set hlace='banana' where sifra=1 and 2;
update muskarac set hlace='jabuka' where sifra=3;

update svekar set dukserica='banana' where sifra=1;
update svekar set dukserica='ananas' where sifra=2;
update svekar set dukserica='limun' where sifra=3;

update sestra set haljina='banana' where sifra=1 and 2;
update sestra set haljina='bali' where sifra=3;

update zena set hlace='ana' where sifra=3;

select f.dukserica, a.asocijalno, b.hlace
from mladic a 
inner join muskarac b on a.muskarac=b.sifra
inner join zena c on b.zena=c.sifra 
inner join sestra d on c.sestra=d.sifra
inner join sestra_svekar e on d.sifra=e.sestra 
inner join svekar f on e.svekar=f.sifra 
where c.hlace like 'a%' and d.haljina like '%ba%'
order by b.hlace desc;
# ? ------ ne znam zašto ne prikazuje ništa u rezultatima iako bi trebalo
#  s obzirom na unesene podatke
 


# 6. Prikažite kolone haljina i maraka iz tablice sestra čiji se primarni 
# ključ ne nalaze u tablici sestra_svekar. (5)

select a.haljina, a.maraka
from sestra a 
left join sestra_svekar b on a.sifra=b.sestra 
where a.sifra is null;


# utrošeno vrijeme = 2 sata







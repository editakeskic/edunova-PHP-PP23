# ZADATAK 2

# 0. Kreirajte tablice (16) i veze između tablica. (6)

# 1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka. (7)

# 2. U tablici prijatelj postavite svim zapisima kolonu treciputa na 
# vrijednost 30. travnja 2020. (4)

# 3. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica 
# različito od 14. (4)

# 4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone 
# drugiputa nepoznate. (6)

# 5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te 
# haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
# drugi puta iz tablice cura poznate te da su vrijednosti kolone vesta iz 
# tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz 
# tablice neprijatelj silazno. (10)

# 6. Prikažite kolone vesta i asocijalno iz tablice decko čiji se primarni 
# ključ ne nalaze u tablici decko_zarucnica. (5)

# ---------------------------------------------------------------------------------------


# 0. Kreirajte tablice (16) i veze između tablica. (6)

DROP database IF EXISTS zadatak2;
CREATE database zadatak2;
use zadatak2;

create table zarucnica(
	sifra int not null primary key auto_increment,
	narukvica int,
	bojakose varchar(37) not null,
	novcica decimal(15,9),
	lipa decimal(15,8) not null,
	indiferentno bit not null
);

create table decko_zarucnica(
	sifra int not null primary key auto_increment,
	decko int not null,
	zarucnica int not null	
);

create table decko(
	sifra int not null primary key auto_increment,
	indiferentno bit,
	vesta varchar(34),
	asocijalno bit not null
);

create table cura(
	sifra int not null primary key auto_increment,
	haljina varchar(33) not null,
	drugiputa datetime not null,
	suknja varchar(38),
	narukvica int,
	introvertno bit,
	majica varchar(40) not null,
	decko int
);

create table neprijatelj(
	sifra int not null primary key auto_increment,
	majica varchar(32),
	haljina varchar(43) not null,
	lipa decimal(16,8),
	modelnaocala varchar(49) not null,
	kuna decimal(12,6) not null,
	jmbag char(11),
	cura int
);

create table brat(
	sifra int not null primary key auto_increment,
	suknja varchar(47),
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null
);

create table svekar(
	sifra int not null primary key auto_increment,
	stilfrizura varchar(48),
	ogrlica int not null,
	asocijalno bit not null
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	modelnaocala varchar(37),
	treciputa datetime not null,
	ekstrovertno bit not null,
	prviputa datetime,
	svekar int not null
);

alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);

alter table cura add foreign key (decko) references decko(sifra);

alter table neprijatelj add foreign key (cura) references cura(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

alter table prijatelj add foreign key (svekar) references svekar(sifra);


# 1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka. (7)

insert into zarucnica(bojakose,lipa,indiferentno) values
('smeđa','50',0),
('smeđa','80',1),
('plava','50',0);

insert into decko(asocijalno) values
(0),
(1),
(0);

insert into decko_zarucnica(decko,zarucnica) values
(1,1),
(2,2),
(3,3);

insert into cura(haljina,drugiputa,majica) values
('plava','2021-01-21','plava'),
('zelena','2021-05-21','plava'),
('plava','2021-04-21','zelena');

insert into neprijatelj(haljina,modelnaocala,kuna) values
('crvena',1,100.50),
('crvena',2,100.50),
('plava',3,100.50);


# 2. U tablici prijatelj postavite svim zapisima kolonu treciputa na 
# vrijednost 30. travnja 2020. (4)

insert into svekar(ogrlica,asocijalno) values 
(1,0),
(1,1),
(2,0);

insert into prijatelj(treciputa,ekstrovertno,svekar) values
('2020-05-05',1,1),
('2020-04-05',1,2),
('2020-05-05',1,3);

select * from prijatelj;

update prijatelj set treciputa='2020-04-30';


# 3. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica 
# različito od 14. (4)
insert into brat(ogrlica,asocijalno,neprijatelj) values
(14,1,1),
(14,0,2),
(1,1,3);

select * from brat;

delete from brat where ogrlica not like 14;


# 4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone 
# drugiputa nepoznate. (6)

select suknja from cura where drugiputa=null;


# 5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te 
# haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
# drugi puta iz tablice cura poznate te da su vrijednosti kolone vesta iz 
# tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz 
# tablice neprijatelj silazno. (10)

select z.novcica, b.neprijatelj, n.haljina 
from zarucnica z 
inner join decko_zarucnica dz on z.sifra=dz.zarucnica 
inner join decko d on dz.decko=d.sifra 
inner join cura c on d.sifra=c.decko 
inner join neprijatelj n on c.sifra=n.cura 
inner join brat b on n.sifra=b.neprijatelj 
where c.drugiputa='not null' and d.vesta like '%ba%'
order by n.haljina desc;


# 6. Prikažite kolone vesta i asocijalno iz tablice decko čiji se primarni 
# ključ ne nalaze u tablici decko_zarucnica. (5)

select d.vesta, d.asocijalno 
from decko d 
left join decko_zarucnica dz on d.sifra=dz.decko 
where d.sifra is null;


# utrošeno vrijeme = 1 sat



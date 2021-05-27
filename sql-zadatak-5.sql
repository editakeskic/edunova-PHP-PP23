# ZADATAK 5

# 0. Kreirajte tablice (16) i veze između tablica. (6)

# 1. U tablice punica, punac i svekar_cura unesite po 3 retka. (7)

# 2. U tablici mladic postavite svim zapisima kolonu haljina na 
# vrijednost Osijek. (4)

# 3. U tablici ostavljena obrišite sve zapise čija je vrijednost kolone 
# ogrlica jednako 17. (4)

# 4. Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone 
# prviputa nepoznate. (6)

# 5. Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te 
# nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz 
# tablice punac poznate te da su vrijednosti kolone majica iz tablice 
# svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice 
# punica silazno. (10)

# 6. Prikažite kolone majica i carape iz tablice svekar čiji se primarni 
# ključ ne nalaze u tablici svekar_cura. (5)

# ---------------------------------------------------------------------------------------

DROP database IF EXISTS zadatak5;
CREATE database zadatak5;
use zadatak5;

create table cura(
	sifra int not null primary key auto_increment,
	carape varchar(41) not null,
	maraka decimal(17,10) not null,
	asocijalno bit,
	vesta varchar(47) not null
);

create table svekar(
	sifra int not null primary key auto_increment,
	bojakose varchar(33),
	majica varchar(31),
	carape varchar(31) not null,
	haljina varchar(43),
	narukvica int,
	eura decimal(14,5) not null
);

create table svekar_cura(
	sifra int not null primary key auto_increment,
	svekar int not null,
	cura int not null
);

create table punac(
	sifra int not null primary key auto_increment,
	dukserica varchar(33),
	prviputa datetime not null,
	majica varchar(36),
	svekar int not null
);

create table punica(
	sifra int not null primary key auto_increment,
	hlace varchar(43) not null,
	nausnica int not null,
	ogrlica int,
	vesta varchar(49) not null,
	modelnaocala varchar(31) not null,
	treciputa datetime not null,
	punac int not null
);

create table ostavljena(
	sifra int not null primary key auto_increment,
	majica varchar(33),
	ogrlica int not null,
	carape varchar(44),
	stilfrizura varchar(42),
	punica int not null
);

create table zarucnik(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	lipa decimal(12,8),
	indiferentno bit not null
);

create table mladic(
	sifra int not null primary key auto_increment,
	kratkamajica varchar(48) not null,
	haljina varchar(30) not null,
	asocijalno bit,
	zarucnik int
);
	
alter table svekar_cura add foreign key (cura) references cura(sifra);
alter table svekar_cura add foreign key (svekar) references svekar(sifra);

alter table punac add foreign key (svekar) references svekar(sifra);

alter table punica add foreign key (punac) references punac(sifra);

alter table ostavljena add foreign key (punica) references punica(sifra);

alter table mladic add foreign key (zarucnik) references zarucnik(sifra);


# 1. U tablice punica, punac i svekar_cura unesite po 3 retka. (7)

insert into cura(carape,maraka,vesta) values
('a',1,'a'),
('b',2,'b'),
('c',3,'c');

insert into svekar(carape,eura) values
('a',1),
('b',2),
('c',3);

insert into svekar_cura(svekar,cura) values
(1,1),
(2,2),
(3,3);

insert into punac(prviputa,svekar) values
('2020-01-20',1),
('2021-01-20',2),
('2020-02-02',3);

insert into punica(hlace,nausnica,vesta,modelnaocala,treciputa,punac) values
('a',1,'a','a','2020-02-20',1),
('b',2,'b','b','2020-03-20',2),
('c',3,'c','c','2020-04-20',3);


# 2. U tablici mladic postavite svim zapisima kolonu haljina na 
# vrijednost Osijek. (4)

insert into zarucnik(indiferentno) values 
(0),
(1),
(0);

insert into mladic(kratkamajica,haljina) values
('a','a'),
('b','b'),
('c','c');

select * from mladic;

update mladic set haljina='Osijek';


# 3. U tablici ostavljena obrišite sve zapise čija je vrijednost kolone 
# ogrlica jednako 17. (4)

insert into ostavljena(ogrlica,punica) values
(17,1),
(14,2),
(1,3);

select * from ostavljena;

delete from ostavljena where ogrlica=17;


# 4. Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone 
# prviputa nepoznate. (6)

select majica from punac where prviputa=null;


# 5. Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te 
# nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz 
# tablice punac poznate te da su vrijednosti kolone majica iz tablice 
# svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice 
# punica silazno. (10)

select c.asocijalno, o.stilfrizura, pu.nausnica 
from cura c 
inner join svekar_cura sc on c.sifra=sc.cura 
inner join svekar s on sc.svekar=s.sifra 
inner join punac p on s.sifra=p.svekar 
inner join punica pu on p.sifra=pu.punac 
inner join ostavljena o on pu.sifra=o.punica 
where p.prviputa is not null and s.majica like '%ba%'
order by pu.nausnica desc;


# 6. Prikažite kolone majica i carape iz tablice svekar čiji se primarni 
# ključ ne nalaze u tablici svekar_cura. (5)
select s.majica, s.carape 
from svekar s 
left join svekar_cura sc on s.sifra=sc.svekar 
where s.sifra is null;

# vrijeme = 34 min
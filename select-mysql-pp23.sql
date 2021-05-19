select * from smjer;

# select na jednu tablicu
# osnovna izvedba select naredbe
select 2;

# select lista - filtriranje po kolonama
# može se nalaziti * - prikaži sve kolone
select * from smjer;

# može se nalaziti popis kolona odvojeno zarezom
select naziv, cijena from smjer;
select ime, prezime, ime, prezime from osoba;

# kolonama se mogu davati zamjenska imena
select ime as osoba, oib as broj from osoba;

select *, ime from osoba;

# ne prolazi
select ime, * from osoba;

# može se nalaziti konstanta
select ime, prezime, 35 as temperatura, 'Osijek' as mjesto from osoba;

# može se nalaziti izraz 
# za vrijeme trenutno
select now();

# prvo mala slova ime, pa druga kolona ime 3 slova i sve velikim slovima
select lower(ime), upper(left(ime,3)) from osoba;

# filtriranje redova
# izvodi se u where
select * from osoba where sifra=7;

select * from osoba where ime='Tomislav';

# operatori
# uspoređivanja: =, != (<>) dobijemo sve osim tog broja, >, <, >= i <=
select * from osoba where sifra<>5;

# logički: and(>=,<= prikazuje samo kad su oba true), or(kad je bar jedan uvjet zadovoljen prikazuje) i not
select * from osoba where sifra>=4 and sifra<=7;
select * from osoba where sifra>=2 and sifra<=3;

select * from osoba where sifra=4 or sifra=7;

select * from osoba where not
(sifra=2 or ((sifra>5 and sifra<7) or sifra=12));

# ostali operatori: in, between, like, is null, is not null
select * from smjer where certifikat is not null;

select * from osoba where sifra=3 or sifra=12;
select * from osoba where sifra in (3,12);

select * from osoba where sifra>=5 and sifra<=15;
# in se često u datumima koristi
select * from osoba where sifra between 5 and 12;

select * from osoba where ime='Tomislav';

# like kada želimo naći po jednom slovu ili znaku nešto
# %?%- između prvog i zadnjeg znaka, ?% na početku, %? na kraju znak
select * from osoba where ime like 'A%';

select * from osoba where ime like '%an%';

select * from osoba where ime not like '%a';

select * from osoba where ime like '%a%e%';

# baza mjesta ------- 
# odaberite sva mjesta u Osječko-baranjskoj županiji
# 1. način
select * from mjesto where postanskibroj like '31%';
# 2. način
select * from mjesto where naziv='Osijek';
select * from mjesto where zupanija=14;

# zupanija ne zavrsava sa a
select * from mjesto where naziv not like '%a';


# baza knjižnica ------- 
#svi autori kojima ne znamo datum rođenja
select * from autor where datumrodenja is null;

#rođenje na datum 1. veljače 1983
select * from autor where datumrodenja='1983-02-01';

# autoru Rober Preišić postavite datum rođenja na 7. veljače 1983
select * from autor where ime='Robert' and prezime='Preišić';
select * from autor where sifra=3;

update autor set datumrodenja='1983-02-07' 
where sifra=3;

#odaberite sve autore koji se zovu kao vi
select * from autor where ime='Edita' or prezime='Keskic';

# svi izdavači koji su društva s ograničenom odgovornošću
select * from izdavac where naziv like '%d.o.o%' or naziv like '%do.o%' or naziv like '%d.oo%';

# odaberimo za preporuku knjige osobi koja je prekinula i želi neke savjete o ljubavi
select * from katalog where naslov like '%ljubav%' and sifra not in (2541,2680,2879,2938);


# baza world  -------
# u državi Kosovo unijeti mjesto Priština donja
select * from country;
insert into country(Code,Name,Continent,Region,SurfaceArea,Population,LocalName,GovernmentForm,Code2) values
('KOS','Kosovo','Europe','Southern Europe',10887,1873,'Kosovo','Republic','KO');

select * from country where code='KOS';
insert into city(name,countrycode,district,population) values
('Priština donja','KOS','Dio Kosova',15000);

select * from city where name='Priština donja' 

# promijeniti naziv Priština donja u Priština
update city set name='Priština'
where countrycode='KOS';

select * from city where countrycode='KOS'; 


# baza mysqlsampledatabase
# naći narudžbe koje su otkazane
select * from orders where status='cancelled';
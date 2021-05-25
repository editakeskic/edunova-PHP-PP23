#baza edunova
select * from smjer where sifra>1;

# order by i limit klauzule
# --- sa limit određujemo koliko rezlutata će se prikazati
select naziv, 'Osijek' as grad, now() as danas # dodali smo 2 nove kolone
from smjer 
where sifra>1
order by naziv desc
limit 1;

# distinct oznaka
# --- distinct prikazuje sve pojedine vrijednosti koje su unešene, 
# prikazuje samo sve raličite vrijednosti jedanput
select distinct grupa from clan;

# UPDATE
# proširenje update naredbe
# promjenite trajanje smjera na 150, cijena je umnožak
# trenutne cijene s šifrom grupe na svim smjerovima
# na kojima je polaznik s šifrom 1
update smjer a 
inner join grupa b on a.sifra =b.smjer 
inner join clan c on b.sifra =c.grupa 
set a.trajanje =150, a.cijena = a.cijena * b.sifra 
where c.polaznik = 1;

# DELETE
# proširenje delete naredbe
# želim obrisati sve članove koji su upisani u grupe čiji smjerovi 
# traju duže od 150 sati
delete a
from clan a 
inner join grupa b on a.grupa =b.sifra 
inner join smjer c on b.smjer =c.sifra 
where c.trajanje >150;


# baza classicmodels
# Klauzule group by i having
select b.productLine, sum(a.buyPrice) 
# sum daje sumu svih vrijednosti navedenih u zagradi
from products a inner join productlines b on a.productLine =b.productLine 
where b.productLine ='Trains'; # ovo nije dobar pristup

# sum, min, max,. avg,... su agregirane funkcije i koriste se skupa s group by klauzulom
select b.productLine, sum(a.buyPrice) as suma, avg(a.buyPrice), min(a.buyPrice), max(a.buyPrice)
from products a 
inner join productlines b on a.productLine =b.productLine 
where a.productLine like '%a%' # filtrira podatke zapisane u tablici
group by b.productLine 
having sum(a.buyPrice)>1000 # filtriranje agregiranih podataka
order by suma desc;


# union
select productCode, productName, '' as city from products
union
select addressLine1, postalCode, city from offices;
# u novu kolonu city smo dodali i ujedinili 3 podatka iz offices

# kreiranje tablice na osnovu select naredbe
create table spojeno
select productCode, productName, '' as city 
from products
union
select addressLine1, postalCode, city from offices; 

select * from spojeno;

# unos podataka u tablicu na osnovu select
insert into spojeno 
select productCode, productName, '' as city from products
union
select addressLine1, postalCode, city from offices;
# ponovo su se ubacili isti podaci ispod 


insert into spojeno
select '', firstName, 'Osijek'  from employees; 
# ubacuju se novi podaci redom kojim idu kolone iz tablice employees
# u tablicu spojeno


# odaberite sve proizvode koje je prodao martin
#----------------------------------------------
select e.firstName, a.*
from products a
inner join orderdetails b on a.productCode=b.productCode
inner join orders c on b.orderNumber=c.orderNumber
inner join customers d on c.customerNumber=d.customerNumber
inner join employees e on d.salesRepEmployeeNumber=e.employeeNumber
where e.firstName like 'Martin';

select a. productName, e.firstName
from products a
inner join orderdetails b on a.productCode=b.productCode
inner join orders c on b.orderNumber=c.orderNumber
inner join customers d on c.customerNumber=d.customerNumber
inner join employees e on d.salesRepEmployeeNumber=e.employeeNumber
where e.firstName like 'Martin';
# riješeno --------------------------------


# Odaberite sve podređene zaposlenike od Patterson Mary



# odaberite sve proizvode koji nisu niti na jednoj narudžbi
select distinct productCode from orderdetails;

select count(*) from products;


select * from products where productCode not in 
(select distinct productCode from orderdetails);

# Obrišite 1985 Toyota Supra



# obrisati sve proizvode koji nisu niti na jednoj narudžbi
delete from products where productLine not in 
(select distinct productCode from orderdetails);

# Na koji datum narudžbe je prodan najskuplji (priceEach) proizvod?
select od.priceEach, o.orderDate
from orderdetails od
inner join orders o on o.orderNumber = od.orderNumber
where od.priceEach = (select max(od2.priceEach) from orderdetails od2);
# morali smo još jednom imenovati orderdetails od2 jer 
# izvlačimo iz iste tablice select unutar select uvjeta where

# sakila
select count(*) from film f ;



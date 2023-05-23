use master;
drop database if exists Inventura;
go
create database Inventura;
use Inventura;
go


create table OPERATER (
    Operater_ID int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Email varchar(50) not null,
    Lozinka varchar(50) not null
);

create table TVRTKA (
    Tvrtka_ID int primary key identity (1, 1) not null,
    Naziv varchar(100) not null,
    OIB char(11) not null,
    Adresa varchar(100) not null,
    IBAN char(21) not null
);

create table OSOBA (
    Osoba_ID int primary key identity (1, 1) not null,
    Ime varchar(20) not null,
    Prezime varchar(20) not null,
    Email varchar(50) not null,
    Lozinka varchar(50) not null,
    Tvrtka_ID int references TVRTKA (Tvrtka_ID) not null
);

create table SREDSTVO (
    Sredstvo_ID int primary key identity (1, 1) not null,
    Naziv varchar(50) not null,
    Opis varchar(100) null,
    Komadno bit not null,
    Osoba_ID int references OSOBA (Osoba_ID) not null
);

create table RACUN (
    Racun_ID int primary key identity (1, 1) not null,
    Broj_racuna varchar(50) not null,
    Datum_racuna datetime not null,
    Stavke varchar(255) not null,
    Ukupno_cijena decimal not null,
    Tvrtka_ID int references TVRTKA (Tvrtka_ID) not null,
    Osoba_ID int references OSOBA (Osoba_ID) not null
);

create table NABAVA (
    Nabava_ID int primary key identity (1, 1) not null,
    Datum_nabave datetime null,
    Racun_ID int references RACUN (Racun_ID) not null
);

create table SREDSTVO_NABAVA (
    Sredstvo_nabava_ID int primary key identity (1, 1) not null,
    Kolicina int not null,
    Cijena decimal not null,
    Sredstvo_ID int references SREDSTVO (Sredstvo_ID) not null,
    Nabava_ID int references NABAVA (Nabava_ID) not null,
    Osoba_ID int references OSOBA (Osoba_ID) not null
);

create table LOKACIJA (
    Lokacija_ID int primary key identity (1, 1) not null,
    Naziv varchar(50) not null,
    Opis varchar(100) null
);

create table LOKACIJA_NABAVA (
    Lokacija_nabava_ID int primary key identity (1, 1),
    Datum datetime null,
    Lokacija_ID int references LOKACIJA (Lokacija_ID) not null,
    Sredstvo_nabava_ID int references SREDSTVO_NABAVA (Sredstvo_nabava_ID) not null,
    Osoba_ID int references OSOBA (Osoba_ID) not null
);
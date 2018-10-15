drop schema if exists 4_02_2015;
create schema 4_02_2015 default character set utf8 default collate utf8_unicode_ci;
use 4_02_2015;

CREATE TABLE ROBA(
	Sifra VARCHAR(20) NOT NULL,
	Naziv VARCHAR(20) NOT NULL,
	Kolicina INTEGER NULL,
	PRIMARY KEY(Sifra)
)
;

CREATE TABLE CENA(
	DatumOd DATE NOT NULL,
    Iznos INTEGER NULL,
    Sifra VARCHAR(20) NOT NULL,
    PRIMARY KEY (DatumOd,Sifra),
    FOREIGN KEY IMA(Sifra) REFERENCES ROBA(Sifra)
)
;

CREATE TABLE KLIJENT(
	JMB VARCHAR(20) NOT NULL,
    Prezime VARCHAR(20) NOT NULL,
    Ime VARCHAR(20) NOT NULL,
    PRIMARY KEY(JMB)
)
;

CREATE TABLE RACUN(
	BrojRacuna VARCHAR(20) NOT NULL,
    Datum DAte NULL,
    JMB VARCHAR(20) NOT NULL,
    PRIMARY KEY(BrojRacuna, JMB),
    foreign key IZDAT(JMB) references KLIJENT(JMB)
)
;

CREATE TABLE UPLATA(
	BrojUplate VARCHAR(20) NOT NULL,
    Iznos Integer NOT NULL,
    BrojRacuna VARCHAR(20) NOT NULL,
    PRIMARY KEY(BrojUplate, BrojRacuna),
    foreign key IZBRSENA(BrojRacuna) references RACUN(BrojRacuna)
)
;

CREATE TABLE RACUN_STAVKA(
	BrojRacuna VARCHAR(20) NOT NULL,
    Sifra VARCHAR(20) NOT NULL,
    primary key(BrojRacuna, Sifra),
    foreign key R_RS(BrojRacuna) references RACUN(BrojRacuna),
    foreign key ROB_RS(BrojRacuna) references RACUN(BrojRacuna)
);
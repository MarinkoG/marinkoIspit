drop schema if exists vezba3;
create schema vezba3 default character set utf8 default collate utf8_unicode_ci;
use vezba3;

CREATE TABLE STUDENT
(
	BrojIndeksa           VARCHAR(20) NOT NULL,
	Ime                   VARCHAR(20) NULL,
	Prezime               VARCHAR(20) NULL,
	 PRIMARY KEY (BrojIndeksa)
)
;



CREATE TABLE NASTAVNIK
(
	JMB                   VARCHAR(20) NOT NULL,
	Ime                   VARCHAR(20) NULL,
	Prezime               VARCHAR(20) NULL,
	 PRIMARY KEY (JMB)
)
;



CREATE TABLE PREDMET
(
	Naziv                 VARCHAR(20) NULL,
	Sifra                 VARCHAR(20) NOT NULL,
	ECTS                  INTEGER NULL,
	 PRIMARY KEY (Sifra)
)
;



CREATE TABLE ISPIT
(
	DatumIspita           DATE NOT NULL,
	JMB                   VARCHAR(20) NOT NULL,
	Sifra                 VARCHAR(20) NOT NULL,
	 PRIMARY KEY (DatumIspita,Sifra),
     FOREIGN KEY DRZI (JMB) REFERENCES NASTAVNIK(JMB),
	FOREIGN KEY R_9 (Sifra) REFERENCES PREDMET(Sifra)
)
;



CREATE TABLE POLAZE
(
	Ocena                 VARCHAR(20) NULL,
	BrojIndeksa           VARCHAR(20) NOT NULL,
	DatumIspita           DATE NOT NULL,
	Sifra                 VARCHAR(20) NOT NULL,
	 PRIMARY KEY (BrojIndeksa,DatumIspita,Sifra),
     FOREIGN KEY R_1 (BrojIndeksa) REFERENCES STUDENT(BrojIndeksa),
	FOREIGN KEY R_2 (DatumIspita,Sifra) REFERENCES ISPIT(DatumIspita,Sifra)
)
;



CREATE TABLE KOMISIJSKI
(
	BrojIndeksa           VARCHAR(20) NOT NULL,
	DatumIspita           DATE NOT NULL,
	JMB                   VARCHAR(20) NOT NULL,
	Sifra                 VARCHAR(20) NOT NULL,
	 PRIMARY KEY (BrojIndeksa,DatumIspita,Sifra),
     FOREIGN KEY (BrojIndeksa,DatumIspita,Sifra) REFERENCES POLAZE(BrojIndeksa,DatumIspita,Sifra)
		ON DELETE CASCADE,
	FOREIGN KEY PRVI_CLAN (JMB) REFERENCES NASTAVNIK(JMB),
	FOREIGN KEY DRUGI_CLAN (JMB) REFERENCES NASTAVNIK(JMB)
)
;



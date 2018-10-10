
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
	 PRIMARY KEY (Sifra,Naziv)
)
;



CREATE TABLE ISPIT
(
	DatumIspita           DATE NOT NULL,
	JMB                   VARCHAR(20) NOT NULL,
	Sifra                 VARCHAR(20) NOT NULL,
	Naziv                 VARCHAR(20) NOT NULL,
	 PRIMARY KEY (DatumIspita,Sifra,Naziv)FOREIGN KEY DRZI (JMB) REFERENCES NASTAVNIK(JMB),
	FOREIGN KEY R_9 (Sifra,Naziv) REFERENCES PREDMET(Sifra,Naziv)
)
;



CREATE TABLE POLAZE
(
	Ocena                 VARCHAR(20) NULL,
	BrojIndeksa           VARCHAR(20) NOT NULL,
	DatumIspita           DATE NOT NULL,
	Sifra                 VARCHAR(20) NOT NULL,
	Naziv                 VARCHAR(20) NOT NULL,
	 PRIMARY KEY (BrojIndeksa,DatumIspita,Sifra,Naziv)FOREIGN KEY R_1 (BrojIndeksa) REFERENCES STUDENT(BrojIndeksa),
	FOREIGN KEY R_2 (DatumIspita,Sifra,Naziv) REFERENCES ISPIT(DatumIspita,Sifra,Naziv)
)
;



CREATE TABLE KOMISIJSKI
(
	BrojIndeksa           VARCHAR(20) NOT NULL,
	DatumIspita           DATE NOT NULL,
	PrviClan              VARCHAR(20) NOT NULL,
	Sifra                 VARCHAR(20) NOT NULL,
	Naziv                 VARCHAR(20) NOT NULL,
	 PRIMARY KEY (BrojIndeksa,DatumIspita,Sifra,Naziv)FOREIGN KEY (BrojIndeksa,DatumIspita,Sifra,Naziv) REFERENCES POLAZE(BrojIndeksa,DatumIspita,Sifra,Naziv)
		ON DELETE CASCADE,
	FOREIGN KEY PRVI_CLAN (PrviClan) REFERENCES NASTAVNIK(JMB),
	FOREIGN KEY DRUGI_CLAN (PrviClan) REFERENCES NASTAVNIK(JMB)
)
;



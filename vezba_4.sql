SELECT * FROM vezba3.student;
INSERT INTO `vezba3`.`student` (`BrojIndeksa`, `Ime`, `Prezime`) VALUES ('98/5', 'Goran', 'Banjac');
INSERT INTO `vezba3`.`student` (`BrojIndeksa`, `Ime`, `Prezime`) VALUES ('1/18', 'Nikola', 'Nikolovic');
INSERT INTO `vezba3`.`student` (`BrojIndeksa`, `Ime`, `Prezime`) VALUES ('25/18', 'Petar', 'Petrovic');

INSERT INTO `vezba3`.`nastavnik` (`JMB`, `Ime`, `Prezime`) VALUES ('123', 'Nastavnik1', 'Nas1prez');
INSERT INTO `vezba3`.`nastavnik` (`JMB`, `Ime`, `Prezime`) VALUES ('5', 'Nas2', 'Nas2Pre');
INSERT INTO `vezba3`.`nastavnik` (`JMB`, `Ime`, `Prezime`) VALUES ('2', 'Petar', 'Maric');


INSERT INTO `vezba3`.`predmet` (`Naziv`, `Sifra`, `ECTS`) VALUES ('Matemat', '1', '6');
INSERT INTO `vezba3`.`predmet` (`Naziv`, `Sifra`, `ECTS`) VALUES ('OET', '2', '6');
INSERT INTO `vezba3`.`predmet` (`Naziv`, `Sifra`, `ECTS`) VALUES ('programiranje', '3', '6');

INSERT INTO `vezba3`.`ispit` (`DatumIspita`, `JMB`, `Sifra`) VALUES ('2018-05-02', '123', '1');
INSERT INTO `vezba3`.`ispit` (`DatumIspita`, `JMB`, `Sifra`) VALUES ('2018-06-02', '5', '2');
INSERT INTO `vezba3`.`ispit` (`DatumIspita`, `JMB`, `Sifra`) VALUES ('2017-01-01', '2', '3');

INSERT INTO `vezba3`.`student` (`BrojIndeksa`, `Ime`, `Prezime`) VALUES ('56/15', 'Nenad', 'Student');
INSERT INTO `vezba3`.`polaze` (`BrojIndeksa`, `DatumIspita`, `Sifra`) VALUES ('25/18', '2017-01-01', '3');
INSERT INTO `vezba3`.`polaze` (`BrojIndeksa`, `DatumIspita`, `Sifra`) VALUES ('1/18', '2018-05-02', '1');

INSERT INTO `vezba3`.`komisijski` (`BrojIndeksa`, `DatumIspita`, `PrviClan`, `DrugiClan`, `Sifra`) VALUES ('25/18', '2017-01-01', '123', '2', '3');

UPDATE `vezba3`.`polaze` SET `Ocena` = '5' WHERE (`BrojIndeksa` = '1/18') and (`DatumIspita` = '2018-05-02') and (`Sifra` = '1');
UPDATE `vezba3`.`polaze` SET `Ocena` = '6' WHERE (`BrojIndeksa` = '25/18') and (`DatumIspita` = '2017-01-01') and (`Sifra` = '3');
INSERT INTO `vezba3`.`polaze` (`Ocena`, `BrojIndeksa`, `DatumIspita`, `Sifra`) VALUES ('8', '1/18', '2018-06-02', '2');


SELECT count(*) from nastavnik n inner join student s on substring(n.Ime,1,1)=substring(s.Ime,1,1) and substring(n.Prezime,1,1)=substring(s.Prezime,1,1);

SELECT  n.Ime,n.Prezime, count(*) as Broj from  nastavnik n inner join komisijski k on k.PrviClan=n.JMB or k.DrugiClan = n.JMB group by n.Ime;

SELECT student.BrojIndeksa, student.Prezime, student.Ime, AVG(Ocena) as ProsjekOcjena , SUM(ECTS) as Bodovi from student  inner join polaze  on student.BrojIndeksa=polaze.BrojIndeksa inner join predmet on polaze.Sifra= predmet.Sifra group by BrojIndeksa;

create index predmetNaziv on predmet
(
	Naziv
);

ALTER table ispit add Izaslo integer NULL;
ALTER table ispit add Polozilo integer Null;

create trigger updateIspit after insert on polaze 
for each row
update ispit
set Izaslo = Izaslo+1, 
Polozilo = Polozilo+1 where ispit.Sifra=new.Sifra;



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


SELECT count(*) from nastavnik n inner join student s on substring(n.Ime,1,1)=substring(s.Ime,1,1) and substring(n.Prezime,1,1)=substring(s.Prezime,1,1);

SELECT  n.Ime,n.Prezime, count(*) as Broj from  nastavnik n inner join komisijski k on k.PrviClan=n.JMB or k.DrugiClan = n.JMB order by n.Ime;
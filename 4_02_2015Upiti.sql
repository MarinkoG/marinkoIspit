use 4_02_2015;

INSERT INTO `4_02_2015`.`roba` (`Sifra`, `Naziv`, `Kolicina`) VALUES ('1', 'cekic', '5');
INSERT INTO `4_02_2015`.`roba` (`Sifra`, `Naziv`, `Kolicina`) VALUES ('2', 'ekser', '6');
INSERT INTO `4_02_2015`.`roba` (`Sifra`, `Naziv`, `Kolicina`) VALUES ('3', 'greda', '4');

INSERT INTO `4_02_2015`.`cena` (`DatumOd`, `Iznos`, `Sifra`) VALUES ('2018-10-10', '5', '2');
INSERT INTO `4_02_2015`.`cena` (`DatumOd`, `Iznos`, `Sifra`) VALUES ('2018-10-15', '200', '2');
INSERT INTO `4_02_2015`.`cena` (`DatumOd`, `Iznos`, `Sifra`) VALUES ('2018-10-15', '300', '3');
INSERT INTO `4_02_2015`.`cena` (`DatumOd`, `Iznos`, `Sifra`) VALUES ('2018-06-06', '100', '3');

INSERT INTO `4_02_2015`.`klijent` (`JMB`, `Prezime`, `Ime`) VALUES ('1', 'Markovic', 'Marko');
INSERT INTO `4_02_2015`.`klijent` (`JMB`, `Prezime`, `Ime`) VALUES ('2', 'Jankovic ', 'janko');
INSERT INTO `4_02_2015`.`klijent` (`JMB`, `Prezime`, `Ime`) VALUES ('3', 'Prezime1', 'Ime1');
INSERT INTO `4_02_2015`.`klijent` (`JMB`, `Prezime`, `Ime`) VALUES ('4', 'Petrovic', 'Petar');

INSERT INTO `4_02_2015`.`racun` (`BrojRacuna`, `Datum`, `JMB`) VALUES ('1', '2018-01-01', '1');
Insert into racun(BrojRacuna, DAtum,JMB) values('2', '2018-02-02', '2');
INSERT INTO `4_02_2015`.`racun` (`BrojRacuna`, `Datum`, `JMB`) VALUES ('3', '2018-06-05', '3');

INSERT INTO `4_02_2015`.`racun_stavka` (`BrojRacuna`, `Sifra`, `Kolicina`) VALUES ('1', '1', '5');
INSERT INTO `4_02_2015`.`racun_stavka` (`BrojRacuna`, `Sifra`, `Kolicina`) VALUES ('2', '2', '5');
INSERT INTO `4_02_2015`.`racun_stavka` (`BrojRacuna`, `Sifra`, `Kolicina`) VALUES ('3', '2', '10');
INSERT INTO `4_02_2015`.`racun_stavka` (`BrojRacuna`, `Sifra`, `Kolicina`) VALUES ('1', '3', '10');

select r.Sifra, r.Naziv, c.Iznos as TrenutnaCena from roba r inner join cena c on r.Sifra=c.Sifra where c.DatumOd=curdate();

select r.BrojRacuna, r.Datum, sum(rs.Kolicina*c.Iznos) as UkupanIznos from racun r inner join racun_stavka rs on r.BrojRacuna=rs.BrojRacuna inner join cena c on rs.Sifra=c.Sifra group by BrojRacuna;

select count(*) from klijent k where substring(k.Ime,1,1)=substring(k.Prezime,1,1);
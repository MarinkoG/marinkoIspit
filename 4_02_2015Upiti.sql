use 4_02_2015;

INSERT INTO `4_02_2015`.`roba` (`Sifra`, `Naziv`, `Kolicina`) VALUES ('1', 'cekic', '5');
INSERT INTO `4_02_2015`.`roba` (`Sifra`, `Naziv`, `Kolicina`) VALUES ('2', 'ekser', '6');
INSERT INTO `4_02_2015`.`roba` (`Sifra`, `Naziv`, `Kolicina`) VALUES ('3', 'greda', '4');

INSERT INTO `4_02_2015`.`cena` (`DatumOd`, `Iznos`, `Sifra`) VALUES ('2018-10-10', '5', '2');
INSERT INTO `4_02_2015`.`cena` (`DatumOd`, `Iznos`, `Sifra`) VALUES ('2018-10-15', '200', '2');
INSERT INTO `4_02_2015`.`cena` (`DatumOd`, `Iznos`, `Sifra`) VALUES ('2018-10-15', '300', '3');



select r.Sifra, r.Naziv, c.Iznos as TrenutnaCena from roba r inner join cena c on r.Sifra=c.Sifra where c.DatumOd=curdate();
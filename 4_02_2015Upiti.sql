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

create trigger insertRS after insert on racun_stavka
for each row
update roba r
set Kolicina = Kolicina-new.Kolicina where Sifra = new.Sifra;

insert into racun(BrojRacuna,JMB,Datum)values('5','4','2018-05-05');
insert into racun_stavka(BrojRacuna, Sifra, Kolicina)values('5','1','10');

create trigger updateRS after update on racun_stavka
for each row
update roba r
set Kolicina = Kolicina+old.Kolicina-new.Kolicina where Sifra = new.Sifra;

UPDATE `4_02_2015`.`racun_stavka` SET `Kolicina` = '5' WHERE (`BrojRacuna` = '5') and (`Sifra` = '1');

create trigger deleteRS after delete on racun_stavka
for each row
update roba r
set Kolicina = Kolicina+old.Kolicina where Sifra=old.Sifra;

DELETE FROM `4_02_2015`.`racun_stavka` WHERE (`BrojRacuna` = '5') and (`Sifra` = '1');

delimiter //
create procedure funkcija(in BrojRacuna varchar(20), in Sifra varchar(20), in Kolicina Integer, out res Integer)
begin
	declare kolicinaRobe Integer;
    declare postojiNaRacunu Integer default 0;
	set res=0;
    set kolicinaRobe = (select Kolicina from roba where roba.Sifra=Sifra);
    if(kolicinaRobe>Kolicina) then
    set postojiNaRacunu=(select count(*) from racun_stavka where BrojRacuna=BrojRacuna and Sifra=Sifra);
		if(postojiNaRacunu>0) then
        update racun_stavka
        set racun_stavka.Kolicina=racun_stavka.Kolicina+Kolicina where BrojRacuna=BrojRacuna and Sifra=Sifra;
		else insert into racun_stavka(BrojRacuna,Sifra,Kolicina) values(BrojRacuna, Sifra, Kolicina);
		end if;
        set res=1;
    end if;
end //
delimiter ;


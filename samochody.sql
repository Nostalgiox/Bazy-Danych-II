CREATE TABLE osoby (
  pesel varchar2(11) PRIMARY KEY CHECK(LENGTH(pesel)=11),
  imie varchar2(15) NOT NULL,
  nazwisko varchar2(25) NOT NULL,
  nr_telefonu varchar2(9) NULL UNIQUE CHECK(LENGTH(nr_telefonu)=9)
);
/
CREATE TABLE samochody (
  vin varchar2(17) PRIMARY KEY CHECK(LENGTH(vin)=17),
  marka varchar2(15) NOT NULL,
  model varchar2(15) NOT NULL,
  rocznik NUMBER(5) NOT NULL,
  przebieg NUMBER(7) NOT NULL,
  bezwypadkowy CHAR(1) NULL,
  pesel varchar2(11) REFERENCES Osoby (pesel) NOT NULL 
);
/
INSERT INTO osoby values (89101067567,'Jan','Kowalski',510698521);
INSERT INTO osoby values (75767887876,'Adam','Piesek',608654753);
INSERT INTO osoby values (96100923578,'Tomek','Kotek',788698456);
INSERT INTO osoby values (95020157897,'Marek','Ulan',604854884);
INSERT INTO osoby values (92031268935,'Julian','Kamieñ',502489321);
INSERT INTO osoby values (98052387427,'Anna','Miodek',668332112);
/
INSERT INTO samochody values ('WMWZN3C51BT133317', 'Mini', 'Cooper',	2011,	110456,	'Y', '98052387427');
INSERT INTO samochody values ('WA1LKAFP1AA007546', 'Audi', 'Q5',	2010,	280789,	null, '96100923578');
INSERT INTO samochody values ('3VWSE29M82M028637', 'Volkswagen', 'Jetta',	2002,	399214,	'N', '89101067567');
INSERT INTO samochody values ('JHLRE48518C002529', 'Honda', 'CR V',	2008,	100100,	'Y', '75767887876');
INSERT INTO samochody values ('1NXBR12E31Z463785', 'Toyota', 'Corolla',	2001,	240004,	'N', '95020157897');
INSERT INTO samochody values ('TMBDD65D79E027023', 'Skoda', 'Fabia',	2007,	152222,	'Y', '92031268935');
INSERT INTO samochody values ('TMBPW16Y315802529', 'Skoda', 'Octavia',	2011,	199033,	'Y', '92031268935');
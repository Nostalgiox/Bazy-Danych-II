--CREATE USER bazy_danych IDENTIFIED BY bazy_danych;
--GRANT ALL PRIVILEGES TO bazy_danych;
CREATE TABLE "Cennik" (
  "id" NUMBER(10),
  "kwota_za_dzien" NUMBER(6,2) NOT NULL,
  "kwota_za_kilometr" NUMBER(6,2) NOT NULL,
  "kaucja" NUMBER(6,2) NOT NULL,
  "kara" NUMBER(6,2) NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "Ubezpieczenie" (
  "id" NUMBER(10),
  "rodzaj_ubezpieczenia" VARCHAR2(25) NOT NULL,
  "kwota_pokrycia" NUMBER(6,2),
  "skladka" NUMBER(6,2),
  PRIMARY KEY ("id")
);

CREATE TABLE "Adres" (
  "id" NUMBER(10),
  "kod_pocztowy" VARCHAR2(6) NOT NULL,
  "miejscowosc" VARCHAR2(50) NOT NULL,
  "ulica" VARCHAR2(50) NOT NULL,
  "nr_domu" NUMBER(5) NOT NULL,
  "nr_lokalu" NUMBER(10),
  PRIMARY KEY ("id")
);

CREATE TABLE "Klienci" (
  "id" NUMBER(10),
  "imie" VARCHAR2(50) NOT NULL,
  "nazwisko" VARCHAR2(50) NOT NULL,
  "id_adresu" NUMBER(10) NOT NULL,
  "nr_dowodu" VARCHAR2(9) NOT NULL,
  "pesel" VARCHAR2(11) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Klienci_id_adresu"
    FOREIGN KEY ("id_adresu")
      REFERENCES "Adres"("id")
);
CREATE TABLE "Dane_techniczne" (
  "id" NUMBER(10),
-- "id_pojazdu" NUMBER(10) NOT NULL,
  "pojemnosc_silnika" NUMBER(4) NOT NULL,
  "moc_silnika" NUMBER(3) NOT NULL,
  "rodzaj_paliwa" VARCHAR2(10),
  "gaz" CHAR(1),
  "stan_licznika" NUMBER(6) NOT NULL,
  PRIMARY KEY ("id")
--  CONSTRAINT "FK_Dane_techniczne_id_pojazdu"
--    FOREIGN KEY ("id_pojazdu")
--     REFERENCES "Pojazd"("id")
);
CREATE TABLE "Pojazd" (
  "id" NUMBER(10),
  "Marka" VARCHAR2(25) NOT NULL,
  "Model" VARCHAR2(25) NOT NULL,
  "Rok_produkcji" NUMBER(4),
  "Kolor" VARCHAR2(25),
  "id_dane_techniczne" NUMBER(10) NOT NULL,
  "typ_pojazdu" VARCHAR2(25),
  "dostepny" CHAR(1),
  "numer_VIN" VARCHAR2(17) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Pojazd_id_dane_techniczne"
    FOREIGN KEY ("id_dane_techniczne")
      REFERENCES "Dane_techniczne"("id")
);

CREATE TABLE "Umowy_wypozyczenia" (
  "id" NUMBER(10),
  "id_pojazdu" NUMBER(10) NOT NULL,
  "id_klienta" NUMBER(10) NOT NULL,
  "id_ubezpieczenia" NUMBER(10) NOT NULL,
  "data_wypozyczenia" DATE,
  "data_oddania" DATE,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Umowy_wypozyczenia_id_klienta"
    FOREIGN KEY ("id_klienta")
      REFERENCES "Klienci"("id"),
  CONSTRAINT "FK_Umowy_wypozyczenia_id_ubezpieczenia"
    FOREIGN KEY ("id_ubezpieczenia")
      REFERENCES "Ubezpieczenie"("id"),
  CONSTRAINT "FK_Umowy_wypozyczenia_id_pojazdu"
    FOREIGN KEY ("id_pojazdu")
      REFERENCES "Pojazd"("id")
);



CREATE TABLE "Forma_platnosci" (
  "id" NUMBER(10),
  "id_umowy" NUMBER(10),
  "rodzaj_platnosci" VARCHAR2(25),
  "nr_karty" NUMBER(19) NOT NULL,
  "data_wygasniecia_karty" DATE NOT NULL,
  "CVV" NUMBER(4) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Forma_platnosci_id_umowy"
    FOREIGN KEY ("id_umowy")
      REFERENCES "Umowy_wypozyczenia"("id")
);

CREATE TABLE "Zwroty" (
  "id" NUMBER(10),
  "id_umowy" NUMBER(10) NOT NULL,
  "data_oddania" DATE NOT NULL,
  "stan_licznika_po" NUMBER(6) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Zwroty_id_umowy"
    FOREIGN KEY ("id_umowy")
      REFERENCES "Umowy_wypozyczenia"("id")
);

CREATE TABLE "Historia" (
  "id" NUMBER(10),
  "id_cennik" NUMBER(10) NOT NULL,
  "id_pojazd" NUMBER(10) NOT NULL,
  "od" DATE,
  "do" DATE,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Historia_id_pojazd"
    FOREIGN KEY ("id_pojazd")
      REFERENCES "Pojazd"("id"),
  CONSTRAINT "FK_Historia_id_cennik"
    FOREIGN KEY ("id_cennik")
      REFERENCES "Cennik"("id")
);



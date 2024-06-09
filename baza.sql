--------------------------------------------------------
--  File created - niedziela-czerwca-09-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type CENNIKRECORD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAZY_DANYCH"."CENNIKRECORD" AS OBJECT (
    id NUMBER,
    kwota VARCHAR2(100)
);

/
--------------------------------------------------------
--  DDL for Type CENNIKTABLE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAZY_DANYCH"."CENNIKTABLE" AS TABLE OF CennikRecord;

/
--------------------------------------------------------
--  DDL for Sequence ADRES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."ADRES_SEQ"  MINVALUE 11 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 12 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CENNIK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."CENNIK_SEQ"  MINVALUE 11 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 17 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DANE_TECHNICZNE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."DANE_TECHNICZNE_SEQ"  MINVALUE 21 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 70 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence FORMY_PLATNOSCI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."FORMY_PLATNOSCI_SEQ"  MINVALUE 16 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HISTORIA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."HISTORIA_SEQ"  MINVALUE 21 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 37 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence KLIENCI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."KLIENCI_SEQ"  MINVALUE 16 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence Pojazd_seq
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."Pojazd_seq"  MINVALUE 21 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 68 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_UMOWY_WYPOZYCZENIA
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."SEQ_UMOWY_WYPOZYCZENIA"  MINVALUE 16 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 48 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence UBEZPIECZENIE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."UBEZPIECZENIE_SEQ"  MINVALUE 7 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 33 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ZWROTY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BAZY_DANYCH"."ZWROTY_SEQ"  MINVALUE 11 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 12 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table Adres
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Adres" 
   (	"id" NUMBER(10,0), 
	"kod_pocztowy" VARCHAR2(6 BYTE), 
	"miejscowosc" VARCHAR2(50 BYTE), 
	"ulica" VARCHAR2(50 BYTE), 
	"nr_domu" NUMBER(5,0), 
	"nr_lokalu" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Cennik
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Cennik" 
   (	"id" NUMBER(10,0), 
	"kwota_za_dzien" NUMBER(6,2), 
	"kaucja" NUMBER(6,2), 
	"kara" NUMBER(6,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Dane_techniczne
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Dane_techniczne" 
   (	"id" NUMBER(10,0), 
	"pojemnosc_silnika" NUMBER(4,0), 
	"moc_silnika" NUMBER(3,0), 
	"rodzaj_paliwa" VARCHAR2(10 BYTE), 
	"gaz" CHAR(1 BYTE), 
	"stan_licznika" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Forma_platnosci
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Forma_platnosci" 
   (	"id" NUMBER(10,0), 
	"id_umowy" NUMBER(10,0), 
	"rodzaj_platnosci" VARCHAR2(25 BYTE), 
	"nr_karty" NUMBER(19,0), 
	"data_wygasniecia_karty" DATE, 
	"CVV" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Historia
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Historia" 
   (	"id" NUMBER(10,0), 
	"id_cennik" NUMBER(10,0), 
	"id_pojazd" NUMBER(10,0), 
	"od" DATE, 
	"do" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Klienci
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Klienci" 
   (	"id" NUMBER(10,0), 
	"imie" VARCHAR2(50 BYTE), 
	"nazwisko" VARCHAR2(50 BYTE), 
	"id_adresu" NUMBER(10,0), 
	"nr_dowodu" VARCHAR2(9 BYTE), 
	"pesel" VARCHAR2(11 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Pojazd
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Pojazd" 
   (	"id" NUMBER(10,0), 
	"Marka" VARCHAR2(25 BYTE), 
	"Model" VARCHAR2(25 BYTE), 
	"Rok_produkcji" NUMBER(4,0), 
	"Kolor" VARCHAR2(25 BYTE), 
	"id_dane_techniczne" NUMBER(10,0), 
	"typ_pojazdu" VARCHAR2(25 BYTE), 
	"dostepny" CHAR(1 BYTE), 
	"numer_VIN" VARCHAR2(17 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Ubezpieczenie
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Ubezpieczenie" 
   (	"id" NUMBER(10,0), 
	"rodzaj_ubezpieczenia" VARCHAR2(25 BYTE), 
	"kwota_pokrycia" NUMBER(6,2), 
	"skladka" NUMBER(6,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Umowy_wypozyczenia
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" 
   (	"id" NUMBER(10,0), 
	"id_pojazdu" NUMBER(10,0), 
	"id_klienta" NUMBER(10,0), 
	"id_ubezpieczenia" NUMBER(10,0), 
	"data_wypozyczenia" DATE, 
	"data_oddania" DATE, 
	"status" VARCHAR2(50 BYTE), 
	"stan_licznika_przed" NUMBER(10,0), 
	"laczna_cena" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table Zwroty
--------------------------------------------------------

  CREATE TABLE "BAZY_DANYCH"."Zwroty" 
   (	"id" NUMBER(10,0), 
	"id_umowy" NUMBER(10,0), 
	"data_oddania" DATE, 
	"stan_licznika_po" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View VW_CENNIK
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BAZY_DANYCH"."VW_CENNIK" ("id_pojazdu", "Marka", "Model", "Rok_produkcji", "Kolor", "typ_pojazdu", "dostepny", "numer_VIN", "id_cennika", "kwota_za_dzien", "kaucja", "kara", "data_od", "data_do") AS 
  SELECT 
    p."id" AS "id_pojazdu",
    p."Marka",
    p."Model",
    p."Rok_produkcji",
    p."Kolor",
    p."typ_pojazdu",
    p."dostepny",
    p."numer_VIN",
    CASE 
        WHEN h."od" IS NOT NULL THEN c."id"
        ELSE 0
    END AS "id_cennika",
    CASE 
        WHEN h."od" IS NOT NULL THEN c."kwota_za_dzien"
        ELSE 0
    END AS "kwota_za_dzien",
    CASE 
        WHEN h."od" IS NOT NULL THEN c."kaucja"
        ELSE 0
    END AS "kaucja",
    CASE 
        WHEN h."od" IS NOT NULL THEN c."kara"
        ELSE 0
    END AS "kara",
    h."od" AS "data_od",
    h."do" AS "data_do"
FROM 
    "Pojazd" p
    JOIN "Historia" h ON p."id" = h."id_pojazd"
    JOIN "Cennik" c ON h."id_cennik" = c."id"
;
--------------------------------------------------------
--  DDL for View VW_KILOMETRY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BAZY_DANYCH"."VW_KILOMETRY" ("id_pojazdu", "Marka", "Model", "miesiac", "przejechane_kilometry") AS 
  SELECT 
    p."id" AS "id_pojazdu",
    p."Marka",
    p."Model",
    TO_CHAR(z."data_oddania", 'YYYY-MM') AS "miesiac",
    SUM(z."stan_licznika_po" - uw."stan_licznika_przed") AS "przejechane_kilometry"
FROM 
    "Pojazd" p
    JOIN "Umowy_wypozyczenia" uw ON p."id" = uw."id_pojazdu"
    JOIN "Zwroty" z ON uw."id" = z."id_umowy"
GROUP BY 
    p."id",
    p."Marka",
    p."Model",
    TO_CHAR(z."data_oddania", 'YYYY-MM')
;
REM INSERTING into BAZY_DANYCH."Adres"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('1','01-001','Warszawa','Aleje Jerozolimskie','10',null);
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('2','02-002','Kraków','Rynek G³ówny','15',null);
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('3','03-003','Gdañsk','ul. D³uga','20','5');
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('4','04-004','Wroc³aw','Plac Solny','30',null);
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('5','05-005','Poznañ','ul. Wielka','40',null);
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('6','06-006','£ódŸ','ul. Piotrkowska','50','2');
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('7','07-007','Szczecin','ul. Ma³eckiego','60',null);
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('8','08-008','Katowice','ul. Warszawska','70','3');
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('9','09-009','Gdynia','ul. Starowiejska','80',null);
Insert into BAZY_DANYCH."Adres" ("id","kod_pocztowy","miejscowosc","ulica","nr_domu","nr_lokalu") values ('10','10-010','Bydgoszcz','ul. Dworcowa','90','1');
REM INSERTING into BAZY_DANYCH."Cennik"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('1','43','700','200');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('2','50','800','220');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('3','39','720','190');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('4','45','690','240');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('5','44','650','225');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('6','43,99','710','185');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('7','40,5','700','197');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('8','41,99','680','212');
Insert into BAZY_DANYCH."Cennik" ("id","kwota_za_dzien","kaucja","kara") values ('10','50,95','749','235');
REM INSERTING into BAZY_DANYCH."Dane_techniczne"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('1','1600','110','Benzyna','N','50000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('2','1500','120','Benzyna','N','40000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('3','2000','140','Benzyna','N','30000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('4','1800','130','Benzyna','N','45000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('5','2000','150','Benzyna','N','60000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('6','300','40','Benzyna','N','20000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('7','600','120','Benzyna','N','15000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('8','900','60','Benzyna','N','18000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('9','1000','200','Benzyna','N','10000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('10','1100','220','Benzyna','N','12000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('11','2000','150','Benzyna','N','70000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('12','1800','140','Benzyna','N','60000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('13','1600','130','Benzyna','N','50000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('14','1400','120','Benzyna','N','40000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('15','1200','110','Benzyna','N','30000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('16','1800','100','Benzyna','N','20000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('17','400','45','Benzyna','N','15000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('18','1250','135','Benzyna','N','10000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('19','800','90','Benzyna','N','8000');
Insert into BAZY_DANYCH."Dane_techniczne" ("id","pojemnosc_silnika","moc_silnika","rodzaj_paliwa","gaz","stan_licznika") values ('20','700','75','Benzyna','N','6000');
REM INSERTING into BAZY_DANYCH."Forma_platnosci"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('1','1','Ca³oœæ','1234567812345678',to_date('30/12/01','RR/MM/DD'),'123');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('2','2','Ca³oœæ','2345678923456789',to_date('31/01/01','RR/MM/DD'),'234');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('3','3','Ca³oœæ','3456789034567890',to_date('32/02/01','RR/MM/DD'),'345');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('4','4','Ca³oœæ','4567890145678901',to_date('33/03/01','RR/MM/DD'),'456');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('5','5','Ca³oœæ','5678901256789012',to_date('34/04/01','RR/MM/DD'),'567');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('6','6','Ca³oœæ','6789012367890123',to_date('35/05/01','RR/MM/DD'),'678');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('7','7','Ca³oœæ','7890123478901234',to_date('30/06/01','RR/MM/DD'),'789');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('8','8','Ca³oœæ','8901234589012345',to_date('31/07/01','RR/MM/DD'),'890');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('9','9','Ca³oœæ','9012345690123456',to_date('32/08/01','RR/MM/DD'),'901');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('10','10','Ca³oœæ','1234567812345678',to_date('33/09/01','RR/MM/DD'),'123');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('11','11','Ca³oœæ','2345678923456789',to_date('34/10/01','RR/MM/DD'),'234');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('12','12','Ca³oœæ','3456789034567890',to_date('35/11/01','RR/MM/DD'),'345');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('13','13','Ca³oœæ','4567890145678901',to_date('30/12/01','RR/MM/DD'),'456');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('14','14','Ca³oœæ','5678901256789012',to_date('31/01/01','RR/MM/DD'),'567');
Insert into BAZY_DANYCH."Forma_platnosci" ("id","id_umowy","rodzaj_platnosci","nr_karty","data_wygasniecia_karty",CVV) values ('15','15','Ca³oœæ','6789012367890123',to_date('32/02/01','RR/MM/DD'),'678');
REM INSERTING into BAZY_DANYCH."Historia"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('1','1','1',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('2','2','2',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('3','3','3',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('4','4','4',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('5','5','5',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('6','6','6',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('7','7','7',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('8','8','8',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('10','10','10',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('11','1','11',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('12','2','12',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('13','3','13',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('14','4','14',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('15','5','15',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('16','6','16',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('17','7','17',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('18','8','18',to_date('24/05/05','RR/MM/DD'),null);
Insert into BAZY_DANYCH."Historia" ("id","id_cennik","id_pojazd","od","do") values ('20','10','20',to_date('24/05/05','RR/MM/DD'),null);
REM INSERTING into BAZY_DANYCH."Klienci"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('1','Jan','Kowalski','1','ABC123456','12345678901');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('2','Anna','Nowak','2','DEF654321','23456789012');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('3','Piotr','Wiœniewski','3','GHI987654','34567890123');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('4','Maria','D¹browska','4','JKL123456','45678901234');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('5','Adam','Lewandowski','5','MNO654321','56789012345');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('6','Alicja','Wójcik','6','PQR987654','67890123456');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('7','Marek','Kamiñski','7','STU123456','78901234567');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('8','Ewa','Zieliñska','8','VWX654321','89012345678');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('9','Tomasz','Kowalczyk','9','YZA987654','90123456789');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('10','Karolina','WoŸniak','10','BCD123456','01234567890');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('11','Katarzyna','Jankowska','1','EFG123456','12345678910');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('12','Robert','Wojciechowski','2','HIJ654321','23456789101');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('13','Monika','Krawczyk','3','KLM987654','34567891012');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('14','£ukasz','Witkowski','4','NOP123456','45678910123');
Insert into BAZY_DANYCH."Klienci" ("id","imie","nazwisko","id_adresu","nr_dowodu","pesel") values ('15','Magdalena','Zaj¹c','5','QRS654321','56789101234');
REM INSERTING into BAZY_DANYCH."Pojazd"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('1','Toyota','Corolla','2018','Czerwony','1','Samochód','T','JTDKB20U987654321');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('2','Ford','Focus','2019','Czarny','2','Samochód','T','1FADP3E27EL123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('3','Volkswagen','Golf','2020','Bia³y','3','Samochód','T','WVWZZZ1JZ2W123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('4','Honda','Civic','2017','Srebrny','4','Samochód','N','SHHFK7H44U1234567');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('5','BMW','3 Series','2016','Niebieski','5','Samochód','T','WBA3N5C50EF712345');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('6','Kawasaki','Ninja 300','2020','Czarny','6','Motocykl','T','JKAEX8A15FDA12345');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('7','Yamaha','YZF-R6','2019','¯ó³ty','7','Motocykl','T','JYARJ16E77A123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('8','Harley-Davidson','Sportster Iron 883','2018','Czarny','8','Motocykl','N','1HD1LE21YJC123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('9','Suzuki','GSX-R1000','2021','Niebieski','9','Motocykl','T','JS1DM11B9M1234567');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('10','Ducati','Panigale V4','2020','Czerwony','10','Motocykl','T','ZDMH602AABCD12345');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('11','Audi','A4','2017','Czarny','11','Samochód','T','WAUZZZF44HN123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('12','Mercedes-Benz','C-Class','2018','Srebrny','12','Samochód','T','WDDGF8BB0AF123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('13','Volvo','S60','2019','Czerwony','13','Samochód','N','YV1FS84D1B1234567');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('14','Peugeot','308','2020','Bia³y','14','Samochód','T','YV1FS84D1B1234567');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('15','Opel','Astra','2021','Niebieski','15','Samochód','N','W0L0*************');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('16','Harley-Davidson','Street Glide','2017','Czarny','16','Motocykl','T','1HD1KB419BB123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('17','KTM','Duke 390','2018','Pomarañczowy','17','Motocykl','T','MD2**************');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('18','BMW','R 1250 GS Adventure','2019','¯ó³ty','18','Motocykl','N','WB10K130*HZ123456');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('19','Ducati','Monster 821','2020','Czerwony','19','Motocykl','T','ZDMC*************');
Insert into BAZY_DANYCH."Pojazd" ("id","Marka","Model","Rok_produkcji","Kolor","id_dane_techniczne","typ_pojazdu","dostepny","numer_VIN") values ('20','Yamaha','MT-07','2021','Zielony','20','Motocykl','T','JYARM03E4MA123456');
REM INSERTING into BAZY_DANYCH."Ubezpieczenie"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Ubezpieczenie" ("id","rodzaj_ubezpieczenia","kwota_pokrycia","skladka") values ('1','OC','4000','500');
Insert into BAZY_DANYCH."Ubezpieczenie" ("id","rodzaj_ubezpieczenia","kwota_pokrycia","skladka") values ('2','AC','3000','700');
Insert into BAZY_DANYCH."Ubezpieczenie" ("id","rodzaj_ubezpieczenia","kwota_pokrycia","skladka") values ('3','Auto','9000','600');
Insert into BAZY_DANYCH."Ubezpieczenie" ("id","rodzaj_ubezpieczenia","kwota_pokrycia","skladka") values ('4','Assistance','3000','150');
Insert into BAZY_DANYCH."Ubezpieczenie" ("id","rodzaj_ubezpieczenia","kwota_pokrycia","skladka") values ('5','NNW','5000','300');
Insert into BAZY_DANYCH."Ubezpieczenie" ("id","rodzaj_ubezpieczenia","kwota_pokrycia","skladka") values ('6','OC+AC','7000','1200');
REM INSERTING into BAZY_DANYCH."Umowy_wypozyczenia"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('1','1','1','1',to_date('24/05/12','RR/MM/DD'),to_date('24/05/20','RR/MM/DD'),'zakoñczona','40000','1560');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('2','6','2','2',to_date('24/05/15','RR/MM/DD'),to_date('24/05/22','RR/MM/DD'),'zakoñczona','10000','1717,93');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('3','11','3','3',to_date('24/05/18','RR/MM/DD'),to_date('24/05/25','RR/MM/DD'),'zakoñczona','60000','1615');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('4','16','4','4',to_date('24/05/20','RR/MM/DD'),to_date('24/05/27','RR/MM/DD'),'zakoñczona','10000','1167,93');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('5','20','5','5',to_date('24/05/22','RR/MM/DD'),to_date('24/05/29','RR/MM/DD'),'zakoñczona','5000','1406,93');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('6','2','6','6',to_date('24/05/25','RR/MM/DD'),to_date('24/06/01','RR/MM/DD'),'zakoñczona','30000','2350');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('7','7','7','1',to_date('24/05/28','RR/MM/DD'),to_date('24/06/05','RR/MM/DD'),'zakoñczona','10000','1524');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('8','12','8','2',to_date('24/05/30','RR/MM/DD'),to_date('24/06/07','RR/MM/DD'),'zakoñczona','50000','1900');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('9','17','9','3',to_date('24/06/02','RR/MM/DD'),to_date('24/06/09','RR/MM/DD'),'zakoñczona','10000','1583,5');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('10','3','10','4',to_date('24/06/05','RR/MM/DD'),to_date('24/06/10','RR/MM/DD'),'zakoñczona','20000','1143');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('11','8','11','5',to_date('24/06/08','RR/MM/DD'),to_date('24/06/15','RR/MM/DD'),'aktywna','18000','1273,93');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('12','13','12','6',to_date('24/06/10','RR/MM/DD'),to_date('24/06/17','RR/MM/DD'),'aktywna','50000','2193');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('13','18','13','2',to_date('24/06/12','RR/MM/DD'),to_date('24/06/19','RR/MM/DD'),'aktywna','10000','1673,93');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('14','4','14','4',to_date('24/06/15','RR/MM/DD'),to_date('24/06/22','RR/MM/DD'),'aktywna','45000','1155');
Insert into BAZY_DANYCH."Umowy_wypozyczenia" ("id","id_pojazdu","id_klienta","id_ubezpieczenia","data_wypozyczenia","data_oddania","status","stan_licznika_przed","laczna_cena") values ('15','9','15','5',to_date('24/06/18','RR/MM/DD'),to_date('24/06/25','RR/MM/DD'),'aktywna','10000','1341,65');
REM INSERTING into BAZY_DANYCH."Zwroty"
SET DEFINE OFF;
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('1','1',to_date('24/05/20','RR/MM/DD'),'50000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('2','2',to_date('24/05/22','RR/MM/DD'),'20000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('3','3',to_date('24/05/25','RR/MM/DD'),'70000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('4','4',to_date('24/05/27','RR/MM/DD'),'20000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('5','5',to_date('24/05/29','RR/MM/DD'),'6000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('6','6',to_date('24/06/01','RR/MM/DD'),'40000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('7','7',to_date('24/06/05','RR/MM/DD'),'15000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('8','8',to_date('24/06/07','RR/MM/DD'),'60000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('9','9',to_date('24/06/09','RR/MM/DD'),'15000');
Insert into BAZY_DANYCH."Zwroty" ("id","id_umowy","data_oddania","stan_licznika_po") values ('10','10',to_date('24/06/12','RR/MM/DD'),'30000');
--------------------------------------------------------
--  DDL for Trigger SPRAWDZ_DATA_ODDANIA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BAZY_DANYCH"."SPRAWDZ_DATA_ODDANIA" 
BEFORE INSERT OR UPDATE ON "Umowy_wypozyczenia"
FOR EACH ROW
BEGIN
    IF :NEW."data_oddania" < SYSDATE AND :NEW."status" = 'aktywna' THEN
        :NEW."status" := 'zaleg³a';
    END IF;
END;
/
ALTER TRIGGER "BAZY_DANYCH"."SPRAWDZ_DATA_ODDANIA" ENABLE;
--------------------------------------------------------
--  DDL for Procedure AKTUALIZUJ_ADRES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."AKTUALIZUJ_ADRES" (
    p_id IN "Adres"."id"%TYPE,
    p_kod_pocztowy IN "Adres"."kod_pocztowy"%TYPE,
    p_miejscowosc IN "Adres"."miejscowosc"%TYPE,
    p_ulica IN "Adres"."ulica"%TYPE,
    p_nr_domu IN "Adres"."nr_domu"%TYPE,
    p_nr_lokalu IN "Adres"."nr_lokalu"%TYPE
) AS
BEGIN
    UPDATE "Adres"
    SET "kod_pocztowy" = p_kod_pocztowy,
        "miejscowosc" = p_miejscowosc,
        "ulica" = p_ulica,
        "nr_domu" = p_nr_domu,
        "nr_lokalu" = p_nr_lokalu
    WHERE "id" = p_id;
    COMMIT;
END aktualizuj_adres;

/
--------------------------------------------------------
--  DDL for Procedure AKTUALIZUJ_DANE_TECHNICZNE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."AKTUALIZUJ_DANE_TECHNICZNE" (
    p_id IN "Dane_techniczne"."id"%TYPE,
    p_pojemnosc_silnika IN "Dane_techniczne"."pojemnosc_silnika"%TYPE,
    p_moc_silnika IN "Dane_techniczne"."moc_silnika"%TYPE,
    p_rodzaj_paliwa IN "Dane_techniczne"."rodzaj_paliwa"%TYPE,
    p_gaz IN "Dane_techniczne"."gaz"%TYPE,
    p_stan_licznika IN "Dane_techniczne"."stan_licznika"%TYPE
) AS
BEGIN
    UPDATE "Dane_techniczne" 
    SET "pojemnosc_silnika" = p_pojemnosc_silnika,
        "moc_silnika" = p_moc_silnika,
        "rodzaj_paliwa" = p_rodzaj_paliwa,
        "gaz" = p_gaz,
        "stan_licznika" = p_stan_licznika
    WHERE "id" = p_id;
    COMMIT;
END aktualizuj_dane_techniczne;

/
--------------------------------------------------------
--  DDL for Procedure AKTUALIZUJ_KLIENTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."AKTUALIZUJ_KLIENTA" (
    p_id IN "Klienci"."id"%TYPE,
    p_imie IN "Klienci"."imie"%TYPE,
    p_nazwisko IN "Klienci"."nazwisko"%TYPE,
    p_id_adresu IN "Klienci"."id_adresu"%TYPE,
    p_nr_dowodu IN "Klienci"."nr_dowodu"%TYPE,
    p_pesel IN "Klienci"."pesel"%TYPE
) AS
BEGIN
    UPDATE "Klienci"
    SET "imie" = p_imie,
        "nazwisko" = p_nazwisko,
        "id_adresu" = p_id_adresu,
        "nr_dowodu" = p_nr_dowodu,
        "pesel" = p_pesel
    WHERE "id" = p_id;
    COMMIT;
END aktualizuj_klienta;

/
--------------------------------------------------------
--  DDL for Procedure AKTUALIZUJ_POJAZD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."AKTUALIZUJ_POJAZD" (
    p_id IN "Pojazd"."id"%TYPE,
    p_Marka IN "Pojazd"."Marka"%TYPE,
    p_Model IN "Pojazd"."Model"%TYPE,
    p_Rok_produkcji IN "Pojazd"."Rok_produkcji"%TYPE,
    p_Kolor IN "Pojazd"."Kolor"%TYPE,
    p_id_dane_techniczne IN "Pojazd"."id_dane_techniczne"%TYPE,
    p_typ_pojazdu IN "Pojazd"."typ_pojazdu"%TYPE,
    p_dostepny IN "Pojazd"."dostepny"%TYPE,
    p_numer_VIN IN "Pojazd"."numer_VIN"%TYPE
) AS
BEGIN
    UPDATE "Pojazd" 
    SET "Marka" = p_Marka,
        "Model" = p_Model,
        "Rok_produkcji" = p_Rok_produkcji,
        "Kolor" = p_Kolor,
        "id_dane_techniczne" = p_id_dane_techniczne,
        "typ_pojazdu" = p_typ_pojazdu,
        "dostepny" = p_dostepny,
        "numer_VIN" = p_numer_VIN
    WHERE "id" = p_id;
    COMMIT;
END aktualizuj_pojazd;

/
--------------------------------------------------------
--  DDL for Procedure AKTUALIZUJ_UBEZPIECZENIE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."AKTUALIZUJ_UBEZPIECZENIE" (
    p_id IN "Ubezpieczenie"."id"%TYPE,
    p_rodzaj_ubezpieczenia IN "Ubezpieczenie"."rodzaj_ubezpieczenia"%TYPE,
    p_kwota_pokrycia IN "Ubezpieczenie"."kwota_pokrycia"%TYPE,
    p_skladka IN "Ubezpieczenie"."skladka"%TYPE
) AS
BEGIN
    UPDATE "Ubezpieczenie" 
    SET "rodzaj_ubezpieczenia" = p_rodzaj_ubezpieczenia,
        "kwota_pokrycia" = p_kwota_pokrycia,
        "skladka" = p_skladka
    WHERE "id" = p_id;
    COMMIT;
END aktualizuj_ubezpieczenie;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_ADRES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_ADRES" (
    p_kod_pocztowy IN "Adres"."kod_pocztowy"%TYPE,
    p_miejscowosc IN "Adres"."miejscowosc"%TYPE,
    p_ulica IN "Adres"."ulica"%TYPE,
    p_nr_domu IN "Adres"."nr_domu"%TYPE,
    p_nr_lokalu IN "Adres"."nr_lokalu"%TYPE
) AS
BEGIN
    INSERT INTO "Adres" ("id", "kod_pocztowy", "miejscowosc", "ulica", "nr_domu", "nr_lokalu")
    VALUES (Adres_seq.NEXTVAL, p_kod_pocztowy, p_miejscowosc, p_ulica, p_nr_domu, p_nr_lokalu);
    COMMIT;
END dodaj_adres;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_CENNIK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_CENNIK" (
    p_kwota_za_dzien IN NUMBER,
    p_kaucja IN NUMBER,
    p_kara IN NUMBER
) IS
BEGIN
    INSERT INTO "Cennik" ("id", "kwota_za_dzien", "kaucja", "kara")
    VALUES (Cennik_seq.NEXTVAL, p_kwota_za_dzien, p_kaucja, p_kara);
END;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_DANE_TECHNICZNE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_DANE_TECHNICZNE" (
    p_pojemnosc_silnika IN "Dane_techniczne"."pojemnosc_silnika"%TYPE,
    p_moc_silnika IN "Dane_techniczne"."moc_silnika"%TYPE,
    p_rodzaj_paliwa IN "Dane_techniczne"."rodzaj_paliwa"%TYPE,
    p_gaz IN "Dane_techniczne"."gaz"%TYPE,
    p_stan_licznika IN "Dane_techniczne"."stan_licznika"%TYPE
) AS
BEGIN
    INSERT INTO "Dane_techniczne" (
        "id", 
        "pojemnosc_silnika", 
        "moc_silnika", 
        "rodzaj_paliwa", 
        "gaz", 
        "stan_licznika"
    ) VALUES (
        Dane_techniczne_seq.NEXTVAL, 
        p_pojemnosc_silnika, 
        p_moc_silnika, 
        p_rodzaj_paliwa, 
        p_gaz, 
        p_stan_licznika
    );
    COMMIT;
END dodaj_dane_techniczne;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_HISTORIE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_HISTORIE" (
    p_id_cennika IN "Cennik"."id"%TYPE,
    p_id_pojazdu IN "Pojazd"."id"%TYPE
) AS
BEGIN
    INSERT INTO "Historia" (
        "id",
        "id_cennik",
        "id_pojazd",
        "od",
        "do"
    ) VALUES (
        Historia_seq.NEXTVAL,
        p_id_cennika,
        p_id_pojazdu,
        SYSDATE,
        NULL
    );

    COMMIT;
END dodaj_historie;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_KLIENTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_KLIENTA" (
    p_imie IN "Klienci"."imie"%TYPE,
    p_nazwisko IN "Klienci"."nazwisko"%TYPE,
    p_id_adresu IN "Klienci"."id_adresu"%TYPE,
    p_nr_dowodu IN "Klienci"."nr_dowodu"%TYPE,
    p_pesel IN "Klienci"."pesel"%TYPE
) AS
BEGIN
    INSERT INTO "Klienci" ("id", "imie", "nazwisko", "id_adresu", "nr_dowodu", "pesel")
    VALUES (Klienci_seq.NEXTVAL, p_imie, p_nazwisko, p_id_adresu, p_nr_dowodu, p_pesel);
    COMMIT;
END dodaj_klienta;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_POJAZD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_POJAZD" (
    p_Marka IN "Pojazd"."Marka"%TYPE,
    p_Model IN "Pojazd"."Model"%TYPE,
    p_Rok_produkcji IN "Pojazd"."Rok_produkcji"%TYPE,
    p_Kolor IN "Pojazd"."Kolor"%TYPE,
    p_id_dane_techniczne IN "Pojazd"."id_dane_techniczne"%TYPE,
    p_typ_pojazdu IN "Pojazd"."typ_pojazdu"%TYPE,
    p_dostepny IN "Pojazd"."dostepny"%TYPE,
    p_numer_VIN IN "Pojazd"."numer_VIN"%TYPE
) AS
BEGIN
    INSERT INTO "Pojazd" (
        "id", 
        "Marka", 
        "Model", 
        "Rok_produkcji", 
        "Kolor", 
        "id_dane_techniczne", 
        "typ_pojazdu", 
        "dostepny", 
        "numer_VIN"
    ) VALUES (
        "Pojazd_seq".NEXTVAL, 
        p_Marka, 
        p_Model, 
        p_Rok_produkcji, 
        p_Kolor, 
        p_id_dane_techniczne, 
        p_typ_pojazdu, 
        p_dostepny, 
        p_numer_VIN
    );
    COMMIT;
END dodaj_pojazd;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_UBEZPIECZENIE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_UBEZPIECZENIE" (
    p_rodzaj_ubezpieczenia VARCHAR2,
    p_kwota_pokrycia NUMBER,
    p_skladka NUMBER
) AS
BEGIN
    INSERT INTO "Ubezpieczenie" ("id", "rodzaj_ubezpieczenia", "kwota_pokrycia", "skladka")
    VALUES (Ubezpieczenie_seq.NEXTVAL, p_rodzaj_ubezpieczenia, p_kwota_pokrycia, p_skladka);
    COMMIT;
END dodaj_ubezpieczenie;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_UMOWE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."DODAJ_UMOWE" (
    p_id_pojazdu IN "Umowy_wypozyczenia"."id_pojazdu"%TYPE,
    p_id_klienta IN "Umowy_wypozyczenia"."id_klienta"%TYPE,
    p_id_ubezpieczenia IN "Umowy_wypozyczenia"."id_ubezpieczenia"%TYPE,
    p_data_wypozyczenia IN "Umowy_wypozyczenia"."data_wypozyczenia"%TYPE,
    p_data_oddania IN "Umowy_wypozyczenia"."data_oddania"%TYPE,
    p_status IN "Umowy_wypozyczenia"."status"%TYPE,
    p_rodzaj_platnosci IN "Forma_platnosci"."rodzaj_platnosci"%TYPE,
    p_nr_karty IN "Forma_platnosci"."nr_karty"%TYPE,
    p_data_wygasniecia_karty IN "Forma_platnosci"."data_wygasniecia_karty"%TYPE,
    p_CVV IN "Forma_platnosci"."CVV"%TYPE
) AS
    v_stan_licznika_przed "Dane_techniczne"."stan_licznika"%TYPE;
    v_umowa_id "Umowy_wypozyczenia"."id"%TYPE;
    v_laczna_cena NUMBER;
BEGIN
    -- Pobierz stan licznika z tabeli Dane_techniczne
    SELECT "stan_licznika" INTO v_stan_licznika_przed
    FROM "Dane_techniczne"
    WHERE "id" = (SELECT "id_dane_techniczne" FROM "Pojazd" WHERE "id" = p_id_pojazdu);

    -- Pobierz kolejn¹ wartoœæ z sekwencji
    v_umowa_id := SEQ_UMOWY_WYPOZYCZENIA.NEXTVAL;

    -- Dodaj now¹ umowê
    INSERT INTO "Umowy_wypozyczenia" (
        "id", "id_pojazdu", "id_klienta", "id_ubezpieczenia", "data_wypozyczenia", "data_oddania", "status", "stan_licznika_przed"
    ) VALUES (
        v_umowa_id, p_id_pojazdu, p_id_klienta, p_id_ubezpieczenia, p_data_wypozyczenia, p_data_oddania, p_status, v_stan_licznika_przed
    );

    -- Dodaj dane p³atnoœci
    INSERT INTO "Forma_platnosci" (
        "id", "id_umowy", "rodzaj_platnosci", "nr_karty", "data_wygasniecia_karty", "CVV"
    ) VALUES (
        formy_platnosci_seq.NEXTVAL, v_umowa_id, p_rodzaj_platnosci, p_nr_karty, p_data_wygasniecia_karty, p_CVV
    );

    -- Oblicz ³¹czn¹ cenê wynajmu
    v_laczna_cena := oblicz_laczna_cene_wynajmu(v_umowa_id);

    -- Aktualizuj umowê o ³¹czn¹ cenê wynajmu
    UPDATE "Umowy_wypozyczenia"
    SET "laczna_cena" = v_laczna_cena
    WHERE "id" = v_umowa_id;

    -- Ustaw pojazd jako niedostêpny
    UPDATE "Pojazd"
    SET "dostepny" = 'N'
    WHERE "id" = p_id_pojazdu;

    COMMIT;
END dodaj_umowe;

/
--------------------------------------------------------
--  DDL for Procedure EDYTUJ_CENNIK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."EDYTUJ_CENNIK" (
    p_id IN NUMBER,
    p_kwota_za_dzien IN NUMBER,
    p_kaucja IN NUMBER,
    p_kara IN NUMBER
) AS
BEGIN
    UPDATE "Cennik" SET
    "kwota_za_dzien" = p_kwota_za_dzien,
    "kaucja" = p_kaucja,
    "kara" = p_kara
    WHERE "id" = p_id;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure EDYTUJ_UMOWE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."EDYTUJ_UMOWE" (
    p_id IN "Umowy_wypozyczenia"."id"%TYPE,
    p_id_pojazdu IN "Umowy_wypozyczenia"."id_pojazdu"%TYPE,
    p_id_klienta IN "Umowy_wypozyczenia"."id_klienta"%TYPE,
    p_id_ubezpieczenia IN "Umowy_wypozyczenia"."id_ubezpieczenia"%TYPE,
    p_data_wypozyczenia IN "Umowy_wypozyczenia"."data_wypozyczenia"%TYPE,
    p_data_oddania IN "Umowy_wypozyczenia"."data_oddania"%TYPE,
    p_status IN "Umowy_wypozyczenia"."status"%TYPE
) AS
    v_laczna_cena NUMBER;
BEGIN
    -- Aktualizuj umowê
    UPDATE "Umowy_wypozyczenia"
    SET "id_pojazdu" = p_id_pojazdu,
        "id_klienta" = p_id_klienta,
        "id_ubezpieczenia" = p_id_ubezpieczenia,
        "data_wypozyczenia" = p_data_wypozyczenia,
        "data_oddania" = p_data_oddania,
        "status" = p_status
    WHERE "id" = p_id;
    
    v_laczna_cena := oblicz_laczna_cene_wynajmu(p_id);
    
    UPDATE "Umowy_wypozyczenia"
    SET "laczna_cena" = v_laczna_cena
    WHERE "id" = p_id;

    COMMIT;
END edytuj_umowe;

/
--------------------------------------------------------
--  DDL for Procedure POBIERZCENNIK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."POBIERZCENNIK" (p_cennik OUT CennikTable) IS
BEGIN
    SELECT CennikRecord("id", 'kwota za dzien ' || "kwota_za_dzien" || ', kaucja ' || "kaucja" || ', kara ' || "kara")
    BULK COLLECT INTO p_cennik
    FROM "Cennik";
END PobierzCennik;

/
--------------------------------------------------------
--  DDL for Procedure USUN_ADRES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."USUN_ADRES" (
    p_id IN "Adres"."id"%TYPE
) AS
BEGIN
    DELETE FROM "Adres" WHERE "id" = p_id;
    COMMIT;
END usun_adres;

/
--------------------------------------------------------
--  DDL for Procedure USUN_CENNIK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."USUN_CENNIK" (
    p_id IN NUMBER
) AS
BEGIN
    DELETE FROM "Cennik" WHERE "id" = p_id;
    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure USUN_DANE_TECHNICZNE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."USUN_DANE_TECHNICZNE" (
    p_id IN "Dane_techniczne"."id"%TYPE
) AS
BEGIN
    -- Usuñ rekordy zale¿ne w tabeli Pojazd
    DELETE FROM "Pojazd" WHERE "id_dane_techniczne" = p_id;
    
    -- Usuñ dane techniczne
    DELETE FROM "Dane_techniczne" WHERE "id" = p_id;
    
    COMMIT;
END usun_dane_techniczne;

/
--------------------------------------------------------
--  DDL for Procedure USUN_KLIENTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."USUN_KLIENTA" (
    p_id IN "Klienci"."id"%TYPE
) AS
BEGIN
    DELETE FROM "Klienci" WHERE "id" = p_id;
    COMMIT;
END usun_klienta;

/
--------------------------------------------------------
--  DDL for Procedure USUN_POJAZD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."USUN_POJAZD" (
    p_id IN "Pojazd"."id"%TYPE
) AS
BEGIN
    -- Usuñ rekordy zale¿ne w tabeli Historia
    DELETE FROM "Historia" WHERE "id_pojazd" = p_id;

    -- Usuñ rekordy zale¿ne w tabeli Umowy_wypozyczenia i powi¹zanych tabelach Zwroty oraz Forma_platnosci
    DELETE FROM "Zwroty" WHERE "id_umowy" IN (SELECT "id" FROM "Umowy_wypozyczenia" WHERE "id_pojazdu" = p_id);
    DELETE FROM "Forma_platnosci" WHERE "id_umowy" IN (SELECT "id" FROM "Umowy_wypozyczenia" WHERE "id_pojazdu" = p_id);
    DELETE FROM "Umowy_wypozyczenia" WHERE "id_pojazdu" = p_id;

    -- Usuñ pojazd
    DELETE FROM "Pojazd" WHERE "id" = p_id;

    -- Usuñ dane techniczne
    DELETE FROM "Dane_techniczne" WHERE "id" = (SELECT "id_dane_techniczne" FROM "Pojazd" WHERE "id" = p_id);

    COMMIT;
END usun_pojazd;

/
--------------------------------------------------------
--  DDL for Procedure USUN_UBEZPIECZENIE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."USUN_UBEZPIECZENIE" (
    p_id IN "Ubezpieczenie"."id"%TYPE
) AS
BEGIN
    DELETE FROM "Ubezpieczenie" WHERE "id" = p_id;
    COMMIT;
END usun_ubezpieczenie;

/
--------------------------------------------------------
--  DDL for Procedure USUN_UMOWE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."USUN_UMOWE" (
    p_id IN "Umowy_wypozyczenia"."id"%TYPE
) AS
BEGIN
    -- Usuñ rekordy zale¿ne w tabeli Zwroty
    DELETE FROM "Zwroty" WHERE "id_umowy" = p_id;

    -- Usuñ rekordy zale¿ne w tabeli Forma_platnosci
    DELETE FROM "Forma_platnosci" WHERE "id_umowy" = p_id;

    -- Usuñ umowê
    DELETE FROM "Umowy_wypozyczenia" WHERE "id" = p_id;

    COMMIT;
END usun_umowe;

/
--------------------------------------------------------
--  DDL for Procedure ZAPISZ_ZWROT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "BAZY_DANYCH"."ZAPISZ_ZWROT" (
    p_umowa_id IN "Umowy_wypozyczenia"."id"%TYPE,
    p_stan_licznika IN "Dane_techniczne"."stan_licznika"%TYPE
) AS
    v_pojazd_id "Umowy_wypozyczenia"."id_pojazdu"%TYPE;
    v_status "Umowy_wypozyczenia"."status"%TYPE := 'zakonczona';
    v_dostepny "Pojazd"."dostepny"%TYPE := 'T';
BEGIN
    -- Aktualizacja stanu licznika w tabeli "Dane_techniczne"
    UPDATE "Dane_techniczne"
    SET "stan_licznika" = p_stan_licznika
    WHERE "id" = (SELECT "id_dane_techniczne" FROM "Pojazd" WHERE "id" = (SELECT "id_pojazdu" FROM "Umowy_wypozyczenia" WHERE "id" = p_umowa_id));


    -- Aktualizacja dostêpnoœci pojazdu
    UPDATE "Pojazd"
    SET "dostepny" = v_dostepny
    WHERE "id" = (SELECT "id_pojazdu" FROM "Umowy_wypozyczenia" WHERE "id" = p_umowa_id);

    -- Aktualizacja statusu umowy na "zakoñczona"
    UPDATE "Umowy_wypozyczenia"
    SET "status" = v_status
    WHERE "id" = p_umowa_id;

    -- Dodanie danych zwrotu do tabeli "Zwroty"
    INSERT INTO "Zwroty" ("id","id_umowy", "data_oddania", "stan_licznika_po")
    VALUES (zwroty_seq.NEXTVAL, p_umowa_id, SYSDATE, p_stan_licznika);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END zapisz_zwrot;

/
--------------------------------------------------------
--  DDL for Function OBLICZ_LACZNA_CENE_WYNAJMU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."OBLICZ_LACZNA_CENE_WYNAJMU" (
    p_id_umowy IN "Umowy_wypozyczenia"."id"%TYPE
) RETURN NUMBER IS
    v_kwota_za_dzien "Cennik"."kwota_za_dzien"%TYPE;
    v_kaucja "Cennik"."kaucja"%TYPE;
    v_skladka "Ubezpieczenie"."skladka"%TYPE;
    v_data_wypozyczenia "Umowy_wypozyczenia"."data_wypozyczenia"%TYPE;
    v_data_oddania "Umowy_wypozyczenia"."data_oddania"%TYPE;
    v_id_pojazdu "Umowy_wypozyczenia"."id_pojazdu"%TYPE;
    v_id_cennik "Historia"."id_cennik"%TYPE;
    v_id_ubezpieczenia "Umowy_wypozyczenia"."id_ubezpieczenia"%TYPE;
    v_laczna_cena NUMBER;
    v_dni_wypozyczenia NUMBER;
BEGIN
    BEGIN
        -- Pobierz daty wypo¿yczenia i oddania oraz id_pojazdu i id_ubezpieczenia
        SELECT "data_wypozyczenia", "data_oddania", "id_pojazdu", "id_ubezpieczenia"
        INTO v_data_wypozyczenia, v_data_oddania, v_id_pojazdu, v_id_ubezpieczenia
        FROM "Umowy_wypozyczenia"
        WHERE "id" = p_id_umowy;

        -- Wyœwietl pobrane wartoœci
        DBMS_OUTPUT.PUT_LINE('Data wypo¿yczenia: ' || v_data_wypozyczenia);
        DBMS_OUTPUT.PUT_LINE('Data oddania: ' || v_data_oddania);
        DBMS_OUTPUT.PUT_LINE('ID pojazdu: ' || v_id_pojazdu);
        DBMS_OUTPUT.PUT_LINE('ID ubezpieczenia: ' || v_id_ubezpieczenia);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Nie znaleziono umowy wypo¿yczenia o podanym ID');
    END;

    -- Oblicz liczbê dni wypo¿yczenia
    v_dni_wypozyczenia := v_data_oddania - v_data_wypozyczenia;
    DBMS_OUTPUT.PUT_LINE('Liczba dni wypo¿yczenia: ' || v_dni_wypozyczenia);

    BEGIN
        -- Pobierz id_cennik z tabeli Historia
        SELECT "id_cennik"
        INTO v_id_cennik
        FROM "Historia"
        WHERE "id_pojazd" = v_id_pojazdu;

        -- Wyœwietl pobrane wartoœci
        DBMS_OUTPUT.PUT_LINE('ID cennika: ' || v_id_cennik);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002, 'Nie znaleziono historii dla podanego pojazdu w tym okresie');
    END;

    BEGIN
        -- Pobierz kwotê za dzieñ i kaucjê z tabeli Cennik
        SELECT "kwota_za_dzien", "kaucja"
        INTO v_kwota_za_dzien, v_kaucja
        FROM "Cennik"
        WHERE "id" = v_id_cennik;

        -- Wyœwietl pobrane wartoœci
        DBMS_OUTPUT.PUT_LINE('Kwota za dzieñ: ' || v_kwota_za_dzien);
        DBMS_OUTPUT.PUT_LINE('Kaucja: ' || v_kaucja);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20003, 'Nie znaleziono cennika o podanym ID');
    END;

    BEGIN
        -- Pobierz sk³adkê z tabeli Ubezpieczenie
        SELECT "skladka"
        INTO v_skladka
        FROM "Ubezpieczenie"
        WHERE "id" = v_id_ubezpieczenia;

        -- Wyœwietl pobrane wartoœci
        DBMS_OUTPUT.PUT_LINE('Sk³adka: ' || v_skladka);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20004, 'Nie znaleziono ubezpieczenia o podanym ID');
    END;

    -- Oblicz ³¹czn¹ cenê
    v_laczna_cena := (v_dni_wypozyczenia * v_kwota_za_dzien) + v_skladka + v_kaucja;
    DBMS_OUTPUT.PUT_LINE('£¹czna cena: ' || v_laczna_cena);

    RETURN v_laczna_cena;
END oblicz_laczna_cene_wynajmu;

/
--------------------------------------------------------
--  DDL for Function OBLICZ_PRZEJECHANE_KILOMETRY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."OBLICZ_PRZEJECHANE_KILOMETRY" (
    p_miesiac IN VARCHAR2 DEFAULT 'May'
) RETURN SYS_REFCURSOR AS
    v_id_pojazdu NUMBER;
    v_marka VARCHAR2(100);
    v_model VARCHAR2(100);
    v_przejechane_kilometry NUMBER;
    v_result SYS_REFCURSOR;
BEGIN
    OPEN v_result FOR
    SELECT
        p."id" AS id_pojazdu,
        p."Marka",
        p."Model",
        SUM(z."stan_licznika_po" - u."stan_licznika_przed") AS przejechane_kilometry
    FROM
        "Pojazd" p
        JOIN "Umowy_wypozyczenia" u ON p."id" = u."id_pojazdu"
        JOIN "Zwroty" z ON u."id" = z."id_umowy"
    WHERE
        TO_CHAR(z."data_oddania", 'Month', 'NLS_DATE_LANGUAGE=ENGLISH') = p_miesiac
    GROUP BY
        p."id", p."Marka", p."Model"
    ORDER BY
        p."id";

    RETURN v_result;
END oblicz_przejechane_kilometry;

/
--------------------------------------------------------
--  DDL for Function odczytaj_cennik
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."odczytaj_cennik" (
    p_id IN "Cennik"."id"%TYPE
) RETURN "Cennik"%ROWTYPE AS
    v_cennik "Cennik"%ROWTYPE;
BEGIN
    SELECT * INTO v_cennik FROM "Cennik" WHERE "id" = p_id;
    RETURN v_cennik;
END "odczytaj_cennik";

/
--------------------------------------------------------
--  DDL for Function ODCZYTAJ_DANE_TECHNICZNE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."ODCZYTAJ_DANE_TECHNICZNE" (
    p_id IN "Dane_techniczne"."id"%TYPE
) RETURN "Dane_techniczne"%ROWTYPE AS
    dane_techniczne "Dane_techniczne"%ROWTYPE;
BEGIN
    SELECT * INTO dane_techniczne FROM "Dane_techniczne" WHERE "id" = p_id;
    RETURN dane_techniczne;
END odczytaj_dane_techniczne;

/
--------------------------------------------------------
--  DDL for Function ODCZYTAJ_POJAZD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."ODCZYTAJ_POJAZD" (
    p_id IN "Pojazd"."id"%TYPE
) RETURN SYS_REFCURSOR AS
    c SYS_REFCURSOR;
BEGIN
    OPEN c FOR
        SELECT * FROM "Pojazd" WHERE "id" = p_id;
    RETURN c;
END odczytaj_pojazd;

/
--------------------------------------------------------
--  DDL for Function ODCZYTAJ_UBEZPIECZENIE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."ODCZYTAJ_UBEZPIECZENIE" (
    p_id IN "Ubezpieczenie"."id"%TYPE
) RETURN SYS_REFCURSOR AS
    ubezpieczenie_cursor SYS_REFCURSOR;
BEGIN
    OPEN ubezpieczenie_cursor FOR
        SELECT "id", "rodzaj_ubezpieczenia", "kwota_pokrycia", "skladka"
        FROM "Ubezpieczenie"
        WHERE "id" = p_id;
    RETURN ubezpieczenie_cursor;
END;

/
--------------------------------------------------------
--  DDL for Function ODCZYTAJ_WSZYSTKICH_KLIENTOW
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."ODCZYTAJ_WSZYSTKICH_KLIENTOW" RETURN SYS_REFCURSOR AS
    c_klienci SYS_REFCURSOR;
BEGIN
    OPEN c_klienci FOR SELECT * FROM "Klienci";
    RETURN c_klienci;
END odczytaj_wszystkich_klientow;

/
--------------------------------------------------------
--  DDL for Function ODCZYTAJ_WSZYSTKIE_ADRESY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."ODCZYTAJ_WSZYSTKIE_ADRESY" RETURN SYS_REFCURSOR AS
    c_adres SYS_REFCURSOR;
BEGIN
    OPEN c_adres FOR SELECT * FROM "Adres";
    RETURN c_adres;
END odczytaj_wszystkie_adresy;

/
--------------------------------------------------------
--  DDL for Function odczytaj_wszystkie_cenniki
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BAZY_DANYCH"."odczytaj_wszystkie_cenniki" 
RETURN SYS_REFCURSOR AS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM "Cennik";
    RETURN v_cursor;
END "odczytaj_wszystkie_cenniki";

/
--------------------------------------------------------
--  Constraints for Table Ubezpieczenie
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Ubezpieczenie" MODIFY ("rodzaj_ubezpieczenia" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Ubezpieczenie" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Adres
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Adres" MODIFY ("kod_pocztowy" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Adres" MODIFY ("miejscowosc" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Adres" MODIFY ("ulica" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Adres" MODIFY ("nr_domu" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Adres" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Klienci
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Klienci" MODIFY ("imie" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Klienci" MODIFY ("nazwisko" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Klienci" MODIFY ("id_adresu" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Klienci" MODIFY ("nr_dowodu" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Klienci" MODIFY ("pesel" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Klienci" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Pojazd
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Pojazd" MODIFY ("Marka" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Pojazd" MODIFY ("Model" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Pojazd" MODIFY ("id_dane_techniczne" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Pojazd" MODIFY ("numer_VIN" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Pojazd" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Umowy_wypozyczenia
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" MODIFY ("id_pojazdu" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" MODIFY ("id_klienta" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" MODIFY ("id_ubezpieczenia" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Cennik
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Cennik" MODIFY ("kwota_za_dzien" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Cennik" MODIFY ("kaucja" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Cennik" MODIFY ("kara" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Cennik" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Historia
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Historia" MODIFY ("id_cennik" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Historia" MODIFY ("id_pojazd" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Historia" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Dane_techniczne
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Dane_techniczne" MODIFY ("pojemnosc_silnika" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Dane_techniczne" MODIFY ("moc_silnika" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Dane_techniczne" MODIFY ("stan_licznika" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Dane_techniczne" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Forma_platnosci
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Forma_platnosci" MODIFY ("nr_karty" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Forma_platnosci" MODIFY ("data_wygasniecia_karty" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Forma_platnosci" MODIFY ("CVV" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Forma_platnosci" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Zwroty
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Zwroty" MODIFY ("id_umowy" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Zwroty" MODIFY ("data_oddania" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Zwroty" MODIFY ("stan_licznika_po" NOT NULL ENABLE);
  ALTER TABLE "BAZY_DANYCH"."Zwroty" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Historia
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Historia" ADD CONSTRAINT "FK_Historia_id_pojazd" FOREIGN KEY ("id_pojazd")
	  REFERENCES "BAZY_DANYCH"."Pojazd" ("id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BAZY_DANYCH"."Historia" ADD CONSTRAINT "FK_Historia_id_cennik" FOREIGN KEY ("id_cennik")
	  REFERENCES "BAZY_DANYCH"."Cennik" ("id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Klienci
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Klienci" ADD CONSTRAINT "FK_Klienci_id_adresu" FOREIGN KEY ("id_adresu")
	  REFERENCES "BAZY_DANYCH"."Adres" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Pojazd
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Pojazd" ADD CONSTRAINT "FK_Pojazd_id_dane_techniczne" FOREIGN KEY ("id_dane_techniczne")
	  REFERENCES "BAZY_DANYCH"."Dane_techniczne" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Umowy_wypozyczenia
--------------------------------------------------------

  ALTER TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" ADD CONSTRAINT "FK_Umowy_wypozyczenia_id_klienta" FOREIGN KEY ("id_klienta")
	  REFERENCES "BAZY_DANYCH"."Klienci" ("id") ENABLE;
  ALTER TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" ADD CONSTRAINT "FK_Umowy_wypozyczenia_id_ubezpieczenia" FOREIGN KEY ("id_ubezpieczenia")
	  REFERENCES "BAZY_DANYCH"."Ubezpieczenie" ("id") ENABLE;
  ALTER TABLE "BAZY_DANYCH"."Umowy_wypozyczenia" ADD CONSTRAINT "FK_Umowy_wypozyczenia_id_pojazdu" FOREIGN KEY ("id_pojazdu")
	  REFERENCES "BAZY_DANYCH"."Pojazd" ("id") ON DELETE CASCADE ENABLE;

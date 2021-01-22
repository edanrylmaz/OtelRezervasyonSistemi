/* Room tablosunun olusturulmasi */
create table Room(
odaID number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
odaNo varchar(250) not null unique,
odaTipi varchar(250) not null,
yatak varchar(250) not null,
fiyat int not null,
rezervasyonDurumu varchar(50) default 'Uygun');

/* Customer tablosunun olusturulmasi */
create table Customer(
musteriID number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
musteriAdi varchar(250) not null,
telefon int not null,
ulus varchar(250) not null,
cinsiyet varchar(50) not null,
dogumTarihi varchar(250) not null,
tc varchar(250) not null,
adres varchar(250) not null,
checkin varchar(250) not null, 
checkout varchar(250),
checkoutKontrol varchar(250) default 'NO' not null,
odaID number not null);

/* Users tablosunun olusturulmasi */
create table Users (
kullaniciID number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
kAdi varchar(250) not null,
telefon number not null,
cinsiyet varchar(50) not null,
email varchar(250) not null,
kullaniciAdi varchar(150) not null,
parola varchar(150) not null,
adminKontrol varchar(50) not null);

/* Primary key tanimlamalari */
alter table Room  
add CONSTRAINT room_pk PRIMARY KEY (OdaID);

alter table Customer 
add CONSTRAINT customer_pk PRIMARY KEY(musteriID);

alter table Users 
add CONSTRAINT user_pk PRIMARY KEY(kullaniciID);

/* Foreign key tanimlamalari */
alter table Customer
add CONSTRAINT customer_fk FOREIGN KEY(odaID) REFERENCES Room(odaID);

/* ************************************** */

/* Trigger */
create or replace NONEDITIONABLE TRIGGER DEFAULT_REZERVASYON 
BEFORE INSERT ON ROOM 
REFERENCING OLD AS OLD NEW AS NEW 
FOR EACH ROW
BEGIN
  :NEW.rezervasyonDurumu := 'Uygun';
END;

/* Prosedure */ 
create or replace NONEDITIONABLE PROCEDURE UPDATE_TEL_NO 
(
  ID IN NUMBER 
, NEWTELNO IN NUMBER 
) AS 
BEGIN
  UPDATE Users SET telefon = NEWTELNO WHERE kullaniciid = ID;
END UPDATE_TEL_NO;



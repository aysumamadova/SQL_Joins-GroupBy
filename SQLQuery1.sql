CREATE DATABASE WORK
USE WORK

CREATE TABLE Işçilər(
ID int identity(1,1)primary key,
VəzifəID int references Vəzifələr(ID),
Ad nvarchar(50),
Soyad nvarchar(60),
AtaAdı nvarchar(50),
Maaş float)

CREATE TABLE Vəzifələr(
ID int identity(1,1)primary key,
Ad nvarchar(255))

CREATE TABLE Filiallar(
ID int identity(1,1)primary key,
Ad nvarchar(255))

CREATE TABLE Məhsullar(
ID int identity(1,1)primary key,
Ad nvarchar(255),
AlışQiyməti float,
SatışQiyməti float)

CREATE TABLE Satışlar(
ID int identity(1,1)primary key,
MəhsulId int references Məhsullar(ID),
İşçiId int references Işçilər(ID),
FiliyalId int references Filiallar(ID),
SatışTarixi Date)

INSERT INTO Vəzifələr(Ad)	
VALUES ('Satış danışmanı'), 
('Kassir'),
('Müdir')

SELECT * FROM Vəzifələr

INSERT INTO Işçilər(VəzifəID,Ad,Soyad,AtaAdı,Maaş)
VALUES(3,'Aysu','Memmedova','Hikmet',4000),
(1,'Nergiz','Ehmedli','Seyyaf',1500),
(1,'Yunis','Mahmudov','Ferid',1500),
(2,'Lale','Eliyeva','Seymur',300),
(2,'Murad','Nuriyev','Mehdi',400)

SELECT * FROM Işçilər

INSERT INTO Filiallar(Ad)
VALUES('Azadliq'),
('Genclik'),
('Nermanov'),
('20yanvar')

SELECT * FROM Filiallar

INSERT INTO Məhsullar(Ad,AlışQiyməti,SatışQiyməti)
VALUES('Kofta',50,80),
('Şalvar',70,100),
('Koynek',60,90),
('Ayaqqabı',40,70),
('Çanta',50,80)

SELECT * FROM Məhsullar

INSERT INTO Satışlar(MəhsulId,İşçiId,FiliyalId, SatışTarixi)
VALUES(1,3,1,'12/04/2022'),
(3,3,1,'7/04/2022'),
(2,4,2,'12/01/2022'),
(2,3,1,'8/02/2022'),
(5,4,2,'1/03/2022')

SELECT * FROM Satışlar
SELECT SUM(SatışQiyməti) AS Satışlar FROM Məhsullar where ID=1 or ID=3 --3 Cari ayda məhsul satışından gələn yekun məbləği tap


SELECT Satışlar.İşçiId,Satışlar.MəhsulId,Satışlar.FiliyalId,Məhsullar.AlışQiyməti,Məhsullar.SatışQiyməti--1 Satış cədvəlində işçilərin , satılan məhsulların, satışın olduğu filialın, məhsulun alış və satış qiyməti yazılsın.
FROM Məhsullar
INNER JOIN Satışlar
ON Məhsullar.ID = Satışlar.ID

SELECT  COUNT(İşçiId) AS MəhsulId  FROM Satışlar--2  Bütün satışların cəmini tap.

SELECT  COUNT(MəhsulId) AS İşçiId  FROM Satışlar where Satışlar.İşçiId=3 --4 Hər işçinin satdığı məhsul sayını tap 

SELECT Satışlar.SatışTarixi,Satışlar.MəhsulId FROM Satışlar WHERE Satışlar.ID=1 OR Satışlar.ID=2 --6 Cari ayda ən çox satılan məhsulu tap
ORDER BY Satışlar.MəhsulId DESC

SELECT Satışlar.SatışTarixi,Satışlar.FiliyalId FROM Satışlar WHERE Satışlar.ID=1 --5 Bu gün üzrə ən çox məhsul satılan filialı tap
ORDER BY Satışlar.FiliyalId DESC


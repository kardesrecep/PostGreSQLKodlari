CREATE TABLE mart
(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);
CREATE TABLE nisan
(
	urun_id int ,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  --MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
  
  
  --Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

SELECT urun_isim , musteri_isim from nisan
Where exists (select urun_id from mart where nisan.urun_isim = mart.urun_isim );

  SELECT urun_isim, musteri_isim FROM nisan
WHERE urun_isim IN (SELECT urun_isim FROM mart WHERE mart.urun_isim = nisan.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
-- NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

SELECT urun_isim,musteri_isim from nisan
WHERE  not exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);
-- EXISTS, NOT EXISTS --
-- EXISTS condition subquery'ler ile kullanılır. IN ifadesinin kullanımına benzer
-- EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde 
-- bir değerin olması veya olmaması durunda işlem yapılmasını sağlar
-- Exists true, false gibidir. Boolean
CREATE TABLE mart
(
    urun_id int,
    musteri_isim varchar(50), 
    urun_isim varchar(50)
);
    
CREATE TABLE nisan 
(
    urun_id int ,
    musteri_isim varchar(50), 
    urun_isim varchar(50)
);
    
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
   
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
select * from mart
select * from nisan
  --MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  --MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
SELECT urun_id, musteri_isim from mart              
WHERE exists (SELECT urun_id from nisan WHERE mart.urun_id = nisan.urun_id)
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
SELECT urun_isim, musteri_isim from nisan               
WHERE exists ( select urun_isim from mart WHERE mart.urun_isim = nisan.urun_isim)               
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve   bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
SELECT urun_isim,musteri_isim from nisan
WHERE not exists (SELECT urun_isim from mart WHERE mart.urun_isim=nisan.urun_isim)















































































































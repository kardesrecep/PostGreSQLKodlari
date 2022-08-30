CREATE TABLE calisanlar7
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar7 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar7 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar7 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar7 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar7 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar7 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar7 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
    
CREATE TABLE markalar7
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
    
INSERT INTO markalar7 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar7 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar7 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar7 VALUES(103, 'LCWaikiki', 21000);
    
select * from calisanlar7;
select * from markalar7;
-- SORU1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu
-- markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isim , maas , isyeri from calisanlar7 
where isyeri 
in(select marka_isim from markalar7 where calisan_sayisi>15000)         -- baglanti noktasi
-- in kulanacaksanin parantez icine aldiginiz sorgu birden fazla deger dondermeleir
select * from calisanlar7;--  tablos icin birlesme isyeri sutunu
select * from markalar7;   -- tablosu icin birlesme yeri marka_isim sutunu

-- SORU2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve 
-- şehirlerini listeleyiniz. 
select isim,maas,sehir from calisanlar7
where isyeri in(select marka_isim from markalar7 where marka_id>101);

-- SORU3: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id,calisan_sayisi from markalar
where marka_isim in(select isyeri from calisanlar7 where sehir= 'Ankara');
  
      
-- SORU4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--toplam maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select sum(maas) 
								  as toplam_maas from calisanlar7 where marka_isim=isyeri)  from markalar7;
 
-- SORU5: Her markanin ismini, calisan sayisini ve o markaya
--ait calisanlarin ortalama maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select  round (avg(maas)) 
								  as ortalama_maas from calisanlar7 where marka_isim=isyeri)  from markalar7;

-- SORU6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim,calisan_sayisi,
(Select max(maas)from calisanlar7 where marka_isim=isyeri),
(Select min(maas)from calisanlar7 where marka_isim=isyeri)
from markalar7;

-- SORU7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

select marka_id,marka_isim,(select count(sehir) as sehir_sayisi from calisanlar7 where marka_isim=isyeri )
from markalar7;













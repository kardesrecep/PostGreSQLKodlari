---============================================================
--interview questions 
CREATE TABLE personel6
(
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO personel6 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel6 VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel6 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel6 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');  
INSERT INTO personel6 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO personel6 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel6 VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');


CREATE TABLE isciler6 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO isciler6 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler6 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler6 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler6 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler6 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler6 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler6 VALUES(123456710, 'Mark Stone', 'texas', 2500, 'IBM');

SELECT * FROM isciler6;
SELECT * from personel6;

-- 1) Her iki tablodaki ortak id’leri ve 
--     personel6 tablosunda bu id’ye sahip isimleri
-- isme gore sirali olarak listeleyen query yaziniz

select * from personel6
where id in(select id from isciler6)
order by isim;

-- 2) Personel6 tablosunda kac tane kayit oldugunu gosteren query yazin

   select count(id) as toplam_kayit from personel6;


-- 3)Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
--1.yol
select * from isciler6
order by maas desc
limit 1;

--2.yol
SELECT * FROM isciler6
WHERE maas = (SELECT MAX(maas) FROM isciler6);
 


-- 4) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select maas from isciler6
order by maas desc
limit 1 offset 1;

                            
                            
 --5) Isciler tablosunda ikinci en yuksek maasi alan kisinin tum bilgilerini listeleyen sorgu yaziniz
 select * from isciler6
order by maas desc
limit 1 offset 1;               
                            
                            
            
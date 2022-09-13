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
INSERT INTO personel6 VALUES(123456719, 'Adem Stone', 'New Jersey', 2700, 'IBM');

SELECT *
FROM personel6;

CREATE TABLE isciler 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'texas', 2700, 'IBM');


SELECT *
FROM isciler;

---- 1) Her iki tablodaki ortak id’leri ve 
--     personel6 tablosunda bu id’ye sahip isimleri
-- isme gore sirali olarak listeleyen query yaziniz
--1.yol
select  p.id,p.isim  from personel6 p
where id in(select i.id from isciler i where i.id=p.id )
order by p.isim;

--2.yol
SELECT isim,id
FROM  personel6
WHERE  EXISTS (SELECT id
                        FROM isciler
                        WHERE isciler.id = personel6.id)
ORDER BY isim; 




-- 2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
--1.yol
select p.isim, p.id from personel6 p, isciler i
where (i.id=p.id) and (p.isim=i.isim);

--2.yol
SELECT id, isim FROM personel6
INTERSECT
SELECT id, isim FROM isciler;

--3.yol
select p.id,p.isim from personel6 p
inner join isciler i on (i.id=p.id) and (i.isim=p.isim);

-- 3) Personel6 tablosunda kac farkli sehirden personel var?

select count( distinct sehir) as farkli_olan_sehirler from personel6

-- 4) Personel6 tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Query yaziniz
--1.yol
--cift olanlar
select * from personel6
where (id%2=0);
--tek olanlar
select * from personel6
where (id%2!=0);

--2.yol
--cift olanlar
SELECT * FROM personel6
WHERE MOD(id,2)=0;
--tek olanlar
SELECT * FROM personel6
WHERE MOD(id,2)!=0;
-- 5) Personel6 tablosunda kac tane kayit oldugunu gosteren query yazin
--1.yol
select count (id) as kayit_sayisi from personel6
--2.yol
select count (*) from  personel6

-- 6)Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
--1.yol
select * from isciler
where maas=(select max(maas) from isciler);

--2.yol
select * from isciler
order by maas desc
limit 1;

-- 7)Personel6 tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
--1.yol
select * from isciler
where maas=(select min(maas) from isciler);

--2.yol
select * from isciler
order by maas asc
limit 1;

-- 8) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
--1.yol
select * from isciler
order by maas desc
 offset 1 limit 1;

--2.yol
select * from isciler
where maas=(SELECT MAX(maas) FROM isciler
WHERE maas<>(SELECT MAX(maas) FROM isciler));


--3.yol
select * from isciler
where maas=(select max(maas) from isciler
		   where maas!=(select max(maas) from isciler))

-- <> esit degil anlaminda kullanilmaktadir.
-- (<>) = (!=)

-- Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, 
--tum bilgilerini gosteren query yazin
--1.yol
select * from isciler
where maas<> (select max(maas) from isciler);

--2.yol
select * from isciler
order by maas desc
offset 1;

--3.yol
select * from isciler
except
select * from isciler
where maas= (select max(maas) from isciler)

--4.yol
select * from isciler 
where maas in (select maas from isciler
except
select max(maas) from isciler)























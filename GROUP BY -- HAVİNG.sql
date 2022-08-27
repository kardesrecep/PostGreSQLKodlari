/*
-- GROUP BY -- HAVİNG -- 
HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor. Ancak kümeleme fonksiyonları ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur.
GROUP BY ile kullanılır. Gruplamadan sonraki şart için group by'dan sonra HAVING kullanılır.
*/
​
--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, avg(maas) as ortalama_yas from personel
where cinsiyet = 'E' GROUP by ulke
HAVING avg(maas)> 3000;
​
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke, avg(maas) as ortalama_yas, count (cinsiyet) as calisan_sayi from personel
where cinsiyet='E'
GROUP by ulke having count(cinsiyet)>1; 
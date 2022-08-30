--UNION Operator: 1) İki sorgu(query) sonucunu birleştirmek için kullanılır.
            --    2) Tekrarsız(unique) recordları verir.
              --  3) Tek bir sütuna çok sütun koyabiliriz.
			--	4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.		
			
--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarsız olarak bulunuz

select state as "name and state", salary
from workers
where salary>3000

union

select name,salary 
from workers
where salary < 2000;

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.

select state as "name and state", salary
from workers
where salary>3000

union all-- tekrarli olanlari cagirmak için kullaniriz

select name,salary 
from workers
where salary < 2000;

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.

--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir.
--Unique(tekrarsız) recordları verir.

select name from workers
where salary>1000

intersect--ortak degerleri bulmak icin kullandiğigimiz keyword

select name from workers
where salary<2000;

--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
select name from workers
where salary <2000

intersect

select name from workers
where company in('IBM', 'APPLE', 'MICROSOFT');

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır.
--Unique(tekrarsız) recordları verir.

--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.

select name from workers
where salary <3000

except

select name from workers
where company in('GOOGLE') --///where company='GOOGLE'












































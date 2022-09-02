--//1. Örnek: İki parametre ile çalışıp bu parametreleri toplayarak return yapan bir fonksiyon oluşturun.

CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
 BEGIN
 RETURN x+y;
 END
$$

select * from toplamaF(15,69) as toplam;


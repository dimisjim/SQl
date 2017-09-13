/*13
CREATE VIEW View1 AS
SELECT title,sum(SALES_DISKS.quantity) as NumberOfCopiesSold
FROM DISKS, SALES_DISKS
WHERE DISKS.diskid=SALES_DISKS.diskid;
group by title;

SELECT title, NumberOfCopiesSold
from View1 
where NumberOfCopiesSold>100;
*/
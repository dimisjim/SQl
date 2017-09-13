/*1
select title, type
from DISKS
order by type;

select title, type
from DISKS
order by title;
*/

/*2
select distinct firstname, lastname, title, year, type
from ARTISTS, DISKS, DISKS_ARTISTS
where ARTISTS.firstname='Blur' 
AND DISKS_ARTISTS.artistid=ARTISTS.artistid
AND DISKS.diskid=DISKS_ARTISTS.diskid
order by year desc;
*/

/*3
select cname, title, year
from DISKS, COMPANIES
where COMPANIES.cname='SONY BMG' 
AND DISKS.type='CD' 
AND DISKS.year>=2000 
AND DISKS.cid=COMPANIES.cid;
*/

/*4
select music, sum(quantity)
from DISKS, MUSIC_TYPES
where MUSIC_TYPES.mid=DISKS.mtype
group by music;
*/

/*5
select title, quantity
from DISKS
where quantity<=3;
*/

/*6
select sid, count(ORDERS.order_status) as '# of In progress orders'
from ORDERS
where ORDERS.order_status='In progress'
group by sid;
*/

/*7 
select sex, sum(DISKS.price) as GrossSalesAmountIn2016
from CUSTOMERS,SALES, DISKS
where DATEPART(yyyy,sale_date)=2016
group by sex;
*/

/*8
select mtype, sum(SALES_DISKS.quantity) as AmountOfDisksSoldByType
from DISKS, SALES_DISKS
group by mtype;
*/

/*9 
select distinct firstname, title, type
from ARTISTS, DISKS, DISKS_ARTISTS
where DISKS_ARTISTS.artistid=ARTISTS.artistid
AND firstname='Blur'
AND DISKS.diskid=DISKS_ARTISTS.diskid
AND DISKS.type='CD'
Union
select distinct firstname, title, type
from ARTISTS, DISKS, DISKS_ARTISTS
where DISKS_ARTISTS.artistid=ARTISTS.artistid
AND firstname='Pendulum'
AND DISKS.diskid=DISKS_ARTISTS.diskid
AND DISKS.type='CD';
*/

/*10
select distinct firstname, title, type
from ARTISTS, DISKS, DISKS_ARTISTS
where DISKS_ARTISTS.artistid=ARTISTS.artistid
AND firstname='Blur'
AND DISKS.diskid=DISKS_ARTISTS.diskid
Except
select distinct firstname, title, type
from ARTISTS, DISKS, DISKS_ARTISTS
where DISKS_ARTISTS.artistid=ARTISTS.artistid
AND firstname='Pendulum'
AND DISKS.diskid=DISKS_ARTISTS.diskid
*/

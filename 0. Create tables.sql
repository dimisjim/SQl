CREATE TABLE COMPANIES
(  cid int NOT NULL PRIMARY KEY,
   cname varchar(100) NOT NULL
);

CREATE TABLE MUSIC_TYPES
(  mid int NOT NULL PRIMARY KEY,
   music varchar(100) NOT NULL
);

CREATE TABLE DISKS
(  diskid int NOT NULL PRIMARY KEY,
   title varchar(100) NOT NULL,
   duration decimal(4,2) NOT NULL,
   price int NOT NULL,  
   quantity int NOT NULL, 
   year int NOT NULL,
   type varchar(20) NOT NULL,
   dstatus varchar(50) NOT NULL,
   mtype int,
   cid int,
   CONSTRAINT CK_YEAR CHECK (year < 2016),
   CONSTRAINT CK_QUANTITY CHECK (quantity >= 0),
   CONSTRAINT CK_PRICE CHECK (price > 0),
   CONSTRAINT CK_type CHECK (type='CD' OR type='DVD' OR type='Vinyl Disk'),
   CONSTRAINT CK_dstatus CHECK (dstatus='In Stock' OR dstatus='On Order' OR dstatus='Sold Out'),
   CONSTRAINT FK01 FOREIGN KEY (mtype) REFERENCES MUSIC_TYPES(mid),
   CONSTRAINT FK02 FOREIGN KEY (cid) REFERENCES COMPANIES(cid)
);

CREATE TABLE ARTISTS
(  artistid int NOT NULL PRIMARY KEY,
   firstname varchar(100),
   lastname varchar(100)
);

CREATE TABLE DISKS_ARTISTS
(  artistid int NOT NULL,
   diskid int NOT NULL,
   PRIMARY KEY (artistid,diskid),
   CONSTRAINT FK03 FOREIGN KEY (artistid) REFERENCES ARTISTS(artistid),
   CONSTRAINT FK04 FOREIGN KEY (diskid) REFERENCES DISKS(diskid)
);

CREATE TABLE SUPPLIERS
(  sid int NOT NULL PRIMARY KEY,
   sname varchar(100) NOT NULL,
   cname varchar(100),
   rank int NOT NULL,
   CONSTRAINT CK_RANK CHECK (rank>=1 AND rank<=5)
);

CREATE TABLE ORDERS
(  orderid int NOT NULL PRIMARY KEY,
   order_date date NOT NULL,
   order_status varchar(50),
   sid int,
   CONSTRAINT FK05 FOREIGN KEY (sid) REFERENCES SUPPLIERS(sid),
   CONSTRAINT CK_ST CHECK (order_status='In progress' OR order_status='Completed' OR order_status='Canceled')
);

CREATE TABLE ORDERS_DISKS
(  orderid int NOT NULL,
   diskid int NOT NULL,
   quantity int,
   unit_price int,
   PRIMARY KEY (orderid, diskid),
   CONSTRAINT FK06 FOREIGN KEY (orderid) REFERENCES ORDERS(orderid),
   CONSTRAINT FK07 FOREIGN KEY (diskid) REFERENCES DISKS(diskid),
   CONSTRAINT CK_QUANT CHECK (quantity>0)
);

CREATE TABLE CUSTOMERS
(  custid int NOT NULL PRIMARY KEY,
   firstname varchar(50) NOT NULL,
   lastname varchar(50),
   city varchar(50),
   street varchar(50),
   no int,
   post_code int,
   sex varchar(2),
   phone bigint,
   CONSTRAINT CK_SEX CHECK (sex='F' OR sex='M')
);

CREATE TABLE SALES
(  saleid int NOT NULL PRIMARY KEY,
   custid int,
   sale_date date,
   Payment varchar(20),
   CONSTRAINT CK_PAY CHECK (Payment='Cash' OR Payment='Credit Card'),
   CONSTRAINT FK08 FOREIGN KEY (custid) REFERENCES CUSTOMERS(custid)
);

CREATE TABLE SALES_DISKS
(  saleid int NOT NULL,
   diskid int NOT NULL,
   PRIMARY KEY (saleid, diskid),
   quantity int, 
   CONSTRAINT FK09 FOREIGN KEY (saleid) REFERENCES SALES(saleid),
   CONSTRAINT FK010 FOREIGN KEY (diskid) REFERENCES DISKS(diskid)
);

-- ----------------------------------------- Sales Schema --------------------------------------------------------

CREATE TABLE Category (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);


insert into Category (id, name) 
values (1, 'Kids'), (2, 'Men'),
(3, 'Women'), (4, 'Sports'),
(5, 'Electronics'), (6, 'Books'),
(7, 'Shoes'), (8, 'Grocery'),
(9, 'Cloths'), (10, 'Furniture'), (11, 'Sports'),
(12, 'Shoes'), (13, 'Women'),(14, 'Electronics'), 
(15, 'Furniture'), (16, 'Books'), (17, 'Grocery'),
(18, 'Cloths'), (19, 'Electronics'), (20, 'Cloths');

select * 
from Category;

CREATE TABLE City (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

insert into City (id, name) values (1001, 'Mumbai'),
(1002, 'Thane'),(1003, 'Nashik'), (1004, 'Pune'),
(1005, 'Delhi'), (1006, 'Patna'), (1007, 'Bangalore'),
(1008, 'Gandhinagar'), (1009, 'kolkata'), (1010, 'London'),
(1011, 'Lonavala'), (1012, 'New York'), (1013, 'New Delhi'),
(1014, 'Navi Mumbai'), (1015, 'Dahanu'), (1016, 'Panji'), (1017, 'Varanasi'),
(1018, 'Lucknow'), (1019, 'Ratnagiri'), (1020, 'Dhule');

select * 
from City;

-- 3)--------       Product       ---------

CREATE TABLE Product (
    id INT PRIMARY KEY,
    prodname VARCHAR(100) NOT NULL,
    price DECIMAL(6,0),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

insert into Product (id, prodname, price, category_id) 
values (10, 'Toys', 1000, 1), (20, 'Man matters', 1500, 2), (30, 'Makeup', 2000, 3), 
(40, 'Cricket', 2400, 4), (50, 'TV', 77000, 5), (60, 'Rhymes', 100, 6),
(70, 'Adidas', 40000, 7), (80, 'Oil', 500, 8), (90, 'T-shirt', 700, 9),
 (100, 'Bed', 6000, 10), (110, 'Foot ball', 200, 11),
 (120, 'Nike', 3000, 12), (130, 'Purse', 3000, 13), (140, 'Refrigerator', 1000, 14),
(150, 'Door', 5000, 15), (160, 'Story', 200, 16), (170, 'Foods', 500, 17),
 (180, 'Shirts', 350, 18), (190, 'Mobile', 25000, 19), (200, 'Jeans', 500, 20);

select *
 from Product;

-- 4) ----------     Customers      -----------

CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    locationid DECIMAL(5),
    email VARCHAR(60),
    DOB DATE,  
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(id)
);

insert into Customers (id, name, locationid, email, DOB, city_id) 
values (1101, 'Shani', 1501, 'ab@gmail.com', STR_TO_DATE('10-03-2002','%d-%m-%Y'),1001 ),
(1102, 'Nikita', 1502, 'nikita@gmail.com', STR_TO_DATE('20-06-2005','%d-%m-%Y'), 1002 ),
(1103, 'Amit', 1503, 'amit@gmail.com', STR_TO_DATE('30-04-2004','%d-%m-%Y'), 1003 ),
(1104, 'Ratan', 1504, 'ratan@gmail.com', STR_TO_DATE('13-03-2001','%d-%m-%Y'), 1004 ),
(1105, 'Ritu', 1505, 'ritu@gmail.com', STR_TO_DATE('10-07-2003','%d-%m-%Y'), 1005 ),
(1106, 'Pravin', 1506, 'pravin@gmail.com', STR_TO_DATE('15-07-2000','%d-%m-%Y'), 1006 ),
(1107, 'Piyush', 1507, 'piyush@gmail.com', STR_TO_DATE('30-07-2003','%d-%m-%Y'), 1007 ),
(1108, 'pinku', 1508, 'pinku@gmail.com', STR_TO_DATE('30-07-2003','%d-%m-%Y'), 1008 ),
(1109, 'Gaurav', 1509, 'Gaurav@gmail.com', STR_TO_DATE('10-07-1999','%d-%m-%Y'), 1009 ),
(1110, 'Ravina', 1510, 'ravina@gmail.com', STR_TO_DATE('30-07-2003','%d-%m-%Y'), 1010 ),
(1111, 'Sachin', 1511, 'sachin@gmail.com', STR_TO_DATE('18-12-2003','%d-%m-%Y'), 1011 ),
(1112, 'Rina', 1512, 'rina@gmail.com', STR_TO_DATE('10-07-2003','%d-%m-%Y'), 1012 ),
(1113, 'Rekha', 1513, 'Rekha@gmail.com', STR_TO_DATE('10-07-2003','%d-%m-%Y'), 1013 ),
(1114, 'David', 1514, 'david@gmail.com', STR_TO_DATE('10-02-2001','%d-%m-%Y'), 1014 ),
(1115, 'Nancy', 1515, 'nancy@gmail.com', STR_TO_DATE('12-07-2005','%d-%m-%Y'), 1015 ),
(1116, 'manu', 1516, 'manu@gmail.com', STR_TO_DATE('13-07-2005','%d-%m-%Y'), 1016 ),
(1117, 'Rakesh', 1517, 'rakesh@gmail.com', STR_TO_DATE('10-07-1998','%d-%m-%Y'), 1017 ),
(1118, 'Ishan', 1518, 'ishan@gmail.com', STR_TO_DATE('15-08-1994','%d-%m-%Y'), 1018 ),
(1119, 'Trisha', 1519, 'trisha@gmail.com', STR_TO_DATE('23-07-1997','%d-%m-%Y'), 1019 ),
(1120, 'Piya', 1520, 'piya@gmail.com', STR_TO_DATE('10-03-2005','%d-%m-%Y'), 1020 );

select *
from Customers;

-- 5) -----------     Transactions     ------------

CREATE TABLE Transactions (
    txid INT PRIMARY KEY,
    txtime TIMESTAMP NOT NULL,
    cust_id INT,
    prod_id INT,
    qty DECIMAL(6) CHECK (qty > 0),  -- Added CHECK constraint
    FOREIGN KEY (prod_id) REFERENCES Product(id),
    FOREIGN KEY (cust_id) REFERENCES Customers(id)
);

insert into transactions (txid, txtime, cust_id, prod_id, qty)
values (101, STR_TO_DATE('10-aug-2024 01:20:09','%d-%b-%Y %H:%i:%s'), 1101, 10, 207 ), -- %b is used for character date
(102, STR_TO_DATE('29-apr-2024 02:50:39','%d-%b-%Y %H:%i:%s'), 1102, 20, 649 ),
(103, STR_TO_DATE('15-jun-2024 10:20:10','%d-%b-%Y %H:%i:%s'), 1103, 30, 1203 ),
(104, STR_TO_DATE('01-sep-2024 05:30:12','%d-%b-%Y %H:%i:%s'), 1104, 40, 1145 ),
(105, STR_TO_DATE('17-feb-2024 01:20:09','%d-%b-%Y %H:%i:%s'), 1105, 50, 232 ),
(106, STR_TO_DATE('19-may-2024 03:50:39','%d-%b-%Y %H:%i:%s'), 1106, 60, 63 ),
(107, STR_TO_DATE('15-jul-2024 11:20:10','%d-%b-%Y %H:%i:%s'), 1107, 70, 190 ),
(108, STR_TO_DATE('18-jul-2024 12:30:12','%d-%b-%Y %H:%i:%s'), 1108, 80, 143 ),
(109, STR_TO_DATE('10-aug-2024 01:20:09','%d-%b-%Y %H:%i:%s'), 1109, 90, 832 ),
(110, STR_TO_DATE('19-aug-2024 09:50:39','%d-%b-%Y %H:%i:%s'), 1110, 100, 800 ),
(111, STR_TO_DATE('03-sep-2024 12:20:10','%d-%b-%Y %H:%i:%s'), 1111, 110, 1793 ),
(112, STR_TO_DATE('21-sep-2024 07:30:12','%d-%b-%Y %H:%i:%s'), 1112, 120, 2241 ),
(113, STR_TO_DATE('02-oct-2024 07:50:12','%d-%b-%Y %H:%i:%s'), 1113, 130, 2241 ),
(114, STR_TO_DATE('22-nov-2024 08:30:19','%d-%b-%Y %H:%i:%s'), 1114, 140, 2201 ),
(115, STR_TO_DATE('23-nov-2024 09:30:13','%d-%b-%Y %H:%i:%s'), 1115, 150, 741 );

select *
 from Transactions;
 
 -- joining the tables --------------------------------
 
select *
from Category c, Product p, Transactions t, Customers cu, City ct
where c.id = p.category_id and p.id = t.prod_id and t.cust_id = cu.id and cu.city_id = ct.id;

-- Questions -----------------------------------------


-- 1) Find a top 3 selling Category.

select *
from   (select catename, total_sales, (dense_rank() over (order by total_sales desc)) as Top_3
           from (select c.name as catename, sum(p.price*t.qty) as total_sales
                   from Category c, Product p, Transactions t
                   where c.id = p.category_id and p.id = t.prod_id
                   group by c.name
                   ) as SaleByCategory
                   ) Rank_sale
where Top_3 <= 3;


-- 2) Find a top 3 selling Products.
-- Ans. It is sales wise top 3 selling products. 

select *
from (  select pname, total_sales2, (dense_rank() over (order by total_sales2 desc)) as top_3
            from (  select p.prodname as pname, sum(t.qty*p.price) as total_sales2
                      from Product p, Transactions t
                     where p.id = t.prod_id
                     group by p.prodname
                     order by 2)as  SalesByProduct)
                     as sales_rank
where top_3 <=3;


-- 3) Find a Product wise total sales.
-- Ans. This is a product wise total sales of all products.

select p.prodname, sum(t.qty*p.price) total_sales
from Product p, Transactions t
where p.id = t.prod_id
group by p.prodname
order by 2;

-- 4) Customers purchase details - all transaction by the customers.
-- Ans. Below query shows the customers purchasing details and all transactions of customers and also shows the customers details.

select p.prodname products, t.txid, t.txtime trans_time, cu.name customers, cu.email emails, (t.qty*p.price) transactions
from Product p, Transactions t, Customers cu
where p.id = t.prod_id and t.cust_id = cu.id
order by customers;

-- 5) Find a top 3 selling cities.
select *
from  (select city_name, total_sale, (dense_rank() over (order by total_sale desc)) top3_cities
           from (select ct.name city_name, (t.qty*p.price) total_sale
                    from Product p, Transactions t, Customers cu, City ct
                    where  p.id = t.prod_id and t.cust_id = cu.id and cu.city_id = ct.id) as SaleByCities)
                    as Rank_sales
where top3_cities <=3;


-- 6) Find the Daily sales, weekly sales and monthly sales.
-- A) Daily sales
select date_format(t.txtime, '%d-%m-%Y') as sales_date, p.prodname as product, p.price, t.qty, (t.qty*p.price) as Total_sales
from Product p, Transactions t
where p.id = t.prod_id;

-- B) Weekly sales
select date_format(t.txtime, '%v') as weekly_sales, p.prodname as products, p.price, t.qty, (t.qty*p.price) as Total_sales
from Product p, Transactions t
where p.id = t.prod_id
order by weekly_sales;

-- C) Monthly sales
select date_format(t.txtime, '%b') as monthly_sales, p.prodname as products, p.price, t.qty, sum(t.qty*p.price) as Total_sales
from Product p, Transactions t
where p.id = t.prod_id
group by date_format(t.txtime, '%b') , p.prodname , p.price, t.qty
order by 1;


-- 7) Find city wise product wise quantity sold and total sales value.

select ct.name city_name, p.prodname product, t.qty quantity, sum(t.qty*p.price) total_sale
from Product p, Transactions t, Customers cu, City ct
where p.id = t.prod_id and t.cust_id = cu.id and cu.city_id = ct.id
group by ct.name , p.prodname , t.qty 
order by 1,2,3;



  

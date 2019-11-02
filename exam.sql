--####1.创建表空间exam
CREATE TABLESPACE exam DATAFILE '/home/oracle/exam/exam_data.dbf' size 100M;


--####2.创建4张表
--创建user表
CREATE TABLE users
(
	userid  	NUMBER(10)	NOT NULL,
	username	VARCHAR2(20)	NOT NULL,	
	userpassword	VARCHAR2(20)	NOT NULL,
	email		VARCHAR2(50)	NOT NULL,
	lastlogin	date		NOT NULL,
	CONSTRAINT PK_USER_ID PRIMARY KEY(userid)
);

--创建goods表
CREATE TABLE goods
(
	goodsid		NUMBER(10)	NOT NULL,
	goodsname	VARCHAR2(20)	NOT NULL,
	goodsnumber	NUMBER(10)	NOT NULL,
	producer	VARCHAR2(50)	NOT NULL,
	price		NUMBER(10)	NOT NULL,
	pdate		date		NOT NULL,
	paddress	VARCHAR2(100)	NOT NULL,
	CONSTRAINT PK_GOODS_ID PRIMARY KEY(goodsid)
);

--创建mybuy表
CREATE TABLE mybuy
(
	buyid		NUMBER(10)	NOT NULL,
	goodsid		NUMBER(10)	NOT NULL,
	userid		NUMBER(10)	NOT NULL,
	buynumber	NUMBER(10)	NOT NULL,
	buytime		date		NOT NULL,
	CONSTRAINT PK_MYBUY_id	PRIMARY KEY(buyid)
);

--创建shoppinglist表
CREATE TABLE shoppinglist
(
	shoppingid	NUMBER(10)	NOT NULL,
	userid		NUMBER(10)	NOT NULL,
	goodsid		NUMBER(10)	NOT NULL,
	shoppingnumber	NUMBER(10)	NOT NULL,
	CONSTRAINT PK_SHOPPING_ID PRIMARY KEY(shoppingid)
);

--####3.分别向表中插入数据
--向user表中插入数据
INSERT INTO users VALUES(1107,'周前程','12345678','123@qq.com','01-JAN-2019');
INSERT INTO users VALUES(1001,'李四','45678901','456@qq.com','02-JAN-2019');
INSERT INTO users VALUES(1002,'王五','78901234','789@qq.com','03-JAN-2019');
INSERT INTO users VALUES(1003,'Hello','hello1234','hello@qq.com','04-JAN-2019');

--向goods表插入数据
INSERT INTO goods VALUES(20,'葡萄',100,'开心果园',12,'01-JAN-2019','成都');
INSERT INTO goods VALUES(21,'西瓜',200,'开心果园',10,'01-JAN-2019','成都');
INSERT INTO goods VALUES(22,'香蕉',100,'开心果园',14,'01-JAN-2018','成都');
INSERT INTO goods VALUES(23,'樱桃',300,'开心果园',60,'01-JAN-2018','成都');
INSERT INTO goods VALUES(24,'橘子',100,'开心果园',10,'01-JAN-2018','成都');
INSERT INTO goods VALUES(25,'柚子',500,'开心果园',10,'01-JAN-2019','成都');
INSERT INTO goods VALUES(26,'草莓',100,'开心果园',55,'01-JAN-2019','成都');
INSERT INTO goods VALUES(27,'李子',700,'开心果园',10,'01-JAN-2019','成都');
INSERT INTO goods VALUES(28,'苹果',100,'开心果园',10,'01-JAN-2019','成都');
INSERT INTO goods VALUES(29,'哈密瓜',100,'开心果园',10,'01-JAN-2019','成都');

--向mybuy表中插入数据
INSERT INTO mybuy VALUES(2000,20,1107,10,'01-JAN-2019');
INSERT INTO mybuy VALUES(2002,21,1107,20,'01-JAN-2019');
INSERT INTO mybuy VALUES(2003,22,1107,30,'01-JAN-2019');
INSERT INTO mybuy VALUES(2004,23,1107,40,'01-JAN-2018');
INSERT INTO mybuy VALUES(2005,24,1107,20,'01-JAN-2018');
INSERT INTO mybuy VALUES(2006,25,1001,40,'01-JAN-2018');
INSERT INTO mybuy VALUES(2007,26,1001,20,'01-JAN-2019');
INSERT INTO mybuy VALUES(2008,27,1002,60,'01-JAN-2019');
INSERT INTO mybuy VALUES(2009,28,1002,20,'01-JAN-2019');
INSERT INTO mybuy VALUES(2010,29,1003,10,'01-JAN-2019');

--向shoppinglist表中插入数据
INSERT INTO shoppinglist VALUES(101,1107,20,10);
INSERT INTO shoppinglist VALUES(102,1107,21,20);
INSERT INTO shoppinglist VALUES(103,1107,22,30);
INSERT INTO shoppinglist VALUES(104,1001,25,40);
INSERT INTO shoppinglist VALUES(105,1002,27,60);

--####4.显示表中所有数据####
--查询users表中所有数据
SELECT * FROM users;
--查询goods表中所有数据
SELECT * FROM goods;
--查询mybuy表中所有数据
SELECT * FROM mybuy;
--查询shoppinglist表中所有数据
SELECT * FROM shoppinglist;


--####5.创建索引和视图####

--为users表的username创建一个非唯一性索引
CREATE INDEX INDEX_username ON users(username);
--为shoppinglist表的goodsid创建唯一性索引
CREATE UNIQUE INDEX INDEX_goodsid ON  shoppinglist(goodsid);
--创建一个购买了商品号goodsid为自己学号末三位的商品信息的视图
CREATE VIEW VIEW_myid AS
SELECT * FROM goods
WHERE goodsid IN (SELECT goodsid FROM mybuy WHERE userid LIKE '%107');

--####6.建立完整性约束####

--为users 表的userpassword 添加检查约束，约束密码的位数必须大于6 位。
ALTER TABLE users 
ADD CONSTRAINT paswd_inspect CHECK (length(userpassword)>6);
--为goods添加检查约束，商品的价格必须大于0。
ALTER TABLE goods
ADD CONSTRAINT price_inspect CHECK (price>0);

--####7.创建一个用户 tiger。设置一个身份认证密码（密码为自己学号），用户的状态设置为锁定状态，在需要开启该用户来管理数据库时，再解锁该用户####
CREATE USER tiger IDENTIFIED BY 20160401107;

ALTER USER tiger ACCOUNT UNLOCK;

--####8.对tiger用户授权。将该数据库中的4个表的所有操作权限授予tiger用户####
GRANT INSERT,DELETE,UPDATE,SELECT ON users TO tiger;
GRANT INSERT,DELETE,UPDATE,SELECT ON goods TO tiger;
GRANT INSERT,DELETE,UPDATE,SELECT ON mybuy TO tiger;
GRANT INSERT,DELETE,UPDATE,SELECT ON shoppinglist TO tiger;


--####9. 查询数据表####

--(1)显示商品价格在50和100 之间的商品信息。
SELECT * FROM goods WHERE price BETWEEN 50 AND 100;

--(2)查询用户“周前程”的购物车shoppinglist里面的所有商品信息。包括商品的名称 goodname，商品的价格price，以及商品的数量shoppingnumber
SELECT goods.goodsname,goods.price,shoppinglist.shoppingnumber  FROM goods,shoppinglist
WHERE goods.goodsid=shoppinglist.goodsid AND shoppinglist.userid=(SELECT userid FROM users WHERE username='周前程');


--(3)查询“周前程”买过的最贵的商品信息。包括商品的goodid，商品的名称goodname，商品的数量 buynumber。
SELECT goods.goodsid,goods.goodsname,mybuy.buynumber FROM goods,mybuy
WHERE goods.goodsid=mybuy.goodsid AND goods.price=(SELECT MAX(price) FROM goods WHERE goodsid IN (SELECT goodsid FROM mybuy WHERE userid=(SELECT userid FROM users WHERE username='周前程')));


--查询“周前程”在2018年全年买过的所有商品信息。包括商品的名称goodname，商品的单价price，商品的数量buynumber。
SELECT goods.goodsname,goods.price,mybuy.buynumber FROM goods,mybuy
WHERE goods.goodsid=mybuy.goodsid AND to_char(mybuy.buytime,'YYYY')='2018' AND mybuy.userid=(SELECT userid FROM users WHERE username='周前程');


--计算“周前程”在2018年用于网购的总金额。
SELECT SUM(goods.price*mybuy.buynumber) FROM goods,mybuy WHERE goods.goodsid=mybuy.goodsid AND to_char(mybuy.buytime,'YYYY')='2018' AND userid=(SELECT userid FROM users WHERE username='周前程')



--####10.创建过程和函数####

--(1)创建存储过程。以用户的userid为参数，返回用户密码。
CREATE OR REPLACE PROCEDURE return_passwd
(
	I_id	IN	users.userid%type,
	O_passwd OUT	users.userpassword%type
)
IS
BEGIN
	SELECT userpassword INTO O_passwd 
	FROM users
	WHERE userid=I_id;
END return_passwd;
/

VARIABLE passwd VARCHAR2(20);
EXECUTE return_passwd(1107,:passwd);
PRINT passwd;
--(2)创建存储过程。以输入用户的userid为参数，统计该用户所购买的商品。
CREATE OR REPLACE PROCEDURE return_goods
(
	I_id	IN	users.userid%type,
	O_goods	OUT	SYS_REFCURSOR
)
IS
BEGIN
	OPEN O_goods FOR
		SELECT goodsname FROM goods
		WHERE goodsid IN (SELECT goodsid FROM mybuy WHERE mybuy.userid=I_id);
END return_goods;
/

VARIABLE goods REFCURSOR;
EXECUTE return_goods(1107,:goods);
PRINT goods;
--(3)创建存储过程。以输入商品的goodid为参数，返回购买此商品的用户userid。

CREATE OR REPLACE PROCEDURE return_userid
(
	I_id	IN	shoppinglist.goodsid%type,
	O_uid	OUT	SYS_REFCURSOR
)
IS
BEGIN
	OPEN O_uid FOR
	SELECT userid FROM users
	WHERE userid IN (SELECT userid FROM mybuy WHERE goodsid=I_id);
END return_userid;
/
VARIABLE userid REFCURSOR;
EXECUTE return_userid(21,:userid);
PRINT userid;
--(4)创建函数。以用户的userid为参数，返回其购买的最高商品的商品名。
CREATE OR REPLACE FUNCTION return_goodsname
(
	I_id	IN	mybuy.userid%type
)
return VARCHAR2
IS	O_goodsname	VARCHAR2(20);
BEGIN
	SELECT goods.goodsname INTO O_goodsname FROM goods,mybuy
	WHERE mybuy.goodsid=goods.goodsid AND mybuy.userid=I_id AND goods.price=(SELECT MAX(price) FROM goods WHERE goodsid IN (SELECT goodsid FROM mybuy WHERE userid=I_id));
	RETURN O_goodsname;
END return_goodsname;
/

VARIABLE high_goodsname VARCHAR2(20);
EXECUTE:high_goodsname:=return_goodsname(1107);
PRINT high_goodsname;


DROP TABLE recommendation IF EXISTS;
DROP TABLE zzim IF EXISTS;
DROP TABLE delivery IF EXISTS;
DROP TABLE orders IF EXISTS;
DROP TABLE shoppingcart IF EXISTS;
DROP TABLE review IF EXISTS;
DROP TABLE menu IF EXISTS;
DROP TABLE restaurant IF EXISTS;
DROP TABLE cate IF EXISTS;
DROP TABLE members IF EXISTS;
DROP TABLE restaurantowner IF EXISTS;


SHOW TABLES;
/**********************************/
/* Table Name: ?궗?뾽?옄 */
/**********************************/

DROP SEQUENCE restaurantowner_seq;
CREATE SEQUENCE restaurantowner_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;          
  
CREATE TABLE restaurantowner(
		rono INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(10) NOT NULL,
		businessnumber VARCHAR(20) DEFAULT 0 NOT NULL,
		phone VARCHAR(15),
		id VARCHAR(15) NOT NULL,
		pw VARCHAR(20) NOT NULL
);


insert into restaurantowner(rono, name, businessnumber, phone, id, pw)
values (restaurantowner_seq.nextval, '주인장1','2021-12111','010-1234-2345','owner1','1234');

insert into restaurantowner(rono, name, businessnumber, phone, id, pw)
values (restaurantowner_seq.nextval, '주인장2','2021-23442','010-1234-23435','owner2','1234');

insert into restaurantowner(rono, name, businessnumber, phone, id, pw)
values (restaurantowner_seq.nextval, '주인장3','2021-14324','010-1234-2325','owner3','1234');



/**********************************/
/* Table Name: ?쉶?썝 */
/**********************************/

DROP SEQUENCE members_seq;
CREATE SEQUENCE members_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;  
  
CREATE TABLE members(
		mno INTEGER NOT NULL PRIMARY KEY,
		id VARCHAR(20) NOT NULL,
		pw VARCHAR(40) NOT NULL,
		name VARCHAR(10) NOT NULL,
		nickname VARCHAR(40),
		phone VARCHAR(40),
		housecode VARCHAR(5),
		address1 VARCHAR(80),
		address2 VARCHAR(60),
		rdate DATE NOT NULL,
		reco char(1) not null
);

insert into members(mno, id, pw, name , nickname, phone, housecode, address1, address2, rdate, reco)
values (members_seq.nextval, 'dudqls', '1234' , '김빈','김영','010-1234-5678','12345','인천시 부평구','청천APT',sysdate,'1');

insert into members(mno, id, pw, name , nickname, phone, housecode, address1, address2, rdate, reco)
values (members_seq.nextval, 'joo', '1234' , '박창','박주','010-1234-5678','12345','서울시 중구','부자',sysdate,'1');

commit;

select * from members;



/**********************************/
/* Table Name: 移댄뀒怨좊━ */
/**********************************/

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;  
  
CREATE TABLE cate(
		cateno INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(20) DEFAULT 한식 NOT NULL,
		seq INTEGER
);

insert into cate (cateno, name, seq) values (cate_seq.nextval,'한식',1);
insert into cate (cateno, name, seq) values (cate_seq.nextval,'중식',2);

/**********************************/
/* Table Name: ?떇?떦 */
/**********************************/
DROP SEQUENCE restaurant_seq;
CREATE SEQUENCE restaurant_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;  
  
CREATE TABLE restaurant(
		rno INTEGER NOT NULL PRIMARY KEY,
		rono INTEGER NOT NULL,
		name VARCHAR(30) NOT NULL,
		code INTEGER NOT NULL,
		address1 VARCHAR(30) NOT NULL,
		address2 VARCHAR(40) NOT NULL,
		explanation VARCHAR(200),
		type VARCHAR(10) NOT NULL,
		leastprice INTEGER DEFAULT 10000 NOT NULL,
		deliverytip INTEGER DEFAULT 1000 NOT NULL,
		call VARCHAR(13),
		score INTEGER DEFAULT 0 NOT NULL,
		reviewcount INTEGER DEFAULT 0 NOT NULL,
		recocnt INTEGER DEFAULT 0 NOT NULL,
		ordercnt INTEGER DEFAULT 0 NOT NULL,
		cateno INTEGER,
  FOREIGN KEY (rono) REFERENCES restaurantowner (rono),
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

insert into restaurant (rno,rono, name, code ,address1 ,address2, explanation, type, leastprice ,deliverytip, call ,score, reviewcount, recocnt ,ordercnt ,cateno)
values(restaurant_seq.nextval,1,'맛있는 한식','12345','인천시 부평구 청천동','1동 ', '입구에~~~~','한식','10000',3000,'032-123-4567',5,100,40,1000,1);

insert into restaurant (rno,rono, name, code ,address1 ,address2, explanation, type, leastprice ,deliverytip, call ,score, reviewcount, recocnt ,ordercnt ,cateno)
values(restaurant_seq.nextval,1,'맛있는 중식','12345','인천시 부평구 청천동','2층', '입구에~~~~','중식','10000',3000,'032-123-4567',5,100,40,1000,1);

insert into restaurant (rno,restaurant _seq.nextval, rono, name, code ,address1 ,address2, explanation, type, leastprice ,deliverytip, call ,score, reviewcount, recocnt ,ordercnt ,cateno)
values(restaurant_seq.nextval,1,'맛있는 일식','12345','인천시 부평구 청천동','3층', '입구에~~~~','일식','10000,3000,'032-123-4567',5,100,40,1000,1);
/**********************************/
/* Table Name: 硫붾돱 */
/**********************************/
CREATE TABLE menu(
		rno INTEGER NOT NULL,
		scno INTEGER,
		menuno INTEGER NOT NULL PRIMARY KEY,
		type VARCHAR(10) NOT NULL,
		title VARCHAR(20) NOT NULL,
		explanation VARCHAR(50),
		spiciness VARCHAR(10),
		file1 VARCHAR(100),
		filesaved1 VARCHAR(100),
		thumb VARCHAR(100),
		imagesize INTEGER,
  FOREIGN KEY (rno) REFERENCES restaurant (rno)
);

/**********************************/
/* Table Name: 由щ럭 */
/**********************************/
CREATE TABLE review(
		rno INTEGER NOT NULL PRIMARY KEY,
		mno INTEGER NOT NULL,
		title VARCHAR(50) NOT NULL,
		content VARCHAR(200) NOT NULL,
		rdate DATE NOT NULL,
		rtime DATE NOT NULL,
		score INTEGER NOT NULL,
  FOREIGN KEY (rno) REFERENCES restaurant (rno),
  FOREIGN KEY (mno) REFERENCES members (mno)
);

/**********************************/
/* Table Name: ?옣諛붽뎄?땲 */
/**********************************/
CREATE TABLE shoppingcart(
		scno INTEGER NOT NULL PRIMARY KEY,
		rno INTEGER NOT NULL,
		count INT DEFAULT 1 NOT NULL,
		rdate DATE,
		menuno INTEGER,
		mno INTEGER,
  FOREIGN KEY (rno) REFERENCES restaurant (rno),
  FOREIGN KEY (menuno) REFERENCES menu (menuno),
  FOREIGN KEY (mno) REFERENCES members (mno)
);

select * from shoppingca;

/**********************************/
/* Table Name: 二쇰Ц */
/**********************************/
CREATE TABLE orders(
		ono INTEGER NOT NULL PRIMARY KEY,
		scno INTEGER NOT NULL,
		rdate DATE NOT NULL,
		rtime date NOT NULL,
		price INTEGER NOT NULL,
		totalprice INTEGER NOT NULL,
		address1 VARCHAR(30) NOT NULL,
		address2 VARCHAR(40) NOT NULL,
		method VARCHAR(15) DEFAULT '현금' NOT NULL,
		phone VARCHAR(13) NOT NULL,
		request VARCHAR(30),
		state char(1) default 1 not null,
		mno INTEGER,
		menuno INTEGER,
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (menuno) REFERENCES menu (menuno)
);

/**********************************/
/* Table Name: 諛곕떖 */
/**********************************/
CREATE TABLE delivery(
		no INTEGER NOT NULL PRIMARY KEY,
		ono INTEGER NOT NULL,
		state char(1) default 1 not null,
        starttime TIMESTAMP,
		driver VARCHAR(10),
  FOREIGN KEY (ono) REFERENCES orders (ono)
);

/**********************************/
/* Table Name: 李? */
/**********************************/
CREATE TABLE zzim(
		zno INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(40) NOT NULL,
		rno INTEGER,
		mno INTEGER,
  FOREIGN KEY (rno) REFERENCES restaurant (rno),
  FOREIGN KEY (mno) REFERENCES members (mno)
);

/**********************************/
/* Table Name: 異붿쿇 */
/**********************************/
CREATE TABLE recommendation(
		recono INTEGER NOT NULL PRIMARY KEY,
		rno INTEGER,
		mno INTEGER,
		rdate date,
        FOREIGN KEY (rno) REFERENCES restaurant (rno),
  FOREIGN KEY (mno) REFERENCES members (mno)
);


commit;

/*DROP TABLE recommendation IF EXISTS;
//DROP TABLE zzim IF EXISTS;
//DROP TABLE delivery IF EXISTS;
//DROP TABLE orders IF EXISTS;
//DROP TABLE shoppingcart IF EXISTS;
//DROP TABLE review IF EXISTS;
//DROP TABLE menu IF EXISTS;
//DROP TABLE restaurant IF EXISTS;
//DROP TABLE cate IF EXISTS;
//DROP TABLE members IF EXISTS;
//DROP TABLE restaurantowner IF EXISTS;

*/

/**********************************/
/* Table Name: 사업자 */
/**********************************/
CREATE TABLE restaurantowner(
		rono INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(10) NOT NULL,
		businessnumber VARCHAR(20) DEFAULT 0 NOT NULL,
		phone VARCHAR(15),
		id VARCHAR(15) NOT NULL,
		pw VARCHAR(20) NOT NULL
);

DROP SEQUENCE restaurantowner_seq;

CREATE SEQUENCE restaurantowner_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;     

insert into restaurantowner values (rono, 
/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE members(
		mno INTEGER NOT NULL PRIMARY KEY,
		id VARCHAR(20) NOT NULL,
		pw VARCHAR(40) NOT NULL,
		name VARCHAR(10) NOT NULL,
		nickname VARCHAR(40),
		phone VARCHAR(40),
		housecode VARCHAR(5),
		address1 VARCHAR(80)
		address2 VARCHAR(60),
		rdate DATE NOT NULL,
		reco char(1) not null
);


DROP SEQUENCE members_seq;
CREATE SEQUENCE members_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;  


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
		cateno INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(20) DEFAULT 한식 NOT NULL,
		seq INTEGER
);

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;  

/**********************************/
/* Table Name: 식당 */
/**********************************/
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

DROP SEQUENCE restaurant_seq;
CREATE SEQUENCE restaurant_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;  

/**********************************/
/* Table Name: 메뉴 */
/**********************************/


DROP SEQUENCE menu_seq;
CREATE SEQUENCE menu_seq
  START WITH 1        
  INCREMENT BY 1    
  MAXVALUE 9999999999   
  CACHE 2                  
  NOCYCLE;  
  

  ALTER TABLE menu DROP COLUMN scno;
  
CREATE TABLE menu(
		rno INTEGER NOT NULL,
		menuno INTEGER NOT NULL PRIMARY KEY,
		menutype VARCHAR(30) NOT NULL,
		title VARCHAR(50) NOT NULL,
		explanation VARCHAR(50),
		spiciness VARCHAR(10),
		file1 VARCHAR(100),
		file1saved VARCHAR(100),
		thumb VARCHAR(100),
		imagesize INTEGER,
  FOREIGN KEY (rno) REFERENCES restaurant (rno)
);

delete from menu;
delete from menu where menuno =23;
ALTER TABLE menu RENAME COLUMN type TO menutype;
ALTER TABLE menu MODIFY title VARCHAR(50);
ALTER TABLE menu MODIFY spiciness VARCHAR(30);
commit;

/**********************************/
/* Table Name: 리뷰 */
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
/* Table Name: 장바구니 */
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

/**********************************/
/* Table Name: 주문 */
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
		method VARCHAR(15) DEFAULT 현금 NOT NULL,
		phone VARCHAR(13) NOT NULL,
		request VARCHAR(30),
		state char(1) default 1 not null,
		mno INTEGER,
		menuno INTEGER,
  FOREIGN KEY (mno) REFERENCES members (mno),
  FOREIGN KEY (menuno) REFERENCES menu (menuno)
);

/**********************************/
/* Table Name: 배달 */
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
/* Table Name: 찜 */
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
/* Table Name: 추천 */
/**********************************/
CREATE TABLE recommendation(
		zno INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(40) NOT NULL,
		rno INTEGER,
		mno INTEGER,
  FOREIGN KEY (rno) REFERENCES restaurant (rno),
  FOREIGN KEY (mno) REFERENCES members (mno)
);


SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE';

select * from restaurantowner;
select * from cate;
select * from restaurant;

delete from cate where cateno =2;
commit;

select * from menu;

/*==============================================================================================================================================================*/
insert into restaurantowner(rono, name, businessnumber, phone, id, pw)
values (restaurantowner_seq.nextval, '주인장1','2021-12111','010-1234-2345','owner1','1234');

insert into restaurantowner(rono, name, businessnumber, phone, id, pw)
values (restaurantowner_seq.nextval, '주인장2','2021-23442','010-1234-23435','owner2','1234');

insert into restaurantowner(rono, name, businessnumber, phone, id, pw)
values (restaurantowner_seq.nextval, '주인장3','2021-14324','010-1234-2325','owner3','1234');
/*==============================================================================================================================================================*/

insert into cate (cateno, name, seq) values (cate_seq.nextval,'한식',1);
insert into cate (cateno, name, seq) values (cate_seq.nextval,'중식',2);
insert into cate (cateno, name, seq) values (cate_seq.nextval,'일식',3);
insert into cate (cateno, name, seq) values (cate_seq.nextval,'양식',4);

/*==============================================================================================================================================================*/
insert into menu ( rno, menuno, type, title, explanation, spiciness, file1,filesaved1, thumb, imagesize)
values (12, menu_seq.nextval,'한식','두부김치','두부 많아요','매움','DG.jpg','savedDG.jpg','tumbDG.jpg', 1 );

insert into menu ( rno, menuno, type, title, explanation, spiciness, file1,filesaved1, thumb, imagesize)
values (12, menu_seq.nextval,'한식','감자전','감자 많아여','매움','DG.jpg','savedDG.jpg','tumbDG.jpg', 13 );

insert into menu ( rno, menuno, type, title, explanation, spiciness, file1,filesaved1, thumb, imagesize)
values (12, menu_seq.nextval,'한식','만두','만두 많아요','매움','DG.jpg','savedDG.jpg','tumbDG.jpg',3 );

/*==============================================================================================================================================================*/

INSERT INTO members(mno, id, pw, name, nickname, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user1', '1234','김', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 1);

INSERT INTO members(mno, id, pw, name, nickname, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user2', '1234','홍', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 1);

INSERT INTO members(mno, id, pw, name, nickname, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user3', '1234','추', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 1);

INSERT INTO members(mno, id, pw, name, nickname, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user4', '1234','박', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 1);


/*==============================================================================================================================================================*/

insert into restaurant (rno,rono, name, code ,address1 ,address2, explanation, type, leastprice ,deliverytip, call ,score, reviewcount, recocnt ,ordercnt ,cateno)
values(restaurant_seq.nextval,1,'맛있는 한식','12345','인천시 부평구 청천동','1동 ', '입구에~~~~','한식','10000',3000,'032-123-4567',5,100,40,1000,3);

insert into restaurant (rno,rono, name, code ,address1 ,address2, explanation, type, leastprice ,deliverytip, call ,score, reviewcount, recocnt ,ordercnt ,cateno)
values(restaurant_seq.nextval,1,'맛있는 중식','12345','인천시 부평구 청천동','2층', '입구에~~~~','중식','10000',3000,'032-123-4567',5,100,40,1000,3);

insert into restaurant  (rno,rono, name, code ,address1 ,address2, explanation, type, leastprice ,deliverytip, call ,score, reviewcount, recocnt ,ordercnt ,cateno)
values(restaurant_seq.nextval,3,'맛있는 일식','12345','인천시 부평구 청천동','3층', '입구에~~~~','일식','10000',3000,'032-123-4567',5,100,40,1000,3);
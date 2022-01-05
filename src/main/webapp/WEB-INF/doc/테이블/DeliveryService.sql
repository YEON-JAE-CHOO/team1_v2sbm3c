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
		address1 VARCHAR(80),
		address2 VARCHAR(60),
		rdate DATE NOT NULL,
		reco BOOLEAN(10) DEFAULT false NOT NULL
);

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
		cateno INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(20) DEFAULT '한식' NOT NULL,
		seq INTEGER,
		file1 VARCHAR(100),
		file1saved1 VARCHAR(100),
		thumb1 VARCHAR(100),
		imagesize1 INTEGER
);

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

/**********************************/
/* Table Name: 메뉴 */
/**********************************/
CREATE TABLE menu(
		rno INTEGER NOT NULL,
		menuno INTEGER NOT NULL PRIMARY KEY,
		type VARCHAR(10) NOT NULL,
		title VARCHAR(20) NOT NULL,
		explanation VARCHAR(50),
		spiciness VARCHAR(10),
		file1 VARCHAR(100),
		filesaved1 VARCHAR(100),
		thumb VARCHAR_IGNORECASE(100),
		imagesize INTEGER,
  FOREIGN KEY (rno) REFERENCES restaurant (rno)
);

/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE review(
		rno INTEGER NOT NULL PRIMARY KEY,
		rno INTEGER NOT NULL,
		mno INTEGER NOT NULL,
		title VARCHAR(50) NOT NULL,
		content VARCHAR(200) NOT NULL,
		date DATE NOT NULL,
		time TIME NOT NULL,
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
		date DATE,
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
		date DATE NOT NULL,
		time TIME NOT NULL,
		price INTEGER NOT NULL,
		totalprice INTEGER NOT NULL,
		address1 VARCHAR(30) NOT NULL,
		address2 VARCHAR(40) NOT NULL,
		method VARCHAR(15) DEFAULT 현금 NOT NULL,
		phone VARCHAR(13) NOT NULL,
		request VARCHAR(30),
		state BOOLEAN(10) DEFAULT false NOT NULL,
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
		state BOOLEAN(10) DEFAULT false NOT NULL,
		start BOOLEAN(10) DEFAULT false NOT NULL,
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
		recono INTEGER NOT NULL PRIMARY KEY,
		rno INTEGER,
		mno INTEGER,
		date TIME,
  FOREIGN KEY (rno) REFERENCES restaurant (rno),
  FOREIGN KEY (mno) REFERENCES members (mno)
  
  
  
  -------------------------------------------
  insert into cate(cateno,name,seq,file1,file1saved,thumb1,size1)
  values(cate_seq.nextval,'야식',3,'0','0','0',0)
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
);


/**********************************/
/* Table Name: 사업자 */
/**********************************/
CREATE TABLE restaurantowner(
		rono INTEGER NOT NULL PRIMARY KEY,
		roname VARCHAR(10) NOT NULL,
		robusinessnumber VARCHAR(20) DEFAULT 0 NOT NULL,
		rophone VARCHAR(15),
		roid VARCHAR(15) NOT NULL,
		ropw VARCHAR(20) NOT NULL
);

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		mno INTEGER NOT NULL PRIMARY KEY,
		mid VARCHAR(20) NOT NULL,
		mpw VARCHAR(40) NOT NULL,
		mname VARCHAR(10) NOT NULL,
		mnickname VARCHAR(40),
		mphone VARCHAR(40),
		mhousecode VARCHAR(5),
		maddress1 VARCHAR(80),
		maddress2 VARCHAR(60),
		mdate DATE NOT NULL
);

/**********************************/
/* Table Name: 식당 */
/**********************************/
CREATE TABLE restaurant(
		rno INTEGER NOT NULL PRIMARY KEY,
		rono INTEGER NOT NULL,
		rname VARCHAR(30) NOT NULL,
		rcode INTEGER NOT NULL,
		raddress1 VARCHAR(30) NOT NULL,
		raddress2 VARCHAR(40) NOT NULL,
		rexplanation VARCHAR(200),
		rtype VARCHAR(10) NOT NULL,
		rleastprice INTEGER DEFAULT 10000 NOT NULL,
		rdeliverytip INTEGER DEFAULT 1000 NOT NULL,
		rcall VARCHAR(13),
		rscore INTEGER DEFAULT 0 NOT NULL,
		rreviewcount INTEGER DEFAULT 0 NOT NULL,
  FOREIGN KEY (rono) REFERENCES restaurantowner (rono)
);

/**********************************/
/* Table Name: 메뉴 */
/**********************************/
CREATE TABLE menu(
		rno INTEGER NOT NULL,
		scno INTEGER,
		menuno INTEGER NOT NULL PRIMARY KEY,
		menutype VARCHAR(10) NOT NULL,
		menutitle VARCHAR(20) NOT NULL,
		menuexp VARCHAR(50),
		menuspiciness VARCHAR(10),
  FOREIGN KEY (rno) REFERENCES restaurant (rno)
);

/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE review(
		rno INTEGER NOT NULL PRIMARY KEY,
		rno INTEGER NOT NULL,
		mno INTEGER NOT NULL,
		rtitle VARCHAR(50) NOT NULL,
		rcontent VARCHAR(200) NOT NULL,
		rdate DATE NOT NULL,
		rtime TIME NOT NULL,
		rscore INTEGER NOT NULL,
  FOREIGN KEY (rno) REFERENCES restaurant (rno),
  FOREIGN KEY (mno) REFERENCES member (mno)
);

/**********************************/
/* Table Name: 장바구니 */
/**********************************/
CREATE TABLE shoppingcart(
		scno INTEGER NOT NULL PRIMARY KEY,
		mno INTEGER NOT NULL,
		rno INTEGER NOT NULL,
		scamount INT DEFAULT 1 NOT NULL,
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (rno) REFERENCES restaurant (rno)
);

/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE order(
		ono INTEGER NOT NULL PRIMARY KEY,
		scno INTEGER NOT NULL,
		odate DATE NOT NULL,
		otime TIME NOT NULL,
		oprice INTEGER NOT NULL,
		ototalprice INTEGER NOT NULL,
		oaddress1 VARCHAR(30) NOT NULL,
		oaddress2 VARCHAR(40) NOT NULL,
		omethod VARCHAR(15) DEFAULT 현금 NOT NULL,
		ophone VARCHAR(13) NOT NULL,
		orequest VARCHAR(30),
  FOREIGN KEY (scno) REFERENCES shoppingcart (scno)
);

/**********************************/
/* Table Name: 배달 */
/**********************************/
CREATE TABLE delivery(
		dno INTEGER NOT NULL PRIMARY KEY,
		ono INTEGER NOT NULL,
  FOREIGN KEY (ono) REFERENCES order (ono)
);


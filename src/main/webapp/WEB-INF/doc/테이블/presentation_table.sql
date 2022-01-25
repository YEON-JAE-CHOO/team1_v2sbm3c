DROP TABLE order_detail IF EXISTS;
DROP TABLE recommendation IF EXISTS;
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
		filesaved1 INTEGER,
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
		price INTEGER,
  FOREIGN KEY (rno) REFERENCES restaurant (rno)
);

/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE review(
		reviewno INTEGER NOT NULL PRIMARY KEY,
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
);

/**********************************/
/* Table Name: 주문 상세 */
/**********************************/
CREATE TABLE order_detail(
		odno INTEGER NOT NULL PRIMARY KEY,
		ono INTEGER,
		menuno INTEGER,
  FOREIGN KEY (ono) REFERENCES orders (ono),
  FOREIGN KEY (menuno) REFERENCES menu (menuno)
);


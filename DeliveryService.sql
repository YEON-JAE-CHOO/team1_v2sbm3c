DROP TABLE recommendation IF EXISTS;
DROP TABLE zzim IF EXISTS;
DROP TABLE delivery IF EXISTS;
DROP TABLE order IF EXISTS;
DROP TABLE shoppingcart IF EXISTS;
DROP TABLE review IF EXISTS;
DROP TABLE menu IF EXISTS;
DROP TABLE restaurant IF EXISTS;
DROP TABLE cate IF EXISTS;
DROP TABLE member IF EXISTS;
DROP TABLE restaurantowner IF EXISTS;

/**********************************/
/* Table Name: ?Ç¨?óÖ?ûê */
/**********************************/
CREATE TABLE restaurantowner(
		rono INTEGER NOT NULL,
		name VARCHAR(10) NOT NULL,
		businessnumber VARCHAR(20) DEFAULT 0 NOT NULL,
		phone VARCHAR(15),
		id VARCHAR(15) NOT NULL,
		pw VARCHAR(20) NOT NULL
);

/**********************************/
/* Table Name: ?öå?õê */
/**********************************/
CREATE TABLE members(
		mno INTEGER NOT NULL,
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
/* Table Name: Ïπ¥ÌÖåÍ≥†Î¶¨ */
/**********************************/
CREATE TABLE cate(
		cateno INTEGER NOT NULL,
		name VARCHAR(20) DEFAULT '?ïú?ãù' NOT NULL,
		seq INTEGER
);

/**********************************/
/* Table Name: ?ãù?ãπ */
/**********************************/
CREATE TABLE restaurant(
		rno INTEGER NOT NULL,
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
		cateno INTEGER
);

select * from restaurant;

/**********************************/
/* Table Name: Î©îÎâ¥ */
/**********************************/
CREATE TABLE menu(
		rno INTEGER NOT NULL,
		scno INTEGER,
		menuno INTEGER NOT NULL,
		type1 VARCHAR(10) NOT NULL,
		title VARCHAR(20) NOT NULL,
		explanation VARCHAR(50),
		spiciness VARCHAR(10),
		file1 VARCHAR(100),
		filesaved VARCHAR(100),
		thumb VARCHAR(100),
		imagesize INTEGER
);

/**********************************/
/* Table Name: Î¶¨Î∑∞ */
/**********************************/
CREATE TABLE review(
		rno INTEGER NOT NULL,
		rno INTEGER NOT NULL,
		mno INTEGER NOT NULL,
		title VARCHAR(50) NOT NULL,
		content VARCHAR(200) NOT NULL,
		date DATE NOT NULL,
		time TIME NOT NULL,
		score INTEGER NOT NULL
);

/**********************************/
/* Table Name: ?û•Î∞îÍµ¨?ãà */
/**********************************/
CREATE TABLE shoppingcart(
		scno INTEGER NOT NULL,
		rno INTEGER NOT NULL,
		count INT DEFAULT 1 NOT NULL,
		rdate DATE,
		menuno INTEGER,
		mno INTEGER
);

/**********************************/
/* Table Name: Ï£ºÎ¨∏ */
/**********************************/
CREATE TABLE orders(
		ono INTEGER NOT NULL,
		scno INTEGER NOT NULL,
		date1 DATE NOT NULL,
		time1 TIME NOT NULL,
		price INTEGER NOT NULL,
		totalprice INTEGER NOT NULL,
		address1 VARCHAR(30) NOT NULL,
		address2 VARCHAR(40) NOT NULL,
		method1 VARCHAR(15)  NOT NULL,
		phone VARCHAR(13) NOT NULL,
		request VARCHAR(30),
		state1 BOOLEAN(10) DEFAULT false NOT NULL,
		mno INTEGER,
		menuno INTEGER
);

/**********************************/
/* Table Name: Î∞∞Îã¨ */
/**********************************/
CREATE TABLE delivery(
		no INTEGER NOT NULL,
		ono INTEGER NOT NULL,
		state BOOLEAN(10) DEFAULT false NOT NULL,
		start BOOLEAN(10) DEFAULT false NOT NULL,
		starttime TIMESTAMP,
		driver VARCHAR(10)
);

/**********************************/
/* Table Name: Ï∞? */
/**********************************/
CREATE TABLE zzim(
		zno INTEGER NOT NULL,
		name VARCHAR(40) NOT NULL,
		rno INTEGER,
		mno INTEGER
);

/**********************************/
/* Table Name: Ï∂îÏ≤ú */
/**********************************/
CREATE TABLE recommendation(
		recono INTEGER NOT NULL,
		rno INTEGER,
		mno INTEGER,
		date TIME
);


ALTER TABLE restaurantowner ADD CONSTRAINT IDX_restaurantowner_PK PRIMARY KEY (rono);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mno);

ALTER TABLE cate ADD CONSTRAINT IDX_cate_PK PRIMARY KEY (cateno);

ALTER TABLE restaurant ADD CONSTRAINT IDX_restaurant_PK PRIMARY KEY (rno);
ALTER TABLE restaurant ADD CONSTRAINT IDX_restaurant_FK0 FOREIGN KEY (rono) REFERENCES restaurantowner (rono);
ALTER TABLE restaurant ADD CONSTRAINT IDX_restaurant_FK1 FOREIGN KEY (cateno) REFERENCES cate (cateno);

ALTER TABLE menu ADD CONSTRAINT IDX_menu_PK PRIMARY KEY (menuno);
ALTER TABLE menu ADD CONSTRAINT IDX_menu_FK0 FOREIGN KEY (rno) REFERENCES restaurant (rno);

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (rno);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (rno) REFERENCES restaurant (rno);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (mno) REFERENCES member (mno);

ALTER TABLE shoppingcart ADD CONSTRAINT IDX_shoppingcart_PK PRIMARY KEY (scno);
ALTER TABLE shoppingcart ADD CONSTRAINT IDX_shoppingcart_FK0 FOREIGN KEY (rno) REFERENCES restaurant (rno);
ALTER TABLE shoppingcart ADD CONSTRAINT IDX_shoppingcart_FK1 FOREIGN KEY (menuno) REFERENCES menu (menuno);
ALTER TABLE shoppingcart ADD CONSTRAINT IDX_shoppingcart_FK2 FOREIGN KEY (mno) REFERENCES member (mno);

ALTER TABLE order ADD CONSTRAINT IDX_order_PK PRIMARY KEY (ono);
ALTER TABLE order ADD CONSTRAINT IDX_order_FK0 FOREIGN KEY (mno) REFERENCES member (mno);
ALTER TABLE order ADD CONSTRAINT IDX_order_FK1 FOREIGN KEY (menuno) REFERENCES menu (menuno);

ALTER TABLE delivery ADD CONSTRAINT IDX_delivery_PK PRIMARY KEY (no);
ALTER TABLE delivery ADD CONSTRAINT IDX_delivery_FK0 FOREIGN KEY (ono) REFERENCES order (ono);

ALTER TABLE zzim ADD CONSTRAINT IDX_zzim_PK PRIMARY KEY (zno);
ALTER TABLE zzim ADD CONSTRAINT IDX_zzim_FK0 FOREIGN KEY (rno) REFERENCES restaurant (rno);
ALTER TABLE zzim ADD CONSTRAINT IDX_zzim_FK1 FOREIGN KEY (mno) REFERENCES member (mno);

ALTER TABLE recommendation ADD CONSTRAINT IDX_recommendation_PK PRIMARY KEY (recono);
ALTER TABLE recommendation ADD CONSTRAINT IDX_recommendation_FK0 FOREIGN KEY (rno) REFERENCES restaurant (rno);
ALTER TABLE recommendation ADD CONSTRAINT IDX_recommendation_FK1 FOREIGN KEY (mno) REFERENCES member (mno);


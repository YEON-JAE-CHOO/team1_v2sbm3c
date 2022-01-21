DROP TABLE 선수 테이블 IF EXISTS;
DROP TABLE 팀 테이블 IF EXISTS;

/**********************************/
/* Table Name: Team */
/**********************************/
CREATE TABLE team(
		TNO NUMERIC(10) NOT NULL PRIMARY KEY,
		TNAME VARCHAR(40) NOT NULL,
		HOMETOWN VARCHAR(20),
		RDATE DATE
);

/**********************************/
/* Table Name: Player */
/**********************************/
CREATE TABLE player(
		PNO INTEGER NOT NULL PRIMARY KEY,
		POSITION VARCHAR(20),
		PNAME VARCHAR(30) NOT NULL,
		JERSEYNO NUMERIC(10),
		TNO NUMERIC(10) NOT NULL,
  FOREIGN KEY (TNO) REFERENCES team (TNO)
);


/**********************************/
/* 부모 테이블 삽입*/
/**********************************/
insert into team(tno, tname, hometown, RDATE) values (1, '그린팀','부평','16/4/1');
insert into team(tno, tname, hometown, RDATE) values (2, '레드','서구','17/1/1');

/**********************************/
/* 6*/
/**********************************/
insert into player(PNO, POSITION, PNAME, JERSEYNO,tno) values (1, 'GK','김기기',1,1);
insert into player(PNO, POSITION, PNAME, JERSEYNO,tno) values (2, 'DF','박바바',4,1);
insert into player(PNO, POSITION, PNAME, JERSEYNO,tno) values (3, 'MF','최채채',8,1);
insert into player(PNO, POSITION, PNAME, JERSEYNO,tno) values (4, 'FW','이이이',9,1);

/**********************************/
/* 7*/
/**********************************/
select pno, pname, jerseyno, position from player where tno = 1;
/**********************************/
/* 8*/
/**********************************/
update player set jerseyno = 11 where pno= 4;
/**********************************/
/* 9*/
/**********************************/
delete from player where pno= 4;

/**********************************/
/*10*/
/**********************************/
select count(pno) from player;



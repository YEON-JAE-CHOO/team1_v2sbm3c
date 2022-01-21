- 테이블 구조
-- member 삭제전에 FK가 선언된 blog 테이블 먼저 삭제합니다.
DROP TABLE qna;
DROP TABLE reply;
DROP TABLE members;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE members CASCADE CONSTRAINTS; 
 
CREATE TABLE members (
  mno NUMBER(10) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
  id             VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
  pw      VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  name      VARCHAR(30)   NOT NULL, -- 성명, 한글 10자 저장 가능
  phone            VARCHAR(14)   NOT NULL, -- 전화번호
  housecode     VARCHAR(5)        NULL, -- 우편번호, 12345
  address1    VARCHAR(80)       NULL, -- 주소 1
  address2    VARCHAR(50)       NULL, -- 주소 2
  rdate       DATE             NOT NULL, -- 가입일    
  reco        NUMBER(2)     NOT NULL, -- 등급(1~10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49, 탈퇴 회원: 99)
  PRIMARY KEY (mno)                     -- 한번 등록된 값은 중복 안됨
);
 
COMMENT ON TABLE MEMBERS is '회원';
COMMENT ON COLUMN MEMBERS.MNO is '회원 번호';
COMMENT ON COLUMN MEMBERS.ID is '아이디';
COMMENT ON COLUMN MEMBERS.PW is '패스워드';
COMMENT ON COLUMN MEMBERS.NAME is '성명';
COMMENT ON COLUMN MEMBERS.PHONE is '전화번호';
COMMENT ON COLUMN MEMBERS.HOUSECODE is '우편번호';
COMMENT ON COLUMN MEMBERS.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBERS.ADDRESS2 is '주소2';
COMMENT ON COLUMN MEMBERS.RDATE is '가입일';
COMMENT ON COLUMN MEMBERS.RECO is '등급';

DROP SEQUENCE members_seq;
CREATE SEQUENCE members_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
 
1. 등록
 
1) id 중복 확인(null 값을 가지고 있으면 count에서 제외됨)
SELECT COUNT(id)
FROM members
WHERE id='user1';

SELECT COUNT(id) as cnt
FROM members
WHERE id='user1';
 
 cnt
 ---
   0   ← 중복 되지 않음.
   
2) 등록

-- 회원 관리용 계정, Q/A 용 계정
INSERT INTO members(mno, id, pw, name ,phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'qnaadmin', '1234', '질문답변관리자', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 1);

-- 개인 회원 테스트 계정
INSERT INTO members(mno, id, pw, name, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user1', '1234', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 30);

INSERT INTO members(mno, id, pw, name, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user2', '1234', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 40);

INSERT INTO members(mno, id, pw, name, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user3', '1234', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 99);

INSERT INTO members(mno, id, pw, name, phone, housecode, address1, address2, rdate, reco)
VALUES (members_seq.nextval, 'user4', '1234', '우아한형제들', '000-0000-0000', '12345', '서울특별시 송파구', '위례성대로', sysdate, 20);

COMMIT;

 
2. 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT mno, id, pw, name, phone, housecode, address1, address2, rdate, reco
FROM members
ORDER BY mno ASC;
     
     
3. 조회
 
1) user1 사원 정보 보기
SELECT mno, id, pw, name, phone, housecode, address1, address2, rdate, reco
FROM members
WHERE mno = 1;

SELECT mno, id, pw, name, phone, housecode, address1, address2, rdate, reco
FROM members
WHERE id = 'user1';
 
    
4. 수정
UPDATE members
SET reco =1
WHERE mno=20;

SELECT A.SID, A.SERIAL#
FROM V$SESSION A, V$LOCK B, DBA_OBJECTS C
WHERE A.SID=B.SID AND B.ID1=C.OBJECT_ID AND B.TYPE='TM' AND C.OBJECT_NAME='members'

ALTER TABLE members MODIFY(reco number(30));

COMMIT;

 
5. 삭제
1) 모두 삭제
DELETE FROM members;
 
2) 특정 회원 삭제
DELETE FROM members
WHERE mno=10;

COMMIT;

 
6. 패스워드 변경
1) 패스워드 검사
SELECT COUNT(mno) as cnt
FROM members
WHERE mno=1 AND pw='1234';
 
2) 패스워드 수정
UPDATE members
SET pw='0000'
WHERE mno=1;

COMMIT;
 
 
7. 로그인
SELECT COUNT(mno) as cnt
FROM members
WHERE id='user1' AND pw='1234';
 cnt
 ---
   0
 
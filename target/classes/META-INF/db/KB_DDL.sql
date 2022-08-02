-- DROPPING TABLE
DROP TABLE MEMBER;
DROP TABLE QBOARD;
-- DROPPING SEQUENCE
DROP SEQUENCE QBOARD_SEQ;


-- [1] MEMBER
CREATE TABLE MEMBER(
    MID VARCHAR2(100) PRIMARY KEY,
    MPW VARCHAR2(100) NOT NULL,
    MNAME VARCHAR2(100) NOT NULL,
    MEMAIL VARCHAR2(100) NOT NULL,
    MRDATE DATE DEFAULT SYSDATE NOT NULL
);
SELECT * FROM MEMBER;
-- [1] MEMBER - DUMMY_DATA
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL)
    VALUES ('aaa', '111', 'unie', 'yoonseokoo@gmail.com');
INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
    VALUES ('bbb', '222', 'dk', 'dk@gmail.com');
INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
    VALUES ('ccc', '333', 'bin', 'bin@gmail.com');
INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
    VALUES ('ddd', '444', 'kim', 'kim@gmail.com');


COMMIT;
-- [1] MEMBER - DML
-- loginMember
SELECT * FROM MEMBER WHERE MID='aaa';
-- confirmMid
SELECT COUNT(*) FROM MEMBER WHERE MID='aaa'; -- 중복된 아이디의 경우 1
SELECT COUNT(*) FROM MEMBER WHERE MID='ZZZ'; -- 중복된 아이디가 아닌 경우 0
-- confirmMemail
SELECT COUNT(*) FROM MEMBER WHERE MEMAIL='yoonseokoo@gmail.com'; -- 중복된 이메일의 경우 1
SELECT COUNT(*) FROM MEMBER WHERE MEMAIL='owen6113@naver.com'; -- 중복된 이메일이 아닌 경우 0
-- joinMember
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL)
    VALUES ('choi', '123', 'jinyeoung', 'jinyeoung@naver.com');
-- getMember
SELECT * FROM MEMBER WHERE MID='aaa';
-- modifyMember
UPDATE MEMBER SET MPW='123',
                  MNAME='최진영',
                  MEMAIL='choi@naver.com'
            WHERE MID='choi';
-- searchMid(mname, memail)
SELECT MID FROM MEMBER WHERE MNAME='최진영' AND MEMAIL='choi@naver.com';
-- searchMemail(mid, mname, memail)
SELECT MPW FROM MEMBER WHERE MID='choi' AND MNAME='최진영' AND MEMAIL='choi@naver.com';

-- [2] QBOARD
CREATE SEQUENCE QBOARD_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE QBOARD(
    QBID NUMBER(10) PRIMARY KEY,
    MID VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    QBTITLE VARCHAR2(1000) NOT NULL,
    QBCONTENT VARCHAR2(4000),
    QBRDATE DATE DEFAULT SYSDATE NOT NULL,
    QBIP VARCHAR2(20) NOT NULL,
    QBREPLYCHECK NUMBER(1) DEFAULT 0 NOT NULL
);
SELECT * FROM QBOARD;
ROLLBACK;
COMMIT;
-- [2] QBOARD - DUMMY_DATA
INSERT INTO QBOARD (QBID, MID, QBTITLE, QBCONTENT, QBIP)
    VALUES (QBOARD_SEQ.NEXTVAL, 'aaa','정산하기에 오류가 있는 것 같습니다','정산하기 버튼을 눌렀는데 저는 받기 버튼이 안떠서 돈을 받을 수 없어요 ㅜㅜ', '127.0.0.1');
INSERT INTO QBOARD (QBID, MID, QBTITLE, QBCONTENT, QBIP)
    VALUES (QBOARD_SEQ.NEXTVAL, 'bbb','정말 잘쓰고 있습니다','이 사이트 정말 좋은 것 같아요!', '127.0.0.3');
INSERT INTO QBOARD (QBID, MID, QBTITLE, QBCONTENT, QBIP)
    VALUES (QBOARD_SEQ.NEXTVAL, 'ccc','문의드립니다!','회원탈퇴 후에 정보는 몇년동안 남아있나요?', '127.0.0.5');
-- [2] QBOARD - DML
-- writeQboard(문의글 작성하기)
INSERT INTO QBOARD (QBID, MID, QBTITLE, QBCONTENT, QBIP)
    VALUES (QBOARD_SEQ.NEXTVAL, 'choi','친구 추가는 어덯게 하나요?','친구추가 버튼이 보이지 않아요', '127.0.0.10');
-- modifyQboard(문의글 수정하기)
UPDATE QBOARD SET QBTITLE='서비스가 정말 별로에요',
                  QBCONTENT='여러분 이 사이트 절대 쓰지마세요',
                  QBIP='127.0.0.4'
            WHERE QBID=2 AND QBREPLYCHECK=0;
-- viewQboard(문의글 상세보기)
SELECT * FROM QBOARD WHERE QBID=1;
-- listQboardForMember(멤버를 위한 문의글 목록)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10;   
-- getQboardTotCntForMember(멤버를 위한 문의글 갯수 얻기)
SELECT COUNT(*) FROM QBOARD;
-- listQboardForMe(자신이 작성한 문의글 목록)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD WHERE MID='aaa' ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10; 
-- getQboardTotCntForMe(자신이 작성한 문의글 갯수 얻기)
SELECT COUNT(*) FROM QBOARD WHERE MID='aaa';
-- listUncheckedQboardForAdmin(관리자를 위한 답글처리가 안 된 문의글 목록)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD WHERE QBREPLYCHECK=0 ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10; 
-- getUncheckedQboardTotCntForAdmin(관리자를 위한 답글처리가 안 된 문의글 갯수 얻기)
SELECT COUNT(*) FROM QBOARD WHERE QBREPLYCHECK=0;
-- listCheckedQboardForAdmin(관리자를 위한 답글처리가 된 문의글 목록)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD WHERE QBREPLYCHECK=1 ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10; 
-- getCheckedQboardTotCntForAdmin(관리자를 위한 답글처리가 된 문의글 갯수 얻기)
SELECT COUNT(*) FROM QBOARD WHERE QBREPLYCHECK=1;
-- updateQboardReplyCheck(답글처리가 된 문의글의 처리상태 바꾸기)
UPDATE QBOARD SET QBREPLYCHECK=1 WHERE QBID=1;

-- [3] ANSWERBOARD

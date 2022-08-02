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
SELECT COUNT(*) FROM MEMBER WHERE MID='aaa'; -- �ߺ��� ���̵��� ��� 1
SELECT COUNT(*) FROM MEMBER WHERE MID='ZZZ'; -- �ߺ��� ���̵� �ƴ� ��� 0
-- confirmMemail
SELECT COUNT(*) FROM MEMBER WHERE MEMAIL='yoonseokoo@gmail.com'; -- �ߺ��� �̸����� ��� 1
SELECT COUNT(*) FROM MEMBER WHERE MEMAIL='owen6113@naver.com'; -- �ߺ��� �̸����� �ƴ� ��� 0
-- joinMember
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL)
    VALUES ('choi', '123', 'jinyeoung', 'jinyeoung@naver.com');
-- getMember
SELECT * FROM MEMBER WHERE MID='aaa';
-- modifyMember
UPDATE MEMBER SET MPW='123',
                  MNAME='������',
                  MEMAIL='choi@naver.com'
            WHERE MID='choi';
-- searchMid(mname, memail)
SELECT MID FROM MEMBER WHERE MNAME='������' AND MEMAIL='choi@naver.com';
-- searchMemail(mid, mname, memail)
SELECT MPW FROM MEMBER WHERE MID='choi' AND MNAME='������' AND MEMAIL='choi@naver.com';

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
    VALUES (QBOARD_SEQ.NEXTVAL, 'aaa','�����ϱ⿡ ������ �ִ� �� �����ϴ�','�����ϱ� ��ư�� �����µ� ���� �ޱ� ��ư�� �ȶ��� ���� ���� �� ����� �̤�', '127.0.0.1');
INSERT INTO QBOARD (QBID, MID, QBTITLE, QBCONTENT, QBIP)
    VALUES (QBOARD_SEQ.NEXTVAL, 'bbb','���� �߾��� �ֽ��ϴ�','�� ����Ʈ ���� ���� �� ���ƿ�!', '127.0.0.3');
INSERT INTO QBOARD (QBID, MID, QBTITLE, QBCONTENT, QBIP)
    VALUES (QBOARD_SEQ.NEXTVAL, 'ccc','���ǵ帳�ϴ�!','ȸ��Ż�� �Ŀ� ������ ��⵿�� �����ֳ���?', '127.0.0.5');
-- [2] QBOARD - DML
-- writeQboard(���Ǳ� �ۼ��ϱ�)
INSERT INTO QBOARD (QBID, MID, QBTITLE, QBCONTENT, QBIP)
    VALUES (QBOARD_SEQ.NEXTVAL, 'choi','ģ�� �߰��� ��F�� �ϳ���?','ģ���߰� ��ư�� ������ �ʾƿ�', '127.0.0.10');
-- modifyQboard(���Ǳ� �����ϱ�)
UPDATE QBOARD SET QBTITLE='���񽺰� ���� ���ο���',
                  QBCONTENT='������ �� ����Ʈ ���� ����������',
                  QBIP='127.0.0.4'
            WHERE QBID=2 AND QBREPLYCHECK=0;
-- viewQboard(���Ǳ� �󼼺���)
SELECT * FROM QBOARD WHERE QBID=1;
-- listQboardForMember(����� ���� ���Ǳ� ���)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10;   
-- getQboardTotCntForMember(����� ���� ���Ǳ� ���� ���)
SELECT COUNT(*) FROM QBOARD;
-- listQboardForMe(�ڽ��� �ۼ��� ���Ǳ� ���)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD WHERE MID='aaa' ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10; 
-- getQboardTotCntForMe(�ڽ��� �ۼ��� ���Ǳ� ���� ���)
SELECT COUNT(*) FROM QBOARD WHERE MID='aaa';
-- listUncheckedQboardForAdmin(�����ڸ� ���� ���ó���� �� �� ���Ǳ� ���)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD WHERE QBREPLYCHECK=0 ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10; 
-- getUncheckedQboardTotCntForAdmin(�����ڸ� ���� ���ó���� �� �� ���Ǳ� ���� ���)
SELECT COUNT(*) FROM QBOARD WHERE QBREPLYCHECK=0;
-- listCheckedQboardForAdmin(�����ڸ� ���� ���ó���� �� ���Ǳ� ���)
SELECT * FROM (SELECT ROWNUM RN, A.* 
            FROM (SELECT * FROM QBOARD WHERE QBREPLYCHECK=1 ORDER BY QBRDATE DESC) A)
        WHERE RN BETWEEN 1 AND 10; 
-- getCheckedQboardTotCntForAdmin(�����ڸ� ���� ���ó���� �� ���Ǳ� ���� ���)
SELECT COUNT(*) FROM QBOARD WHERE QBREPLYCHECK=1;
-- updateQboardReplyCheck(���ó���� �� ���Ǳ��� ó������ �ٲٱ�)
UPDATE QBOARD SET QBREPLYCHECK=1 WHERE QBID=1;

-- [3] ANSWERBOARD
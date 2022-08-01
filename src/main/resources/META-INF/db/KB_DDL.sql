-- DROPPING TABLE
DROP TABLE MEMBER;
-- DROPPING SEQUENCE

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

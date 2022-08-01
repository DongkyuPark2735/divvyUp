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
-- midConfirm
SELECT COUNT(*) FROM MEMBER WHERE MID='aaa'; -- �ߺ��� ���̵��� ��� 1
SELECT COUNT(*) FROM MEMBER WHERE MID='ZZZ'; -- �ߺ��� ���̵� �ƴ� ��� 0
-- memailConfirm
SELECT COUNT(*) FROM MEMBER WHERE MEMAIL='yoonseokoo@gmail.com'; -- �ߺ��� �̸����� ��� 1
SELECT COUNT(*) FROM MEMBER WHERE MEMAIL='owen6113@naver.com'; -- �ߺ��� �̸����� �ƴ� ��� 0

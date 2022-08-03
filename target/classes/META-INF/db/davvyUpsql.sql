DROP TABLE GROUPS;

CREATE TABLE GROUPS(
    GID NUMBER(6) PRIMARY KEY,
    GNAME VARCHAR2(100) NOT NULL,
    GRDATE DATE DEFAULT SYSDATE,
    GIMG VARCHAR2(100),
    GCONTENT VARCHAR2(4000),
    MID VARCHAR2(100) REFERENCES  MEMBER(MID) NOT NULL
);

DROP TABLE MEMBER;

INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT, MID)
    VALUES(100, '그룹1', 'nothing.jpg', '그룹설명',  'QWE2735');

INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT, MID)
    VALUES(200, '그룹2', 'nothing.jpg', '그룹설명2',  'hayoon200');

CREATE TABLE MEMBER(
    MID VARCHAR2(100) PRIMARY KEY,
    MPW VARCHAR2(100) NOT NULL,
    MNAME VARCHAR2(100) NOT NULL,
    MEMAIL VARCHAR2(100) NOT NULL,
    MRDATE DATE DEFAULT SYSDATE
);

INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('QWE2735', '1', '박동규', 'qer2735@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('jeong123', '1', '정효원', 'jeong123@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('hwang123', '1', '황효진', 'hwang123@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('hayoon200', '1', '전하윤', 'hayoon200@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('gilsu100', '1', '이길수', 'gilsu100@naver.com');


DROP TABLE GROUPBOARD;

CREATE TABLE GROUPBOARD(
    GBID NUMBER(10) PRIMARY KEY,
    GID NUMBER(6) REFERENCES GROUPS(GID) NOT NULL,
    MID VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    GBCONTENT VARCHAR2(4000),
    GBFILENAME VARCHAR2(1000),
    GBRDATE TIMESTAMP DEFAULT SYSDATE 
);
DROP SEQUENCE GROUPBOARD_SEQ;

CREATE SEQUENCE GROUPBOARD_SEQ NOCYCLE NOCACHE;

COMMIT;

INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 100, 'QWE2735', '대화1', NULL);
    
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 100, 'jeong123', '대화2', NULL);
        
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 200, 'hwang123', '대화3', NULL);
            
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 200, 'gilsu100', '대화4', NULL);
      
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 200, 'hayoon200', '대화4', NULL);
                  
SELECT * FROM GROUPBOARD;        

-- 대화 입력 
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 100, 'QER2735', '대화1', NULL);

-- 대화 삭제 
DELETE FROM GROUPBOARD WHERE GBID = 37;

-- 그룹별 대화 내역 출력(최근 10개 최근게시글 아래로)
SELECT *
    FROM(SELECT ROWNUM RN2, GB.* 
            FROM (SELECT ROWNUM RN, GROUPBOARD.* 
                    FROM GROUPBOARD 
                    WHERE GID = 100 ORDER BY GBID DESC)GB
            ORDER BY RN2 DESC) 
    WHERE RN2 BETWEEN 1 AND 10;

-- 그룹별 과거 대화내역 가져오기 10개씩 
-- SERVICE단에서 RN2 BETWEEN 11 AND 20 수정하여 받음 
-- 클릭할때마다? SESSION값에 과거보기 1 추가
SELECT *
    FROM(SELECT ROWNUM RN2, GB.* 
            FROM (SELECT ROWNUM RN, GROUPBOARD.* 
                    FROM GROUPBOARD 
                    WHERE GID = 100 ORDER BY GBID DESC)GB
            ORDER BY RN2 DESC) 
    WHERE RN2 BETWEEN 11 AND 20;

-- 대화글 하나 가져오기? //주기적으로 대화 최신화 
-- 대화글 리스트로 받아서 기존글 ID와 비교 ?
SELECT * FROM GROUPBOARD WHERE GID = 100 ORDER BY GBID DESC;
<<<<<<< HEAD
=======

SELECT * 
    FROM (SELECT ROWNUM RN, GB.*
            FROM(SELECT * 
                    FROM GROUPBOARD  
                    WHERE GID = 100 ORDER BY GBID DESC) GB)
    WHERE RN = 1;
     
-- 그룹별 총 글 갯수 
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd

SELECT * 
    FROM (SELECT ROWNUM RN, GB.*
            FROM(SELECT * 
                    FROM GROUPBOARD  
                    WHERE GID = 100 ORDER BY GBID DESC) GB)
    WHERE RN = 1;
     

commit;






        
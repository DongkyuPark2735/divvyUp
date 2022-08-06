-- groupBoaard DummyData
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 1, 'aaa', '대화1', NULL);
    
select last_number from USER_SEQUENCES where SEQUENCE_NAME = 'GROUPBOARD_SEQ';

INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 1, 'bbb', '대화2', NULL);
        
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 1, 'ccc', '대화3', NULL);
            
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 1, 'ddd', '대화4', NULL);
      
INSERT INTO GROUPBOARD(GBID, GID, MID, GBCONTENT, GBFILENAME)
    VALUES(GROUPBOARD_SEQ.NEXTVAL, 2, 'hayoon200', '대화4', NULL);
                  
SELECT * FROM GROUPS;                  
SELECT * FROM GROUPDETAIL; 

SELECT * FROM GROUPBOARD; 
SELECT * FROM MEMBER;


-- GroupBoard
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

commit;

-- 입력한 대화글 하나 가져오기 dto
SELECT * FROM GROUPBOARD WHERE GBID = 192;
-- mid 별 입력한 최신글 가져오기
SELECT * FROM GROUPBOARD WHERE MID = 'aaa' ORDER BY GBID DESC; 

		SELECT * 
		    FROM (SELECT ROWNUM RN, GB.*
		            FROM(SELECT * 
		                    FROM GROUPBOARD  
		                    WHERE mid='aaa' ORDER BY GBID DESC) GB)
		    WHERE RN = 1;
commit;



SELECT *
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'GROUPS';
select * from groups;
insert into groups(gid, gname, grdate, gcontent, mid)
    VALUES(5, 'testGroup1', '22/08/01', '지우지말아주세요ㅠㅡㅠ', 'H34FI3');
insert into groups(gid, gname, grdate, gcontent, mid)
    VALUES(6, 'testGrouprfihgirg', '22/07/01', '지우지말아주세요ㅠㅡㅠ', 'H34FI3');
insert into groups(gid, gname, grdate, gcontent, mid)
    VALUES(11, 'testGroup48dodoodg', '22/07/01', '지우지말아주세요ㅠㅡㅠ', 'FI31234');    
insert into groups(gid, gname, grdate, gcontent, mid)
    VALUES(8, 'testGroupgvi34i4', '22/08/04', '지우지말아주세요ㅠㅡㅠ', 'FI31234');
insert into groups(gid, gname, grdate, gcontent, mid)
    VALUES(9, 'testGroupgmjm34i4', '22/07/31', '지우지말아주세요ㅠㅡㅠ', 'FI31234');
commit;
-- admin 검색 기능
-- MEMBER DUMMY
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('H34FI3', '1', '두길동', 'ALLf9U@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('FI31234', '1', '루길동', '22DFF9OD@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('98GV4H39', '1', '미길동', 'F93FIJ@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('O33UF', '1', '삼길동', 'FI3456@naver.com');
INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
    VALUES('G9I409', '1', '천길동', 'honFIJ5@naver.com');


-- 모든 회원  -- 정렬 가입일 이름순 등등
SELECT * FROM MEMBER ORDER BY MNAME;

-- 총 회원수 
SELECT COUNT(*) FROM MEMBER;

-- 회원 이름별 검색
SELECT *
    FROM(SELECT ROWNUM RN, M.* FROM MEMBER M WHERE M.MNAME LIKE '%'||'길'||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY mrdate desc;

-- 회원 ID별 검색
SELECT * FROM MEMBER WHERE MID LIKE '%'||'aa'||'%';
-- 회원 이메일별 검색  -- 대문자나 소문자 처리 ??? 메일 주소는 자르고 검색해야함 
SELECT * FROM MEMBER WHERE MEMAIL LIKE '%'||'hong'||'%';

-- 가입일별 정렬 == 최신순, 오래된순 
SELECT *
    FROM(SELECT ROWNUM RN, M.* FROM MEMBER M WHERE M.MNAME LIKE '%'||'길'||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY mname asc;

SELECT * 
    FROM MEMBER 
        WHERE MNAME LIKE '%'||'길'||'%'
            ORDER BY MRDATE;

commit;

select * from groups;
select * from follow;
select * from event;
select * from eventdetail;
select * from eventhistory;
select * from admin;

insert into admin 
    values ('a', '1', 'a');

commit;

-- 그룹 검색 
-- 총 그룹수 
SELECT COUNT(*) FROM GROUPS;

-- 그룹 이름별 검색
SELECT *
    FROM(SELECT ROWNUM RN, G.* FROM GROUPS G WHERE G.GNAME LIKE '%'||'t'||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY GRDATE desc;

-- 그룹 ID별 검색
SELECT *
    FROM(SELECT ROWNUM RN, G.* FROM GROUPS G WHERE G.GID LIKE '%'||'1'||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY GRDATE desc;

-- 그룹 생성회원별 검색
SELECT *
    FROM(SELECT ROWNUM RN, G.* FROM GROUPS G WHERE G.MID LIKE '%'||''||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY GRDATE desc;

-- 그룹 생성일별 정렬 == 최신순, 오래된순 
SELECT *
    FROM(SELECT ROWNUM RN, G.* FROM GROUPS G WHERE G.GID LIKE '%'||'1'||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY GRDATE desc;
commit;
select * from event;
-- 지출기록 검색 
-- 총 지출기록수 
SELECT COUNT(*) FROM EVENT;

-- 지출기록 이름별 검색
SELECT *
    FROM(SELECT ROWNUM RN, E.* FROM EVENT E WHERE E.ENAME LIKE '%'||''||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY ERDATE desc;

-- 지출기록 ID별 검색
SELECT *
    FROM(SELECT ROWNUM RN, E.* FROM EVENT E WHERE E.EID LIKE '%'||''||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY ERDATE desc;

-- 지출기록 그룹ID별 검색
SELECT *
    FROM(SELECT ROWNUM RN, E.* FROM EVENT E WHERE E.GID LIKE '%'||''||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY ERDATE desc;
        
-- 지출기록 생성회원 ID별 검색
SELECT *
    FROM(SELECT ROWNUM RN, E.* FROM EVENT E WHERE E.MID LIKE '%'||'a'||'%')
        WHERE RN BETWEEN 1 AND 10 ORDER BY ERDATE desc;

commit;
select * from groups;
select * from groupboard;


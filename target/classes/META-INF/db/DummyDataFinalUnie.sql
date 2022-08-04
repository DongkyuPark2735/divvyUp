
-- [1] MEMBER TABLE --

SELECT * FROM  MEMBER;

    INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL)
        VALUES ('aaa', '111', 'unie', 'yoonseokoo@gmail.com');
     INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
        VALUES ('bbb', '222', 'dk', 'dk@gmail.com');
     INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
        VALUES ('ccc', '333', 'bin', 'bin@gmail.com');
     INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
        VALUES ('ddd', '444', 'kim', 'kim@gmail.com');
        
COMMIT;

--[2] GROUP TABLE --

SELECT * FROM  GROUPS;



INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT, MID)
    VALUES (GROUPS_SEQ.NEXTVAL, 'Trip to Namhae', 'namhae.jpg' , 'Lets have a lit time', 'aaa');
    
INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT, MID)
    VALUES (GROUPS_SEQ.NEXTVAL, '전주식당', '' , '수요일은 돈가쓰가 맛있으니깐', 'bbb');

COMMIT;

-- [3] GROUP DETAIL -- 

SELECT * FROM GROUPDETAIL;


INSERT INTO GROUPDETAIL (GDID, GID, MID, GDBALANCE)
        VALUES (GROUPDETAIL_SEQ.NEXTVAL, (SELECT MAX(GID) FROM GROUPS), #{mid}, 0);

INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'aaa');
        
INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'bbb');
    
    INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'ccc');
    
    INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'ddd');
      
      commit;
-- [4] EVENT -- 

SELECT * FROM  EVENT;

INSERT INTO EVENT (EID, ENAME, ECONTENT, EIMAGE, EAMOUNT, EADDRESS, ECOUNT, MID, GID)
    VALUES (EVENT_SEQ.NEXTVAL, 'Lunch', 'Pizza near the station', '', 55000, 'london',  2, 'aaa', 1);
 
COMMIT;
ROLLBACK;

-- [5] EVENT DETAIL --

SELECT * FROM  EVENTDETAIL;


SELECT M.MID FROM MEMBER M, GROUPDETAIL GD, GROUPS G WHERE M.MID=GD.MID AND G.MID != GD.MID AND GD.GID=G.GID AND GD.GID=1;

    
    commit;
    
    
-- allocating the individual costs of the paid transaction (1/n)

INSERT INTO EVENTDETAIL (EDID, EID, MID, EDSHARE)
    VALUES (EVENTDETAIL_SEQ.NEXTVAL, 1, 'aaa', ((SELECT EAMOUNT FROM EVENT WHERE EID=1)/(SELECT ECOUNT FROM EVENT WHERE EID=1)));
    
INSERT INTO EVENTDETAIL  (EDID, EID, MID, EDSHARE)
    VALUES (EVENTDETAIL_SEQ.NEXTVAL, 1, 'bbb', -1*((SELECT EAMOUNT FROM EVENT WHERE EID=1)/(SELECT ECOUNT FROM EVENT WHERE EID=1)));

COMMIT;

-- [6] PAY HISTORY --

SELECT * FROM  EVENTHISTORY;

INSERT INTO EVENTHISTORY
		    (SELECT  EVENTHISTORY_SEQ.NEXTVAL, E.EID, ED.MID, ED.EDSHARE, E.ERDATE, E.ENAME
		    FROM EVENTDETAIL ED, EVENT E
		    WHERE E.EID=ED.EID
		    AND E.EID=(SELECT MAX(EID) FROM EVENT));
    
COMMIT;

-- [7] CENTRALSYSTEM

INSERT INTO CENTRALSYSTEM (CSID, GID)
 VALUES(CENTRALSYSTEM_SEQ.NEXTVAL, 1);
 
 UPDATE CENTRALSYSTEM
    SET CSAMOUNT = CSAMOUNT + (SELECT -GDBALANCE PAID FROM GROUPDETAIL WHERE  MID = 'bbb');

--PAY
UPDATE CENTRALSYSTEM
    SET CSALLPAID = 1
    WHERE CSAMOUNT=(SELECT SUM(-GDBALANCE) FROM GROUPDETAIL WHERE GDBALANCE < 0 AND GID = 1);

--GET
--UPDATE CENTRALSYSTEM
--    SET CSAMOUNT = CSAMOUNT - (SELECT GDBALANCE PAID FROM GROUPDETAIL WHERE  MID = 'aaa')
--    WHERE CSALLPAID = 1;
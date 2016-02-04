
-- Q1 --
SELECT DISTINCT S1.name, S1.sid
FROM Student S1, Student S2, Member M1, Member M2, Enrolled E1, Enrolled E2, Course C1, Course C2
WHERE S1.sid = M1.sid AND S2.sid = M2.sid 
  AND M1.pid = M2.pid AND S1.sid <> S2.sid 
  AND S2.sid = E1.sid AND E1.cid = C1.cid
  AND S2.sid = E2.sid AND E2.cid = C2.cid 
  AND C1.title = 'EECS484' AND (C2.title = 'EECS483' OR C2.title = 'EECS482');

-- Q2 --
SELECT S.sid, S.name, C.title
FROM Student S, Course C, Enrolled E
WHERE S.sid = E.sid AND S.major <> 'CS' AND E.cid = C.cid
  AND E.cid IN (SELECT E1.cid
		FROM  Enrolled E1, Student S1
		WHERE E1.sid = S1.sid AND S1.major = 'CS'
		GROUP BY E1.cid 
		HAVING COUNT(*) > 60)
ORDER BY S.name DESC;

-- Q3 -- 
CREATE VIEW Pairs(sid1,sid2) AS 
SELECT S1.sid, S2.sid
FROM Student S1, Student S2, Member M1, Member M2
WHERE S1.sid = M1.sid AND S2.sid = M2.sid 
  AND M1.pid = M2.pid AND S1.sid < S2.sid
MINUS
SELECT S1.sid, S2.sid 
FROM Student S1, Student S2, Enrolled E1, Enrolled E2
WHERE S1.sid = E1.sid AND S2.sid = E2.sid 
  AND E1.cid = E2.cid AND S1.sid < S2.sid;

SELECT P.sid1, P.sid2
FROM Pairs P;
DROP VIEW Pairs;


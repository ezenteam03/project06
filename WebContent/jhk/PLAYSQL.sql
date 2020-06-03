SELECT * FROM PMSEMP;
UPDATE pmsemp
SET EMAIL = 'pkmon2d@gmail.com'
WHERE eno = 10000005;
SELECT * FROM PMSMEMBER
ORDER BY mno;
SELECT pe.ENO, pe.NAME, pe.GRADE, pm.MDIV, pc.CNAME 
FROM pmsemp pe, pmsmember pm, PMSCODES pc
WHERE pe.ENO = pm.MNO 
AND pm.MDIV = pc.cno;
SELECT * FROM PMSPROJECT;
SELECT * FROM pmstask
ORDER BY tno;

DELETE FROM pmsproject 
WHERE pno = 1003 
;

SELECT pp.*, TO_CHAR(pp.sdate,'yyyy/mm/dd') sdatestr,TO_CHAR(pp.deadline,'yyyy/mm/dd') deadlinestr,
		 pem.name
		FROM PMSPROJECT pp, 
		(SELECT * FROM PMSEMP pe, PMSMEMBER pm WHERE pe.eno = pm.mno) pem
		WHERE pem.mno = pp.mno
		AND pem.mno = 10000005
		AND pp.pdiv = 11;

SELECT * FROM PMStask;
UPDATE PMSTASK 
SET prog=100
WHERE tno=1008;
SELECT * FROM PMSEMP pe, PMSMEMBER pm;
--pno를 기준으로 project정보 가져오기
SELECT pp.*, TO_CHAR(pp.sdate,'yyyy/mm/dd') sdatestr,TO_CHAR(pp.deadline,'yyyy/mm/dd') deadlinestr,
 pem.name
FROM PMSPROJECT pp, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm WHERE pe.eno = pm.mno) pem
WHERE pem.mno = pp.mno
AND pem.pno = 1002;
--mno와 pdiv를 기준으로 프로젝트 정보 가져오기
SELECT pp.*, TO_CHAR(pp.sdate,'yyyy/mm/dd') sdatestr,TO_CHAR(pp.deadline,'yyyy/mm/dd') deadlinestr,
 pem.name
FROM PMSPROJECT pp, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm WHERE pe.eno = pm.mno) pem
WHERE pem.mno = pp.mno
AND pem.mno = 10000010
AND pp.pdiv = 11;

UPDATE PMSPROJECT
SET cdate = '2020/05/04'
WHERE pno=1001;

SELECT * FROM PMSCODES;
SELECT * FROM PMSTASK;
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '화면설계', '화면을 설계', to_date('2020/05/04','YYYY/MM/DD'),to_date('2020/05/08','YYYY/MM/DD'),0,to_date('2020/05/06','YYYY/MM/DD'),NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '데이터베이스', 'DB설계 및 생성', to_date('2020/05/04','YYYY/MM/DD'),to_date('2020/05/08','YYYY/MM/DD'),0,to_date('2020/05/06','YYYY/MM/DD'),NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '웹', '웹화면 구현', to_date('2020/05/08','YYYY/MM/DD'),to_date('2020/05/20','YYYY/MM/DD'),0,to_date('2020/05/15','YYYY/MM/DD'),NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '앱', '앱화면 구현', to_date('2020/05/20','YYYY/MM/DD'),to_date('2020/06/01','YYYY/MM/DD'),0,to_date('2020/05/25','YYYY/MM/DD'),NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '테스트', '테스트를 함', to_date('2020/06/01','YYYY/MM/DD'),to_date('2020/06/08','YYYY/MM/DD'),0,to_date('2020/06/06','YYYY/MM/DD'),NULL,21,10000005);

UPDATE PMSTASK 
SET prog = 50
WHERE tno = 1004;

SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno;
SELECT *
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno;
/*
10000005 PM

10000015 10000016 10000017 10000019 10000022 10000023 10000024 팀원
 진수님           형준님           현규님         조장님           나             하나님         준석님
 */
SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno;

SELECT LEVEL||pt.tdiv "LEVEL",LPAD(' ', 4*(LEVEL)) || pt.tname tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
AND pp.pno = 1001
--AND pt.refno <= 0
--AND pem.eno = 10000015
--AND pt.tname LIKE '%'||'웹'||'%'
START WITH pt.refno=0
CONNECT BY PRIOR pt.tno = pt.refno;

--테스트용
SELECT * FROM pmstask
WHERE pno = 1001
CONNECT BY PRIOR tno = refno
START WITH refno = 0;
SELECT LTRIM(SYS_CONNECT_BY_PATH(r, '.'),'.')||'. '|| tname tname, tno
FROM
  (SELECT rank() over (partition BY refno ORDER BY tno) r,
                tno, tname, refno
  FROM pmstask)
   CONNECT BY PRIOR tno = refno 
  START WITH refno =0;
 ---- 프로젝트 최종 완성본??
 SELECT LEVEL||pt.tdiv "LEVEL",LPAD(' ', 4*(LEVEL-1)) || prt.tname tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem,
(SELECT LTRIM(SYS_CONNECT_BY_PATH(r, '.'),'.')||'. '|| tname tname, tno
FROM (SELECT rank() over (partition BY refno ORDER BY tno) r,
tno, tname, refno FROM pmstask WHERE pno = 1001)
   CONNECT BY PRIOR tno = refno 
  START WITH refno =0) prt
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
AND pt.tno = prt.tno
AND pp.pno = 1001
--AND pt.refno <= 0
--AND pem.eno = 10000015
--AND pt.tname LIKE '%'||'웹'||'%'
START WITH pt.refno=0
CONNECT BY PRIOR pt.tno = pt.refno;
 ----
 SELECT rank() over (partition BY refno ORDER BY tno) r,
                tno, tname, refno
  FROM pmstask
 WHERE pno = 1001; 
--팀원 작업 내역(전)
SELECT pt.tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
		(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
		FROM PMSPROJECT pp, PMSTASK pt, 
		(SELECT * FROM PMSEMP pe, PMSMEMBER pm
		WHERE pe.eno = pm.mno) pem
		WHERE pp.pno = pt.pno
		AND pt.mno = pem.mno
		AND pp.pno = #{pno}
		AND pt.tno = #{refno}
		UNION all
		SELECT pt.tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
		(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
		FROM PMSPROJECT pp, PMSTASK pt, 
		(SELECT * FROM PMSEMP pe, PMSMEMBER pm
		WHERE pe.eno = pm.mno) pem
		WHERE pp.pno = pt.pno
		AND pt.mno = pem.mno
		AND pp.pno = #{pno}
		AND pem.eno = #{mno}
		AND pt.refno = #{refno}
		START WITH pt.refno=0
		CONNECT BY PRIOR pt.tno = pt.refno;
--팀원 작업 내역(후)
SELECT LEVEL||pt.tdiv "LEVEL", LPAD(' ', 4*(LEVEL-1)) || prt.tname tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem,
(SELECT LTRIM(SYS_CONNECT_BY_PATH(r, '.'),'.')||'. '|| tname tname, tno
FROM (SELECT rank() over (partition BY refno ORDER BY tno) r,
tno, tname, refno FROM pmstask)
   CONNECT BY PRIOR tno = refno 
  START WITH refno =0) prt
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
AND pt.tno = prt.tno
AND pp.pno = 1001
AND pt.tno = 1009
START WITH pt.refno=0
CONNECT BY PRIOR pt.tno = pt.refno
--AND pt.refno = 1009
--AND pem.eno = 10000005
UNION all
SELECT LEVEL||pt.tdiv "LEVEL", LPAD(' ', 4*(LEVEL-1)) || prt.tname tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem,
(SELECT LTRIM(SYS_CONNECT_BY_PATH(r, '.'),'.')||'. '|| tname tname, tno
FROM (SELECT rank() over (partition BY refno ORDER BY tno) r,
tno, tname, refno FROM pmstask)
   CONNECT BY PRIOR tno = refno 
  START WITH refno =0) prt
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
AND pt.tno = prt.tno
AND pp.pno = 1001
AND pem.eno = 10000016
AND pt.refno = 1009
--OR pt.tno = 1009
START WITH pt.refno=0
CONNECT BY PRIOR pt.tno = pt.refno;
--팀원에 해당하는 REFNO 가져오기
SELECT DISTINCT refno FROM pmstask
WHERE mno=10000017
START WITH refno=0
CONNECT BY PRIOR tno = refno
ORDER BY refno ASC;

SELECT pp.*, pt.*, pem.* 
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
AND pem.eno = 10000016
START WITH pt.refno=0
CONNECT BY PRIOR pt.tno = pt.refno;

SELECT LEVEL, p.tNO , p.REFNO , p.TNAME, p.SDATE, p.EDATE 
FROM pmstask p
START WITH p.refno=0
CONNECT BY PRIOR tno = refno; 

SELECT a.eno, a.name, a.GRADE, a.DEPT, a.EMAIL, a.PHONE,  
c.CNAME,b.pno
FROM pmsemp a, pmsmember b, pmscodes c
WHERE c.cno(+)=b.mdiv
AND a.eno = b.mno(+)
--AND a.eno = #{eno};
ORDER BY a.eno ASC;
--pmsemp로 
SELECT rownum cnt, pmlist.* FROM (
	SELECT *  
	FROM (
			SELECT a.eno, a.name, a.GRADE, a.DEPT, a.EMAIL, a.PHONE, b.WCON, 
			c.CNAME,b.pno
			FROM pmsemp a, pmsmember b, pmscodes c
			WHERE a.eno = b.mno and b.mdiv=c.cno
			AND c.cno =9 
			AND b.pno is NULL
			UNION ALL
			select a.eno, a.name, a.GRADE, a.DEPT, a.EMAIL, a.PHONE, b.WCON, 
					c.CNAME,b.pno
			from (pmsemp a left outer join pmsMember b on a.eno=b.mno), pmscodes c
			where b.mno is NULL AND c.cno=9
		) 
	WHERE NOT grade = '사원'
	ORDER BY eno ASC
	) pmlist;

SELECT count(*) FROM (
	SELECT a.eno, a.name, a.GRADE, a.DEPT, a.EMAIL, a.PHONE, b.WCON,  
	c.CNAME,b.pno
	FROM pmsemp a, pmsmember b, pmscodes c
	WHERE a.eno = b.mno and b.mdiv=c.cno
	AND c.cno =9 
	AND b.pno is NULL
	UNION ALL
	select a.eno, a.name, a.GRADE, a.DEPT, a.EMAIL, a.PHONE, b.WCON,  
			c.CNAME,b.pno
	from (pmsemp a left outer join pmsMember b on a.eno=b.mno), pmscodes c
	where b.mno is NULL AND c.cno=9
)
WHERE NOT grade = '사원'
ORDER BY eno ASC;

WHERE pno=1003
ORDER BY mno;
SELECT * FROM PMSLOG;

--참여인원

--프로젝트 추가 실험
INSERT INTO pmsproject(pno, pname, sdate, deadline, mno, pdiv, detail) 
VALUES(pmsproject_seq.nextval,'새로운 프로젝트3', '2020/06/03','2020/07/01', 10000009, 11 ,'3');

SELECT * FROM PMSPROJECT WHERE mno=10000009;
SELECT * FROM pmsmember WHERE mno=10000009;
SELECT * FROM pmsemp WHERE eno=10000009;
insert into pmsmember values(10000009, '1234qwer!', 4, '010-6078-9450', 0);
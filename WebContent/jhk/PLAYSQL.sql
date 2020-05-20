SELECT * FROM PMSEMP;
SELECT * FROM PMSMEMBER;
SELECT pe.ENO, pe.NAME, pe.GRADE, pm.MDIV, pc.CNAME 
FROM pmsemp pe, pmsmember pm, PMSCODES pc
WHERE pe.ENO = pm.MNO 
AND pm.MDIV = pc.cno;
SELECT * FROM PMSPROJECT;
SELECT * FROM PMStask;
SELECT * FROM PMSEMP pe, PMSMEMBER pm;
--SQL 추가해야함
SELECT pp.*, TO_CHAR(pp.sdate,'yyyy/mm/dd') sdatestr,TO_CHAR(pp.deadline,'yyyy/mm/dd') deadlinestr,
 pem.name
FROM PMSPROJECT pp, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm WHERE pe.eno = pm.mno) pem
WHERE pem.mno = pp.mno
AND pem.pno = 1002;

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
SELECT pt.tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
--AND pt.refno <= 0
--AND pem.eno = 10000015
--AND pp.pno = 1002
--AND pt.tname LIKE '%'||'웹'||'%'
START WITH pt.refno=0
CONNECT BY PRIOR pt.tno = pt.refno;
--팀원 작업 내역
SELECT pt.tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
AND pp.pno = 1001
AND pt.tno = 1009
--AND pt.refno = 1009
--AND pem.eno = 10000005
UNION all
SELECT pt.tname, pt.tno, pt.refno, pp.pno, pp.pname, pt.sdate sdateorigin, pt.edate edateorigin, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem
WHERE pp.pno = pt.pno
AND pt.mno = pem.mno
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
SELECT pe.eno, pe.name, pe.GRADE, pe.DEPT, pe.EMAIL, pe.PHONE,  
		pc.CNAME,pm.pno
		FROM pmsemp pe, pmsmember pm, pmscodes pc
		WHERE pe.eno = pm.mno and pm.mdiv=pc.cno;

-- pno가 null인것, cname이 구분 없음인
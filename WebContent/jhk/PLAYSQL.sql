SELECT * FROM PMSEMP;
SELECT * FROM PMSMEMBER;
SELECT pe.ENO, pe.NAME, pe.GRADE, pm.MDIV, pc.CNAME 
FROM pmsemp pe, pmsmember pm, PMSCODES pc
WHERE pe.ENO = pm.MNO 
AND pm.MDIV = pc.cno;
SELECT * FROM PMSPROJECT;
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

SELECT pt.tname, pt.tno, pt.refno, pp.pno, pp.pname, 
(pt.sdate-pp.sdate) sdate, (pt.edate-pp.sdate) edate, (pt.prog/100) prog, pem.name name
FROM PMSPROJECT pp, PMSTASK pt, 
(SELECT * FROM PMSEMP pe, PMSMEMBER pm
WHERE pe.eno = pm.mno) pem
WHERE pp.pno = pt.pno AND
pp.mno = pem.mno;
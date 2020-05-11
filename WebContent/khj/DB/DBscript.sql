CREATE TABLE PMSemp (
PMSemp	 NUMBER			NOT NULL,
PMSename varchar2(40)	NULL,
PMSdept  varchar2(40)	NULL,
PMSmgr 	 varchar2(40)	NULL,
PMSphone varchar2(60)	NULL,
PMSemail varchar2(100)	NULL
);
SELECT * FROM PMSemp;

CREATE SEQUENCE PMSemp_seq
INCREMENT BY 1
START WITH 1000;


DROP TABLE PMSemp;
DROP SEQUENCE PMSemp_seq;

-- 사원정보
INSERT INTO PMSemp values(PMSemp_seq.nextval,'유재인',NULL, 'CEO', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_seq.nextval,'전현규',NULL, 'CTO', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_seq.nextval,'김진수','개발1팀', '부장', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_seq.nextval,'김하나','개발1팀', '팀장', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_seq.nextval,'김형준','개발1팀', '차장', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_seq.nextval,'이준석','개발1팀', '대리', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_seq.nextval,'이연학','개발1팀', '사원', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174612,'문재인',NULL, 'CEO', '010-8270-6064', 'Moon2017@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174611,'박근혜',NULL, '전무', '010-6634-1032', 'Park2013@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174610,'이명박',NULL, 'CTO', '010-0224-1025', 'MB2008@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174609,'노무현',NULL, '상무', '010-8586-8894', 'MH2003@daum.net');
INSERT INTO PMSemp values(PMSemp_sequence,10174608,'김대중','개발1팀', '부장', '010-2175-9239', 'DJ1998@daum.net');
INSERT INTO PMSemp values(PMSemp_sequence,10174607,'김영삼','개발2팀', '부장', '010-5762-1972', 'YS1993@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174606,'노태우','개발3팀', '부장', '010-4127-6585', 'TW1988@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174605,'전두환','개발3팀', '차장', '010-7714-8058', 'Tank1980@daum.net');
INSERT INTO PMSemp values(PMSemp_sequence,10174604,'최규하','개발3팀', '과장', '010-6078-9450', 'Choi1979@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174603,'박정희','개발3팀', '대리', '010-9665-6200', 'Yusin1963@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174602,'윤보선','개발2팀', '차장', '010-3255-8985', 'Yoon1960@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,10174601,'이승만','개발2팀', '과장', '010-1619-1914', 'FirstLee@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,11210301,'김문수','개발3팀', '대리', '010-5206-7975', 'Imoonsu@daum.net');
INSERT INTO PMSemp values(PMSemp_sequence,11210304,'유승민','개발3팀', '사원', '010-3570-8717', 'seongmin@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,11210314,'추미애','개발1팀', '차장', '010-2415-2920', 'miae58@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,12371420,'오세훈','개발1팀', '과장', '010-6002-7753', 'sehu61@daum.net');
INSERT INTO PMSemp values(PMSemp_sequence,12371421,'안희정','개발1팀', '대리', '010-9589-3836', 'heejung65@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,12371425,'나경원','개발2팀', '대리', '010-7954-1705', 'nabe28@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,13012406,'박영선','개발1팀', '대리', '010-1543-2532', 'pys60@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,13012408,'고승덕','개발3팀', '사원', '010-9905-5718', 'Sorry79@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,15127801,'이은재','개발2팀', '대리', '010-7082-0084', 'Stepdown@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,15134501,'정은경','개발1팀', '사원', '010-5446-3704', 'Corona44@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,16013574,'홍준표','개발1팀', '사원', '010-9033-2939', 'RedJun54@daum.net');
INSERT INTO PMSemp values(PMSemp_sequence,16013254,'김무성','개발1팀', '사원', '010-7397-9015', 'Moosung@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,16013254,'이재명','개발2팀', '사원', '010-0987-9761', 'Gyeonggi11@gmail.com');
INSERT INTO PMSemp values(PMSemp_sequence,18124872,'심상정','개발1팀', '사원', '010-4574-7345', 'Justice3@naver.com');
INSERT INTO PMSemp values(PMSemp_sequence,19481245,'안철수','개발3팀', '사원', '010-2936-6952', 'VirusAnn@daum.net');
INSERT INTO PMSemp values(PMSemp_sequence,20782121,'문희상','개발2팀', '사원', '010-2378-8963', 'Mhs45@gmail.com');


-- PMS사용자
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174612, '1234qwer!', 0, '010-8270-6064', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174611, '1q2w3e4r!', 0, '010-6634-1032', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174610, 'qwer1234!', 0, '010-0224-1025', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174609, 'q1w2e3r4!', 0, '010-8586-8894', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174608, '1q2w3e4r!', 1, '010-2175-9239', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174607, '1234qwer!', 1, '010-5762-1972', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174606, '1q2w3e4r!', 1, '010-4127-6585', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174605, '1234qwer!', 2, '010-7714-8058', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174604, 'q1w2e3r4!', 2, '010-6078-9450', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174603, '1q2w3e4r!', 3, '010-9665-6200', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174602, '1234qwer!', 2, '010-3255-8985', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 10174601, 'qwer1234!', 2, '010-1619-1914', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 11210301, 'qwer1234!', 3, 'Imoonsu@daum.net', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 11210304, '1q2w3e4r!', 3, 'seongmin@gmail.com', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 11210314, 'q1w2e3r4!', 2, 'miae58@naver.com', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 16013254, '1234qwer!', 3, 'Moosung@naver.com', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 17053254, '1q2w3e4r!', 3, 'Gyeonggi11@gmail.com', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 18124872, 'qwer1234!', 3, 'Justice3@naver.com', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 19481245, '1234qwer!', 3, 'VirusAnn@daum.net', 0);
INSERT INTO p6_pmsUser values(p6_pmsUser_sequence, 20782121, '1234qwer!', 3, 'Mhs45@gmail.com', 0);



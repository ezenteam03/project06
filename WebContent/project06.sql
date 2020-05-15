DROP SEQUENCE pmsemp_seq;
DROP SEQUENCE pmslog_seq;
DROP SEQUENCE pmsproject_seq;
DROP SEQUENCE pmstask_seq;
DROP SEQUENCE pmstfile_seq;
DROP SEQUENCE pmsnotice_seq;
DROP SEQUENCE pmsissue_seq; 
DROP SEQUENCE pmsreply_seq; 
DROP SEQUENCE pmsmeeting_seq; 
DROP SEQUENCE pmsbfile_seq; 

ALTER TABLE PMSCODES
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSCODES;

/* 코드성데이터 테이블 */
DROP TABLE PMSCODES 
	CASCADE CONSTRAINTS;

/* 코드성데이터 테이블 */
CREATE TABLE PMSCODES (
	cno NUMBER NOT NULL, /* 코드번호 */
	refno NUMBER NOT NULL, /* 부모코드번호 */
	cname VARCHAR2(30) NOT NULL /* 이름 */
);

COMMENT ON TABLE PMSCODES IS '코드성데이터 테이블';

COMMENT ON COLUMN PMSCODES.cno IS '코드번호';

COMMENT ON COLUMN PMSCODES.refno IS '부모코드번호';

COMMENT ON COLUMN PMSCODES.cname IS '이름';

CREATE UNIQUE INDEX PK_PMSCODES
	ON PMSCODES (
		cno ASC
	);

ALTER TABLE PMSCODES
	ADD
		CONSTRAINT PK_PMSCODES
		PRIMARY KEY (
			cno
		);
	
ALTER TABLE PMSEMP
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSEMP;

/* 사원정보 */
DROP TABLE PMSEMP 
	CASCADE CONSTRAINTS;

/* 사원정보 */
CREATE TABLE PMSEMP (
	eno NUMBER NOT NULL, /* 사원번호 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	dept VARCHAR2(50), /* 부서명 */
	grade VARCHAR2(50) NOT NULL, /* 직책 */
	phone VARCHAR2(50) NOT NULL, /* 핸드폰 */
	email VARCHAR2(50) NOT NULL /* 이메일 */
);

COMMENT ON TABLE PMSEMP IS '사원정보';

COMMENT ON COLUMN PMSEMP.eno IS '사원번호';

COMMENT ON COLUMN PMSEMP.name IS '이름';

COMMENT ON COLUMN PMSEMP.dept IS '부서명';

COMMENT ON COLUMN PMSEMP.grade IS '직책';

COMMENT ON COLUMN PMSEMP.phone IS '핸드폰';

COMMENT ON COLUMN PMSEMP.email IS '이메일';

CREATE UNIQUE INDEX PK_PMSEMP
	ON PMSEMP (
		eno ASC
	);

ALTER TABLE PMSEMP
	ADD
		CONSTRAINT PK_PMSEMP
		PRIMARY KEY (
			eno
		);
	
CREATE SEQUENCE pmsemp_seq
START WITH 10000001
INCREMENT BY 1;
		
ALTER TABLE PMSMEMBER
	DROP
		CONSTRAINT FK_PMSPROJECT_TO_PMSMEMBER
		CASCADE;

ALTER TABLE PMSMEMBER
	DROP
		CONSTRAINT FK_PMSEMP_TO_PMSMEMBER
		CASCADE;

ALTER TABLE PMSMEMBER
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSMEMBER;

/* 사용자 */
DROP TABLE PMSMEMBER 
	CASCADE CONSTRAINTS;

/* 사용자 */
CREATE TABLE PMSMEMBER (
	mno NUMBER NOT NULL, /* 사원번호 */
	pass VARCHAR2(20) NOT NULL, /* 비밀번호 */
	mdiv NUMBER NOT NULL, /* 권한구분 */
	wcon VARCHAR2(50), /* 희망연락처 */
	pno NUMBER /* 프로젝트번호 */
);

COMMENT ON TABLE PMSMEMBER IS '사용자';

COMMENT ON COLUMN PMSMEMBER.mno IS '사원번호';

COMMENT ON COLUMN PMSMEMBER.pass IS '비밀번호';

COMMENT ON COLUMN PMSMEMBER.mdiv IS '권한구분';

COMMENT ON COLUMN PMSMEMBER.wcon IS '희망연락처';

COMMENT ON COLUMN PMSMEMBER.pno IS '프로젝트번호';

CREATE UNIQUE INDEX PK_PMSMEMBER
	ON PMSMEMBER (
		mno ASC
	);

ALTER TABLE PMSMEMBER
	ADD
		CONSTRAINT PK_PMSMEMBER
		PRIMARY KEY (
			mno
		);

ALTER TABLE PMSMEMBER
	ADD
		CONSTRAINT FK_PMSEMP_TO_PMSMEMBER
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSEMP (
			eno
		);
	
ALTER TABLE pmsmember
	ADD
		CONSTRAINT pmsmember_mdiv_ck
		CHECK(mdiv IN(2,3,4,5,6));
	
ALTER TABLE PMSPROJECT
	DROP
		CONSTRAINT FK_PMSMEMBER_TO_PMSPROJECT
		CASCADE;

ALTER TABLE PMSPROJECT
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSPROJECT;

/* 프로젝트 */
DROP TABLE PMSPROJECT 
	CASCADE CONSTRAINTS;

/* 프로젝트 */
CREATE TABLE PMSPROJECT (
	pno NUMBER NOT NULL, /* 프로젝트번호 */
	sdate DATE NOT NULL, /* 시작일자 */
	deadline DATE NOT NULL, /* 종료일자 */
	pname VARCHAR2(100) NOT NULL, /* 프로젝트명 */
	detail VARCHAR2(500) NOT NULL, /* 프로젝트내용 */
	cdate DATE, /* 결재일자 */
	pdiv NUMBER NOT NULL, /* 결재구분 */
	mno NUMBER NOT NULL /* PM번호 */
);

COMMENT ON TABLE PMSPROJECT IS '프로젝트';

COMMENT ON COLUMN PMSPROJECT.pno IS '프로젝트번호';

COMMENT ON COLUMN PMSPROJECT.sdate IS '시작일자';

COMMENT ON COLUMN PMSPROJECT.deadline IS '종료일자';

COMMENT ON COLUMN PMSPROJECT.pname IS '프로젝트명';

COMMENT ON COLUMN PMSPROJECT.detail IS '프로젝트내용';

COMMENT ON COLUMN PMSPROJECT.cdate IS '결재일자';

COMMENT ON COLUMN PMSPROJECT.pdiv IS '결재구분';

COMMENT ON COLUMN PMSPROJECT.mno IS 'PM번호';

CREATE UNIQUE INDEX PK_PMSPROJECT
	ON PMSPROJECT (
		pno ASC
	);

ALTER TABLE PMSPROJECT
	ADD
		CONSTRAINT PK_PMSPROJECT
		PRIMARY KEY (
			pno
		);

ALTER TABLE PMSPROJECT
	ADD
		CONSTRAINT FK_PMSMEMBER_TO_PMSPROJECT
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSMEMBER (
			mno
		);
	
ALTER TABLE pmsproject
	ADD
		CONSTRAINT pmsproject_pdiv_ck
		CHECK(pdiv IN(11,12,13,14));
	
CREATE SEQUENCE pmsproject_seq
START WITH 1001
INCREMENT BY 1;
	
ALTER TABLE PMSMEMBER
	ADD
		CONSTRAINT FK_PMSPROJECT_TO_PMSMEMBER
		FOREIGN KEY (
			pno
		)
		REFERENCES PMSPROJECT (
			pno
		);
	
ALTER TABLE PMSLOG
	DROP
		CONSTRAINT FK_PMSMEMBER_TO_PMSLOG
		CASCADE;

ALTER TABLE PMSLOG
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSLOG;

/* 로그인히스토리 */
DROP TABLE PMSLOG 
	CASCADE CONSTRAINTS;

/* 로그인히스토리 */
CREATE TABLE PMSLOG (
	lno NUMBER NOT NULL, /* 순번 */
	state NUMBER NOT NULL, /* 로그인상태 */
	login DATE NOT NULL, /* 로그인일시 */
	logout DATE, /* 로그아웃일시 */
	mno NUMBER NOT NULL /* 사원번호 */
);

COMMENT ON TABLE PMSLOG IS '로그인히스토리';

COMMENT ON COLUMN PMSLOG.lno IS '순번';

COMMENT ON COLUMN PMSLOG.state IS '로그인상태';

COMMENT ON COLUMN PMSLOG.login IS '로그인일시';

COMMENT ON COLUMN PMSLOG.logout IS '로그아웃일시';

COMMENT ON COLUMN PMSLOG.mno IS '사원번호';

CREATE UNIQUE INDEX PK_PMSLOG
	ON PMSLOG (
		lno ASC
	);

ALTER TABLE PMSLOG
	ADD
		CONSTRAINT PK_PMSLOG
		PRIMARY KEY (
			lno
		);

ALTER TABLE PMSLOG
	ADD
		CONSTRAINT FK_PMSMEMBER_TO_PMSLOG
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSMEMBER (
			mno
		);
	
ALTER TABLE pmslog
	ADD
		CONSTRAINT pmslog_state_ck
		CHECK(state IN(0,1));
	
CREATE SEQUENCE pmslog_seq
START WITH 1
INCREMENT BY 1;
	
ALTER TABLE PMSTASK
	DROP
		CONSTRAINT FK_PMSPROJECT_TO_PMSTASK
		CASCADE;

ALTER TABLE PMSTASK
	DROP
		CONSTRAINT FK_PMSMEMBER_TO_PMSTASK
		CASCADE;

ALTER TABLE PMSTASK
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSTASK;

/* 프로젝트업무 */
DROP TABLE PMSTASK 
	CASCADE CONSTRAINTS;

/* 프로젝트업무 */
CREATE TABLE PMSTASK (
	tno NUMBER NOT NULL, /* 업무번호 */
	pno NUMBER NOT NULL, /* 프로젝트번호 */
	refno NUMBER NOT NULL, /* 부모업무번호 */
	tname VARCHAR2(100) NOT NULL, /* 업무명 */
	detail VARCHAR2(2000) NOT NULL, /* 업무내용 */
	updetail VARCHAR2(2000), /* 업무진행내용 */
	sdate DATE NOT NULL, /* 시작일자 */
	edate DATE NOT NULL, /* 종료일자 */
	prog NUMBER NOT NULL, /* 진행율 */
	pdate DATE, /* 진행일자 */
	coment VARCHAR2(200), /* 반려사유 */
	tdiv NUMBER NOT NULL, /* 결재구분 */
	mno NUMBER NOT NULL /* 사원번호 */
);

COMMENT ON TABLE PMSTASK IS '프로젝트업무';

COMMENT ON COLUMN PMSTASK.tno IS '업무번호';

COMMENT ON COLUMN PMSTASK.pno IS '프로젝트번호';

COMMENT ON COLUMN PMSTASK.refno IS '부모업무번호';

COMMENT ON COLUMN PMSTASK.tname IS '업무명';

COMMENT ON COLUMN PMSTASK.detail IS '업무내용';

COMMENT ON COLUMN PMSTASK.updetail IS '업무진행내용';

COMMENT ON COLUMN PMSTASK.sdate IS '시작일자';

COMMENT ON COLUMN PMSTASK.edate IS '종료일자';

COMMENT ON COLUMN PMSTASK.prog IS '진행율';

COMMENT ON COLUMN PMSTASK.pdate IS '진행일자';

COMMENT ON COLUMN PMSTASK.coment IS '반려사유';

COMMENT ON COLUMN PMSTASK.tdiv IS '결재구분';

COMMENT ON COLUMN PMSTASK.mno IS '사원번호';

CREATE UNIQUE INDEX PK_PMSTASK
	ON PMSTASK (
		tno ASC
	);

ALTER TABLE PMSTASK
	ADD
		CONSTRAINT PK_PMSTASK
		PRIMARY KEY (
			tno
		);

ALTER TABLE PMSTASK
	ADD
		CONSTRAINT FK_PMSPROJECT_TO_PMSTASK
		FOREIGN KEY (
			pno
		)
		REFERENCES PMSPROJECT (
			pno
		);

ALTER TABLE PMSTASK
	ADD
		CONSTRAINT FK_PMSMEMBER_TO_PMSTASK
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSMEMBER (
			mno
		);
	
ALTER TABLE pmstask
	ADD
		CONSTRAINT pmstask_tdiv_ck
		CHECK(tdiv IN(21,22,23,24));
	
CREATE SEQUENCE pmstask_seq
START WITH 1001
INCREMENT BY 1;
	
ALTER TABLE PMSTFILE
	DROP
		CONSTRAINT FK_PMSTASK_TO_PMSTFILE
		CASCADE;

ALTER TABLE PMSTFILE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSTFILE;

/* 업무첨부파일 */
DROP TABLE PMSTFILE 
	CASCADE CONSTRAINTS;

/* 업무첨부파일 */
CREATE TABLE PMSTFILE (
	tfno NUMBER NOT NULL, /* 파일번호 */
	tno NUMBER NOT NULL, /* 업무번호 */
	fname VARCHAR2(200) NOT NULL, /* 파일명 */
	upload DATE NOT NULL /* 업로드일 */
);

COMMENT ON TABLE PMSTFILE IS '업무첨부파일';

COMMENT ON COLUMN PMSTFILE.tfno IS '파일번호';

COMMENT ON COLUMN PMSTFILE.tno IS '업무번호';

COMMENT ON COLUMN PMSTFILE.fname IS '파일명';

COMMENT ON COLUMN PMSTFILE.upload IS '업로드일';

CREATE UNIQUE INDEX PK_PMSTFILE
	ON PMSTFILE (
		tfno ASC
	);

ALTER TABLE PMSTFILE
	ADD
		CONSTRAINT PK_PMSTFILE
		PRIMARY KEY (
			tfno
		);

ALTER TABLE PMSTFILE
	ADD
		CONSTRAINT FK_PMSTASK_TO_PMSTFILE
		FOREIGN KEY (
			tno
		)
		REFERENCES PMSTASK (
			tno
		);
	
CREATE SEQUENCE pmstfile_seq
START WITH 1
INCREMENT BY 1;
	
ALTER TABLE PMSNOTICE
	DROP
		CONSTRAINT FK_PMSPROJECT_TO_PMSNOTICE
		CASCADE;

ALTER TABLE PMSNOTICE
	DROP
		CONSTRAINT FK_PMSMEMBER_TO_PMSNOTICE
		CASCADE;

ALTER TABLE PMSNOTICE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSNOTICE;

/* 공지사항 */
DROP TABLE PMSNOTICE 
	CASCADE CONSTRAINTS;

/* 공지사항 */
CREATE TABLE PMSNOTICE (
	nno NUMBER NOT NULL, /* 공지번호 */
	title VARCHAR2(100) NOT NULL, /* 제목 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	wdate DATE NOT NULL, /* 작성일 */
	chdate DATE, /* 수정일 */
	views NUMBER NOT NULL, /* 조회수 */
	pno NUMBER NOT NULL, /* 프로젝트번호 */
	mno NUMBER NOT NULL /* 작성자번호 */
);

COMMENT ON TABLE PMSNOTICE IS '공지사항';

COMMENT ON COLUMN PMSNOTICE.nno IS '공지번호';

COMMENT ON COLUMN PMSNOTICE.title IS '제목';

COMMENT ON COLUMN PMSNOTICE.detail IS '내용';

COMMENT ON COLUMN PMSNOTICE.wdate IS '작성일';

COMMENT ON COLUMN PMSNOTICE.chdate IS '수정일';

COMMENT ON COLUMN PMSNOTICE.views IS '조회수';

COMMENT ON COLUMN PMSNOTICE.pno IS '프로젝트번호';

COMMENT ON COLUMN PMSNOTICE.mno IS '작성자번호';

CREATE UNIQUE INDEX PK_PMSNOTICE
	ON PMSNOTICE (
		nno ASC
	);

ALTER TABLE PMSNOTICE
	ADD
		CONSTRAINT PK_PMSNOTICE
		PRIMARY KEY (
			nno
		);

ALTER TABLE PMSNOTICE
	ADD
		CONSTRAINT FK_PMSPROJECT_TO_PMSNOTICE
		FOREIGN KEY (
			pno
		)
		REFERENCES PMSPROJECT (
			pno
		);

ALTER TABLE PMSNOTICE
	ADD
		CONSTRAINT FK_PMSMEMBER_TO_PMSNOTICE
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSMEMBER (
			mno
		);
	
CREATE SEQUENCE pmsnotice_seq
START WITH 1
INCREMENT BY 1;
	
ALTER TABLE PMSMEETING
	DROP
		CONSTRAINT FK_PMSMEMBER_TO_PMSMEETING
		CASCADE;

ALTER TABLE PMSMEETING
	DROP
		CONSTRAINT FK_PMSPROJECT_TO_PMSMEETING
		CASCADE;

ALTER TABLE PMSMEETING
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSMEETING;

/* 회의록 게시판 */
DROP TABLE PMSMEETING 
	CASCADE CONSTRAINTS;

/* 회의록 게시판 */
CREATE TABLE PMSMEETING (
	mnno NUMBER NOT NULL, /* 회의록번호 */
	topic VARCHAR2(100) NOT NULL, /* 안건 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	result VARCHAR2(200), /* 결정사항 */
	etc VARCHAR2(200), /* 특이사항 */
	views NUMBER NOT NULL, /* 조회수 */
	wdate DATE NOT NULL, /* 작성일 */
	chdate DATE, /* 수정일 */
	mdate DATE NOT NULL, /* 회의일시 */
	loc VARCHAR2(100) NOT NULL, /* 회의장소 */
	people VARCHAR2(200) NOT NULL, /* 참여자 */
	mndiv NUMBER NOT NULL, /* 결재구분 */
	mno NUMBER NOT NULL, /* 작성자번호 */
	pno NUMBER NOT NULL /* 프로젝트번호 */
);

COMMENT ON TABLE PMSMEETING IS '회의록 게시판';

COMMENT ON COLUMN PMSMEETING.mnno IS '회의록번호';

COMMENT ON COLUMN PMSMEETING.topic IS '안건';

COMMENT ON COLUMN PMSMEETING.detail IS '내용';

COMMENT ON COLUMN PMSMEETING.result IS '결정사항';

COMMENT ON COLUMN PMSMEETING.etc IS '특이사항';

COMMENT ON COLUMN PMSMEETING.views IS '조회수';

COMMENT ON COLUMN PMSMEETING.wdate IS '작성일';

COMMENT ON COLUMN PMSMEETING.chdate IS '수정일';

COMMENT ON COLUMN PMSMEETING.mdate IS '회의일시';

COMMENT ON COLUMN PMSMEETING.loc IS '회의장소';

COMMENT ON COLUMN PMSMEETING.people IS '참여자';

COMMENT ON COLUMN PMSMEETING.mndiv IS '결재구분';

COMMENT ON COLUMN PMSMEETING.mno IS '작성자번호';

COMMENT ON COLUMN PMSMEETING.pno IS '프로젝트번호';

CREATE UNIQUE INDEX PK_PMSMEETING
	ON PMSMEETING (
		mnno ASC
	);

ALTER TABLE PMSMEETING
	ADD
		CONSTRAINT PK_PMSMEETING
		PRIMARY KEY (
			mnno
		);

ALTER TABLE PMSMEETING
	ADD
		CONSTRAINT FK_PMSMEMBER_TO_PMSMEETING
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSMEMBER (
			mno
		);

ALTER TABLE PMSMEETING
	ADD
		CONSTRAINT FK_PMSPROJECT_TO_PMSMEETING
		FOREIGN KEY (
			pno
		)
		REFERENCES PMSPROJECT (
			pno
		);
	
ALTER TABLE pmsmeeting
	ADD
		CONSTRAINT pmmeeting_mndiv_ck
		CHECK(mndiv IN(31,32,33,34));
	
CREATE SEQUENCE pmsmeeting_seq
START WITH 1
INCREMENT BY 1;
	
ALTER TABLE PMSISSUE
	DROP
		CONSTRAINT FK_PMSPROJECT_TO_PMSISSUE
		CASCADE;

ALTER TABLE PMSISSUE
	DROP
		CONSTRAINT FK_PMSMEMBER_TO_PMSISSUE
		CASCADE;

ALTER TABLE PMSISSUE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSISSUE;

/* 이슈리스트 */
DROP TABLE PMSISSUE 
	CASCADE CONSTRAINTS;

/* 이슈리스트 */
CREATE TABLE PMSISSUE (
	ino NUMBER NOT NULL, /* 이슈번호 */
	title VARCHAR2(200) NOT NULL, /* 제목 */
	detail VARCHAR2(2000) NOT NULL, /* 내용 */
	views NUMBER NOT NULL, /* 조회수 */
	coment VARCHAR2(2000), /* 해결방안 */
	wdate DATE NOT NULL, /* 작성일 */
	chdate DATE, /* 수정일 */
	cdate DATE, /* 해결방안작성일 */
	pno NUMBER NOT NULL, /* 프로젝트번호 */
	mno NUMBER NOT NULL /* 사원번호 */
);

COMMENT ON TABLE PMSISSUE IS '이슈리스트';

COMMENT ON COLUMN PMSISSUE.ino IS '이슈번호';

COMMENT ON COLUMN PMSISSUE.title IS '제목';

COMMENT ON COLUMN PMSISSUE.detail IS '내용';

COMMENT ON COLUMN PMSISSUE.views IS '조회수';

COMMENT ON COLUMN PMSISSUE.coment IS '해결방안';

COMMENT ON COLUMN PMSISSUE.wdate IS '작성일';

COMMENT ON COLUMN PMSISSUE.chdate IS '수정일';

COMMENT ON COLUMN PMSISSUE.cdate IS '해결방안작성일';

COMMENT ON COLUMN PMSISSUE.pno IS '프로젝트번호';

COMMENT ON COLUMN PMSISSUE.mno IS '사원번호';

CREATE UNIQUE INDEX PK_PMSISSUE
	ON PMSISSUE (
		ino ASC
	);

ALTER TABLE PMSISSUE
	ADD
		CONSTRAINT PK_PMSISSUE
		PRIMARY KEY (
			ino
		);

ALTER TABLE PMSISSUE
	ADD
		CONSTRAINT FK_PMSPROJECT_TO_PMSISSUE
		FOREIGN KEY (
			pno
		)
		REFERENCES PMSPROJECT (
			pno
		);

ALTER TABLE PMSISSUE
	ADD
		CONSTRAINT FK_PMSMEMBER_TO_PMSISSUE
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSMEMBER (
			mno
		);
	
CREATE SEQUENCE pmsissue_seq
START WITH 1
INCREMENT BY 1;
	
ALTER TABLE PMSREPLY
	DROP
		CONSTRAINT FK_PMSMEMBER_TO_PMSREPLY
		CASCADE;

ALTER TABLE PMSREPLY
	DROP
		CONSTRAINT FK_PMSISSUE_TO_PMSREPLY
		CASCADE;

ALTER TABLE PMSREPLY
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSREPLY;

/* 이슈댓글 */
DROP TABLE PMSREPLY 
	CASCADE CONSTRAINTS;

/* 이슈댓글 */
CREATE TABLE PMSREPLY (
	rno NUMBER NOT NULL, /* 댓글번호 */
	refno NUMBER NOT NULL, /* 원댓번호 */
	detail VARCHAR2(200) NOT NULL, /* 내용 */
	wdate DATE NOT NULL, /* 작성일 */
	mno NUMBER NOT NULL, /* 사원번호 */
	ino NUMBER NOT NULL /* 이슈번호 */
);

COMMENT ON TABLE PMSREPLY IS '이슈댓글';

COMMENT ON COLUMN PMSREPLY.rno IS '댓글번호';

COMMENT ON COLUMN PMSREPLY.refno IS '원댓번호';

COMMENT ON COLUMN PMSREPLY.detail IS '내용';

COMMENT ON COLUMN PMSREPLY.wdate IS '작성일';

COMMENT ON COLUMN PMSREPLY.mno IS '사원번호';

COMMENT ON COLUMN PMSREPLY.ino IS '이슈번호';

CREATE UNIQUE INDEX PK_PMSREPLY
	ON PMSREPLY (
		rno ASC
	);

ALTER TABLE PMSREPLY
	ADD
		CONSTRAINT PK_PMSREPLY
		PRIMARY KEY (
			rno
		);

ALTER TABLE PMSREPLY
	ADD
		CONSTRAINT FK_PMSMEMBER_TO_PMSREPLY
		FOREIGN KEY (
			mno
		)
		REFERENCES PMSMEMBER (
			mno
		);

ALTER TABLE PMSREPLY
	ADD
		CONSTRAINT FK_PMSISSUE_TO_PMSREPLY
		FOREIGN KEY (
			ino
		)
		REFERENCES PMSISSUE (
			ino
		);
	
CREATE SEQUENCE pmsreply_seq
START WITH 1
INCREMENT BY 1;
	
ALTER TABLE PMSBFILE
	DROP
		CONSTRAINT FK_PMSMEETING_TO_PMSBFILE
		CASCADE;

ALTER TABLE PMSBFILE
	DROP
		CONSTRAINT FK_PMSISSUE_TO_PMSBFILE
		CASCADE;

ALTER TABLE PMSBFILE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_PMSBFILE;

/* 게시판첨부파일 */
DROP TABLE PMSBFILE 
	CASCADE CONSTRAINTS;

/* 게시판첨부파일 */
CREATE TABLE PMSBFILE (
	bfno NUMBER NOT NULL, /* 파일번호 */
	mnno NUMBER, /* 회의록번호 */
	ino NUMBER, /* 이슈번호 */
	fname VARCHAR2(200) NOT NULL, /* 파일명 */
	upload DATE NOT NULL /* 업로드일 */
);

COMMENT ON TABLE PMSBFILE IS '게시판첨부파일';

COMMENT ON COLUMN PMSBFILE.bfno IS '파일번호';

COMMENT ON COLUMN PMSBFILE.mnno IS '회의록번호';

COMMENT ON COLUMN PMSBFILE.ino IS '이슈번호';

COMMENT ON COLUMN PMSBFILE.fname IS '파일명';

COMMENT ON COLUMN PMSBFILE.upload IS '업로드일';

CREATE UNIQUE INDEX PK_PMSBFILE
	ON PMSBFILE (
		bfno ASC
	);

ALTER TABLE PMSBFILE
	ADD
		CONSTRAINT PK_PMSBFILE
		PRIMARY KEY (
			bfno
		);

ALTER TABLE PMSBFILE
	ADD
		CONSTRAINT FK_PMSMEETING_TO_PMSBFILE
		FOREIGN KEY (
			mnno
		)
		REFERENCES PMSMEETING (
			mnno
		);

ALTER TABLE PMSBFILE
	ADD
		CONSTRAINT FK_PMSISSUE_TO_PMSBFILE
		FOREIGN KEY (
			ino
		)
		REFERENCES PMSISSUE (
			ino
		);
	
CREATE SEQUENCE pmsbfile_seq
START WITH 1
INCREMENT BY 1;
--코드성 데이터	
INSERT INTO pmscodes values(1,0,'사원권한');
INSERT INTO pmscodes values(2,1,'CEO');
INSERT INTO pmscodes values(3,1,'CTO');
INSERT INTO pmscodes values(4,1,'PM');
INSERT INTO pmscodes values(5,1,'팀원');
INSERT INTO pmscodes values(6,1,'ADMIN');
INSERT INTO pmscodes values(7,1,'인사관리자');
INSERT INTO pmscodes values(8,1,'퇴사자');
INSERT INTO pmscodes values(9,1,'구분없음');
INSERT INTO pmscodes values(10,0,'프로젝트결재');
INSERT INTO pmscodes values(11,10,'진행중');
INSERT INTO pmscodes values(12,10,'결재신청');
INSERT INTO pmscodes values(13,10,'반려');
INSERT INTO pmscodes values(14,10,'종료');
INSERT INTO pmscodes values(20,0,'업무결재');
INSERT INTO pmscodes values(21,20,'업무수행중');
INSERT INTO pmscodes values(22,20,'결재신청');
INSERT INTO pmscodes values(23,20,'반려');
INSERT INTO pmscodes values(24,20,'결재완료');
INSERT INTO pmscodes values(30,0,'회의록결재');
INSERT INTO pmscodes values(31,30,'작성중');
INSERT INTO pmscodes values(32,30,'결재신청');
INSERT INTO pmscodes values(33,30,'반려');
INSERT INTO pmscodes values(34,30,'결재완료');
--사원정보
insert into pmsemp values(pmsemp_seq.nextval,'문재인',null,'대표이사','010-8270-6064','Moon2017@gmail.com');
insert into pmsemp values(pmsemp_seq.nextval,'박근혜',null,'전무','010-6634-1032','Park2013@gmail.com');
insert into pmsemp values(pmsemp_seq.nextval,'이명박',null,'기술이사','010-0224-1025','MB2008@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'노무현',null,'상무','010-8586-8894','MH2003@daum.net');
insert into pmsemp values(pmsemp_seq.nextval,'김대중','개발1팀','부장','010-2175-9239','DJ1998@daum.net');
insert into pmsemp values(pmsemp_seq.nextval,'김영삼','개발2팀','부장','010-5762-1972','YS1993@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'노태우','개발3팀','부장','010-4127-6585','TW1988@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'전두환','개발3팀','차장','010-7714-8058','Tank1980@daum.net');
insert into pmsemp values(pmsemp_seq.nextval,'최규하','개발3팀','과장','010-6078-9450','Choi1979@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'박정희','개발3팀','대리','010-9665-6200','Yusin1963@gmail.com');
insert into pmsemp values(pmsemp_seq.nextval,'윤보선','개발2팀','차장','010-3255-8985','Yoon1960@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'이승만','개발2팀','과장','010-1619-1914','FirstLee@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'김문수','개발3팀','대리','010-5206-7975','Imoonsu@daum.net');
insert into pmsemp values(pmsemp_seq.nextval,'유승민','개발3팀','사원','010-3570-8717','seongmin@gmail.com');
insert into pmsemp values(pmsemp_seq.nextval,'추미애','개발1팀','차장','010-2415-2920','miae58@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'오세훈','개발1팀','과장','010-6002-7753','sehu61@daum.net');
insert into pmsemp values(pmsemp_seq.nextval,'안희정','개발1팀','대리','010-9589-3836','heejung65@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'나경원','개발2팀','대리','010-7954-1705','nabe28@gmail.com');
insert into pmsemp values(pmsemp_seq.nextval,'박영선','개발1팀','대리','010-1543-2532','pys60@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'고승덕','개발3팀','사원','010-9905-5718','Sorry79@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'이은재','개발2팀','대리','010-7082-0084','Stepdown@gmail.com');
insert into pmsemp values(pmsemp_seq.nextval,'정은경','개발1팀','사원','010-5446-3704','Corona44@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'홍준표','개발1팀','사원','010-9033-2939','RedJun54@daum.net');
insert into pmsemp values(pmsemp_seq.nextval,'김무성','개발1팀','사원','010-7397-9015','Moosung@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'이재명','개발2팀','사원','010-0987-9761','Gyeonggi11@gmail.com');
insert into pmsemp values(pmsemp_seq.nextval,'심상정','개발1팀','사원','010-4574-7345','Justice3@naver.com');
insert into pmsemp values(pmsemp_seq.nextval,'안철수','개발3팀','사원','010-2936-6952','VirusAnn@daum.net');
insert into pmsemp values(pmsemp_seq.nextval,'문희상','개발2팀','사원','010-2378-8963','Mhs45@gmail.com');
--사용자정보(중간에 추가되는건 프로젝트 정보)
INSERT INTO pmsmember values(10000001,'1234qwer!',2,'010-8270-6064',null);
INSERT INTO pmsmember values(10000003,'qwer1234!',3,'010-0224-1025',null);
INSERT INTO pmsmember values(10000005,'1q2w3e4r!',4,'010-2175-9239',null);
INSERT INTO pmsproject values(pmsproject_seq.nextval,to_date('2020-05-04','yyyy-mm-dd'),to_date('2020-06-08','yyyy-mm-dd'),'PMS시스템 개발','PMS 시스템을 개발하시오',NULL,11,10000005);
INSERT INTO pmsmember values(10000007,'q1w2e3r4!',8,'010-4127-6585',null);
INSERT INTO pmsmember values(10000008,'1q2w3e4r!',8,'010-7714-8058',null);
INSERT INTO pmsmember values(10000010,'1q2w3e4r!',8,'010-9665-6200',null);
INSERT INTO pmsmember values(10000013,'1q2w3e4r!',8,'010-5206-7975',null);
INSERT INTO pmsmember values(10000015,'1q2w3e4r!',5,'010-2415-2920',1001);
INSERT INTO pmsmember values(10000016,'1q2w3e4r!',5,'010-6002-7753',1001);
INSERT INTO pmsmember values(10000017,'1q2w3e4r!',5,'010-9589-3836',1001);
INSERT INTO pmsmember values(10000019,'1q2w3e4r!',5,'010-1543-2532',1001);
INSERT INTO pmsmember values(10000020,'1q2w3e4r!',8,'010-9905-5718',null);
INSERT INTO pmsmember values(10000021,'1q2w3e4r!',8,'010-7082-0084',null);
INSERT INTO pmsmember values(10000022,'1q2w3e4r!',5,'010-5446-3704',1001);
INSERT INTO pmsmember values(10000023,'1q2w3e4r!',5,'010-9033-2939',1001);
INSERT INTO pmsmember values(10000024,'1q2w3e4r!',5,'010-7397-9015',1001);
INSERT INTO pmsmember values(10000025,'1q2w3e4r!',8,'010-0987-9761',null);
INSERT INTO pmsmember values(10000026,'1q2w3e4r!',8,'010-4574-7345',null);
INSERT INTO pmsmember values(10000027,'1q2w3e4r!',8,'010-2936-6952',null);
INSERT INTO pmsmember values(10000028,'1q2w3e4r!',8,'010-2378-8963',null);
UPDATE pmsmember SET pno=1001 WHERE mno=10000005;
--로그인히스토리 정보
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085032','yyyymmddhh24miss'),to_date('20200503202032','yyyymmddhh24miss'),10000001);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085132','yyyymmddhh24miss'),to_date('20200503202232','yyyymmddhh24miss'),10000003);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085232','yyyymmddhh24miss'),to_date('20200503202332','yyyymmddhh24miss'),10000005);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085332','yyyymmddhh24miss'),to_date('20200503202532','yyyymmddhh24miss'),10000015);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085432','yyyymmddhh24miss'),to_date('20200503202632','yyyymmddhh24miss'),10000016);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085532','yyyymmddhh24miss'),to_date('20200503202032','yyyymmddhh24miss'),10000017);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085632','yyyymmddhh24miss'),to_date('20200503202132','yyyymmddhh24miss'),10000019);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085732','yyyymmddhh24miss'),to_date('20200503202432','yyyymmddhh24miss'),10000022);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085832','yyyymmddhh24miss'),to_date('20200503202632','yyyymmddhh24miss'),10000023);
INSERT INTO pmslog values(pmslog_seq.nextval,0,to_date('20200503085932','yyyymmddhh24miss'),to_date('20200503202732','yyyymmddhh24miss'),10000024);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085232','yyyymmddhh24miss'),null,10000005);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085332','yyyymmddhh24miss'),null,10000015);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085432','yyyymmddhh24miss'),null,10000016);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085532','yyyymmddhh24miss'),null,10000017);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085632','yyyymmddhh24miss'),null,10000019);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085732','yyyymmddhh24miss'),null,10000022);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085832','yyyymmddhh24miss'),null,10000023);
INSERT INTO pmslog values(pmslog_seq.nextval,1,to_date('20200504085932','yyyymmddhh24miss'),null,10000024);
--공지사항 정보
insert into pmsnotice values(pmsnotice_seq.nextval,'프로젝트 주제 선정에 대한 회의 일정 공지','5월 4일 오후 1시 30분, 507호 강의실에서 주제 선정에 관한 회의를 개최할 예정입니다. ',to_date('2020-05-01','yyyy-mm-dd'),null,20,1001,10000003);
insert into pmsnotice values(pmsnotice_seq.nextval,'프로젝트 역할 분담에 대한 회의 일정 공지','5월 4일 오후 5시 30분, 507호 강의실에서 프로젝트 역할 분담에 대한 회의를 개최합니다.',to_date('2020-05-04','yyyy-mm-dd'),null,17,1001,10000005);
insert into pmsnotice values(pmsnotice_seq.nextval,'프로젝트에 활용할 bootstrap template 투표','카카오톡 단체채팅방에 올라온 템플릿 후보 중 하나를 선택해 주세요. ',to_date('2020-05-04','yyyy-mm-dd'),null,20,1001,10000005);
insert into pmsnotice values(pmsnotice_seq.nextval,'회의 공지','5월 6일 오후 1시 30분, 507호 강의실에서 ERD설계에 관한 회의가 있을 예정입니다. 회의 전까지 각자 맡은 파트에 대한 요구사항 정의서를 구글 스프레드 시트에 작성해주세요.',to_date('2020-05-04','yyyy-mm-dd'),null,25,1001,10000005);
insert into pmsnotice values(pmsnotice_seq.nextval,'5월5일 휴일 과제 공지','Git에 업로드된 PPT템플릿을 다운받아 화면설계서를 작성하시고, 각자 자기 폴더에 업로드 해주세요. ',to_date('2020-05-04','yyyy-mm-dd'),null,20,1001,10000005);
insert into pmsnotice values(pmsnotice_seq.nextval,'1주차 발표에 대한 피드백 회의 공지','5월 8일 오후 3시, 507호 강의실에서 1주차 발표에 대한 피드백이 있겠습니다.',to_date('2020-05-07','yyyy-mm-dd'),null,10,1001,10000005);
insert into pmsnotice values(pmsnotice_seq.nextval,'주말 과제 공지','피드백을 반영하여 PPT 파트 수정 후 GIT에 업로드하기. PMS에 대해 공부해오기(면접 대비)',to_date('2020-05-08','yyyy-mm-dd'),null,15,1001,10000005);
insert into pmsnotice values(pmsnotice_seq.nextval,'회의 공지','5월 11일 오후 1시 30분, 507호 강의실에서 ERD 설계에 대한 회의가 있을 예정입니다.',to_date('2020-05-11','yyyy-mm-dd'),null,10,1001,10000005);
-- 회의록 입력
insert into pmsmeeting values(pmsmeeting_seq.nextval,'프로젝트 주제 선정','pms와 다른 주제들 중 이번 프로젝트로 진행할 주제 선정','나이키 등 의류 쇼핑몰&지점관리 시스템',null,15,to_date('2020-05-04','yyyy-mm-dd'),null,to_date('2020-05-04','yyyy-mm-dd'),'507호','김대중,추미애,오세훈,안희정,박영선,정은경,홍준표,김무성',34,10000005,1001);
insert into pmsmeeting values(pmsmeeting_seq.nextval,'프로젝트 역할 분담','프로젝트에서 각자 담당할 part 역할 분담 및 백업/협업 계획 수립','역할 분담 완료',null,20,to_date('2020-05-04','yyyy-mm-dd'),null,to_date('2020-05-04','yyyy-mm-dd'),'507호','김대중,추미애,오세훈,안희정,박영선,정은경,홍준표,김무성',34,10000015,1001);
insert into pmsmeeting values(pmsmeeting_seq.nextval,'bootstrap template 결정','프로젝트에 활용할 bootstrap template 비교/논의 및 결정','선정완료',null,15,to_date('2020-05-05','yyyy-mm-dd'),null,to_date('2020-05-04','yyyy-mm-dd'),'507호','김대중,추미애,오세훈,안희정,박영선,정은경,홍준표',34,10000017,1001);
insert into pmsmeeting values(pmsmeeting_seq.nextval,'ERD 설계','요구사항정의서와 화면 설계를 바탕으로 ERD 설계','러프한 ERD 개요 설계',null,20,to_date('2020-05-06','yyyy-mm-dd'),null,to_date('2020-05-06','yyyy-mm-dd'),'507호','김대중,추미애,안희정,박영선,정은경,김무성',32,10000016,1001);
insert into pmsmeeting values(pmsmeeting_seq.nextval,'1주차 발표 피드백 개선방안논의','발표에 대한 피드백 확인 및 자체 회의를 통한 프로젝트 개선방향 및 추가로 프로젝트에 필요한 기능 논의','주말을 활용하여 결정된 사안에 대해 각자 업무 처리 후 월요일에 다시 논의',null,17,to_date('2020-05-09','yyyy-mm-dd'),null,to_date('2020-05-08','yyyy-mm-dd'),'507호','김대중,추미애,오세훈,안희정',32,10000015,1001);
insert into pmsmeeting values(pmsmeeting_seq.nextval,'ERD 설계','테이블간 식별/비식별 관계 및 세부 컬럼 논의','DB 생성 후 추후 수정',null,7,to_date('2020-05-12','yyyy-mm-dd'),null,to_date('2020-05-11','yyyy-mm-dd'),'507호','김대중,추미애,박영선,정은경',31,10000017,1001);
-- 이슈리스트
insert into PMSISSUE values(pmsissue_seq.nextval,'ERD설계','ERD설계에 있어 게시판 통합의 문제 사용자 번호와 사원 번호 중복의 문제 테이블간 연결시 식별/비식별 구분 문제 등',0,null,to_date('2020-05-04','YYYY-MM-DD'),null,null,1001,10000005);		
insert into PMSISSUE values(pmsissue_seq.nextval,'파일작업','파일 작업 순서를 모르겠습니다.',0,null,to_date('2020-05-06','YYYY-MM-DD'),null,null,1001,10000015);		
insert into PMSISSUE values(pmsissue_seq.nextval,'controller','오늘 배운 controller 어렵습니다.',0,null,to_date('2020-05-06','YYYY-MM-DD'),null,null,1001,10000016);		
insert into PMSISSUE values(pmsissue_seq.nextval,'controller','하나의 controller 안에서 request 내용이 계속 유지됨 다른 페이지에서 불러오기 싫은 parameter값이 불러와짐',0,null,to_date('2020-05-07','YYYY-MM-DD'),null,null,1001,10000017);		
insert into PMSISSUE values(pmsissue_seq.nextval,'code table','code table을 하나로 작성하는 방법을 적용하는 문제',0,null,to_date('2020-05-07','YYYY-MM-DD'),null,null,1001,10000019);		
insert into PMSISSUE values(pmsissue_seq.nextval,'controller','controller거친 이후 img 가 화면출력 안됨',0,null,to_date('2020-05-07','YYYY-MM-DD'),null,null,1001,10000022);		
insert into PMSISSUE values(pmsissue_seq.nextval,'jquery','main에서 slider jquery 안돌아가는 경우 발생',0,null,to_date('2020-05-08','YYYY-MM-DD'),null,null,1001,10000023);		
insert into PMSISSUE values(pmsissue_seq.nextval,'servlet에서 페이지 이동 안됨','href를 사용하여 페이지 이동 중에 controller단으로 넘어가면 다른 페이지로 이동 안됨',0,null,to_date('2020-05-08','YYYY-MM-DD'),null,null,1001,10000024);		
insert into PMSISSUE values(pmsissue_seq.nextval,'div(분류)에 맞는 공연 검색이 안됨','main페이지에서 controller로 보낼때 div를 보내야 하는데 ?key=value 로도 안보내지고 session으로 주고받기도 안됨',0,null,to_date('2020-05-08','YYYY-MM-DD'),null,null,1001,10000024);		
insert into PMSISSUE values(pmsissue_seq.nextval,'페이지 이동문제','한번 controller로 넘어간 이후 div parameter가 고정되어 변경된 값을 입력해도 적용이 안됨',0,null,to_date('2020-05-09','YYYY-MM-DD'),null,null,1001,10000023);		
insert into PMSISSUE values(pmsissue_seq.nextval,'데이터베이스 연결','데이터베이스 연결이 끊김',0,null,to_date('2020-05-16','YYYY-MM-DD'),null,null,1001,10000022);		
insert into PMSISSUE values(pmsissue_seq.nextval,'파일 통합','화면 구현 내용 통합시 파일 경로문제 및 겹치는 파일로인하여 team update 후 동작이 안되는 문제 발생',0,null,to_date('2020-05-16','YYYY-MM-DD'),null,null,1001,10000019);		
insert into PMSISSUE values(pmsissue_seq.nextval,'이미지 경로','화면구현 통합(연결) 이미지 경로 설정',0,null,to_date('2020-05-22','YYYY-MM-DD'),null,null,1001,10000017);		
insert into PMSISSUE values(pmsissue_seq.nextval,'update','결재상세 페이지 update과정에서 VO를 통해서 int 값을 받는 중 오버로딩 과정에서 변수의 수가 같아 int값을넘기지 못하는 문제 발생',0,null,to_date('2020-05-22','YYYY-MM-DD'),null,null,1001,10000016);		
insert into PMSISSUE values(pmsissue_seq.nextval,'insert','결제 정보를 insert한 뒤 포인트 적립이나 차감을 할 때 방금 결제된 결제번호가 필요한데 결제번호를 못 넘기는 문제',0,null,to_date('2020-05-24','YYYY-MM-DD'),null,null,1001,10000015);		
insert into PMSISSUE values(pmsissue_seq.nextval,'로그인 문제','문의하기 새글작성 클릭시 로그인이 되어있는 상태에서도 로그인하라는 alert창 뜨는 문제',0,null,to_date('2020-05-24','YYYY-MM-DD'),null,null,1001,10000024);		
insert into PMSISSUE values(pmsissue_seq.nextval,'쿠폰 테이블','전체 회원에 쿠폰을 증정할 때 새로운 쿠폰을 등록하고 부여할 경우 coupon 테이블에 check constraint 때문에 문제발생',0,null,to_date('2020-05-29','YYYY-MM-DD'),null,null,1001,10000022);		
insert into PMSISSUE values(pmsissue_seq.nextval,'결제화면','결제 화면에서 쿠폰 사용 시 총 결제금액 산출의 업데이트 문제 팝업창과 부모창 간의 실시간 업데이트시 부모창 업데이트 후 자식창 업데이트 하면 변경값 반영이 안됨',0,null,to_date('2020-05-29','YYYY-MM-DD'),null,null,1001,10000023);		
-- 이슈리스트 댓글
insert into PMSREPLY values(pmsreply_seq.nextval,0,'쿠폰 코드의번호를 획득 한뒤 새로운 쿠폰을 등록해야 할거 같습니다.',sysdate,10000023,17);
insert into PMSREPLY values(pmsreply_seq.nextval,1,'그뒤 제약조건을 삭제하고 다시 생성한 뒤 일반회원 리스트 작성해야 할것 같습니다.',sysdate,10000023,17);
insert into PMSREPLY values(pmsreply_seq.nextval,2,'정말 감사합니다',sysdate,10000022,17);
insert into PMSREPLY values(pmsreply_seq.nextval,0,'쿠폰부여의 DAO 메서드를 각각 작성하여 Service에서 일괄처리해보세요',sysdate,10000024,17);
insert into PMSREPLY values(pmsreply_seq.nextval,0,'해결되었습니다. 도와주셔서 감사합니다.',sysdate,10000022,17);

SELECT * FROM pmsmember;
SELECT a.eno, a.name, a.GRADE, a.DEPT, a.EMAIL, a.PHONE
	FROM pmsemp a 
	WHERE NOT a.grade LIKE '%'||'대표이사'||'%';
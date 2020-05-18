/*
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '사원등록 시스템 개발',' - 개인 정보 입력(사원번호/이름/비밀번호/희망연락처)할 수 있는 UI 구현','2020-05-20','2020-05-27',
0,'','',21,10000008);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '로그인/로그아웃 시스템 개발',' - DB에 등록되어 있는 사원번호/비밀번호 입력 -> 로그인 성공 / 실패 &#10; - 로그아웃 기능 구현','2020-05-20','2020-05-27',
0,'','',21,10000008);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '개인정보 조회 / 수정 시스템 개발',' - 내 프로젝트 팀원 확인 &#10; - 개인정보 -> 입력 정보 확인 및 수정 UI 구현','2020-05-20','2020-05-27',
0,'','',21,10000008);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '프로젝트 총괄 시스템 개발',' - 직원리스트 UI 구현 &#10; - CEO - CTO 설정 및 변경 &#10; - 프로젝트 팀장 설정 및 변경 &#10; - 프로젝트 추가 &#10; - 전체 프로젝트 진행률 대쉬보드','2020-05-20','2020-05-27',
0,'','',21,10000008);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '프로젝트 상세',' - 프로젝트 간트차트 &#10; - 공지사항 게시판 리스트 &#10; - 공지사항 작성 페이지 &#10; - 공지사항 상세페이지 (수정 / 삭제 기능) &#10; - 회의록 게시판 리스트 / 상세화면 &#10; - risk management 이슈리스트 / 상세 (댓글 기능)','2020-05-20','2020-05-27',
0,'','',21,10000008);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '프로젝트 관리 시스템 개발',' - 사원리스트 &#10; - 팀장권한 프로젝트 팀원 설정 및 변경 &#10; - 대시보드형태 - 프로젝트 진행률 (개인별) &#10; - 프로젝트 간트차트(해당 프로젝트 전체) 페이지 &#10; - 업무 리스트 &#10; - 업무 리스트 추가 / 새 업무 추가(시작일/종료일/담당자 지정) &#10; - 업무 리스트 상세 / 코멘트(반려시), 결재 / 반려처리','2020-05-20','2020-05-27',
0,'','',21,10000008);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '게시판 시스템 개발',' - 공지사항 게시판 리스트 (공지사항 추가기능) &#10; - 공지사항 작성 페이지 / 상세페이지 (수정/삭제기능)&#10; - 회의록 게시판 리스트(회의록 추가기능) / 상세(수정/파일 업로드) &#10; - 회의록 작성 페이지 (파일 업로드) &#10;','2020-05-20','2020-05-27',
0,'','',21,10000008);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1, '프로젝트 수행',' - 해당 프로젝트 전체 진행률 / 일정 &#10; - 프로젝트 간트차트 페이지&#10; - 업무 리스트 ( 로그인 정보에 해당하는 업무 )  &#10; - 업무 리스트 상세 (진행률 갱신 / 결재 신청) &#10;','2020-05-20','2020-05-27',
0,'','',21,10000008);
*/



INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '화면설계', '화면을 설계',null, '2020/05/04', '2020/05/08',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '데이터베이스', 'DB설계 및 생성',null, '2020/05/04','2020/05/14',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '화면구현', '설계된 웹/앱 화면 구현',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 0, '테스트', '테스트를 함',null, '2020/06/01','2020/06/08',0,NULL,NULL,21,10000005);

INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1002, '데이터베이스 설계', 'DB 설계',null, '2020/05/04','2020/05/09',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1002, '데이터베이스 생성', 'DB 생성',null, '2020/05/09','2020/05/14',0,NULL,NULL,21,10000005);
-- 1007~1013
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1003, '사원정보', '사원정보 시스템 개발 ',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1003, '프로젝트 총괄관리', '총괄관리 시스템 개발',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1003, '프로젝트 통합관리', '통합관리 시스템 개발',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1003, '프로젝트 일정관리', '일정관리 시스템 개발',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1003, '프로젝트 자원관리', '자원관리 시스템 개발',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1003, '프로젝트 의사소통관리', '의사소통관리 시스템 개발',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
INSERT INTO PMSTASK VALUES (pmstask_seq.nextval, 1001, 1003, '프로젝트 리스크관리', '리스크관리 시스템 개발',null, '2020/05/08','2020/06/01',0,NULL,NULL,21,10000005);
/*
10000005 PM

10000015 10000016 10000017 10000019 10000022 10000023 10000024 팀원
 진수님           형준님           현규님         조장님           나             하나님         준석님
 */
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1007, '로그인/로그아웃(웹)','- 로그인(50%) : 사원번호/비밀번호 입력 후 DB와 일치하면 로그인 &#10;- 로그아웃(50%) : 메인화면 이동 및 로그인 세션 정보 삭제',null,'2020/05/08','2020/05/12', 0,NULL,NULL,21,10000015);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1007, '번호 찾기(웹)','- 이름/이메일 -> 일치하는 사원번호 출력 &#10;- 사원번호/이름/이메일(인증번호) -> 비밀번호 재설정(변경)',null,'2020/05/12','2020/05/16', 0,NULL,NULL,21,10000015);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1007, '개인정보(웹)','- 내 프로젝트 팀원 확인 &#10;- 개인정보 -> 입력 정보 확인 및 수정',null,'2020/05/16','2020/05/20', 0,NULL,NULL,21,10000015);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1007, '로그인/로그아웃(앱)','- 사원번호/비밀번호 입력 -> 로그인 &#10;- 로그아웃 -> 메인화면 이동 / 로그인 세션 정보 삭제',null,'2020/05/20','2020/05/24', 0,NULL,NULL,21,10000015);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1007, '번호 찾기(앱)','- 이름/이메일 -> 일치하는 사원번호 출력 &#10;- 사원번호/이름/이메일(인증번호) -> 비밀번호 재설정(변경)',null,'2020/05/24','2020/05/28', 0,NULL,NULL,21,10000015);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1007, '개인정보(앱)','- 내 프로젝트 팀원 확인 &#10;- 개인정보 -> 입력 정보 확인 및 수정',null,'2020/05/28','2020/06/01', 0,NULL,NULL,21,10000015);

INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1008, 'CTO 선정(웹)','- CEO - 직원리스트 - CTO 설정 및 변경',null,'2020-05-08','2020-05-15', 0,NULL,NULL,21,10000016);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1008, '프로젝트 추가(웹)','- 프로젝트 추가(팀원이 아닌 사원중 한명 팀장 지정)',null,'2020-05-08','2020-05-14', 0,NULL,NULL,21,10000017);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1008, '프로젝트 결재 / 반려(웹)','- PM 대시보드 - 프로젝트 완수 결재신청 (50%)&#10;- CEO / CTO 대시보드 - 프로젝트 완료 결재 / 반려 (50%)',null,'2020-05-24','2020-06-01', 0,NULL,NULL,21,10000019);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1008, '프로젝트 총괄(웹)','- CEO / CTO 대시보드 - 전체 프로젝트 진행률 등',null,'2020-05-08','2020-05-13', 0,NULL,NULL,21,10000019);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1008, 'CTO 선정(앱)','- CEO - 직원리스트 - CTO 설정 및 변경',null,'2020-05-08','2020-05-15', 0,NULL,NULL,21,10000016);


INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1009, '대시보드(웹)','- PM 대시보드 - 프로젝트 진행률(개인별) 등 (50%)&#10;- 팀원 대시보드 -해당 프로젝트 전체 진행률 / 일정 등 (50%)',null,'2020-05-14','2020-05-23', 0,NULL,NULL,21,10000019);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1009, 'PM 선정(웹)','- CEO / CTO - 직원리스트(50%)&#10;- CEO / CTO - 직원리스트 - 프로젝트 팀장 설정 및 변경 (50%)',null,'2020-05-15','2020-05-23', 0,NULL,NULL,21,10000016);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1009, '업무관리 / PM (웹)','- PM - 업무 리스트(30%)&#10;- PM - 업무 리스트 - 새 업무 추가 (시작일/종료일/담당자 지정 등) (30%)&#10;- PM - 업무 리스트 상세 - 반려사유, 결재/반려 처리(결재 신청된 사항만), 삭제 (40%)',null,'2020-05-08','2020-05-23', 0,NULL,NULL,21,10000022);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1009, '업무관리 / 팀원 (웹)','- 팀원 - 업무 리스트(내업무)(50%)&#10;- 팀원 - 업무 리스트 상세 - 진행률 갱신 / 결재 신청 (50%)&#10;',null,'2020-05-23','2020-06-01', 0,NULL,NULL,21,10000022);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1009, 'PM 선정(앱)','- CEO / CTO - 직원리스트(50%)&#10;- CEO / CTO - 직원리스트 - 프로젝트 팀장 설정 및 변경 (50%)',null,'2020-05-15','2020-05-23', 0,NULL,NULL,21,10000016);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1009, '업무관리 / PM(앱)','- PM - 업무 리스트(30%)&#10;- PM - 업무 리스트 - 새 업무 추가 (시작일/종료일/담당자 지정 등) (30%)&#10;- PM - 업무 리스트 상세 - 반려사유, 결재/반려 처리(결재 신청된 사항만), 삭제 (40%)',null,'2020-05-08','2020-05-23', 0,NULL,NULL,21,10000022);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1009, '업무관리 / 팀원(앱)','- 팀원 - 업무 리스트(내업무)(50%)&#10;- 팀원 - 업무 리스트 상세 - 진행률 갱신 / 결재 신청 (50%)&#10;',null,'2020-05-23','2020-06-01', 0,NULL,NULL,21,10000022);


INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1010, '일정관리 CEO / CTO (웹)','- CEO / CTO - 프로젝트 간트챠트',null,'2020-05-15','2020-05-22', 0,NULL,NULL,21,10000017);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1010, '일정관리 PM / 팀원 (웹) ','- PM - 프로젝트 간트챠트  (50%)&#10;- 팀원 - 프로젝트 간트챠트 (50%)',null,'2020-05-22','2020-06-01', 0,NULL,NULL,21,10000017);


INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1011, '인적자원관리 (웹) ','- 사원리스트  (50%)&#10;- 팀장권한 프로젝트 팀원 설정 및 변경 (50%)',null,'2020-05-24','2020-06-01', 0,NULL,NULL,21,10000016);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1011, '인적자원관리 (앱) ','- 사원리스트  (50%)&#10;- 팀장권한 프로젝트 팀원 설정 및 변경 (50%)',null,'2020-05-24','2020-06-01', 0,NULL,NULL,21,10000016);


INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1012, '공지사항 / 회의록 게시판 리스트 (웹)','- CEO / CTO / PM / 팀원 - 공지사항 게시판 리스트  (50%)&#10;- CEO / CTO / PM / 팀원 - 회의록 게시판 리스트 (50%)',null,'2020-05-08','2020-05-14', 0,NULL,NULL,21,10000023);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1012, '공지사항 / 회의록 작성(웹)','- CEO / CTO / PM - 공지사항 작성 페이지  (50%)&#10;- PM / 팀원 - 회의록 작성 페이지 (파일 업로드 가능) (50%)',null,'2020-05-14','2020-05-20', 0,NULL,NULL,21,10000023);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1012, '공지사항 / 회의록 상세 (PM/팀원) (웹)','- 팀원 - 공지사항 상세페이지 (조회만 가능)  (50%)&#10;- PM / 팀원 - 회의록 게시판 상세 (수정/파일 업로드 가능) (50%)',null,'2020-05-20','2020-05-26', 0,NULL,NULL,21,10000023);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1012, '공지사항 / 회의록 상세 (CEO/CTO/PM) (웹)','- CEO / CTO / PM - 공지사항 상세페이지 (수정/삭제 가능) (50%)&#10;- CEO / CTO - 회의록 게시판 상세 (조회만 가능) (50%)',null,'2020-05-26','2020-06-01', 0,NULL,NULL,21,10000023);


INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1013, '이슈리스트 / 추가 (웹)','- CEO / CTO / PM / 팀원 - 리스크관리 - 이슈리스트 리스트  (50%)&#10;- PM /팀원 - 리스크관리 - 이슈리스트 추가 (50%)',null,'2020-05-08','2020-05-19', 0,NULL,NULL,21,10000023);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1013, '이슈 상세화면 (웹)','- CEO / CTO / PM / 팀원 - 리스크관리 - 이슈리스트 상세 (댓글 가능) (50%)&#10;- PM - 리스크관리 - 이슈리스트 상세 (해결방안/댓글 가능) (50%)',null,'2020-05-20','2020-06-01', 0,NULL,NULL,21,10000023);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1013, '이슈리스트 / 추가 (앱)','- CEO / CTO / PM / 팀원 - 리스크관리 - 이슈리스트 리스트  (50%)&#10;- PM /팀원 - 리스크관리 - 이슈리스트 추가 (50%)',null,'2020-05-08','2020-05-19', 0,NULL,NULL,21,10000023);
INSERT INTO PMSTASK values(pmstask_seq.nextval, 1001, 1013, '이슈 상세화면 (앱)','- CEO / CTO / PM / 팀원 - 리스크관리 - 이슈리스트 상세 (댓글 가능) (50%)&#10;- PM - 리스크관리 - 이슈리스트 상세 (해결방안/댓글 가능) (50%)',null,'2020-05-20','2020-06-01', 0,NULL,NULL,21,10000023);
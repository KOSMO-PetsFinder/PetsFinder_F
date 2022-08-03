
/* Drop Triggers */

DROP TRIGGER TRI_abandonedAnimal_abani_idx;
DROP TRIGGER TRI_ADOPTION_APPLICATION_ADPAPL_idx;
DROP TRIGGER TRI_ADOPTION_BOARD_adoptboard_idx;
DROP TRIGGER TRI_ADOPTION_Comment_adoptcomm_idx;
DROP TRIGGER TRI_ADOPTION_like_adoptlike_idx;
DROP TRIGGER TRI_ADOPTION_list_ADOPlist_idx;
DROP TRIGGER TRI_ADOPTION_REVIEW_BOARD_adoptboard_idx;
DROP TRIGGER TRI_APPROVAL_APR_idx;
DROP TRIGGER TRI_faq_board_faq_idx;
DROP TRIGGER TRI_member_member_idx;
DROP TRIGGER TRI_NOTICE_BOARD_notboard_idx;
DROP TRIGGER TRI_pet_pet_idx;
DROP TRIGGER TRI_qna_board_qna_idx;
DROP TRIGGER TRI_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx;
DROP TRIGGER TRI_sitrev_Comment_sitrevcomm_idx;
DROP TRIGGER TRI_SITTER_APPLICATION_ADPAPL_idx;
DROP TRIGGER TRI_SITTER_APPLICATION_SITAPL_idx;
DROP TRIGGER TRI_sitter_like_adoptlike_idx;
DROP TRIGGER TRI_sitter_like_sitrevlike_idx;
DROP TRIGGER TRI_sitter_photo_sitphoto_idx;
DROP TRIGGER TRI_sitter_review_sitreview_idx;
DROP TRIGGER TRI_sitter_sit_idx;
DROP TRIGGER TRI_sit_book_sbook_idx;
DROP TRIGGER TRI_TYPE_SERVICE_typSrv_idx;
DROP TRIGGER TRI_TYPE_Tag_typTag_idx;



/* Drop Tables */

DROP TABLE ADOPTION_APPLICATION CASCADE CONSTRAINTS;
DROP TABLE ADOPTION_list CASCADE CONSTRAINTS;
DROP TABLE abandonedAnimal CASCADE CONSTRAINTS;
DROP TABLE ADOPTION_Comment CASCADE CONSTRAINTS;
DROP TABLE ADOPTION_like CASCADE CONSTRAINTS;
DROP TABLE ADOPTION_BOARD CASCADE CONSTRAINTS;
DROP TABLE APPROVAL CASCADE CONSTRAINTS;
DROP TABLE AVAILABLE_SERVICES CASCADE CONSTRAINTS;
DROP TABLE faq_board CASCADE CONSTRAINTS;
DROP TABLE pet CASCADE CONSTRAINTS;
DROP TABLE qna_board CASCADE CONSTRAINTS;
DROP TABLE REPORT_ABANDONED_ANIMALS CASCADE CONSTRAINTS;
DROP TABLE sitrev_Comment CASCADE CONSTRAINTS;
DROP TABLE sitter_photo CASCADE CONSTRAINTS;
DROP TABLE sitter_like CASCADE CONSTRAINTS;
DROP TABLE sitter_review CASCADE CONSTRAINTS;
DROP TABLE sitter_tag CASCADE CONSTRAINTS;
DROP TABLE sit_book CASCADE CONSTRAINTS;
DROP TABLE sitter CASCADE CONSTRAINTS;
DROP TABLE RESIDENCE_TYPE CASCADE CONSTRAINTS;
DROP TABLE SITTER_APPLICATION CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE NEW_TABLE CASCADE CONSTRAINTS;
DROP TABLE NEW_TABLE CASCADE CONSTRAINTS;
DROP TABLE NOTICE_BOARD CASCADE CONSTRAINTS;
DROP TABLE TYPE_SERVICE CASCADE CONSTRAINTS;
DROP TABLE TYPE_Tag CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_abandonedAnimal_abani_idx;
DROP SEQUENCE SEQ_ADOPTION_APPLICATION_ADPAPL_idx;
DROP SEQUENCE SEQ_ADOPTION_BOARD_adoptboard_idx;
DROP SEQUENCE SEQ_ADOPTION_Comment_adoptcomm_idx;
DROP SEQUENCE SEQ_ADOPTION_like_adoptlike_idx;
DROP SEQUENCE SEQ_ADOPTION_list_ADOPlist_idx;
DROP SEQUENCE SEQ_ADOPTION_REVIEW_BOARD_adoptboard_idx;
DROP SEQUENCE SEQ_APPROVAL_APR_idx;
DROP SEQUENCE SEQ_faq_board_faq_idx;
DROP SEQUENCE SEQ_member_member_idx;
DROP SEQUENCE SEQ_NOTICE_BOARD_notboard_idx;
DROP SEQUENCE SEQ_pet_pet_idx;
DROP SEQUENCE SEQ_qna_board_qna_idx;
DROP SEQUENCE SEQ_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx;
DROP SEQUENCE SEQ_sitrev_Comment_sitrevcomm_idx;
DROP SEQUENCE SEQ_SITTER_APPLICATION_ADPAPL_idx;
DROP SEQUENCE SEQ_SITTER_APPLICATION_SITAPL_idx;
DROP SEQUENCE SEQ_sitter_like_adoptlike_idx;
DROP SEQUENCE SEQ_sitter_like_sitrevlike_idx;
DROP SEQUENCE SEQ_sitter_photo_sitphoto_idx;
DROP SEQUENCE SEQ_sitter_review_sitreview_idx;
DROP SEQUENCE SEQ_sitter_sit_idx;
DROP SEQUENCE SEQ_sit_book_sbook_idx;
DROP SEQUENCE SEQ_TYPE_SERVICE_typSrv_idx;
DROP SEQUENCE SEQ_TYPE_Tag_typTag_idx;




/* Create Sequences */

CREATE SEQUENCE SEQ_abandonedAnimal_abani_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ADOPTION_APPLICATION_ADPAPL_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ADOPTION_BOARD_adoptboard_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ADOPTION_Comment_adoptcomm_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ADOPTION_like_adoptlike_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ADOPTION_list_ADOPlist_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ADOPTION_REVIEW_BOARD_adoptboard_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_APPROVAL_APR_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_faq_board_faq_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member_member_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NOTICE_BOARD_notboard_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_pet_pet_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qna_board_qna_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sitrev_Comment_sitrevcomm_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SITTER_APPLICATION_ADPAPL_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SITTER_APPLICATION_SITAPL_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sitter_like_adoptlike_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sitter_like_sitrevlike_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sitter_photo_sitphoto_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sitter_review_sitreview_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sitter_sit_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sit_book_sbook_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TYPE_SERVICE_typSrv_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TYPE_Tag_typTag_idx INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- 유기동물 테이블
CREATE TABLE abandonedAnimal
(
	-- 유기동물 일련번호
	abani_idx number NOT NULL,
	-- 유기동물 품종
	abani_kind varchar2(30) NOT NULL,
	-- 유기동물 성별(F,M)
	abani_gender char(1) NOT NULL,
	-- 유기동물 발생장소
	abani_loc varchar2(30) NOT NULL,
	-- 유기동물 접수일
	abani_regdate date NOT NULL,
	-- 유기동물 중성화여부(1,0)
	abani_neut char(1) NOT NULL,
	-- 유기동물 상태 입양/보호(adopt,prtct)
	abani_stat char(5) NOT NULL,
	-- 유기동물 사진
	abani_photo varchar2(100) NOT NULL,
	PRIMARY KEY (abani_idx)
);


-- 입양신청 폼 테이블
CREATE TABLE ADOPTION_APPLICATION
(
	-- 입양신청 일련번호
	ADPAPL_idx number NOT NULL,
	-- 신청자 이름
	SITAPL_name varchar2(30) NOT NULL,
	-- 신청자 성별(F,M)
	SITAPL_gender char(1) NOT NULL,
	-- 지원자 생년월일
	SITAPL_birth date NOT NULL,
	-- 지원자 전화번호
	SITAPL_tel varchar2(30) NOT NULL,
	-- 지원자 주소
	SITAPL_addr varchar2(30) NOT NULL,
	-- 신청자 가족 흡연 여부(0,1)
	SITAPL_smkStt char(1) NOT NULL,
	-- 신청자 반려동물 키운 기간
	SITAPL_havepet varchar2(30) NOT NULL,
	-- 지원자  직업
	ADPAPL_job varchar2(30) NOT NULL,
	-- 방묘창 여부(0,1)
	ADPAPL_catblo char(1) NOT NULL,
	-- 지원자의 반려동울 키운 경험 여부 (0,1)
	ADPAPL_exp char(1) NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 입양할 유기동물 일련번호
	abani_idx number NOT NULL,
	PRIMARY KEY (ADPAPL_idx)
);


-- 입양후기게시판
CREATE TABLE ADOPTION_BOARD
(
	-- 입양게시판 일련번호
	adoptboard_idx number NOT NULL,
	-- 입양게시판 제목
	adoptboard_title varchar2(100) NOT NULL,
	-- 입양게시판 내용
	adoptboard_content varchar2(2000) NOT NULL,
	-- 입양게시판 사진
	adoptboard_photo varchar2(200),
	-- 입양게시판 등록일
	adoptboard_regdate date NOT NULL,
	-- 입양게시판 조회수
	adoptboard_hit number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (adoptboard_idx)
);


-- 입양게시판댓글 테이블
CREATE TABLE ADOPTION_Comment
(
	-- 시터후기 댓글 일련번호
	sitrevcomm_idx number NOT NULL,
	-- 댓글 내용
	sitrevcomm_content varchar2(1000) NOT NULL,
	-- 댓글 등록일
	sitrevcomm_regdate date NOT NULL,
	-- 입양게시판 일련번호
	adoptboard_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (sitrevcomm_idx)
);


-- 입양 좋아요 테이블
CREATE TABLE ADOPTION_like
(
	-- 시터후기 좋아요 일련번호
	sitrevlike_idx number NOT NULL,
	-- 좋아요 상태 (0,1)
	sitrevlike_stt char(1) NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 입양게시판 일련번호
	adoptboard_idx number NOT NULL,
	PRIMARY KEY (sitrevlike_idx)
);


-- 입양 목록
CREATE TABLE ADOPTION_list
(
	-- 입양 목록 일련번호
	ADOPlist_idx number NOT NULL,
	-- 입양날짜 
	ADOPlist_date date NOT NULL,
	-- 유기동물 일련번호
	abani_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (ADOPlist_idx)
);


-- 승인 테이블
CREATE TABLE APPROVAL
(
	-- 승인 일련번호
	APR_idx number NOT NULL,
	-- 승인 허가여부(Y,N)
	APR_stts char(1) NOT NULL,
	-- 사유
	APR_rsn varchar2(2000) NOT NULL,
	-- 타입(adt ,sit)입양/시터
	APR_type char(3) NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (APR_idx)
);


-- 이용가능서비스
CREATE TABLE AVAILABLE_SERVICES
(
	-- 태그종류 테이블 일련번호
	typTag_idx number NOT NULL,
	-- 시터 일련번호
	sit_idx number NOT NULL
);


-- faq게시판 테이블
CREATE TABLE faq_board
(
	-- faq게시판 일련번호
	faq_idx number NOT NULL,
	-- 질문
	faq_QUESTION varchar2(100) NOT NULL,
	-- 답변
	faq_ANSWER varchar2(2000) NOT NULL,
	-- 사진
	faq_photo varchar2(0),
	PRIMARY KEY (faq_idx)
);


-- 회원테이블
CREATE TABLE member
(
	-- 회원번호
	member_idx number NOT NULL,
	-- 아이디
	member_id varchar2(30) NOT NULL UNIQUE,
	-- 비밀번호
	member_pass varchar2(30) NOT NULL,
	-- 일반/시터/관리자(nor,sit,mag)
	member_type char(3) NOT NULL,
	-- 이메일
	member_email varchar2(30) NOT NULL UNIQUE,
	-- 주소
	member_addr varchar2(30) NOT NULL,
	-- 이름
	member_name varchar2(30) NOT NULL,
	-- 전화번호
	member_phone varchar2(30) NOT NULL,
	-- 회원가입일
	member_reg date NOT NULL,
	-- 회원 나이(생일)
	member_birth date NOT NULL,
	-- 회원 성별(F,M)
	member_gender char(1) NOT NULL,
	-- 회원 프로필 사진
	member_photo varchar2(100),
	PRIMARY KEY (member_idx)
);


-- 새 테이블
CREATE TABLE NEW_TABLE
(

);


-- 새 테이블
CREATE TABLE NEW_TABLE
(

);


-- 공지게시판 테이블
CREATE TABLE NOTICE_BOARD
(
	-- 공지게시판 일련번호
	notboard_idx number NOT NULL,
	-- 제목
	notboard_title varchar2(200) NOT NULL,
	-- 내용
	notboard_content varchar2(2000) NOT NULL,
	-- 작성일
	notboard_regdate date NOT NULL,
	-- 조회수
	notboard_hit number NOT NULL,
	-- 사진
	notboard_photo varchar2(100),
	PRIMARY KEY (notboard_idx)
);


-- 펫 테이블
CREATE TABLE pet
(
	-- 펫번호
	pet_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 펫 이름
	pet_name varchar2(30) NOT NULL,
	-- 펫 나이
	pet_age number(10,0) NOT NULL,
	-- 중성화여부(Y,N)
	pet_neut char(1) NOT NULL,
	-- 펫 성별(F,M)
	pet_gender char(1) NOT NULL,
	-- 펫 품종
	pet_kind varchar2(30) NOT NULL,
	-- 펫 특징
	pet_char varchar2(200) NOT NULL,
	-- 펫 사진
	pet_photo varchar2(100),
	PRIMARY KEY (pet_idx)
);


-- qna게시판
CREATE TABLE qna_board
(
	-- qna게시판 일련번호
	qna_idx number NOT NULL,
	-- 질문 제목
	qna_title varchar2(200) NOT NULL,
	-- 질문 내용
	qna_content varchar2(2000) NOT NULL,
	-- 사진
	qna_photo varchar2(200),
	-- 등록일
	qna_regdate date NOT NULL,
	-- 처리상태(답변완료,미완료)(com,Inc)
	qna_stt char(3) NOT NULL,
	-- 공개여부(비공개,공개)(pri,pub)
	qna_OPENSTATUS char(3) NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (qna_idx)
);


-- 유기동물신고 테이블
CREATE TABLE REPORT_ABANDONED_ANIMALS
(
	-- 유기동물신고 일련번호
	dclrAbnd_idx number NOT NULL,
	-- 주소
	dclrAbnd_loc varchar2(50) NOT NULL,
	-- 제목
	dclrAbnd_title varchar2(100) NOT NULL,
	-- 내용
	dclrAbnd_content varchar2(2000) NOT NULL,
	-- 사진
	dclrAbnd_photo varchar2(100),
	-- 등록일
	dclrAbnd_regdate date NOT NULL,
	-- 처리상태(접수,처리중,완료)(reg,PRG,CMP)
	dclrAbnd_stts char(3) NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (dclrAbnd_idx)
);


-- 거주지 유형 테이블
CREATE TABLE RESIDENCE_TYPE
(
	-- 시터신청 일련번호
	SITAPL_idx number NOT NULL,
	-- 거주지 유형
	RSD_TYP varchar2(30) NOT NULL
);


-- 시터후기 댓글 테이블
CREATE TABLE sitrev_Comment
(
	-- 시터후기 댓글 일련번호
	sitrevcomm_idx number NOT NULL,
	-- 댓글 내용
	sitrevcomm_content varchar2(1000) NOT NULL,
	-- 댓글 등록일
	sitrevcomm_regdate date NOT NULL,
	-- 후기 일련번호
	sitreview_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (sitrevcomm_idx)
);


-- 시터 테이블
CREATE TABLE sitter
(
	-- 시터 일련번호
	sit_idx number NOT NULL,
	-- 시터 제목
	sit_title varchar2(100) NOT NULL,
	-- 시터 소개글
	sit_intro varchar2(2000) NOT NULL,
	-- 시터 주소
	sit_addr varchar2(50) NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 소형 요금
	s_fee number,
	-- 중형 요금
	m_fee number,
	-- 대형 요금
	b_fee number,
	-- 이용고객 수 
	sit_CLIENT number,
	PRIMARY KEY (sit_idx)
);


-- 시터신청 폼 테이블
CREATE TABLE SITTER_APPLICATION
(
	-- 시터신청 일련번호
	SITAPL_idx number NOT NULL,
	-- 신청자 이름
	SITAPL_name varchar2(30) NOT NULL,
	-- 신청자 성별(F,M)
	SITAPL_gender char(1) NOT NULL,
	-- 지원자 생년월일
	SITAPL_birth date NOT NULL,
	-- 지원자 전화번호
	SITAPL_tel varchar2(30) NOT NULL,
	-- 지원자 주소
	SITAPL_addr varchar2(30) NOT NULL,
	-- 신청자 가족 흡연 여부(0,1)
	SITAPL_smkStt char(1) NOT NULL,
	-- 신청자 반려동물 키운 기간
	SITAPL_havepet varchar2(30) NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (SITAPL_idx)
);


-- 시터후기 좋아요 테이블
CREATE TABLE sitter_like
(
	-- 시터후기 좋아요 일련번호
	sitrevlike_idx number NOT NULL,
	-- 좋아요 상태 (0,1)
	sitrevlike_stt char(1) NOT NULL,
	-- 후기 일련번호
	sitreview_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (sitrevlike_idx)
);


-- 시터 사진 테이블
CREATE TABLE sitter_photo
(
	-- 사진 일련번호
	sitphoto_idx number NOT NULL,
	-- 사진 경로
	sitphoto_photo varchar2(0),
	-- 시터 일련번호
	sit_idx number NOT NULL,
	PRIMARY KEY (sitphoto_idx)
);


-- 시터후기 테이블
CREATE TABLE sitter_review
(
	-- 후기 일련번호
	sitreview_idx number NOT NULL,
	-- 등록일
	sitreview_regdate date NOT NULL,
	-- 내용
	sitreview_content varchar2(1000) NOT NULL,
	-- 사진
	sitreview_photo varchar2(200),
	-- 별점
	sitreview_startpoint number NOT NULL,
	-- 시터 일련번호
	sit_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	PRIMARY KEY (sitreview_idx)
);


-- 시터 태그
CREATE TABLE sitter_tag
(
	-- 시터 일련번호
	sit_idx number NOT NULL,
	-- 태그종류 테이블 일련번호
	typTag_idx number NOT NULL
);


-- 펫시터 예약 테이블
CREATE TABLE sit_book
(
	-- 펫시터 예약 일련번호
	sbook_idx number NOT NULL,
	-- 시터 일련번호
	sit_idx number NOT NULL,
	-- 예약 시작일
	sbook_start date NOT NULL,
	-- 예약 마지막일
	sbook_end date NOT NULL,
	PRIMARY KEY (sbook_idx)
);


-- 서비스 종류 테이블
CREATE TABLE TYPE_SERVICE
(
	-- 태그종류 테이블 일련번호
	typTag_idx number NOT NULL,
	-- 태그 종류(아파트, 반려동물 없음 등)
	typTag_type varchar2(30),
	-- 태그 설명
	typTag_expln varchar2(200),
	PRIMARY KEY (typTag_idx)
);


-- 태그 종류 테이블
CREATE TABLE TYPE_Tag
(
	-- 태그종류 테이블 일련번호
	typTag_idx number NOT NULL,
	-- 태그 종류(아파트, 반려동물 없음 등)
	typTag_type varchar2(30),
	-- 태그 설명
	typTag_expln varchar2(200),
	PRIMARY KEY (typTag_idx)
);



/* Create Foreign Keys */

ALTER TABLE ADOPTION_APPLICATION
	ADD FOREIGN KEY (abani_idx)
	REFERENCES abandonedAnimal (abani_idx)
;


ALTER TABLE ADOPTION_list
	ADD FOREIGN KEY (abani_idx)
	REFERENCES abandonedAnimal (abani_idx)
;


ALTER TABLE ADOPTION_Comment
	ADD FOREIGN KEY (adoptboard_idx)
	REFERENCES ADOPTION_BOARD (adoptboard_idx)
;


ALTER TABLE ADOPTION_like
	ADD FOREIGN KEY (adoptboard_idx)
	REFERENCES ADOPTION_BOARD (adoptboard_idx)
;


ALTER TABLE ADOPTION_APPLICATION
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE ADOPTION_BOARD
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE ADOPTION_Comment
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE ADOPTION_like
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE ADOPTION_list
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE APPROVAL
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE pet
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE qna_board
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE REPORT_ABANDONED_ANIMALS
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE sitrev_Comment
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE sitter
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE SITTER_APPLICATION
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE sitter_like
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE sitter_review
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;


ALTER TABLE AVAILABLE_SERVICES
	ADD FOREIGN KEY (sit_idx)
	REFERENCES sitter (sit_idx)
;


ALTER TABLE sitter_photo
	ADD FOREIGN KEY (sit_idx)
	REFERENCES sitter (sit_idx)
;


ALTER TABLE sitter_review
	ADD FOREIGN KEY (sit_idx)
	REFERENCES sitter (sit_idx)
;


ALTER TABLE sitter_tag
	ADD FOREIGN KEY (sit_idx)
	REFERENCES sitter (sit_idx)
;


ALTER TABLE sit_book
	ADD FOREIGN KEY (sit_idx)
	REFERENCES sitter (sit_idx)
;


ALTER TABLE RESIDENCE_TYPE
	ADD FOREIGN KEY (SITAPL_idx)
	REFERENCES SITTER_APPLICATION (SITAPL_idx)
;


ALTER TABLE sitrev_Comment
	ADD FOREIGN KEY (sitreview_idx)
	REFERENCES sitter_review (sitreview_idx)
;


ALTER TABLE sitter_like
	ADD FOREIGN KEY (sitreview_idx)
	REFERENCES sitter_review (sitreview_idx)
;


ALTER TABLE AVAILABLE_SERVICES
	ADD FOREIGN KEY (typTag_idx)
	REFERENCES TYPE_SERVICE (typTag_idx)
;


ALTER TABLE sitter_tag
	ADD FOREIGN KEY (typTag_idx)
	REFERENCES TYPE_Tag (typTag_idx)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_abandonedAnimal_abani_idx BEFORE INSERT ON abandonedAnimal
FOR EACH ROW
BEGIN
	SELECT SEQ_abandonedAnimal_abani_idx.nextval
	INTO :new.abani_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ADOPTION_APPLICATION_ADPAPL_idx BEFORE INSERT ON ADOPTION_APPLICATION
FOR EACH ROW
BEGIN
	SELECT SEQ_ADOPTION_APPLICATION_ADPAPL_idx.nextval
	INTO :new.ADPAPL_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ADOPTION_BOARD_adoptboard_idx BEFORE INSERT ON ADOPTION_BOARD
FOR EACH ROW
BEGIN
	SELECT SEQ_ADOPTION_BOARD_adoptboard_idx.nextval
	INTO :new.adoptboard_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ADOPTION_Comment_adoptcomm_idx BEFORE INSERT ON ADOPTION_Comment
FOR EACH ROW
BEGIN
	SELECT SEQ_ADOPTION_Comment_adoptcomm_idx.nextval
	INTO :new.adoptcomm_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ADOPTION_like_adoptlike_idx BEFORE INSERT ON ADOPTION_like
FOR EACH ROW
BEGIN
	SELECT SEQ_ADOPTION_like_adoptlike_idx.nextval
	INTO :new.adoptlike_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ADOPTION_list_ADOPlist_idx BEFORE INSERT ON ADOPTION_list
FOR EACH ROW
BEGIN
	SELECT SEQ_ADOPTION_list_ADOPlist_idx.nextval
	INTO :new.ADOPlist_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ADOPTION_REVIEW_BOARD_adoptboard_idx BEFORE INSERT ON ADOPTION_REVIEW_BOARD
FOR EACH ROW
BEGIN
	SELECT SEQ_ADOPTION_REVIEW_BOARD_adoptboard_idx.nextval
	INTO :new.adoptboard_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_APPROVAL_APR_idx BEFORE INSERT ON APPROVAL
FOR EACH ROW
BEGIN
	SELECT SEQ_APPROVAL_APR_idx.nextval
	INTO :new.APR_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_faq_board_faq_idx BEFORE INSERT ON faq_board
FOR EACH ROW
BEGIN
	SELECT SEQ_faq_board_faq_idx.nextval
	INTO :new.faq_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_member_member_idx BEFORE INSERT ON member
FOR EACH ROW
BEGIN
	SELECT SEQ_member_member_idx.nextval
	INTO :new.member_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_NOTICE_BOARD_notboard_idx BEFORE INSERT ON NOTICE_BOARD
FOR EACH ROW
BEGIN
	SELECT SEQ_NOTICE_BOARD_notboard_idx.nextval
	INTO :new.notboard_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_pet_pet_idx BEFORE INSERT ON pet
FOR EACH ROW
BEGIN
	SELECT SEQ_pet_pet_idx.nextval
	INTO :new.pet_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qna_board_qna_idx BEFORE INSERT ON qna_board
FOR EACH ROW
BEGIN
	SELECT SEQ_qna_board_qna_idx.nextval
	INTO :new.qna_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx BEFORE INSERT ON REPORT_ABANDONED_ANIMALS
FOR EACH ROW
BEGIN
	SELECT SEQ_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx.nextval
	INTO :new.dclrAbnd_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sitrev_Comment_sitrevcomm_idx BEFORE INSERT ON sitrev_Comment
FOR EACH ROW
BEGIN
	SELECT SEQ_sitrev_Comment_sitrevcomm_idx.nextval
	INTO :new.sitrevcomm_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SITTER_APPLICATION_ADPAPL_idx BEFORE INSERT ON SITTER_APPLICATION
FOR EACH ROW
BEGIN
	SELECT SEQ_SITTER_APPLICATION_ADPAPL_idx.nextval
	INTO :new.ADPAPL_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SITTER_APPLICATION_SITAPL_idx BEFORE INSERT ON SITTER_APPLICATION
FOR EACH ROW
BEGIN
	SELECT SEQ_SITTER_APPLICATION_SITAPL_idx.nextval
	INTO :new.SITAPL_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sitter_like_adoptlike_idx BEFORE INSERT ON sitter_like
FOR EACH ROW
BEGIN
	SELECT SEQ_sitter_like_adoptlike_idx.nextval
	INTO :new.adoptlike_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sitter_like_sitrevlike_idx BEFORE INSERT ON sitter_like
FOR EACH ROW
BEGIN
	SELECT SEQ_sitter_like_sitrevlike_idx.nextval
	INTO :new.sitrevlike_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sitter_photo_sitphoto_idx BEFORE INSERT ON sitter_photo
FOR EACH ROW
BEGIN
	SELECT SEQ_sitter_photo_sitphoto_idx.nextval
	INTO :new.sitphoto_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sitter_review_sitreview_idx BEFORE INSERT ON sitter_review
FOR EACH ROW
BEGIN
	SELECT SEQ_sitter_review_sitreview_idx.nextval
	INTO :new.sitreview_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sitter_sit_idx BEFORE INSERT ON sitter
FOR EACH ROW
BEGIN
	SELECT SEQ_sitter_sit_idx.nextval
	INTO :new.sit_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sit_book_sbook_idx BEFORE INSERT ON sit_book
FOR EACH ROW
BEGIN
	SELECT SEQ_sit_book_sbook_idx.nextval
	INTO :new.sbook_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TYPE_SERVICE_typSrv_idx BEFORE INSERT ON TYPE_SERVICE
FOR EACH ROW
BEGIN
	SELECT SEQ_TYPE_SERVICE_typSrv_idx.nextval
	INTO :new.typSrv_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TYPE_Tag_typTag_idx BEFORE INSERT ON TYPE_Tag
FOR EACH ROW
BEGIN
	SELECT SEQ_TYPE_Tag_typTag_idx.nextval
	INTO :new.typTag_idx
	FROM dual;
END;

/




/* Comments */

COMMENT ON TABLE abandonedAnimal IS '유기동물 테이블';
COMMENT ON COLUMN abandonedAnimal.abani_idx IS '유기동물 일련번호';
COMMENT ON COLUMN abandonedAnimal.abani_kind IS '유기동물 품종';
COMMENT ON COLUMN abandonedAnimal.abani_gender IS '유기동물 성별(F,M)';
COMMENT ON COLUMN abandonedAnimal.abani_loc IS '유기동물 발생장소';
COMMENT ON COLUMN abandonedAnimal.abani_regdate IS '유기동물 접수일';
COMMENT ON COLUMN abandonedAnimal.abani_neut IS '유기동물 중성화여부(1,0)';
COMMENT ON COLUMN abandonedAnimal.abani_stat IS '유기동물 상태 입양/보호(adopt,prtct)';
COMMENT ON COLUMN abandonedAnimal.abani_photo IS '유기동물 사진';
COMMENT ON TABLE ADOPTION_APPLICATION IS '입양신청 폼 테이블';
COMMENT ON COLUMN ADOPTION_APPLICATION.ADPAPL_idx IS '입양신청 일련번호';
COMMENT ON COLUMN ADOPTION_APPLICATION.SITAPL_name IS '신청자 이름';
COMMENT ON COLUMN ADOPTION_APPLICATION.SITAPL_gender IS '신청자 성별(F,M)';
COMMENT ON COLUMN ADOPTION_APPLICATION.SITAPL_birth IS '지원자 생년월일';
COMMENT ON COLUMN ADOPTION_APPLICATION.SITAPL_tel IS '지원자 전화번호';
COMMENT ON COLUMN ADOPTION_APPLICATION.SITAPL_addr IS '지원자 주소';
COMMENT ON COLUMN ADOPTION_APPLICATION.SITAPL_smkStt IS '신청자 가족 흡연 여부(0,1)';
COMMENT ON COLUMN ADOPTION_APPLICATION.SITAPL_havepet IS '신청자 반려동물 키운 기간';
COMMENT ON COLUMN ADOPTION_APPLICATION.ADPAPL_job IS '지원자  직업';
COMMENT ON COLUMN ADOPTION_APPLICATION.ADPAPL_catblo IS '방묘창 여부(0,1)';
COMMENT ON COLUMN ADOPTION_APPLICATION.ADPAPL_exp IS '지원자의 반려동울 키운 경험 여부 (0,1)';
COMMENT ON COLUMN ADOPTION_APPLICATION.member_idx IS '회원번호';
COMMENT ON COLUMN ADOPTION_APPLICATION.abani_idx IS '입양할 유기동물 일련번호';
COMMENT ON TABLE ADOPTION_BOARD IS '입양후기게시판';
COMMENT ON COLUMN ADOPTION_BOARD.adoptboard_idx IS '입양게시판 일련번호';
COMMENT ON COLUMN ADOPTION_BOARD.adoptboard_title IS '입양게시판 제목';
COMMENT ON COLUMN ADOPTION_BOARD.adoptboard_content IS '입양게시판 내용';
COMMENT ON COLUMN ADOPTION_BOARD.adoptboard_photo IS '입양게시판 사진';
COMMENT ON COLUMN ADOPTION_BOARD.adoptboard_regdate IS '입양게시판 등록일';
COMMENT ON COLUMN ADOPTION_BOARD.adoptboard_hit IS '입양게시판 조회수';
COMMENT ON COLUMN ADOPTION_BOARD.member_idx IS '회원번호';
COMMENT ON TABLE ADOPTION_Comment IS '입양게시판댓글 테이블';
COMMENT ON COLUMN ADOPTION_Comment.sitrevcomm_idx IS '시터후기 댓글 일련번호';
COMMENT ON COLUMN ADOPTION_Comment.sitrevcomm_content IS '댓글 내용';
COMMENT ON COLUMN ADOPTION_Comment.sitrevcomm_regdate IS '댓글 등록일';
COMMENT ON COLUMN ADOPTION_Comment.adoptboard_idx IS '입양게시판 일련번호';
COMMENT ON COLUMN ADOPTION_Comment.member_idx IS '회원번호';
COMMENT ON TABLE ADOPTION_like IS '입양 좋아요 테이블';
COMMENT ON COLUMN ADOPTION_like.sitrevlike_idx IS '시터후기 좋아요 일련번호';
COMMENT ON COLUMN ADOPTION_like.sitrevlike_stt IS '좋아요 상태 (0,1)';
COMMENT ON COLUMN ADOPTION_like.member_idx IS '회원번호';
COMMENT ON COLUMN ADOPTION_like.adoptboard_idx IS '입양게시판 일련번호';
COMMENT ON TABLE ADOPTION_list IS '입양 목록';
COMMENT ON COLUMN ADOPTION_list.ADOPlist_idx IS '입양 목록 일련번호';
COMMENT ON COLUMN ADOPTION_list.ADOPlist_date IS '입양날짜 ';
COMMENT ON COLUMN ADOPTION_list.abani_idx IS '유기동물 일련번호';
COMMENT ON COLUMN ADOPTION_list.member_idx IS '회원번호';
COMMENT ON TABLE APPROVAL IS '승인 테이블';
COMMENT ON COLUMN APPROVAL.APR_idx IS '승인 일련번호';
COMMENT ON COLUMN APPROVAL.APR_stts IS '승인 허가여부(Y,N)';
COMMENT ON COLUMN APPROVAL.APR_rsn IS '사유';
COMMENT ON COLUMN APPROVAL.APR_type IS '타입(adt ,sit)입양/시터';
COMMENT ON COLUMN APPROVAL.member_idx IS '회원번호';
COMMENT ON TABLE AVAILABLE_SERVICES IS '이용가능서비스';
COMMENT ON COLUMN AVAILABLE_SERVICES.typTag_idx IS '태그종류 테이블 일련번호';
COMMENT ON COLUMN AVAILABLE_SERVICES.sit_idx IS '시터 일련번호';
COMMENT ON TABLE faq_board IS 'faq게시판 테이블';
COMMENT ON COLUMN faq_board.faq_idx IS 'faq게시판 일련번호';
COMMENT ON COLUMN faq_board.faq_QUESTION IS '질문';
COMMENT ON COLUMN faq_board.faq_ANSWER IS '답변';
COMMENT ON COLUMN faq_board.faq_photo IS '사진';
COMMENT ON TABLE member IS '회원테이블';
COMMENT ON COLUMN member.member_idx IS '회원번호';
COMMENT ON COLUMN member.member_id IS '아이디';
COMMENT ON COLUMN member.member_pass IS '비밀번호';
COMMENT ON COLUMN member.member_type IS '일반/시터/관리자(nor,sit,mag)';
COMMENT ON COLUMN member.member_email IS '이메일';
COMMENT ON COLUMN member.member_addr IS '주소';
COMMENT ON COLUMN member.member_name IS '이름';
COMMENT ON COLUMN member.member_phone IS '전화번호';
COMMENT ON COLUMN member.member_reg IS '회원가입일';
COMMENT ON COLUMN member.member_birth IS '회원 나이(생일)';
COMMENT ON COLUMN member.member_gender IS '회원 성별(F,M)';
COMMENT ON COLUMN member.member_photo IS '회원 프로필 사진';
COMMENT ON TABLE NEW_TABLE IS '새 테이블';
COMMENT ON TABLE NEW_TABLE IS '새 테이블';
COMMENT ON TABLE NOTICE_BOARD IS '공지게시판 테이블';
COMMENT ON COLUMN NOTICE_BOARD.notboard_idx IS '공지게시판 일련번호';
COMMENT ON COLUMN NOTICE_BOARD.notboard_title IS '제목';
COMMENT ON COLUMN NOTICE_BOARD.notboard_content IS '내용';
COMMENT ON COLUMN NOTICE_BOARD.notboard_regdate IS '작성일';
COMMENT ON COLUMN NOTICE_BOARD.notboard_hit IS '조회수';
COMMENT ON COLUMN NOTICE_BOARD.notboard_photo IS '사진';
COMMENT ON TABLE pet IS '펫 테이블';
COMMENT ON COLUMN pet.pet_idx IS '펫번호';
COMMENT ON COLUMN pet.member_idx IS '회원번호';
COMMENT ON COLUMN pet.pet_name IS '펫 이름';
COMMENT ON COLUMN pet.pet_age IS '펫 나이';
COMMENT ON COLUMN pet.pet_neut IS '중성화여부(Y,N)';
COMMENT ON COLUMN pet.pet_gender IS '펫 성별(F,M)';
COMMENT ON COLUMN pet.pet_kind IS '펫 품종';
COMMENT ON COLUMN pet.pet_char IS '펫 특징';
COMMENT ON COLUMN pet.pet_photo IS '펫 사진';
COMMENT ON TABLE qna_board IS 'qna게시판';
COMMENT ON COLUMN qna_board.qna_idx IS 'qna게시판 일련번호';
COMMENT ON COLUMN qna_board.qna_title IS '질문 제목';
COMMENT ON COLUMN qna_board.qna_content IS '질문 내용';
COMMENT ON COLUMN qna_board.qna_photo IS '사진';
COMMENT ON COLUMN qna_board.qna_regdate IS '등록일';
COMMENT ON COLUMN qna_board.qna_stt IS '처리상태(답변완료,미완료)(com,Inc)';
COMMENT ON COLUMN qna_board.qna_OPENSTATUS IS '공개여부(비공개,공개)(pri,pub)';
COMMENT ON COLUMN qna_board.member_idx IS '회원번호';
COMMENT ON TABLE REPORT_ABANDONED_ANIMALS IS '유기동물신고 테이블';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.dclrAbnd_idx IS '유기동물신고 일련번호';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.dclrAbnd_loc IS '주소';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.dclrAbnd_title IS '제목';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.dclrAbnd_content IS '내용';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.dclrAbnd_photo IS '사진';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.dclrAbnd_regdate IS '등록일';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.dclrAbnd_stts IS '처리상태(접수,처리중,완료)(reg,PRG,CMP)';
COMMENT ON COLUMN REPORT_ABANDONED_ANIMALS.member_idx IS '회원번호';
COMMENT ON TABLE RESIDENCE_TYPE IS '거주지 유형 테이블';
COMMENT ON COLUMN RESIDENCE_TYPE.SITAPL_idx IS '시터신청 일련번호';
COMMENT ON COLUMN RESIDENCE_TYPE.RSD_TYP IS '거주지 유형';
COMMENT ON TABLE sitrev_Comment IS '시터후기 댓글 테이블';
COMMENT ON COLUMN sitrev_Comment.sitrevcomm_idx IS '시터후기 댓글 일련번호';
COMMENT ON COLUMN sitrev_Comment.sitrevcomm_content IS '댓글 내용';
COMMENT ON COLUMN sitrev_Comment.sitrevcomm_regdate IS '댓글 등록일';
COMMENT ON COLUMN sitrev_Comment.sitreview_idx IS '후기 일련번호';
COMMENT ON COLUMN sitrev_Comment.member_idx IS '회원번호';
COMMENT ON TABLE sitter IS '시터 테이블';
COMMENT ON COLUMN sitter.sit_idx IS '시터 일련번호';
COMMENT ON COLUMN sitter.sit_title IS '시터 제목';
COMMENT ON COLUMN sitter.sit_intro IS '시터 소개글';
COMMENT ON COLUMN sitter.sit_addr IS '시터 주소';
COMMENT ON COLUMN sitter.member_idx IS '회원번호';
COMMENT ON COLUMN sitter.s_fee IS '소형 요금';
COMMENT ON COLUMN sitter.m_fee IS '중형 요금';
COMMENT ON COLUMN sitter.b_fee IS '대형 요금';
COMMENT ON COLUMN sitter.sit_CLIENT IS '이용고객 수 ';
COMMENT ON TABLE SITTER_APPLICATION IS '시터신청 폼 테이블';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_idx IS '시터신청 일련번호';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_name IS '신청자 이름';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_gender IS '신청자 성별(F,M)';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_birth IS '지원자 생년월일';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_tel IS '지원자 전화번호';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_addr IS '지원자 주소';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_smkStt IS '신청자 가족 흡연 여부(0,1)';
COMMENT ON COLUMN SITTER_APPLICATION.SITAPL_havepet IS '신청자 반려동물 키운 기간';
COMMENT ON COLUMN SITTER_APPLICATION.member_idx IS '회원번호';
COMMENT ON TABLE sitter_like IS '시터후기 좋아요 테이블';
COMMENT ON COLUMN sitter_like.sitrevlike_idx IS '시터후기 좋아요 일련번호';
COMMENT ON COLUMN sitter_like.sitrevlike_stt IS '좋아요 상태 (0,1)';
COMMENT ON COLUMN sitter_like.sitreview_idx IS '후기 일련번호';
COMMENT ON COLUMN sitter_like.member_idx IS '회원번호';
COMMENT ON TABLE sitter_photo IS '시터 사진 테이블';
COMMENT ON COLUMN sitter_photo.sitphoto_idx IS '사진 일련번호';
COMMENT ON COLUMN sitter_photo.sitphoto_photo IS '사진 경로';
COMMENT ON COLUMN sitter_photo.sit_idx IS '시터 일련번호';
COMMENT ON TABLE sitter_review IS '시터후기 테이블';
COMMENT ON COLUMN sitter_review.sitreview_idx IS '후기 일련번호';
COMMENT ON COLUMN sitter_review.sitreview_regdate IS '등록일';
COMMENT ON COLUMN sitter_review.sitreview_content IS '내용';
COMMENT ON COLUMN sitter_review.sitreview_photo IS '사진';
COMMENT ON COLUMN sitter_review.sitreview_startpoint IS '별점';
COMMENT ON COLUMN sitter_review.sit_idx IS '시터 일련번호';
COMMENT ON COLUMN sitter_review.member_idx IS '회원번호';
COMMENT ON TABLE sitter_tag IS '시터 태그';
COMMENT ON COLUMN sitter_tag.sit_idx IS '시터 일련번호';
COMMENT ON COLUMN sitter_tag.typTag_idx IS '태그종류 테이블 일련번호';
COMMENT ON TABLE sit_book IS '펫시터 예약 테이블';
COMMENT ON COLUMN sit_book.sbook_idx IS '펫시터 예약 일련번호';
COMMENT ON COLUMN sit_book.sit_idx IS '시터 일련번호';
COMMENT ON COLUMN sit_book.sbook_start IS '예약 시작일';
COMMENT ON COLUMN sit_book.sbook_end IS '예약 마지막일';
COMMENT ON TABLE TYPE_SERVICE IS '서비스 종류 테이블';
COMMENT ON COLUMN TYPE_SERVICE.typTag_idx IS '태그종류 테이블 일련번호';
COMMENT ON COLUMN TYPE_SERVICE.typTag_type IS '태그 종류(아파트, 반려동물 없음 등)';
COMMENT ON COLUMN TYPE_SERVICE.typTag_expln IS '태그 설명';
COMMENT ON TABLE TYPE_Tag IS '태그 종류 테이블';
COMMENT ON COLUMN TYPE_Tag.typTag_idx IS '태그종류 테이블 일련번호';
COMMENT ON COLUMN TYPE_Tag.typTag_type IS '태그 종류(아파트, 반려동물 없음 등)';
COMMENT ON COLUMN TYPE_Tag.typTag_expln IS '태그 설명';




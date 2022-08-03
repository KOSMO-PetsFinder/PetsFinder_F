--유기동물 테이블
CREATE TABLE abandonedAnimal
(
	abani_idx number NOT NULL, --일련번호
	abani_kind varchar2(30) NOT NULL, --품종(아메리칸숏헤어,먼치킨 등..)
	abani_gender char(1) NOT NULL, -- 성별(F,M)
	abani_loc varchar2(30) NOT NULL, -- 유기동물 발생장소(경기도 부천시 오정동)
	abani_regdate date NOT NULL, -- 등록일자
	abani_neut number NOT NULL, --중성화여부(0안함,1함)
	abani_stat char(5) NOT NULL, --상태 (입양,보호중//adopt,prtct)
	abani_photo varchar2(100) NOT NULL, --사진
	abani_age varchar2(30) NOT NULL, --나이
	abani_vaccin number NOT NULL, --예방접종 유무
	abani_species char(3) NOT NULL, --종(고양이cat/개dog)
    abani_char varchar2(1000) NOT NULL,
	PRIMARY KEY (abani_idx)
);
drop table abandonedAnimal;
CREATE SEQUENCE SEQ_abani_idx INCREMENT BY 1 START WITH 1;
insert into abandonedAnimal values
		(SEQ_abani_idx.nextval,'페르시안','M','경기도 부천시 오정동',
		sysdate,1,'adopt','사진경로','1년6개월',1,'cat','특징임');
insert into abandonedAnimal values
		(SEQ_abani_idx.nextval,'버먼','F','경기도 부천시 원종동',
		sysdate,1,'adopt','사진경로','2년6개월',1,'cat','특징임');
select * from abandonedAnimal;
select * from abandonedAnimal where abani_idx=23;
        SELECT * from abandonedAnimal where abani_idx=23;
        commit;
SELECT * FROM (
  			SELECT Tb.*, rownum rNum FROM (
  				SELECT * FROM abandonedAnimal 
  				ORDER BY abani_idx DESC 
  			) Tb
  		)
  		WHERE rNum>=1 AND rNum<=3;        
        
















CREATE TABLE REPORT_ABANDONED_ANIMALS
(
	dclrAbnd_idx number NOT NULL,
	dclrAbnd_loc varchar2(50) NOT NULL,
	dclrAbnd_title varchar2(100) NOT NULL,
	dclrAbnd_content varchar2(2000) NOT NULL,
	dclrAbnd_photo varchar2(100),
	dclrAbnd_regdate date NOT NULL,
	dclrAbnd_stts char(3) NOT NULL,
	member_idx number NOT NULL,
	PRIMARY KEY (dclrAbnd_idx)
);  
CREATE SEQUENCE SEQ_dclrAbnd_idx INCREMENT BY 1 START WITH 1;
INSERT INTO REPORT_ABANDONED_ANIMALS( dclrAbnd_idx,   dclrAbnd_loc, dclrAbnd_title, dclrAbnd_content
                                 , dclrAbnd_photo, dclrAbnd_regdate,   dclrAbnd_stts, member_idx )
                           VALUES(SEQ_dclrAbnd_idx.nextval, '서울시', '123', '123'
, '123', sysdate, '123', 123);














--멤버 테이블
CREATE TABLE member
(
	member_idx number NOT NULL,
	member_id varchar2(30) NOT NULL UNIQUE,
	member_pass varchar2(30) NOT NULL,
	member_type char(3) NOT NULL,
	member_email varchar2(30) NOT NULL UNIQUE,
	member_addr varchar2(100) NOT NULL,
	member_name varchar2(30) NOT NULL,
	member_phone varchar2(30) NOT NULL,
	member_reg date NOT NULL,
	member_birth date NOT NULL,
	member_gender char(1) NOT NULL,
	member_photo varchar2(100),
	PRIMARY KEY (member_idx)
);
drop table member;
CREATE SEQUENCE SEQ_member_idx INCREMENT BY 1 START WITH 1;
commit;
select * from member;

        
        
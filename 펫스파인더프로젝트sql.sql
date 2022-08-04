/*
--���⵿�� ���̺� ����
*/
CREATE TABLE abandonedAnimal
(
	abani_idx number NOT NULL, --�Ϸù�ȣ
	abani_kind varchar2(30) NOT NULL, --ǰ��(�Ƹ޸�ĭ�����,��ġŲ ��..)
	abani_gender char(1) NOT NULL, -- ����(F,M)
	abani_loc varchar2(30) NOT NULL, -- ���⵿�� �߻����(��⵵ ��õ�� ������)
	abani_regdate date NOT NULL, -- �������
	abani_neut number NOT NULL, --�߼�ȭ����(0����,1��)
	abani_stat char(5) NOT NULL, --���� (�Ծ�,��ȣ��//adopt,prtct)
	abani_photo varchar2(100) NOT NULL, --����
	abani_age varchar2(30) NOT NULL, --����
	abani_vaccin number NOT NULL, --�������� ����
	abani_species char(3) NOT NULL, --��(�����cat/��dog)
    abani_char varchar2(1000) NOT NULL,
	PRIMARY KEY (abani_idx)
);
drop table abandonedAnimal;
CREATE SEQUENCE SEQ_abani_idx INCREMENT BY 1 START WITH 1;
insert into abandonedAnimal values
		(SEQ_abani_idx.nextval,'�丣�þ�','M','��⵵ ��õ�� ������',
		sysdate,1,'adopt','�������','1��6����',1,'cat','Ư¡��');
insert into abandonedAnimal values
		(SEQ_abani_idx.nextval,'����','F','��⵵ ��õ�� ������',
		sysdate,1,'adopt','�������','2��6����',1,'cat','Ư¡��');
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
        

commit;














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
CREATE SEQUENCE SEQ_member_member_idx INCREMENT BY 1 START WITH 1;
INSERT INTO REPORT_ABANDONED_ANIMALS( dclrAbnd_idx,   dclrAbnd_loc, dclrAbnd_title, dclrAbnd_content
                                 , dclrAbnd_photo, dclrAbnd_regdate,   dclrAbnd_stts, member_idx )
                           VALUES(SEQ_dclrAbnd_idx.nextval, '�����', '123', '123'
, '123', sysdate, '123', 123);

/*
--���⵿�� ���̺� ��
*/
-------------------------------------------------
/*
--��� ���̺� ����
*/
drop table member;
CREATE SEQUENCE SEQ_member_idx INCREMENT BY 1 START WITH 1;
commit;
select * from member;



CREATE TABLE member
(
   -- ȸ����ȣ
   member_idx number NOT NULL,
   -- ���̵�
   member_id varchar2(30) NOT NULL UNIQUE,
   -- ��й�ȣ
   member_pass varchar2(30) NOT NULL,
   -- �Ϲ�/����/������(nor,sit,mag)
   member_type char(3) NOT NULL,
   -- �̸���
   member_email varchar2(30) NOT NULL UNIQUE,
   -- �ּ�
   member_addr varchar2(100) NOT NULL,
   -- �̸�
   member_name varchar2(30) NOT NULL,
   -- ��ȭ��ȣ
   member_phone varchar2(30) NOT NULL,
   -- ȸ��������
   member_reg date NOT NULL,
   -- ȸ�� ����(����)
   member_birth date NOT NULL,
   -- ȸ�� ����(F,M)
   member_gender char(1) NOT NULL,
   -- ȸ�� ������ ����
   member_photo varchar2(100),
   PRIMARY KEY (member_idx)
);
drop SEQUENCE SEQ_member_member_idx;
CREATE SEQUENCE SEQ_member_member_idx INCREMENT BY 1 START WITH 2;
select * from member;
SEQ_member_member_idx.nextval;
commit;


/*
--��� ���̺� ��
*/
-------------------------------------------------
/*
���⵿�� �Ű�?����
*/
DROP TRIGGER TRI_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx;

DROP TABLE REPORT_ABANDONED_ANIMALS CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ABANDONEDANIMAL_ABANI_IDX;

CREATE SEQUENCE SEQ_dclrAbnd_idx INCREMENT BY 1 START WITH 1;
commit;

CREATE TABLE REPORT_ABANDONED_ANIMALS
(
	dclrAbnd_idx number NOT NULL,
	dclrAbnd_loc varchar2(100) NOT NULL,
	dclrAbnd_title varchar2(100) NOT NULL,
	dclrAbnd_content varchar2(2000) NOT NULL,
	dclrAbnd_photo varchar2(100),
	dclrAbnd_regdate date NOT NULL,
	dclrAbnd_stts char(3) NOT NULL,
	member_idx number NOT NULL,
	PRIMARY KEY (dclrAbnd_idx)
);
select * from REPORT_ABANDONED_ANIMALS;
ALTER TABLE REPORT_ABANDONED_ANIMALS
	ADD FOREIGN KEY (member_idx)
	REFERENCES member (member_idx)
;

/

CREATE OR REPLACE TRIGGER TRI_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx BEFORE INSERT ON REPORT_ABANDONED_ANIMALS
FOR EACH ROW
BEGIN
	SELECT SEQ_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx.nextval
	INTO :new.dclrAbnd_idx
	FROM dual;
END;

/

commit;
select SEQ_dclrAbnd_idx.nextval from dual;
INSERT INTO REPORT_ABANDONED_ANIMALS( dclrAbnd_idx,	dclrAbnd_loc, dclrAbnd_title, dclrAbnd_content
											, dclrAbnd_photo, dclrAbnd_regdate,	dclrAbnd_stts, member_idx )
									VALUES(SEQ_dclrAbnd_idx.nextval, '?������', '123', '123'
, '123', sysdate, '123', 123);


/*
���⵿�� �Ű� ��
*/
-------------------------------------------------
/*
�ı�Խ��� ����
*/
CREATE SEQUENCE SEQ_review_board_idx INCREMENT BY 1 START WITH 1;
drop table review_board;
CREATE TABLE review_board
(
	review_idx number NOT NULL,
	review_content varchar2(1000) NOT NULL,
	review_regdate date NOT NULL,
	review_photo varchar2(200),
	review_flag char(3) NOT NULL,
	sit_idx number,
	member_idx number NOT NULL,
	abani_idx number,
	PRIMARY KEY (review_idx)
);
INSERT INTO review_board(review_idx, review_content, review_regdate, review_photo,
                        review_flag, member_idx,abani_idx)
                    VALUES(SEQ_review_board_idx.nextval, 'ȣȣȣȣȣȣȣȣ��.', sysdate,'���ϰ��',
                    'adp',2,58);
                    commit;
select * from abandonedAnimal;
select * from review_board;
select * from review_board where abani_idx=58 order by review_idx desc;
/*
�ı�Խ��� ��
*/
-------------------------------------------------
/*
�Ծ��� ����
*/
drop SEQUENCE SEQ_ADOPlist_idx;
CREATE SEQUENCE SEQ_ADOPlist_idx INCREMENT BY 1 START WITH ;
CREATE TABLE ADOPTION_list
(
	ADOPlist_idx number NOT NULL, --�Ծ��� �Ϸù�ȣ
	ADOPlist_date date NOT NULL, --�Ծ糯¥
	abani_idx number NOT NULL, --���⵿�� �Ϸù�ȣ
	member_idx number NOT NULL, --ȸ����ȣ
	PRIMARY KEY (ADOPlist_idx)
);
INSERT INTO ADOPTION_list(ADOPlist_idx, ADOPlist_date, abani_idx, member_idx)
                           VALUES(SEQ_ADOPlist_idx.nextval, sysdate, 58, 2);
select * from ADOPTION_list;
/*
�Ծ��� ��
*/
---------------------------------------------
/*
�ı� ��� ����
*/
CREATE SEQUENCE SEQ_reviewcomm_idx INCREMENT BY 1 START WITH 1;
CREATE TABLE review_Comment
(
	reviewcomm_idx number NOT NULL,
	reviewcomm_content varchar2(1000) NOT NULL,
	reviewcomm_regdate date NOT NULL,
	review_idx number NOT NULL,
	member_idx number NOT NULL,
	PRIMARY KEY (reviewcomm_idx)
);
INSERT INTO review_Comment(reviewcomm_idx, reviewcomm_content, reviewcomm_regdate, review_idx,member_idx)
                           VALUES(SEQ_reviewcomm_idx.nextval,'����Դϴ��' ,sysdate, 1, 1);
INSERT INTO review_Comment(reviewcomm_idx, reviewcomm_content, reviewcomm_regdate, review_idx,member_idx)
                           VALUES(SEQ_reviewcomm_idx.nextval,'����Դϴ��' ,sysdate, 2, 1);
INSERT INTO review_Comment(reviewcomm_idx, reviewcomm_content, reviewcomm_regdate, review_idx,member_idx)
                           VALUES(SEQ_reviewcomm_idx.nextval,'����Դϴ��' ,sysdate, 3, 1);
INSERT INTO review_Comment(reviewcomm_idx, reviewcomm_content, reviewcomm_regdate, review_idx,member_idx)
                           VALUES(SEQ_reviewcomm_idx.nextval,'����Դϴ��' ,sysdate, 4, 1);
INSERT INTO review_Comment(reviewcomm_idx, reviewcomm_content, reviewcomm_regdate, review_idx,member_idx)
                           VALUES(SEQ_reviewcomm_idx.nextval,'����Դϴ��' ,sysdate, 5, 1);
INSERT INTO review_Comment(reviewcomm_idx, reviewcomm_content, reviewcomm_regdate, review_idx,member_idx)
                           VALUES(SEQ_reviewcomm_idx.nextval,'����Դϴ��' ,sysdate, 6, 1);
select * from review_Comment;
--�� �Ծ絿�� �󼼺��⿡�� ���� �ı���� ����� ��� �������� ����
select * from review_board where abani_idx=58 order by review_idx desc;
select * from review_Comment where review_idx in(select review_idx from review_board where abani_idx=58);
--�ı� �Խ���
select review_idx from review_board where abani_idx=58;
commit;
/*
�ı� ��� ��
*/        
        
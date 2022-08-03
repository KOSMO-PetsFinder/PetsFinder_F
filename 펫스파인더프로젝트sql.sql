--���⵿�� ���̺�
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
/*
--��� ���̺� ��
*/


/*
���⵿�� �Ű�?����
*/
DROP TRIGGER TRI_REPORT_ABANDONED_ANIMALS_dclrAbnd_idx;

DROP TABLE REPORT_ABANDONED_ANIMALS CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ABANDONEDANIMAL_ABANI_IDX;

CREATE SEQUENCE SEQ_dclrAbnd_idx INCREMENT BY 1 START WITH 1;


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




        
        
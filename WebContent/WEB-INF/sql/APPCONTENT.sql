CREATE TABLE APPCONTENT (
	num NUMBER(*,0) CONSTRAINT pk_approval_num PRIMARY KEY,
	title VARCHAR2(2000),
	content VARCHAR2(2000),
	appline NUMBER(*,0),
	coopline NUMBER(*,0),
	empno NUMBER(*,0),
	ollno NUMBER(*,0),
	state NUMBER(*,0),
	CONSTRAINT fk_appline_num FOREIGN KEY(appline) REFERENCES APPROVALLINE(num),
	CONSTRAINT fk_coopline_num FOREIGN KEY(coopline) REFERENCES APPROVALLINE(num),
	CONSTRAINT fk_aemp_num FOREIGN KEY(empno) REFERENCES EMPLOYEE(num)
);

CREATE SEQUENCE SEQ_APPCONTENT_no;
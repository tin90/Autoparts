CREATE TABLE DEPARTMENT (
	num NUMBER(*,0) CONSTRAINT pk_department PRIMARY KEY,
	name VARCHAR2(40)
);

CREATE SEQUENCE SEQ_DEPARTMENT_no;

CREATE TABLE SPOT (
	num NUMBER(*,0) CONSTRAINT pk_spot PRIMARY KEY,
	name VARCHAR2(40)
);

CREATE SEQUENCE SEQ_SPOT_no;

CREATE TABLE EMPLOYEE (
	num NUMBER(*,0) CONSTRAINT pk_employee PRIMARY KEY,
	name VARCHAR2(40),
	dept VARCHAR2(40),
	spot VARCHAR2(40),
	CONSTRAINT fk_emp_dept_num FOREIGN KEY(dept) REFERENCES DEPARTMENT(name),
	CONSTRAINT fk_emp_spot_num FOREIGN KEY(spot) REFERENCES DEPARTMENT(name)
);

CREATE SEQUENCE SEQ_EMPLOYEE_no;
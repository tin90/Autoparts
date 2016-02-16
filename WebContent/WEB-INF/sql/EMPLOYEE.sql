CREATE TABLE EMPLOYEE (
	num NUMBER(*,0) CONSTRAINT pk_employee PRIMARY KEY,
	name VARCHAR2(40),
	dept NUMBER(*,0),
	spot NUMBER(*,0),
	CONSTRAINT fk_emp_dept_num FOREIGN KEY(dept) REFERENCES DEPARTMENT(num),
	CONSTRAINT fk_emp_spot_num FOREIGN KEY(spot) REFERENCES SPOT(num)
);

CREATE SEQUENCE SEQ_EMPLOYEE_no;
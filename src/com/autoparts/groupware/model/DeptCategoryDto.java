package com.autoparts.groupware.model;

/***
 * 
 * @author pc
 * select d.no no, d.name name, d.seq seq, count(e.id) empCount
 * from dept d, emp e 
 * where d.no = e.deptno
 * group by e.deptno;
 *  
 */
//ºÎ¼­
public class DeptCategoryDto {
	private int no;
	private String name;
	private int seq;
	
	private int empCount;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getEmpCount() {
		return empCount;
	}

	public void setEmpCount(int empCount) {
		this.empCount = empCount;
	}
}

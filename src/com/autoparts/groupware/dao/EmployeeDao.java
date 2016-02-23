package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.model.PageDept;
import com.autoparts.groupware.model.PageSpot;
import com.autoparts.groupware.model.RawEmpDto;

@Repository
public class EmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public EmployeeDto getEmpOne(int num){
		return sqlSession.selectOne("emp.getEmp", num);
	}
	
	public List<EmployeeDto> getEmpList(){
		return sqlSession.selectList("emp.getEmpList");
	}
	
	public List<EmployeeDto> getEmpPage(int page){
		return sqlSession.selectList("emp.getEmpPage", page);
	}
	
	public List<EmployeeDto> getEmpPage(String search, int page, int q){
		if(search.equals("dept")){
			PageDept pd = new PageDept();
			pd.setPage(page);
			pd.setDept(q);
			return sqlSession.selectList("emp.getEmpPageByDept", pd);
		}else if(search.equals("spot")){
			PageSpot ps = new PageSpot();
			ps.setPage(page);
			ps.setSpot(q);
			return sqlSession.selectList("emp.getEmpPageBySpot", ps);
		}else{
			return null;
		}
	}
	
	public int getPageCount(String search){
		return sqlSession.selectOne("emp.getPageCount");
	}
	
	public int getPageCount(String search, int q){
		if(search.equals("dept")){
			return sqlSession.selectOne("emp.getPageCountByDept", q);
		}else if(search.equals("spot")){
			return sqlSession.selectOne("emp.getPageCountBySpot", q);
		}else if(search.equals("name")){
			return 1;
		}else{
			return sqlSession.selectOne("emp.getPageCount");
		}
	}
	
	public void addEmp(RawEmpDto emp){
		sqlSession.insert("emp.addEmp", emp);
	}
	
	public void modEmp(RawEmpDto emp){
		sqlSession.update("emp.modEmp", emp);
	}
	
	public void modDept(RawEmpDto emp){
		sqlSession.update("emp.modDept", emp);
	}
	
	public void modSpot(RawEmpDto emp){
		sqlSession.update("emp.modSpot", emp);
	}
	
	public void delEmp(int num){
		sqlSession.delete("emp.delEmp", num);
	}
}

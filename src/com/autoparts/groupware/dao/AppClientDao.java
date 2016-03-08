package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.AppClientDto;
import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.model.RawAppClientDto;

@Repository
public class AppClientDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AppClientDto> getAll(){
		return sqlSession.selectList("appclient.getAll");
	}
	
	public List<AppClientDto> getAll(int page){
		return sqlSession.selectList("appclient.getAllPage", page);
	}
	
	public int getAllPageCount(){
		return sqlSession.selectOne("appclient.getAllPageCount");
	}
	
	public List<AppClientDto> getAbledAll(){
		return sqlSession.selectList("appclient.getAbledAll");
	}
	
	public List<AppClientDto> getAbledAll(int page){
		return sqlSession.selectList("appclient.getAbledAllPage", page);
	}
	
	public int getAbledAllPageCount(){
		return sqlSession.selectOne("appclient.getAbledAllPageCount");
	}
	
	public List<AppClientDto> getDisabledAll(){
		return sqlSession.selectList("appclient.getDisabledAll");
	}
	
	public List<AppClientDto> getDisabledAll(int page){
		return sqlSession.selectList("appclient.getDisabledAllPage", page);
	}
	
	public int getDisabledAllPageCount(){
		return sqlSession.selectOne("appclient.getDisabledAllPageCount");
	}
	
	public void addAppclient(RawAppClientDto app){
		sqlSession.insert("appclient.addAppclient", app);
	}
	
	public void delAppclient(int empno){
		sqlSession.delete("appclient.delAppclient", empno);
	}
	
	public EmployeeDto getEmp(String id){
		return sqlSession.selectOne("appclient.getEmp", id);
	}
}

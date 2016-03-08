package com.autoparts.groupware.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.AppLineDto;
import com.autoparts.groupware.model.RawAppconDto;

@Repository
public class AppDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void addAppLine(AppLineDto dto){
		sqlSession.insert("app.addAppline", dto);
		sqlSession.insert("app.addApplist", dto);
	}
	
	public void addAppcon(RawAppconDto appcon){
		sqlSession.insert("app.addAppcon", appcon);
	}
	
	public RawAppconDto getAppcon(int num){
		return sqlSession.selectOne("app.getAppcon", num);
	}
	
	public AppLineDto getApplist(int num){
		AppLineDto line = new AppLineDto();
		line.setNum(num);
		line.setList(sqlSession.selectList("app.getApplist", num));
		return line;
	}
}

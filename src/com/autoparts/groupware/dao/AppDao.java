package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.AppLineDto;
import com.autoparts.groupware.model.ParamAppcon;
import com.autoparts.groupware.model.RawAppconDto;

@Repository
public class AppDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void addAppLine(AppLineDto dto){
		sqlSession.insert("app.addAppline", dto);
		sqlSession.insert("app.addApplist", dto);
	}
	
	public void addNullAppLine(AppLineDto dto){
		sqlSession.insert("app.addAppline", dto);
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
	
	public List<RawAppconDto> getAppconList(int page, int state){
		ParamAppcon pa = new ParamAppcon();
		pa.setPage(page);
		pa.setState(state);
		return sqlSession.selectList("app.getAppconPage", pa);
	}
	
	public int getAppconListCount(int state){
		return sqlSession.selectOne("app.getAppconPageCount", state);
	}
	
	public List<RawAppconDto> getAppconByApplinePage(int page, int state){
		ParamAppcon pa = new ParamAppcon();
		pa.setPage(page);
		pa.setState(state);
		return sqlSession.selectList("app.getAppconByApplinePage", pa);
	}
	
	public int getAppconByApplinePageCount(int state){
		return sqlSession.selectOne("app.getAppconByApplinePageCount", state);
	}
	
	public int getAppconByApplineCount(int state){
		return sqlSession.selectOne("app.getAppconByApplineCount", state);
	}
}

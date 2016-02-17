package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.RawSpotDto;
import com.autoparts.groupware.model.SpotCategoryDto;

@Repository
public class SpotDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<SpotCategoryDto> getCategory(){
		return sqlSession.selectList("spot.getCategory");
	}
	
	public SpotCategoryDto getCategory(int num){
		return sqlSession.selectOne("spot.getCategoryOne");
	}
	
	public void addSpot(String name){
		sqlSession.insert("spot.addSpot", name);
	}
	
	public void modSpot(RawSpotDto dept){
		sqlSession.update("spot.modSpot", dept);
	}
	
	public void delSpot(int num){
		sqlSession.delete("spot.delSpot", num);
	}
}

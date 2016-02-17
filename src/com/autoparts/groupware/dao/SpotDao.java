package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.SpotCategoryDto;

@Repository
public class SpotDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<SpotCategoryDto> getCategory(){	
		return sqlSession.selectList("spot.getCategory");
	}
}

package com.autoparts.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.erp.model.ErpDto;

@Repository
public class ErpDao {

	@Autowired
	SqlSessionTemplate sst;

	public String test(ErpDto erpDto) {
		
		return sst.selectOne("test",erpDto.getPart());
		
	}

	public List<ErpDto> search(String partnum) {
		return sst.selectList("search", partnum);
	}
	
	
}

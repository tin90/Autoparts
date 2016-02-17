package com.autoparts.groupware.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.MobileDto;

@Repository
public class MobileDao {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public MobileDto prod_search(String prod_code){
		//return (MobileDto) sst.selectList("prod_search",prod_code);
		return null;
	}
	
	public MobileDto bill_list(){
		//return (MobileDto) sst.selectList("bill_list");
		return null;
	}
	
	public MobileDto bill_detail(String bill_code){
		//return (MobileDto) sst.selectList("bill_detail", bill_code);
		return null;
	}
	
	public void store(MobileDto mobileDto){
		sst.update("store", mobileDto);
	}
	
	public void release(MobileDto mobileDto){
		sst.update("release", mobileDto);
	}
	
	public void insert(MobileDto mobileDto){
		sst.insert("insert", mobileDto);
	}
}
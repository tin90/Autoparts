package com.autoparts.mobile.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.mobile.model.MobileDto;

@Repository
public class MobileDao {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<MobileDto> prod_search(String part){
		ArrayList<String> list = new ArrayList<>();
		return sst.selectList("prod_search",part);
	}
	
	public List<MobileDto> bill_list(){
		return sst.selectList("bill_list");
	}
	
	public List<MobileDto> bill_detail(String pocode){
		return sst.selectList("bill_detail", pocode);
	}
	
	public void store(MobileDto mobileDto){
		sst.insert("store", mobileDto);
		//sst.update("update", mobileDto);
	}
	
	public void release(MobileDto mobileDto){
		sst.insert("release", mobileDto);
		//sst.update("update", mobileDto);
	}
	
	public void insert(MobileDto mobileDto){
		sst.insert("insert", mobileDto);
	}

	public void update(MobileDto mobileDto) {
		sst.update("update", mobileDto);
	}

	public List<MobileDto> recent() {
		return sst.selectList("recent");		
	}

	public List<MobileDto> keeplist() {
		return sst.selectList("keeplist");		
	}

	public void keep(String pocode, List<String> keeparr) {
		sst.update("confirm");
		if(keeparr != null){
			sst.update("notconfirm",keeparr);
		}
	}

	public void keep(MobileDto mobileDto) {
		sst.update("confirm", mobileDto);
		System.out.println(mobileDto.getOrder_qty() +"/"+ mobileDto.getQty());
		if(mobileDto.getOrder_qty()<mobileDto.getQty()){
			sst.update("notconfirm", mobileDto);
		}
		//sst.update("complete", mobileDto);
		
	}
}
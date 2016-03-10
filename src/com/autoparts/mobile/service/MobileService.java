package com.autoparts.mobile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.mobile.dao.MobileDao;
import com.autoparts.mobile.model.MobileDto;

@Service
public class MobileService {

	@Autowired
	MobileDao mobileDao;
	
	public List<MobileDto> prod_search(String part) {
		return mobileDao.prod_search(part);
	}

	public List<MobileDto> bill_list() {
		return mobileDao.bill_list();
	}

	public List<MobileDto> bill_detail(String pocode) {
		return mobileDao.bill_detail(pocode);
	}

	public void store(MobileDto mobileDto) {
		mobileDao.store(mobileDto);
	}

	public void release(MobileDto mobileDto) {
		mobileDao.release(mobileDto);
	}

	public void update(MobileDto mobileDto) {
		mobileDao.update(mobileDto);
	}

	public List<MobileDto> recent() {
		return mobileDao.recent();		
	}

	public List<MobileDto> keep() {
		return mobileDao.keeplist();		
	}

	public void keep(MobileDto mobileDto) {
		mobileDao.keep(mobileDto);
	}

	
}

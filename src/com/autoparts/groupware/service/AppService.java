package com.autoparts.groupware.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.AppDao;
import com.autoparts.groupware.model.AppLineDto;
import com.autoparts.groupware.model.ApprovalDto;
import com.autoparts.groupware.model.RawAppconDto;

@Service
public class AppService {
	@Autowired
	private AppDao dao;
	
	public String addAppcontent(String json){
		try {
			JSONParser parser = new JSONParser();
			JSONObject obj =  (JSONObject)parser.parse(json);
			
			RawAppconDto appcon = new RawAppconDto();
			appcon.setTitle((String)obj.get("title"));
			appcon.setContent((String)obj.get("content"));
			
			//결재선 등록 시작
			List<ApprovalDto> applist = new ArrayList<ApprovalDto>();
			JSONArray app = (JSONArray)obj.get("app");
			int size = app.size();
			for(int i = 0; i < size; i++){
				JSONObject appo = (JSONObject)app.get(i);
				ApprovalDto appd = new ApprovalDto();
				appd.setEmpno((int)(long)(Long)appo.get("num"));
				applist.add(appd);
			}
			
			if(size != 0){
				AppLineDto appline = new AppLineDto();
				appline.setList(applist);
				dao.addAppLine(appline);
				appcon.setAppline(appline.getNum());
			}
			//결재선 등록 끝
			
			//협조 등록 시작
			List<ApprovalDto> cooplist = new ArrayList<ApprovalDto>();
			JSONArray coop = (JSONArray)obj.get("coop");
			size = coop.size();
			for(int i = 0; i < size; i++){
				JSONObject coopo = (JSONObject)coop.get(i);
				ApprovalDto coopd = new ApprovalDto();
				coopd.setEmpno((int)(long)(Long)coopo.get("num"));
				applist.add(coopd);
			}
			
			if(size != 0){
				AppLineDto coopline = new AppLineDto();
				coopline.setList(cooplist);
				dao.addAppLine(coopline);
				appcon.setCoopline(coopline.getNum());
			}
			//협조 등록 끝
			
			//appcon.setAppline(applist);
		} catch (ParseException e) {
			return "error : " + e.getMessage();
		}
		
		return "ok";
	}
}

package com.autoparts.groupware.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.AppClientDao;
import com.autoparts.groupware.dao.AppDao;
import com.autoparts.groupware.model.AppClientDto;
import com.autoparts.groupware.model.AppLineDto;
import com.autoparts.groupware.model.ApprovalDto;
import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.model.RawAppClientDto;
import com.autoparts.groupware.model.RawAppconDto;

@Service
@SuppressWarnings("unchecked")
public class AppService {
	@Autowired
	private AppDao dao;
	
	@Autowired
	private AppClientDao acdao;
	
	public String addAppcontent(String json, int empno){
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
			
			AppLineDto appline = null;
			if(size != 0){
				appline = new AppLineDto();
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
				cooplist.add(coopd);
			}
			
			AppLineDto coopline = null;
			if(size != 0){
				coopline = new AppLineDto();
				coopline.setList(cooplist);
				dao.addAppLine(coopline);
				appcon.setCoopline(coopline.getNum());
			}
			//협조 등록 끝
			
			if(appline != null && coopline != null){
				appcon.setAppline(appline.getNum());
				appcon.setEmpno(empno);
				appcon.setState((int)(long)(Long)obj.get("state"));
			}
			
			dao.addAppcon(appcon);
		} catch (ParseException e) {
			return "error : " + e.getMessage();
		}
		
		return "ok";
	}
	
	private JSONObject getJSONObject(AppClientDto aclient){
		JSONObject obj = new JSONObject();
		obj.put("empno", aclient.getEmpno());
		obj.put("id", aclient.getId());
		obj.put("name", aclient.getName());
		obj.put("phone", aclient.getPhone());
		obj.put("dept", aclient.getDept());
		obj.put("spot", aclient.getSpot());
		return obj;
	}
	
	public String getAll(){
		JSONArray json = new JSONArray();
		
		for(AppClientDto aclient : acdao.getAll()){
			json.add(getJSONObject(aclient));
		}
		
		return json.toJSONString();
	}
	
	public String getAll(int page){
		JSONArray json = new JSONArray();
		
		for(AppClientDto aclient : acdao.getAll(page)){
			json.add(getJSONObject(aclient));
		}
		
		return json.toJSONString();
	}
	
	public String getAllPageCount(){
		JSONObject json = new JSONObject();
		json.put("count", acdao.getAllPageCount());
		return json.toJSONString();
	}
	
	public String getAbledAll(){
		JSONArray json = new JSONArray();
		
		for(AppClientDto aclient : acdao.getAbledAll()){
			json.add(getJSONObject(aclient));
		}
		
		return json.toJSONString();
	}
	
	public String getAbledAll(int page){
		JSONArray json = new JSONArray();

		for(AppClientDto aclient : acdao.getAbledAll(page)){
			json.add(getJSONObject(aclient));
		}
		
		return json.toJSONString();
	}
	
	public String getAbledAllPageCount(){
		JSONObject json = new JSONObject();
		json.put("count", acdao.getAbledAllPageCount());
		return json.toJSONString();
	}
	
	public String getDisabledAll(){
		JSONArray json = new JSONArray();
		
		for(AppClientDto aclient : acdao.getDisabledAll()){
			json.add(getJSONObject(aclient));
		}
		
		return json.toJSONString();
	}
	
	public String getDisabledAll(int page){
		JSONArray json = new JSONArray();
		
		for(AppClientDto aclient : acdao.getDisabledAll(page)){
			json.add(getJSONObject(aclient));
		}
		
		return json.toJSONString();
	}
	
	public String getDisabledAllPageCount(){
		JSONObject json = new JSONObject();
		json.put("count", acdao.getDisabledAllPageCount());
		return json.toJSONString();
	}
	
	public void addAppclient(RawAppClientDto app){
		acdao.addAppclient(app);
	}
	
	public void delAppclient(int empno){
		acdao.delAppclient(empno);
	}
	
	public EmployeeDto getEmp(String id){
		return acdao.getEmp(id);
	}
}

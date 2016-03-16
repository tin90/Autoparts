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
import com.autoparts.groupware.model.AppconDto;
import com.autoparts.groupware.model.ApprovalDto;
import com.autoparts.groupware.model.ApprovalEmpDto;
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
			System.out.println(empno);
			JSONParser parser = new JSONParser();
			JSONObject obj =  (JSONObject)parser.parse(json);
			
			RawAppconDto appcon = new RawAppconDto();
			appcon.setTitle((String)obj.get("title"));
			appcon.setContent((String)obj.get("content"));
			appcon.setEmpno(empno);
			
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
			
			AppLineDto appline = new AppLineDto();
			if(size != 0){
				appline.setList(applist);
				dao.addAppLine(appline);
				appcon.setAppline(appline.getNum());
			}else{
				dao.addNullAppLine(appline);
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
			
			AppLineDto coopline = new AppLineDto();
			if(size != 0){
				coopline.setList(cooplist);
				dao.addAppLine(coopline);
				appcon.setCoopline(coopline.getNum());
			}else{
				dao.addNullAppLine(coopline);
				appcon.setCoopline(coopline.getNum());
			}
			//협조 등록 끝
			
			appcon.setState((int)(long)(Long)obj.get("state"));
			dao.addAppcon(appcon);
			
		} catch (ParseException e) {
			return "error : " + e.getMessage();
		}
		
		return "ok";
	}
	
	public AppconDto getAppcon(int num){
		RawAppconDto rappcon = dao.getAppcon(num);
		AppconDto appcon = new AppconDto();
		
		appcon.setNum(rappcon.getNum());
		appcon.setTitle(rappcon.getTitle());
		appcon.setContent(rappcon.getContent());
		int appn = rappcon.getAppline();
		appcon.setAppline(dao.getApplist(appn).getList());
		int coopn = rappcon.getCoopline();
		appcon.setCoopline(dao.getApplist(coopn).getList());
		System.out.println(appn + "," + coopn);
		appcon.setOrderlist_no(-1); // 아직 모름
		
		return appcon;
	}
	
	public String getAppconJson(int num){
		RawAppconDto rappcon = dao.getAppcon(num);
		
		JSONObject json = new JSONObject();
		json.put("num", rappcon.getNum());
		json.put("title", rappcon.getTitle());
		json.put("content", rappcon.getContent());
		
		JSONArray app = new JSONArray();
		for(ApprovalEmpDto e : dao.getApplistEmp(rappcon.getAppline())){
			JSONObject o = new JSONObject();
			o.put("num", e.getNum());
			o.put("dept", e.getDept());
			o.put("spot", e.getSpot());
			o.put("name", e.getName());
			o.put("date", e.getApp_date());
			app.add(o);
		}
		json.put("app", app);
		
		JSONArray coop = new JSONArray();
		for(ApprovalEmpDto e : dao.getApplistEmp(rappcon.getCoopline())){
			JSONObject o = new JSONObject();
			o.put("num", e.getNum());
			o.put("dept", e.getDept());
			o.put("spot", e.getSpot());
			o.put("name", e.getName());
			o.put("date", e.getApp_date());
			coop.add(o);
		}
		json.put("coop", coop);
		json.put("order", -1);
		
		return json.toJSONString();
	}
	
	public String getAppconByApplineJson(int page, int state, int empno){
		List<RawAppconDto> appcon = dao.getAppconByApplinePage(page, state, empno);
		int max_page = dao.getAppconByApplinePageCount(state, empno);
		
		JSONObject obj = new JSONObject();
		obj.put("curr_page", page);
		obj.put("max_page", max_page);
		
		JSONArray arr = new JSONArray();
		for(RawAppconDto c : appcon){
			JSONObject o = new JSONObject();
			o.put("num", c.getNum());
			o.put("title", c.getTitle());
			o.put("content", c.getContent());
			arr.add(o);
		}
		obj.put("list", arr);
		
		return obj.toJSONString();
	}
	
	public String getAppconList(int page, int state){
		List<RawAppconDto> appcon = dao.getAppconList(page, state);
		int max_page = dao.getAppconListCount(state);
		
		JSONObject obj = new JSONObject();
		obj.put("curr_page", page);
		obj.put("max_page", max_page);
		
		JSONArray arr = new JSONArray();
		for(RawAppconDto c : appcon){
			JSONObject o = new JSONObject();
			o.put("num", c.getNum());
			o.put("title", c.getTitle());
			o.put("content", c.getContent());
			arr.add(o);
		}
		obj.put("list", arr);
		
		return obj.toJSONString();
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

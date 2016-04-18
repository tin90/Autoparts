package com.autoparts.erp.controller;

import java.io.IOException;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.autoparts.erp.model.ErpDto;
import com.autoparts.erp.service.ErpService;

@Controller
@RequestMapping("/erp")
public class ErpController {

	@Autowired
	private ErpService erpService;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public @ResponseBody String test(ErpDto erpDto){
		
		return erpService.test(erpDto);
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public @ResponseBody String search(String partnum){

		partnum=partnum.trim();
		List<ErpDto> list = erpService.search(partnum);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(ErpDto dto : list){
			JSONObject obj = new JSONObject();
			obj.put("partnum", dto.getPartnum());
			obj.put("brand", dto.getBrand());
			obj.put("net", dto.getNet());
			obj.put("description", dto.getDescription());
			obj.put("country", dto.getCountry());
			jarray.add(obj);
			
		}
		json.put("list", jarray);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public ModelAndView cart(String id, HttpSession session){
		id= (String)session.getAttribute("id");
		//세션의 아이디에 따라 카트 내용 달라지게 해야함.
		//세션 아이디가 널일경우..?
		ArrayList cart = new ArrayList();
		
		DecimalFormat df = new DecimalFormat();
        df.setDecimalSeparatorAlwaysShown(false);
		
		List<ErpDto> list = erpService.cart(id);
		for(ErpDto dto : list){
			Map map = new HashMap();
			map.put("net", df.format(dto.getNet()));
			map.put("partnum", dto.getPartnum());
			map.put("qty", dto.getQty());
			map.put("country", dto.getCountry());
			map.put("amount", df.format(dto.getNet()*dto.getQty()));
			map.put("memo", dto.getMemo());
			map.put("description", dto.getDescription());
			map.put("brand", dto.getBrand());
			cart.add(map);
		}
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("cart_list",cart);
		mav.setViewName("erp/cart.tiles");
		return mav;		
	}
	
	@RequestMapping(value="/add_cart", method=RequestMethod.POST)
	public ModelAndView add_cart(ErpDto erpDto, HttpSession session){
		erpDto.setId((String)session.getAttribute("id"));
		//임시로 cart_temp 테이블에 insert 되게함
		erpService.add_cart(erpDto);
		String url = "redirect:/erp/cart.html";
		return new ModelAndView(url);
	}
	
	@RequestMapping(value="/excel_cart", method=RequestMethod.POST)
	public ModelAndView excel_cart(ErpDto erpDto, @RequestParam(value = "partarr[]") List<String> partarr,@RequestParam(value = "qtyarr[]") List<String> qtyarr,@RequestParam(value = "memoarr[]") List<String> memoarr, HttpSession session){
		
		erpDto.setId((String)session.getAttribute("id"));
		int len = partarr.size();
		List list = new ArrayList();
		for(int i=0; i<len; i++){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("part", partarr.get(i));
			map.put("qty", qtyarr.get(i));
			map.put("memo", memoarr.get(i));
			map.put("id", erpDto.getId());
			list.add(map);
		}
		
		erpService.excel_cart(list);
		
		String url = "redirect:/erp/cart.html";
		return new ModelAndView(url);
	}
	
	@RequestMapping(value="/del_cart", method=RequestMethod.GET)
	public ModelAndView remove_cart(ErpDto erpDto, HttpSession session){
		erpDto.setId((String)session.getAttribute("id"));
		erpService.del_cart(erpDto);
		String url = "redirect:/erp/cart.html";
		return new ModelAndView(url);
	}
	
	@RequestMapping(value="send_cart", method=RequestMethod.GET)
	public ModelAndView send_cart(ErpDto erpDto, HttpSession session){
		erpDto.setId((String)session.getAttribute("id"));
		erpService.send_Cart(erpDto);
		String url = "redirect:/erp/cart.html";
		return new ModelAndView(url);
	}
	
	@RequestMapping(value="mod_qty", method=RequestMethod.GET)
	public ModelAndView mod_qty(ErpDto erpDto, HttpSession session){
		erpDto.setId((String)session.getAttribute("id"));
		erpService.mod_qty(erpDto);
		String url = "redirect:/erp/cart.html";
		return new ModelAndView(url);
	}
	
	
	@RequestMapping(value="menu_dealer", method=RequestMethod.GET)
	public @ResponseBody String menu_dealer(ErpDto erpDto, HttpSession session){
		//erpDto.setId((String)session.getAttribute("id"));

		List<ErpDto> list = erpService.menu_dealer(erpDto);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(ErpDto dto : list){
			JSONObject obj = new JSONObject();
			obj.put("partnum", dto.getId());
			jarray.add(obj);
			
		}
		json.put("list", jarray);
		return json.toJSONString();
	}
	
	@RequestMapping(value="myInfo", method=RequestMethod.GET)
	public ModelAndView myInfo(String id, HttpSession session){
		id= (String)session.getAttribute("id");
		
		//List<ErpDto> list = erpService.myInfo(id);
		
		
		ModelAndView mav = new ModelAndView();

		//mav.addObject("myInfo_list",list);
		mav.setViewName("erp/myInfo.tiles");
		return mav;
	}
	
	
	
	
/*	@RequestMapping(value="parts_image", method=RequestMethod.GET)
	public ModelAndView parts_image(ErpDto erpDto){
	
		jericho() throws IOException {
	
			String url="http://www.partsbase.org/parts/mazda-w06561510/";
		     // URL·Î ºÎÅÍ ¼Ò½ºÅ¬·¡½º ÀÛ¼º
		     // Source source = new Source(new FileInputStream(new File(urlStr)));
		     Source source = new Source(new URL(url));
	
		     StringTokenizer st = new StringTokenizer("http://www.naver.com/", "/");
		     String a = st.toString();
		     System.out.println(a);
	
		        List<Element> imgtags = source.getAllElements(HTMLElementName.A);
		        
		            Element e = (Element) imgtags.get(imgtags.size()-1);
		            // src¼Ó¼ºÀ» ½Àµæ
		            String src = e.getAttributeValue("href");
	
		            System.out.println("http://www.partsbase.org/"+src);
		            
		}
	}	*/
}

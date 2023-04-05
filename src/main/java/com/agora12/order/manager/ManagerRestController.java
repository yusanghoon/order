package com.agora12.order.manager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.agora12.order.manager.bo.ManagerBO;

@RestController
@RequestMapping("/post/manager/price")
public class ManagerRestController {

	@Autowired
	private ManagerBO managerBO;
	
	@PostMapping("/add")
	public Map<String, String> addPrice(
			@RequestParam("id") int id
			, @RequestParam("code") String code
			, @RequestParam("name") String name
			, @RequestParam("type") String type
			, @RequestParam("price") String price
			, @RequestParam("Availability") String Availability	
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = managerBO.addprice(
									id
									, code
									, name
									, type
									, price
									, Availability								
									, userId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
	@PostMapping("/create")
	public Map<String, String> create() {

		
		int count = managerBO.createPrice();
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	
	@GetMapping("/delete")
	public Map<String, String> delete(
			@RequestParam("priceId") int priceId) {
		
		int count = managerBO.deletePrice(priceId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("reslut", "fail");
		}
		
		return result;
	}
	
	
	
	
	
	
}

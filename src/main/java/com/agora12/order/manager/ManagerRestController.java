package com.agora12.order.manager;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.agora12.order.manager.bo.ManagerBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/post/manager")
public class ManagerRestController {

	@Autowired
	private ManagerBO managerBO;
	
	@PostMapping("/price/add")
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
	
	
	@PostMapping("/price/create")
	public Map<String, String> createPrice() {
		
		
		
	
		
		Map<String, String> result = new HashMap<>();
		
			result.put("result", "success");
		
		
		return result;
		
	}
	
}

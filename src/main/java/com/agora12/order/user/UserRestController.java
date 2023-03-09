package com.agora12.order.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.agora12.order.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO; 
	
	@PostMapping("/signup")
	public Map<String, String> sigup(
			@RequestParam("name") String name
			,@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,@RequestParam("email") String email){
		
		Map<String, String> result = new HashMap<>();		
		int count = userBO.addUser(name, loginId, password, email);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;	
	}
	
	public Map<String, Boolean> duplicateId(@RequestParam("loginId") String loginId){
		
		boolean duplicate = userBO.duplicateId(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("duplicate", duplicate);
		
		return result;
		
	}
	
	
	
	
	
}

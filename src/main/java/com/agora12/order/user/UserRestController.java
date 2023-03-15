package com.agora12.order.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.agora12.order.user.bo.UserBO;
import com.agora12.order.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO; 
	
	@PostMapping("/signup")
	public Map<String, String> signup(
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
	
	@GetMapping("/duplicateId")
	public Map<String, Boolean> duplicateId(@RequestParam("loginId") String loginId){
		
		boolean duplicate = userBO.duplicateId(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("duplicate", duplicate);
		
		return result;
		
	}
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request){
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
		
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userEmail", user.getEmail());
			
			result.put("result", "success"); 
		} else { 
			result.put("result", "fail");
		}
		return result;
		
	}
	
	
	
	
}

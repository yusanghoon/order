package com.agora12.order.list;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.agora12.order.list.bo.ListBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/post/order")
public class ListRestController {
	
	@Autowired
	private ListBO listBO;

	@GetMapping("/duplicateBusinessNumber")
	public Map<String, Boolean> duplicateBusinessNumber(@RequestParam("businessNumber") String businessNumber){
		
		boolean duplicate = listBO.duplicateBusinessNumber(businessNumber);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("duplicate", duplicate);
		
		return result;
		
	}
	

	
	@PostMapping("/created/company")
	public Map<String, String> created(
			 @RequestParam("companyType") String companyType
			, @RequestParam("companyName") String companyName
			, @RequestParam("ceoName") String ceoName
			, @RequestParam("businessNumber") String businessNumber
			, @RequestParam("address") String address
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("faxNumber") String faxNumber
			, @RequestParam("business") String business
			, @RequestParam("typeOfBusiness") String typeOfBusiness
			, @RequestParam("email") String email
			, @RequestParam("accessAuthority") String accessAuthority
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = listBO.createdCompany(companyType
									, companyName
									, ceoName
									, businessNumber
									, address
									, phoneNumber
									, faxNumber
									, business
									, typeOfBusiness
									, email
									, accessAuthority
									, userId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
}

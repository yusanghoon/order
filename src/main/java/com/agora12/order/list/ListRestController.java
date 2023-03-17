package com.agora12.order.list;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.agora12.order.list.bo.ListBO;

@RestController
@RequestMapping("/post/order")
public class ListRestController {
	
	@Autowired
	private ListBO listBO;

	@GetMapping("/duplicateBusinessNumber")
	public Map<String, Boolean> duplicateBusinessNumber(@RequestParam("BusinessNumber") String BusinessNumber){
		
		boolean duplicate = listBO.duplicateBusinessNumber(BusinessNumber);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("duplicate", duplicate);
		
		return result;
		
	}
	
}

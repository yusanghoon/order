package com.agora12.order.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.agora12.order.manager.bo.ManagerBO;
import com.agora12.order.manager.model.ManagerModel;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/post/manager")
public class ManagerController {

	@Autowired
	private ManagerBO managerBO;
	
	@GetMapping("/price")
	public String managerPrice() {
		return "manager/pricemanager";
	}
	
	
	@GetMapping("/price/list")
	public String managerPrice(
			HttpSession session
			,Model model) {
			
		int userId = (Integer)session.getAttribute("userId");
		
		List<ManagerModel> price = managerBO.getprice(userId);
		
		model.addAttribute("price", price);
		
		return "order/list";
	}
	
	
	@GetMapping("/created")
	public String createdCompany() {
		return "order/createcompany";
	}
	
	
}

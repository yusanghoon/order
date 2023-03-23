package com.agora12.order.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.agora12.order.list.bo.ListBO;
import com.agora12.order.list.model.ListModel;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/post/order")
public class ListController {
	
	@Autowired
	private ListBO listBO;

	
	// 아직 미완성 유저생성
	@GetMapping("/list/companyuser")
	public String companyUser() {
		return "order/createuser";
	}
	
	//아직 미완성 디테일페이지
	
	@GetMapping("/list/companydetail")
	public String companydetail() {
		return "order/listdetail";
	}
	
	
	
	@GetMapping("/list")
	public String orderList(
			HttpSession session
			,Model model) {
			
		int userId = (Integer)session.getAttribute("userId");
		
		List<ListModel> list = listBO.getList(userId);
		
		model.addAttribute("list", list);
		
		return "order/list";
	}
	
	
	@GetMapping("/created")
	public String createdCompany() {
		return "order/createcompany";
	}
	
	
}

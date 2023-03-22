package com.agora12.order.list.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.agora12.order.list.dao.ListDAO;
import com.agora12.order.list.model.ListModel;

import jakarta.servlet.http.HttpSession;

@Service
public class ListBO {

	@Autowired
	private ListDAO listDAO;
	
	public List<ListModel> getList(int userId){
		return listDAO.selectList(userId);
	}
	
	public boolean duplicateBusinessNumber(String BusinessNumber){
		
		int count = listDAO.selectCountByBusinessNumber(BusinessNumber);
		
		return count !=0;
	}

	
	public int createdCompany(
			String companyType
			, String companyName
			, String ceoName
			, String businessNumber
			, String address
			, String phoneNumber
			, String faxNumber
			, String business
			, String typeOfBusiness
			, String email
			, String accessAuthority
			, int userId) {
		return listDAO.insertCompany(
				companyType
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
	}



}



package com.agora12.order.manager.bo;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agora12.order.list.model.ListModel;
import com.agora12.order.manager.dao.ManagerDAO;
import com.agora12.order.manager.model.ManagerModel;

@Service
public class ManagerBO {
	
	@Autowired
	private ManagerDAO managerDAO;
	
	public List<ManagerModel> getprice(int userId) {		
		return managerDAO.selectList(userId);
	}
	
	public int addprice(
			int id
			,String code
			,String name
			,String type
			,String price
			,String Availability			
			,int userId) {
		return managerDAO.insertprice(
				id
				, code
				, name
				, type
				, price
				, Availability
				, userId);
			}
	
	public int createPrice() {
		return managerDAO.defaultIsertprice();
	}
	
	
}


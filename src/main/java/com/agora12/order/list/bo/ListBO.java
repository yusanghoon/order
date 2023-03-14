package com.agora12.order.list.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agora12.order.list.dao.ListDAO;
import com.agora12.order.list.model.ListModel;

@Service
public class ListBO {

	@Autowired
	private ListDAO listDAO;
	
	public List<ListModel> getList(int userId){
		return listDAO.selectList(userId);
	}
	
}

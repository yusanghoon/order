package com.agora12.order.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agora12.order.common.EncryptUtils;
import com.agora12.order.user.dao.UserDAO;
import com.agora12.order.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;

	public int addUser(
			String name
			, String loginId
			, String password
			, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(name, loginId, encryptPassword, email);	
	}
	
	public boolean duplicateId(String loginId){
		
		int count = userDAO.selectCountByLoginId(loginId);
		
		return count !=0;
		
	}
	
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
		
	}
	
	
}

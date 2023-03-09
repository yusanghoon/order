package com.agora12.order.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agora12.order.common.EncryptUtils;
import com.agora12.order.user.dao.UserDAO;

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
		
		return userDAO.insertUser(name, loginId, password, email);	
	}
	
	public boolean duplicateId(String loginId){
		
		int count = userDAO.selectCountByLoginId(loginId);
		
		return count !=0;
		
	}
	
}

package com.agora12.order.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.agora12.order.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("name") String name
			,@Param("loginId") String loginId
			,@Param("password") String password
			,@Param("email") String email);
	
	public int selectCountByLoginId(@Param("loginId") String loginId);
	
	
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	
	
}

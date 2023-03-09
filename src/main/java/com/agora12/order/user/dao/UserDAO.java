package com.agora12.order.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("name") String name
			,@Param("loginId") String loginId
			,@Param("password") String password
			,@Param("email") String email);
	
	public int selectCountByLoginId(@Param("longinId") String loginId);
	
	
}

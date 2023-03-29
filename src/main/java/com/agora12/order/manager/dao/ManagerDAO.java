package com.agora12.order.manager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.agora12.order.manager.model.ManagerModel;

@Repository
public interface ManagerDAO {

	public List<ManagerModel> selectList(@Param("userId")int userId);
	
	public int insertprice(
			@Param("id") int id
			, @Param("code") String code
			, @Param("name") String name
			, @Param("type") String type
			, @Param("price") String price
			, @Param("Availability") String Availability			
			, @Param("userId") int userId);
	
	public int defaultIsertprice();
	
}

package com.agora12.order.list.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.agora12.order.list.model.ListModel;

@Repository
public interface ListDAO {

	public List<ListModel> selectList(@Param("userId")int userId);
	
	public int selectCountByBusinessNumber(@Param("businessNumber") String businessNumber);

	public int insertCompany(
			@Param("companyType") String companyType
			, @Param("companyName") String companyName
			, @Param("ceoName") String ceoName
			, @Param("businessNumber") String businessNumber
			, @Param("address") String address
			, @Param("phoneNumber") String phoneNumber
			, @Param("faxNumber") String faxNumber
			, @Param("business") String business
			, @Param("typeOfBusiness") String typeOfBusiness
			, @Param("email") String email
			, @Param("accessAuthority") String accessAuthority
			, @Param("userId") int userId);

	public ListModel selectListId(@Param("companyId") int companyId);
	
	
	
	
	
}

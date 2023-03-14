package com.agora12.order.list.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.agora12.order.list.model.ListModel;

@Repository
public interface ListDAO {

	public List<ListModel> selectList(@Param("userId")int userId);
}

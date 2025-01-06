package com.FoodAppDao;

import java.util.ArrayList;

import com.FoodAppModel.OrderHistoryModel;

public interface OrderHistoryDAO {
	
	int insertData(OrderHistoryModel u);
	ArrayList<OrderHistoryModel> fetchAll();
	void fetchOne(int orderHistoryId);
	int update(int orderHistoryId,String status);
	int delete(int orderHistoryId);

}

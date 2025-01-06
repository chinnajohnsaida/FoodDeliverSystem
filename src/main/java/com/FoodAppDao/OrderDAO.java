package com.FoodAppDao;

import java.util.ArrayList;

import com.FoodAppModel.OrderModel;

public interface OrderDAO {
	
	int insertData(OrderModel u);
	ArrayList<OrderModel> fetchAll();
	void fetchOne(int orderId);
	int update(int orderId, String status);
	int delete(int orderId);

}

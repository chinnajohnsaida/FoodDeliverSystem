package com.FoodAppDao;

import java.util.ArrayList;

import com.FoodAppModel.OrderItemModel;


public interface OrderItemDAO {
	
	int insertData(OrderItemModel u);
	ArrayList<OrderItemModel> fetchAll();
	void fetchOne(int orderItemId);
	int update(int orderItemId, int quantity);
	int delete(int orderId);

}

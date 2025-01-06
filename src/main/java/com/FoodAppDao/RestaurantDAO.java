package com.FoodAppDao;

import java.util.ArrayList;

import com.FoodAppModel.RestaurantModel;

public interface RestaurantDAO {
	
	int insertData(RestaurantModel u);
	ArrayList<RestaurantModel> fetchAll();
	void fetchOne(int restaurantId);
	int update(int restaurantId,boolean isActive);
	int delete(int restaurantId);

}

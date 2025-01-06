package com.FoodAppDao;

import java.util.ArrayList;

import com.FoodAppModel.MenuModel;

public interface MenuDAO {
	
	int insertData(MenuModel u);
	ArrayList<MenuModel> fetchAll();
	MenuModel fetchOne(int menuId);
	int update(int menuId, int price);
	int delete(int menuId);
	ArrayList<MenuModel> fetchMenuByRestaurant(int restaurantId);

}

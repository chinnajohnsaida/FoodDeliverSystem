package com.FoodAppDao;

import java.util.ArrayList;

import com.FoodAppModel.UsersModel;

public interface UsersDAO {
	int insertData(UsersModel u);
	ArrayList<UsersModel> fetchAll();
	void fetchOne(int id);
	int update(int id,String password);
	int delete(int id);
	UsersModel fetch(String email);
}
package com.FoodAppDaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.FoodAppDao.RestaurantDAO;
import com.FoodAppModel.RestaurantModel;
import com.dao.dbutil.GetConnection;

public class RestaurantDaoImpl implements RestaurantDAO{
	
	private static Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	ArrayList<RestaurantModel> restaurants=new ArrayList<RestaurantModel>();
	private ResultSet result;
	private static final String INSERT="INSERT INTO restaurant(restaurantId,name,cuisineType,deliveryTime,ratings,isActive,imagePath) VALUES(?,?,?,?,?,?,?)";
	private static final String FETCHALL="select * from restaurant";
	private static final String FETCHONE="select * from restaurant where restaurantId=?";
	private static final String UPDATE="update restaurant set isActive=? where restaurantId=?";
	private static final String DELETE="delete from restaurant where restaurantId=?";
	
	static {
		con=GetConnection.connect();
	}

	@Override
	public int insertData(RestaurantModel u) {
		try {
			pstmt=con.prepareStatement(INSERT);
			
			pstmt.setInt(1, u.getRestaurantId());
			pstmt.setString(2,u.getName());
			pstmt.setString(3, u.getCuisineType());
			pstmt.setInt(4, u.getDeliveryTime());
			pstmt.setFloat(5, u.getRatings());
			pstmt.setBoolean(6, u.getIsActive());
			pstmt.setString(7, u.getImagePath());
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<RestaurantModel> fetchAll() {
		try {
			stmt=con.createStatement();
			result=stmt.executeQuery(FETCHALL);
			while(result.next()) {
				restaurants.add(new RestaurantModel(result.getInt("restaurantId"),result.getString("name"),result.getString("cuisineType"),result.getInt("deliveryTime"),result.getFloat("ratings"),result.getBoolean("isActive"),result.getString("imagePath")));
			}
			return restaurants;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void fetchOne(int restaurantId) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, restaurantId);
			result=pstmt.executeQuery();
			while(result.next()) {
				System.out.println(result.getInt("restaurantId")+"   "+result.getString("name")+"   "+result.getString("cuisineType")+"    "+result.getInt("deliveryTime")+"    "+result.getFloat("ratings")+"    "+result.getBoolean("isActive")+"    "+result.getString("imagePath"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	@Override
	public int update(int restaurantId, boolean isActive) {
		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(2, restaurantId);
			pstmt.setBoolean(1, isActive);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int delete(int restaurantId) {
		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, restaurantId);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}

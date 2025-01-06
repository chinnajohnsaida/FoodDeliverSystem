package com.FoodAppDaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.FoodAppDao.MenuDAO;
import com.FoodAppModel.MenuModel;
import com.dao.dbutil.GetConnection;

public class MenuDaoImpl implements MenuDAO{
	
	private static Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	ArrayList<MenuModel> menu=new ArrayList<MenuModel>();
	private ResultSet result;
	private static final String INSERT="INSERT INTO menu(menuId,restaurantId,name,description,price,imagePath) VALUES(?,?,?,?,?,?)";
	private static final String FETCHMENUBYRESTAURANT="SELECT * from menu where restaurantId=?";
	private static final String FETCHALL="select * from menu";
	private static final String FETCHONE="select * from menu where menuId=?";
	private static final String UPDATE="update menu set price=? where menuId=?";
	private static final String DELETE="delete from menu where menuId=?";
	
	static {
		con=GetConnection.connect();
	}

	@Override
	public int insertData(MenuModel u) {try {
		pstmt=con.prepareStatement(INSERT);
		
		pstmt.setInt(1, u.getMenuId());
		pstmt.setInt(2,u.getRestaurantId());
		pstmt.setString(3, u.getName());
		pstmt.setString(4, u.getDescription());
		pstmt.setInt(5, u.getPrice());
		pstmt.setString(6, u.getImagePath());
		return pstmt.executeUpdate();
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
		return 0;
	}
	
	
	@Override
	  public ArrayList<MenuModel> fetchMenuByRestaurant(int restaurantId){
	  try {
		  pstmt=con.prepareStatement(FETCHMENUBYRESTAURANT);
		  pstmt.setInt(1,restaurantId);
		  result=pstmt.executeQuery();
		  while(result.next()) {
				menu.add(new MenuModel(result.getInt("menuId"),result.getInt("restaurantId"),result.getString("name"),result.getString("description"),result.getInt("price"),result.getBoolean("isAvailable"),result.getString("imagePath")));
			}
		  return menu;
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	  return null;
	  
	  }

	@Override
	public ArrayList<MenuModel> fetchAll() {
		
		try {
			stmt=con.createStatement();
			result=stmt.executeQuery(FETCHALL);
			while(result.next()) {
				menu.add(new MenuModel(result.getInt("menuId"),result.getInt("restaurantId"),result.getString("name"),result.getString("description"),result.getInt("price"),result.getBoolean("isAvailable"),result.getString("imagePath")));
			}
			return menu;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public MenuModel fetchOne(int menuId) {
		
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, menuId);
			result=pstmt.executeQuery();
			if(result.next()) {
				return (new MenuModel(result.getInt("menuId"),result.getInt("restaurantId"),result.getString("name"),result.getString("description"),result.getInt("price"),result.getBoolean("isAvailable"),result.getString("imagePath")));
			
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return null;
		
	}

	@Override
	public int update(int menuId, int price) {
		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(2, menuId);
			pstmt.setInt(1, price);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int delete(int menuId) {
		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, menuId);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}

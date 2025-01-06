package com.FoodAppDaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.FoodAppDao.OrderDAO;
import com.FoodAppModel.OrderModel;
import com.dao.dbutil.GetConnection;

public class OrderDaoImpl implements OrderDAO {
	
	private static Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	ArrayList<OrderModel> orders=new ArrayList<OrderModel>();
	private ResultSet result;
	private static final String INSERT="INSERT INTO orders(orderId,userId,restaurantId,totalAmmount,status,paymentMode) VALUES(?,?,?,?,?,?)";
	private static final String FETCHALL="select * from orders";
	private static final String FETCHONE="select * from orders where orderId=?";
	private static final String UPDATE="update orders set status=? where orderId=?";
	private static final String DELETE="delete from restaurant where orderId=?";
	
	static {
		con=GetConnection.connect();
	}

	@Override
	public int insertData(OrderModel u) {
		try {
			pstmt=con.prepareStatement(INSERT);
			
			pstmt.setInt(1, u.getOrderId());
			pstmt.setInt(2,u.getUserId());
			pstmt.setInt(3, u.getRestaurantId());
			pstmt.setInt(4, u.getTotalAmmount());
			pstmt.setString(5, u.getStatus());
			pstmt.setString(6, u.getPaymentMode());
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public ArrayList<OrderModel> fetchAll() {

		try {
			stmt=con.createStatement();
			result=stmt.executeQuery(FETCHALL);
			while(result.next()) {
				orders.add(new OrderModel(result.getInt("orderId"),result.getInt("userId"),result.getInt("restaurantId"),result.getInt("totalAmmount"),result.getString("status"),result.getString("paymentMode")));
			}
			return orders;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void fetchOne(int orderId) {

		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, orderId);
			result=pstmt.executeQuery();
			while(result.next()) {
				System.out.println(result.getInt("orderId")+"   "+result.getInt("userId")+"   "+result.getInt("restaurantId")+"    "+result.getInt("totalAmmount")+"    "+result.getString("status")+"    "+result.getString("paymentMode"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	@Override
	public int update(int orderId, String status) {
		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(2, orderId);
			pstmt.setString(1, status);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int delete(int orderId) {
		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, orderId);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	

}

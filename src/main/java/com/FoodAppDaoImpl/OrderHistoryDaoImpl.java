package com.FoodAppDaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.FoodAppDao.OrderHistoryDAO;
import com.FoodAppModel.OrderHistoryModel;
import com.dao.dbutil.GetConnection;

public class OrderHistoryDaoImpl implements OrderHistoryDAO{
	
	private static Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	ArrayList<OrderHistoryModel> orderHistory=new ArrayList<OrderHistoryModel>();
	private ResultSet result;
	private static final String INSERT="INSERT INTO orderhistory(orderHistoryId,orderId,userId,totalAmount,status) VALUES(?,?,?,?,?)";
	private static final String FETCHALL="select * from orderhistory";
	private static final String FETCHONE="select * from orderhistory where orderHistoryId=?";
	private static final String UPDATE="update orderhistory set status=? where orderHistoryId=?";
	private static final String DELETE="delete from orderhistory where orderHistoryId=?";
	
	static {
		con=GetConnection.connect();
	}

	@Override
	public int insertData(OrderHistoryModel u) {
		try {
			pstmt=con.prepareStatement(INSERT);
			
			pstmt.setInt(1, u.getOrderHistoryId());
			pstmt.setInt(2,u.getOrderId());
			pstmt.setInt(3, u.getUserId());
			pstmt.setInt(4, u.getTotalAmount());
			pstmt.setString(5, u.getStatus());
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<OrderHistoryModel> fetchAll() {
		try {
			stmt=con.createStatement();
			result=stmt.executeQuery(FETCHALL);
			while(result.next()) {
				orderHistory.add(new OrderHistoryModel(result.getInt("orderHistoryId"),result.getInt("orderId"),result.getInt("userId"),result.getInt("totalAmount"),result.getString("status")));
			}
			return orderHistory;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void fetchOne(int orderHistoryId) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, orderHistoryId);
			result=pstmt.executeQuery();
			while(result.next()) {
				System.out.println(result.getInt("orderHistoryId")+"   "+result.getInt("orderId")+"   "+result.getInt("userId")+"    "+result.getInt("totalAmount")+"    "+result.getString("status"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	@Override
	public int update(int orderHistoryId, String status) {

		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(2, orderHistoryId);
			pstmt.setString(1, status);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(int orderHistoryId) {
		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, orderHistoryId);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}

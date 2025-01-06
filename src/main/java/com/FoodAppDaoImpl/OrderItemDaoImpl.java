package com.FoodAppDaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.FoodAppDao.OrderItemDAO;
import com.FoodAppModel.OrderItemModel;
import com.dao.dbutil.GetConnection;

public class OrderItemDaoImpl implements OrderItemDAO {
	
	private static Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	ArrayList<OrderItemModel> orderItems=new ArrayList<OrderItemModel>();
	private ResultSet result;
	private static final String INSERT="INSERT INTO orderItems(orderItemId,orderId,menuId,quantity,itemTotal) VALUES(?,?,?,?,?)";
	private static final String FETCHALL="select * from orderItems";
	private static final String FETCHONE="select * from orderItems where orderItemId=?";
	private static final String UPDATE="update orderItems set quantity=? where orderItemId=?";
	private static final String DELETE="delete from orderItems where orderItemId=?";
	
	static {
		con=GetConnection.connect();
	}

	@Override
	public int insertData(OrderItemModel u) {
		try {
			pstmt=con.prepareStatement(INSERT);
			
			pstmt.setInt(1, u.getOrderItemId());
			pstmt.setInt(2,u.getOrderId());
			pstmt.setInt(3, u.getMenuId());
			pstmt.setInt(4, u.getQuantity());
			pstmt.setInt(5, u.getItemTotal());
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<OrderItemModel> fetchAll() {
		try {
			stmt=con.createStatement();
			result=stmt.executeQuery(FETCHALL);
			while(result.next()) {
				orderItems.add(new OrderItemModel(result.getInt("orderItemId"),result.getInt("orderId"),result.getInt("menuId"),result.getInt("quantity"),result.getInt("itemTotal")));
			}
			return orderItems;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void fetchOne(int orderItemId) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, orderItemId);
			result=pstmt.executeQuery();
			while(result.next()) {
				System.out.println(result.getInt("orderItemId")+"   "+result.getInt("orderId")+"   "+result.getInt("menuId")+"    "+result.getInt("quantity")+"    "+result.getInt("itemTotal"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	@Override
	public int update(int orderItemId, int quantity) {
		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(2, orderItemId);
			pstmt.setInt(1,quantity );
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(int orderItemId) {

		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, orderItemId);
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	

}

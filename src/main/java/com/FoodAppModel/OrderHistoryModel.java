package com.FoodAppModel;

public class OrderHistoryModel {
	
	private int orderHistoryId;
	private int orderId;
	private int userId;
	private int totalAmount;
	private String status;
	
	public int getOrderHistoryId() {
		return orderHistoryId;
	}
	public void setOrderHistoryId(int orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public OrderHistoryModel(int orderHistoryId, int orderId, int userId, int totalAmount, String status) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.orderId = orderId;
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.status = status;
	}
	@Override
	public String toString() {
		return orderHistoryId + "   " + orderId + "   " + userId
				+ "   " + totalAmount + "   " + status;
	}
	
	

}

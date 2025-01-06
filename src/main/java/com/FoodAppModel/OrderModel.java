package com.FoodAppModel;

public class OrderModel {
	
	private int orderId;
	private int userId;
	private int restaurantId;
	private int totalAmmount;
	private String status;
	private String paymentMode;
	
	
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
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public int getTotalAmmount() {
		return totalAmmount;
	}
	public void setTotalAmmount(int totalAmmount) {
		this.totalAmmount = totalAmmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public OrderModel(int orderId, int userId, int restaurantId, int totalAmmount, String status, String paymentMode) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.totalAmmount = totalAmmount;
		this.status = status;
		this.paymentMode = paymentMode;
	}
	@Override
	public String toString() {
		return orderId + "   " + userId + "   " + restaurantId
				+ "   " + totalAmmount + "   " + status + "   " + paymentMode;
	}
	
	
	
	
	
	

}

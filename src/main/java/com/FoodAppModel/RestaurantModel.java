package com.FoodAppModel;

public class RestaurantModel {

	private int restaurantId;
	private String name;
	private String cuisineType;
	private int deliveryTime;
	private float ratings;
	private boolean isActive;
	private String imagePath;
	
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCuisineType() {
		return cuisineType;
	}
	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}
	public int getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public float getRatings() {
		return ratings;
	}
	public void setRating(float ratings) {
		this.ratings = ratings;
	}
	public boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public RestaurantModel(int restaurantId, String name, String cuisineType, int deliveryTime, float ratings,
			boolean isActive, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.ratings = ratings;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return restaurantId + "   " + name + "   " + cuisineType
				+ "   " + deliveryTime + "    " + ratings + "    " + isActive + "   "
				+ imagePath;
	}
	
	
	
	
}

package com.FoodAppModel;

public class MenuModel {
	
	private int menuId;
	private int restaurantId;
	private String name;
	private String description;
	private int price;
	private String imagePath;
	private boolean isAvailable;
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public MenuModel(int menuId, int restaurantId, String name, String description, int price,
			boolean isAvailable,String imagePath) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.name = name;
		this.description = description;
		this.price = price;
		this.isAvailable=isAvailable;
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return menuId + "   " + restaurantId + "   " + name + "   "
				+ description + "   " + price + "   " +isAvailable+"    "+ imagePath;
	}
	
	

}

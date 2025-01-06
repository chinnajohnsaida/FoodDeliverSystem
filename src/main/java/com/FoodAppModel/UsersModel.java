package com.FoodAppModel;

public class UsersModel {
	private int userId;
	private String name;
	private String password;
	private String address;
	private String email;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public UsersModel() {
		
	}
	
	public UsersModel(int userId,String name,String password,String email,String address) {
		this.userId=userId;
		this.name=name;
		this.password=password;
		this.address=address;
		this.email=email;
	}
	@Override
	public String toString() {
		return  userId  +"     "+ name +"    " + password + "   " + email
				+"   " + address  ;
	}
	
	public UsersModel(String name,String password,String email,String address) {
		this.name=name;
		this.password=password;
		this.address=address;
		this.email=email;
	}
	
}
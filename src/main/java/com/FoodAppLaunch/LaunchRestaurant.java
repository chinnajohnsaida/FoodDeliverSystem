package com.FoodAppLaunch;

import java.util.Scanner;

import com.FoodAppDaoImpl.RestaurantDaoImpl;
import com.FoodAppModel.RestaurantModel;

public class LaunchRestaurant {
	
	private static RestaurantDaoImpl imp=new RestaurantDaoImpl();

	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		int RestaurantId;
		String name;
		String cuisineType;
		int deliveryTime;
		float ratings;
		boolean isActive;
		String imagePath;
		
		
		System.out.println("Welcome to the Restaurant table. Select the below options you want to perform:");
		System.out.println("1.  Insert the data into the Restaurant\n"
				+"2.  Fetch all the data from Restaurant\n"
				+"3.  Fetch particular data from Restaurant\n"
				+"4.  Update particular data in Restaurant\n"
				+"5.  Delete particular row from Restaurant");
		
		int n=scanner.nextInt();
		scanner.nextLine();
		
		switch(n) {
		
		case 1:
			System.out.println("Enter the RestaurantId:");
			RestaurantId=scanner.nextInt();
			scanner.nextLine();
			System.out.println("Enter the name:");
			name=scanner.nextLine();
			System.out.println("Enter the cuisineType:");
			cuisineType=scanner.nextLine();
			System.out.println("Enter the deliveryTime:");
			deliveryTime=scanner.nextInt();
			System.out.println("Enter the ratings:");
			ratings=scanner.nextFloat();
			System.out.println("Enter the isActive:");
			isActive=scanner.nextBoolean();
			scanner.nextLine();
			System.out.println("Enter the imagePath:");
			imagePath=scanner.nextLine();
			
			RestaurantModel restaurant=new RestaurantModel(RestaurantId,name,cuisineType,deliveryTime,ratings,isActive,imagePath);
			
			if(imp.insertData(restaurant)!=0) {
				System.out.println("Data inserted into Restaurant successfully");
			}
			else {
				System.out.println("Data insertion into Restaurant failed");
			}
			break;
			
		case 2:
			for(RestaurantModel p:imp.fetchAll()) {
				System.out.println(p);
			}
			break;
			
		case 3:
			System.out.println("Enter the id whose data you want:");
			RestaurantId=scanner.nextInt();
			imp.fetchOne(RestaurantId);
			break;
			
		case 4:
			System.out.println("Enter the id of Restaurant whose data you want to update:");
			RestaurantId=scanner.nextInt();
			scanner.nextLine();
			System.out.println("Enter the new avialability");
			isActive=scanner.nextBoolean();
			scanner.nextLine();
			if(imp.update(RestaurantId,isActive)!=0) {
				System.out.println("Data updated successfully");
			}
			else {
				System.out.println("Data updation failed");
			}
			break;
			
		case 5:
			System.out.println("Enter the id whose data you want to delete");
			RestaurantId=scanner.nextInt();
			if(imp.delete(RestaurantId)!=0) {
				System.out.println("Data updated successfully");
			}
			else {
				System.out.println("Data updation failed");
			}
			break;
		}
		scanner.close();
		System.out.println("Operation finished");

	}

}

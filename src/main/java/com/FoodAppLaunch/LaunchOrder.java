package com.FoodAppLaunch;

import java.util.Scanner;

import com.FoodAppDaoImpl.OrderDaoImpl;
import com.FoodAppModel.OrderModel;

public class LaunchOrder {
	private static OrderDaoImpl imp=new OrderDaoImpl();

	public static void main(String[] args) {
		
		Scanner scanner=new Scanner(System.in);
		
		int orderId;
		int userId;
		int restaurantId;
		int totalAmmount;
		String status;
		String paymentMode;
		
		System.out.println("Welcome to the order table. Select the below options you want to perform:");
		System.out.println("1.  Insert the data into the orders\n"
				+"2.  Fetch all the data from orders\n"
				+"3.  Fetch particular data from orders\n"
				+"4.  Update particular data in orders\n"
				+"5.  Delete particular row from orders");
		
		int n=scanner.nextInt();
		scanner.nextLine();
		
		switch(n) {
		
		case 1:
			System.out.println("Enter the OrderId:");
			orderId=scanner.nextInt();
			System.out.println("Enter the userId:");
			userId=scanner.nextInt();
			System.out.println("Enter the restaurantId:");
			restaurantId=scanner.nextInt();
			System.out.println("Enter the totalAmmount:");
			totalAmmount=scanner.nextInt();
			scanner.nextLine();
			System.out.println("Enter the status:");
			status=scanner.nextLine();
			System.out.println("Enter the paymentMode:");
			paymentMode=scanner.nextLine();
			
			
			OrderModel orders=new OrderModel(orderId,userId,restaurantId,totalAmmount,status,paymentMode);
			
			if(imp.insertData(orders)!=0) {
				System.out.println("Data inserted into Orders successfully");
			}
			else {
				System.out.println("Data insertion into Orders failed");
			}
			break;
			
		case 2:
			for(OrderModel p:imp.fetchAll()) {
				System.out.println(p);
			}
			break;
			
		case 3:
			System.out.println("Enter the id whose data you want:");
			orderId=scanner.nextInt();
			imp.fetchOne(orderId);
			break;
			
		case 4:
			System.out.println("Enter the id of Orders whose data you want to update:");
			orderId=scanner.nextInt();
			scanner.nextLine();
			System.out.println("Enter the new status");
			status=scanner.nextLine();
			if(imp.update(orderId,status)!=0) {
				System.out.println("Data updated successfully");
			}
			else {
				System.out.println("Data updation failed");
			}
			break;
			
		case 5:
			System.out.println("Enter the id whose data you want to delete");
			orderId=scanner.nextInt();
			if(imp.delete(orderId)!=0) {
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

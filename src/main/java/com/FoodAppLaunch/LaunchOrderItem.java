package com.FoodAppLaunch;

import java.util.Scanner;

import com.FoodAppDaoImpl.OrderItemDaoImpl;
import com.FoodAppModel.OrderItemModel;

public class LaunchOrderItem {
	
	private static OrderItemDaoImpl imp=new OrderItemDaoImpl();

	public static void main(String[] args) {
		
		Scanner scanner=new Scanner(System.in);
		
		 int orderItemId;
		 int orderId;
		 int menuId;
		 int quantity;
		 int itemTotal;
		 
		 System.out.println("Welcome to the orderItem table. Select the below options you want to perform:");
			System.out.println("1.  Insert the data into the orderItem\n"
					+"2.  Fetch all the data from orderItem\n"
					+"3.  Fetch particular data from orderItem\n"
					+"4.  Update particular data in orderItem\n"
					+"5.  Delete particular row from orderItem");
			
			int n=scanner.nextInt();
			scanner.nextLine();
			
			switch(n) {
			
			case 1:
				System.out.println("Enter the OrderItemId:");
				orderItemId=scanner.nextInt();
				System.out.println("Enter the orderId:");
				orderId=scanner.nextInt();
				System.out.println("Enter the menuId:");
				menuId=scanner.nextInt();
				System.out.println("Enter the quantity:");
				quantity=scanner.nextInt();
				System.out.println("Enter the ietem total:");
				itemTotal=scanner.nextInt();
				
				
				OrderItemModel orderItems=new OrderItemModel(orderItemId,orderId,menuId,quantity,itemTotal);
				
				if(imp.insertData(orderItems)!=0) {
					System.out.println("Data inserted into OrderItemss successfully");
				}
				else {
					System.out.println("Data insertion into OrderItems failed");
				}
				break;
				
			case 2:
				for(OrderItemModel p:imp.fetchAll()) {
					System.out.println(p);
				}
				break;
				
			case 3:
				System.out.println("Enter the OrderIdid whose data you want:");
				orderId=scanner.nextInt();
				imp.fetchOne(orderId);
				break;
				
			case 4:
				System.out.println("Enter the id of OrderItems whose data you want to update:");
				orderItemId=scanner.nextInt();
				System.out.println("Enter the new quantity");
				quantity=scanner.nextInt();
				if(imp.update(orderItemId,quantity)!=0) {
					System.out.println("Data updated successfully");
				}
				else {
					System.out.println("Data updation failed");
				}
				break;
				
			case 5:
				System.out.println("Enter the id whose data you want to delete");
				orderItemId=scanner.nextInt();
				if(imp.delete(orderItemId)!=0) {
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

package com.FoodProject.Controller;

import java.io.IOException;
import java.util.ArrayList;

import com.FoodAppDaoImpl.RestaurantDaoImpl;
import com.FoodAppModel.RestaurantModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


//@WebServlet("/GetAllRestaurants")
public class GetAllRestaurants extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 Cookie[] ck=req.getCookies();
		 
		 if(ck[0].getValue()!=null) {
			 RestaurantDaoImpl rdi=new RestaurantDaoImpl();
			 
			 ArrayList<RestaurantModel> rList=rdi.fetchAll();
			 HttpSession session = req.getSession();
			 session.setAttribute("RestaurantList", rList);
			 resp.sendRedirect("home.jsp");
		 }
		 else {
			 resp.sendRedirect("login.jsp");
		 }
	}
}
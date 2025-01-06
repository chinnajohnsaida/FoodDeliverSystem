package com.FoodProject.Controller;

import java.io.IOException;
import java.util.ArrayList;

import com.FoodAppDaoImpl.MenuDaoImpl;
import com.FoodAppModel.MenuModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MenuServlet
 *
 */
@WebServlet("/Menu")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int restaurantId=Integer.parseInt(req.getParameter("restaurantId"));
		
		HttpSession session = req.getSession();
		session.setAttribute("john", restaurantId);
		MenuDaoImpl mdi=new MenuDaoImpl();
		ArrayList<MenuModel> mList=mdi.fetchMenuByRestaurant(restaurantId);
		session.setAttribute("MenuList", mList);
		req.getRequestDispatcher("menu.jsp").forward(req, resp);
	}
}
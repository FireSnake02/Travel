package cn.edu.songmx.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.RestaurantBean;
import cn.edu.songmx.dao.RestaurantDao;

public class RestaurantAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("restaurant-add.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RestaurantBean restaurant = new RestaurantBean();
		restaurant.setName(request.getParameter("name"));
		if (!request.getParameter("rating").isEmpty()) {
			String parameter = request.getParameter("rating");
			Float rating = Float.parseFloat(parameter);
			restaurant.setRating(rating);
		}
		restaurant.setAddress(request.getParameter("address"));
		restaurant.setPhone_number(request.getParameter("phone"));
		restaurant
				.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date startDate = null;
		try {
			startDate = dateFormat.parse(request.getParameter("start_date"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
		restaurant.setStart_date(sqlStartDate);
		if (!request.getParameter("image_url").isEmpty()) {
			restaurant.setImage_url(request.getParameter("image_url"));
		} else {
			restaurant.setImage_url("static/image/404.jpg");
		}

		RestaurantDao restaurantDao = new RestaurantDao();
		if (restaurantDao.addRestaurant(restaurant) >= 1) {
			request.setAttribute("errorMsg", "添加成功，刷新页面后可见");
		} else {
			request.setAttribute("errorMsg", "添加失败");
		}
		doGet(request, response);
	}
}

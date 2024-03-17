package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.RestaurantBean;
import cn.edu.songmx.dao.RestaurantDao;

public class RestaurantListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RestaurantDao dao = new RestaurantDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<RestaurantBean> restaurants = dao.queryAllRestaurants();
		request.setAttribute("restaurants", restaurants);
		request.getRequestDispatcher("restaurant-list.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("search") == 0) {
			String searchUserId = request.getParameter("searchUserId");
			List<RestaurantBean> searchRestaurants = dao.queryRestaurantByUserId(Integer
					.parseInt(searchUserId));
			if (searchRestaurants == null || searchRestaurants.isEmpty()) {
				request.setAttribute("errorMsg", "没有符合要求的数据");
			} else {
				request.setAttribute("searchRestaurants", searchRestaurants);
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("remove") == 0) {
			int restaurant_id = Integer.parseInt(request
					.getParameter("restaurant_id"));
			if (dao.deleteRestaurant(restaurant_id) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("removeAll") == 0) {
			String restaurantIdListStr = request.getParameter("restaurantIdList");
			String[] restaurantIds = restaurantIdListStr.split(",");
			int[] restaurantIdList = new int[restaurantIds.length];
			for (int i = 0; i < restaurantIds.length; i++) {
				restaurantIdList[i] = Integer.parseInt(restaurantIds[i]);
			}
			if (dao.deleteAllRestaurant(restaurantIdList) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		}
		doGet(request, response);
	}

}

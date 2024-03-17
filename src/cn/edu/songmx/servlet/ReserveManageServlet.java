package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.songmx.bean.AttractionBean;
import cn.edu.songmx.bean.HotelBean;
import cn.edu.songmx.bean.RestaurantBean;
import cn.edu.songmx.dao.AttractionDao;
import cn.edu.songmx.dao.HotelDao;
import cn.edu.songmx.dao.RestaurantDao;

public class ReserveManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (request.getParameter("headClick") != null
				&& request.getParameter("headClick") != "") {
			session.setAttribute("headClick", request.getParameter("headClick"));
		}
		request.setAttribute("headClick", session.getAttribute("headClick"));
		if (session.getAttribute("headClick").equals("1")) {
			RestaurantDao dao = new RestaurantDao();
			List<RestaurantBean> restaurant = dao
					.queryRestaurantByUserId((Integer) session
							.getAttribute("user_id"));
			request.setAttribute("restaurant", restaurant);
		} else if (session.getAttribute("headClick").equals("2")) {
			HotelDao dao = new HotelDao();
			List<HotelBean> hotel = dao.queryHotelByUserId((Integer) session
					.getAttribute("user_id"));
			request.setAttribute("hotel", hotel);
		} else if (session.getAttribute("headClick").equals("3")) {
			AttractionDao dao = new AttractionDao();
			List<AttractionBean> attraction = dao
					.queryAttractionByUserId((Integer) session
							.getAttribute("user_id"));
			request.setAttribute("attraction", attraction);
		}
		request.getRequestDispatcher("reserve-manage.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int index = Integer.parseInt(request.getParameter("index"));
		String headClick = request.getParameter("headClick");
		if (headClick.equals("1")) {
			RestaurantDao dao = new RestaurantDao();
			if (dao.deleteRestaurant(index) >= 1) {
				request.setAttribute("successMsg", "取消预定成功");
			} else {
				request.setAttribute("errorMsg", "取消预定失败");
			}
		} else if (headClick.equals("2")) {
			HotelDao dao = new HotelDao();
			if (dao.deleteHotel(index) >= 1) {
				request.setAttribute("successMsg", "取消预定成功");
			} else {
				request.setAttribute("errorMsg", "取消预定失败");
			}
		} else if (headClick.equals("3")) {
			AttractionDao dao = new AttractionDao();
			if (dao.deleteAttraction(index) >= 1) {
				request.setAttribute("successMsg", "取消预定成功");
			} else {
				request.setAttribute("errorMsg", "取消预定失败");
			}
		}
		doGet(request, response);
	}
}

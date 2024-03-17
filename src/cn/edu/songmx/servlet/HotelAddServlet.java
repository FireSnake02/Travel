package cn.edu.songmx.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.HotelBean;
import cn.edu.songmx.dao.HotelDao;

public class HotelAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("hotel-add.jsp")
				.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HotelBean hotel = new HotelBean();
		hotel.setName(request.getParameter("name"));
		if (!request.getParameter("rating").isEmpty()) {
			String parameter = request.getParameter("rating");
			Float rating = Float.parseFloat(parameter);
			hotel.setRating(rating);
		}
		hotel.setAddress(request.getParameter("address"));
		hotel.setPhone_number(request.getParameter("phone"));
		hotel.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date startDate = null;
		try {
			startDate = dateFormat.parse(request.getParameter("start_date"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
		hotel.setStart_date(sqlStartDate);
		if (!request.getParameter("image_url").isEmpty()) {
			hotel.setImage_url(request.getParameter("image_url"));
		} else {
			hotel.setImage_url("static/image/404.jpg");
		}

		HotelDao hotelDao = new HotelDao();
		if (hotelDao.addHotel(hotel) >= 1) {
			request.setAttribute("errorMsg", "添加成功，刷新页面后可见");
		} else {
			request.setAttribute("errorMsg", "添加失败");
		}
		doGet(request, response);
	}
}

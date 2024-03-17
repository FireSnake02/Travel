package cn.edu.songmx.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.songmx.api.VerificationApi;
import cn.edu.songmx.bean.AttractionBean;
import cn.edu.songmx.bean.HotelBean;
import cn.edu.songmx.bean.RestaurantBean;
import cn.edu.songmx.dao.AttractionDao;
import cn.edu.songmx.dao.HotelDao;
import cn.edu.songmx.dao.RestaurantDao;

public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		request.setAttribute("reserveRestaurantName",
				session.getAttribute("reserveRestaurantName"));
		request.setAttribute("reserveRestaurantRating",
				session.getAttribute("reserveRestaurantRating"));
		request.setAttribute("reserveRestaurantAddress",
				session.getAttribute("reserveRestaurantAddress"));
		request.setAttribute("reserveRestaurantPhone_number",
				session.getAttribute("reserveRestaurantPhone_number"));

		request.setAttribute("reserveHotelName",
				session.getAttribute("reserveHotelName"));
		request.setAttribute("reserveHotelRating",
				session.getAttribute("reserveHotelRating"));
		request.setAttribute("reserveHotelAddress",
				session.getAttribute("reserveHotelAddress"));
		request.setAttribute("reserveHotelPhone_number",
				session.getAttribute("reserveHotelPhone_number"));

		request.setAttribute("reserveAttractionName",
				session.getAttribute("reserveAttractionName"));
		request.setAttribute("reserveAttractionTicketPrice",
				session.getAttribute("reserveAttractionTicketPrice"));
		request.setAttribute("reserveAttractionAddress",
				session.getAttribute("reserveAttractionAddress"));
		request.setAttribute("reserveAttractionOpenTime",
				session.getAttribute("reserveAttractionOpenTime"));
		request.getRequestDispatcher("reserve.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("sendMessage") == 0) {
			HttpSession session = request.getSession();
			int number = VerificationApi.sendLetter((String) session
					.getAttribute("phone_number"));
			if (number > 1) {
				session.setAttribute("number", number);
				request.setAttribute("successMsg", "验证码已成功发送");
			} else {
				request.setAttribute("errorMsg", "验证码发送失败");
			}
			doGet(request, response);
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("confirm") == 0) {
			HttpSession session = request.getSession();
			String number = "";
			Object numberObj = session.getAttribute("number");
			if (numberObj != null) {
				number = numberObj.toString().trim();
			}
			String verification = request.getParameter("verification").trim();
			if (number.equals(verification)) {
				if ((Integer) session.getAttribute("reserveType") == 1) {
					RestaurantBean restaurant = new RestaurantBean();
					restaurant.setName(session.getAttribute(
							"reserveRestaurantName").toString());
					restaurant.setRating((float) session
							.getAttribute("reserveRestaurantRating"));
					restaurant.setAddress(session.getAttribute(
							"reserveRestaurantAddress").toString());
					restaurant.setPhone_number(session.getAttribute(
							"reserveRestaurantPhone_number").toString());
					restaurant.setUser_id((Integer) session
							.getAttribute("user_id"));
					restaurant.setImage_url(session.getAttribute(
							"reserveRestaurantImage_url").toString());
					String dateString = (String) session
							.getAttribute("start_date");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date startDate = null;
					try {
						startDate = new Date(sdf.parse(dateString).getTime());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					restaurant.setStart_date(startDate);

					RestaurantDao dao = new RestaurantDao();
					if (dao.addRestaurant(restaurant) >= 1) {
						session.setAttribute("reserveSuccess", "预定成功");
						response.sendRedirect("RecommendationServlet");
					} else {
						request.setAttribute("errorMsg", "预定失败");
						doGet(request, response);
					}
				} else if ((Integer) session.getAttribute("reserveType") == 2) {
					HotelBean hotel = new HotelBean();
					hotel.setName(session.getAttribute("reserveHotelName")
							.toString());
					hotel.setRating((float) session
							.getAttribute("reserveHotelRating"));
					hotel.setAddress(session
							.getAttribute("reserveHotelAddress").toString());
					hotel.setPhone_number(session.getAttribute(
							"reserveHotelPhone_number").toString());
					hotel.setImage_url(session.getAttribute(
							"reserveHotelImage_url").toString());
					hotel.setUser_id((Integer) session.getAttribute("user_id"));
					String dateString = (String) session
							.getAttribute("start_date");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date startDate = null;
					try {
						startDate = new Date(sdf.parse(dateString).getTime());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					hotel.setStart_date(startDate);

					HotelDao dao = new HotelDao();
					if (dao.addHotel(hotel) >= 1) {
						session.setAttribute("reserveSuccess", "预定成功");
						response.sendRedirect("RecommendationServlet");
					} else {
						request.setAttribute("errorMsg", "预定失败");
						doGet(request, response);
					}
				} else if ((Integer) session.getAttribute("reserveType") == 3) {
					AttractionBean attraction = new AttractionBean();
					attraction.setName(session.getAttribute(
							"reserveAttractionName").toString());
					String ticketPriceStr = "0.0";
					if (session.getAttribute("reserveAttractionTicketPrice") != "免费") {
						ticketPriceStr = (String) session
								.getAttribute("reserveAttractionTicketPrice");
					}
					float ticketPrice = Float.parseFloat(ticketPriceStr);
					attraction.setEntrance_fee(ticketPrice);
					attraction.setOpen_time(session.getAttribute(
							"reserveAttractionOpenTime").toString());
					attraction.setAddress(session.getAttribute(
							"reserveAttractionAddress").toString());
					attraction.setImage_url(session.getAttribute(
							"reserveAttractionImage_url").toString());
					attraction.setUser_id((Integer) session
							.getAttribute("user_id"));
					String dateString = (String) session
							.getAttribute("start_date");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date startDate = null;
					try {
						startDate = new Date(sdf.parse(dateString).getTime());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					attraction.setStart_date(startDate);

					AttractionDao dao = new AttractionDao();
					if (dao.addAttraction(attraction) >= 1) {
						session.setAttribute("reserveSuccess", "预定成功");
						response.sendRedirect("RecommendationServlet");
					} else {
						request.setAttribute("errorMsg", "预定失败");
						doGet(request, response);
					}
				}
			} else {
				request.setAttribute("errorMsg", "验证码验证失败");
				doGet(request, response);
			}
		}
	}
}

package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import cn.edu.songmx.bean.CommentBean;
import cn.edu.songmx.dao.CommentDao;

public class RecommendationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String successMsg = (String) request.getSession().getAttribute(
				"reserveSuccess");
		if (successMsg != null) {
			request.setAttribute("successMsg", successMsg);
		}
		HttpSession session = request.getSession();
		session.removeAttribute("reserveSuccess");
		try {
			// 获取饭店信息
			JSONArray restaurant = (JSONArray) request.getSession()
					.getAttribute("restaurant");
			ArrayList<String> restaurantNames = new ArrayList<>();
			ArrayList<String> restaurantTels = new ArrayList<>();
			ArrayList<String> restaurantimageUrls = new ArrayList<>();
			ArrayList<Double> restaurantratings = new ArrayList<>();
			ArrayList<String> restaurantaddresses = new ArrayList<>();

			if (restaurant != null && restaurant.length() > 0) {
				for (int i = 0; i < restaurant.length(); i++) {
					JSONObject restaurantObj = restaurant.getJSONObject(i);

					String name = restaurantObj.getString("name");
					String contactNumber = restaurantObj.optString("tel", "");
					double rating = restaurantObj.getJSONObject("biz_ext")
							.optDouble("rating", 0.0);
					String address = restaurantObj.getString("address");
					JSONArray photos = restaurantObj.getJSONArray("photos");
					String imageUrl = "";
					if (photos.length() > 0) { // 只处理有图片的餐厅
						JSONObject photo = photos.getJSONObject(0); // 获取第一张图片
						imageUrl = photo.getString("url");
					}

					restaurantNames.add(name);

					if (contactNumber.contains("[]")) {
						restaurantTels.add("暂无联系电话");
					} else {
						restaurantTels.add(contactNumber);
					}

					if (imageUrl.isEmpty()) {
						restaurantimageUrls.add("static/image/404.jpg");
					} else {
						restaurantimageUrls.add(imageUrl);
					}

					restaurantratings.add(rating);
					restaurantaddresses.add(address);
				}
			}
			request.setAttribute("restaurantNames", restaurantNames);
			request.setAttribute("restaurantTels", restaurantTels);
			request.setAttribute("restaurantimageUrls", restaurantimageUrls);
			request.setAttribute("restaurantratings", restaurantratings);
			request.setAttribute("restaurantaddresses", restaurantaddresses);

			// 获取宾馆信息
			JSONArray hotel = (JSONArray) request.getSession().getAttribute(
					"hotel");
			ArrayList<String> hotelNames = new ArrayList<>();
			ArrayList<String> hotelTels = new ArrayList<>();
			ArrayList<String> hotelimageUrls = new ArrayList<>();
			ArrayList<Double> hotelratings = new ArrayList<>();
			ArrayList<String> hoteladdresses = new ArrayList<>();
			if (hotel != null && hotel.length() > 0) {
				for (int i = 0; i < hotel.length(); i++) {
					JSONObject hotelObj = hotel.getJSONObject(i);
					String name = hotelObj.getString("name");
					String contactNumber = hotelObj.optString("tel", "");
					double rating = hotelObj.getJSONObject("biz_ext")
							.optDouble("rating", 0.0);
					String address = hotelObj.getString("address");

					JSONArray photos = hotelObj.getJSONArray("photos");
					String imageUrl = "";
					if (photos.length() > 0) { // 只处理有图片的餐厅
						JSONObject photo = photos.getJSONObject(0); // 获取第一张图片
						imageUrl = photo.getString("url");
					}

					hotelNames.add(name);

					if (contactNumber.contains("[]")) {
						hotelTels.add("暂无联系电话");
					} else {
						hotelTels.add(contactNumber);
					}

					if (imageUrl.isEmpty()) {
						hotelimageUrls.add("static/image/404.jpg");
					} else {
						hotelimageUrls.add(imageUrl);
					}

					hotelratings.add(rating);
					hoteladdresses.add(address);
				}
			}
			request.setAttribute("hotelNames", hotelNames);
			request.setAttribute("hotelTels", hotelTels);
			request.setAttribute("hotelimageUrls", hotelimageUrls);
			request.setAttribute("hotelratings", hotelratings);
			request.setAttribute("hoteladdresses", hoteladdresses);

			// 获取景点信息
			JSONArray attraction = (JSONArray) request.getSession()
					.getAttribute("attraction");
			ArrayList<String> attractionNames = new ArrayList<>();
			ArrayList<String> attractionAddress = new ArrayList<>();
			ArrayList<String> attractionimageUrls = new ArrayList<>();
			ArrayList<String> attractionTicketPrice = new ArrayList<>();
			ArrayList<String> attractionOpenTime = new ArrayList<>();
			if (attraction != null && attraction.length() > 0) {
				for (int i = 0; i < attraction.length(); i++) {
					JSONObject attractionObj = attraction.getJSONObject(i);
					String name = attractionObj.getString("name");
					String address = attractionObj.getString("address");
					String OpenTime = attractionObj.optString("opentime");
					String TicketPrice = attractionObj.optString("price");
					JSONArray photos = attractionObj.getJSONArray("photos");
					String imageUrl = "";
					if (photos.length() > 0) {
						JSONObject photo = photos.getJSONObject(0);
						imageUrl = photo.getString("url");
					}

					attractionNames.add(name);
					if (TicketPrice.isEmpty()) {
						attractionTicketPrice.add("免费");
					} else {
						attractionTicketPrice.add(TicketPrice);
					}
					if (imageUrl.isEmpty()) {
						attractionimageUrls.add("static/image/404.jpg");
					} else {
						attractionimageUrls.add(imageUrl);
					}
					if (OpenTime.isEmpty()) {
						attractionOpenTime.add("暂无信息");
					} else {
						attractionOpenTime.add(OpenTime);
					}
					attractionAddress.add(address);
				}
			}
			request.setAttribute("attractionNames", attractionNames);
			request.setAttribute("attractionTicketPrice", attractionTicketPrice);
			request.setAttribute("attractionimageUrls", attractionimageUrls);
			request.setAttribute("attractionOpenTime", attractionOpenTime);
			request.setAttribute("attractionAddress", attractionAddress);
			request.getRequestDispatcher("recommendations.jsp").forward(
					request, response);
		} catch (Exception e) {
			request.setAttribute("infoMsg", "没有查到符合的信息哦");
			request.getRequestDispatcher("index.jsp")
					.forward(request, response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("comment") == 0) {
			CommentBean comment = new CommentBean();
			HttpSession session = request.getSession(false);
			comment.setTravel_plan_id((Integer) session
					.getAttribute("travel_plan_id"));
			comment.setUser_id((Integer) session.getAttribute("user_id"));
			comment.setComment_text(request.getParameter("inputComment"));
			comment.setRating(Double.valueOf(request.getParameter("starRating")));

			CommentDao dao = new CommentDao();
			if (dao.addComment(comment) >= 1) {
				request.setAttribute("successMsg", "评论成功");
				doGet(request, response);
			} else {
				request.setAttribute("infoMsg", "添加评论信息出错");
				doGet(request, response);
			}
		} else {
			if (Integer.parseInt(operationType.toString()) < 6) {
				// 获取饭店信息
				JSONArray restaurant = (JSONArray) request.getSession()
						.getAttribute("restaurant");
				ArrayList<String> restaurantNames = new ArrayList<>();
				ArrayList<String> restaurantTels = new ArrayList<>();
				ArrayList<Double> restaurantratings = new ArrayList<>();
				ArrayList<String> restaurantaddresses = new ArrayList<>();
				ArrayList<String> restaurantimageUrls = new ArrayList<>();
				
				if (restaurant != null && restaurant.length() > 0) {
					for (int i = 0; i < restaurant.length(); i++) {
						JSONObject restaurantObj = restaurant.getJSONObject(i);

						String name = restaurantObj.getString("name");
						String contactNumber = restaurantObj.optString("tel",
								"");
						double rating = restaurantObj.getJSONObject("biz_ext")
								.optDouble("rating", 0.0);
						String address = restaurantObj.getString("address");
						JSONArray photos = restaurantObj.getJSONArray("photos");
						String imageUrl = "";
						if (photos.length() > 0) { // 只处理有图片的餐厅
							JSONObject photo = photos.getJSONObject(0); // 获取第一张图片
							imageUrl = photo.getString("url");
						}
						
						restaurantNames.add(name);
						
						if (imageUrl.isEmpty()) {
							restaurantimageUrls.add("static/image/404.jpg");
						} else {
							restaurantimageUrls.add(imageUrl);
						}

						if (contactNumber.contains("[]")) {
							restaurantTels.add("暂无联系电话");
						} else {
							restaurantTels.add(contactNumber);
						}

						restaurantratings.add(rating);
						restaurantaddresses.add(address);
					}
				}

				HttpSession session = request.getSession();
				session.setAttribute("reserveType", 1);
				session.setAttribute("reserveRestaurantName", restaurantNames
						.get(Integer.parseInt(operationType.toString()) - 1));
				session.setAttribute(
						"reserveRestaurantRating",
						(float) restaurantratings.get(
								Integer.parseInt(operationType.toString()) - 1)
								.doubleValue());
				session.setAttribute("reserveRestaurantAddress",
						restaurantaddresses.get(Integer.parseInt(operationType
								.toString()) - 1));
				session.setAttribute("reserveRestaurantPhone_number",
						restaurantTels.get(Integer.parseInt(operationType
								.toString()) - 1));
				session.setAttribute("reserveRestaurantImage_url",
						restaurantimageUrls.get(Integer.parseInt(operationType
								.toString()) - 1));
				response.sendRedirect("ReserveServlet");
			} else if (Integer.parseInt(operationType.toString()) < 11) {
				JSONArray hotel = (JSONArray) request.getSession()
						.getAttribute("hotel");
				ArrayList<String> hotelNames = new ArrayList<>();
				ArrayList<String> hotelTels = new ArrayList<>();
				ArrayList<Double> hotelratings = new ArrayList<>();
				ArrayList<String> hoteladdresses = new ArrayList<>();
				ArrayList<String> hotelimageUrls = new ArrayList<>();
				if (hotel != null && hotel.length() > 0) {
					for (int i = 0; i < hotel.length(); i++) {
						JSONObject hotelObj = hotel.getJSONObject(i);
						String name = hotelObj.getString("name");
						String contactNumber = hotelObj.optString("tel", "");
						double rating = hotelObj.getJSONObject("biz_ext")
								.optDouble("rating", 0.0);
						String address = hotelObj.getString("address");

						JSONArray photos = hotelObj.getJSONArray("photos");
						String imageUrl = "";
						if (photos.length() > 0) { // 只处理有图片的餐厅
							JSONObject photo = photos.getJSONObject(0); // 获取第一张图片
							imageUrl = photo.getString("url");
						}
						
						hotelNames.add(name);

						if (contactNumber.contains("[]")) {
							hotelTels.add("暂无联系电话");
						} else {
							hotelTels.add(contactNumber);
						}
						
						if (imageUrl.isEmpty()) {
							hotelimageUrls.add("static/image/404.jpg");
						} else {
							hotelimageUrls.add(imageUrl);
						}

						hotelratings.add(rating);
						hoteladdresses.add(address);
					}
				}
				HttpSession session = request.getSession();
				session.setAttribute("reserveType", 2);
				session.setAttribute("reserveHotelName", hotelNames.get(Integer
						.parseInt(operationType.toString()) - 6));
				session.setAttribute("reserveHotelRating", (float) hotelratings
						.get(Integer.parseInt(operationType.toString()) - 6)
						.doubleValue());
				session.setAttribute("reserveHotelAddress", hoteladdresses
						.get(Integer.parseInt(operationType.toString()) - 6));
				session.setAttribute("reserveHotelPhone_number", hotelTels
						.get(Integer.parseInt(operationType.toString()) - 6));
				session.setAttribute("reserveHotelImage_url", hotelimageUrls
						.get(Integer.parseInt(operationType.toString()) - 6));
				response.sendRedirect("ReserveServlet");
			} else if (Integer.parseInt(operationType.toString()) < 16) {
				JSONArray attraction = (JSONArray) request.getSession()
						.getAttribute("attraction");
				ArrayList<String> attractionNames = new ArrayList<>();
				ArrayList<String> attractionAddress = new ArrayList<>();
				ArrayList<String> attractionTicketPrice = new ArrayList<>();
				ArrayList<String> attractionOpenTime = new ArrayList<>();
				ArrayList<String> attractionimageUrls = new ArrayList<>();
				if (attraction != null && attraction.length() > 0) {
					for (int i = 0; i < attraction.length(); i++) {
						JSONObject attractionObj = attraction.getJSONObject(i);
						String name = attractionObj.getString("name");
						String address = attractionObj.getString("address");
						String OpenTime = attractionObj.optString("opentime");
						String TicketPrice = attractionObj.optString("price");
						JSONArray photos = attractionObj.getJSONArray("photos");
						String imageUrl = "";
						if (photos.length() > 0) {
							JSONObject photo = photos.getJSONObject(0);
							imageUrl = photo.getString("url");
						}
						
						attractionNames.add(name);
						if (imageUrl.isEmpty()) {
							attractionimageUrls.add("static/image/404.jpg");
						} else {
							attractionimageUrls.add(imageUrl);
						}
						if (TicketPrice.isEmpty()) {
							attractionTicketPrice.add("免费");
						} else {
							attractionTicketPrice.add(TicketPrice);
						}
						if (OpenTime.isEmpty()) {
							attractionOpenTime.add("暂无信息");
						} else {
							attractionOpenTime.add(OpenTime);
						}
						attractionAddress.add(address);
					}
				}
				HttpSession session = request.getSession();
				session.setAttribute("reserveType", 3);
				session.setAttribute("reserveAttractionName", attractionNames
						.get(Integer.parseInt(operationType.toString()) - 11));
				session.setAttribute("reserveAttractionTicketPrice",
						attractionTicketPrice.get(Integer
								.parseInt(operationType.toString()) - 11));
				session.setAttribute("reserveAttractionAddress",
						attractionAddress.get(Integer.parseInt(operationType
								.toString()) - 11));
				session.setAttribute("reserveAttractionOpenTime",
						attractionOpenTime.get(Integer.parseInt(operationType
								.toString()) - 11));
				session.setAttribute("reserveAttractionImage_url",
						attractionimageUrls.get(Integer.parseInt(operationType
								.toString()) - 11));
				response.sendRedirect("ReserveServlet");
			}
		}
	}

}

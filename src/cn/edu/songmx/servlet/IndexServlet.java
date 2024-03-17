package cn.edu.songmx.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import cn.edu.songmx.api.AttractionApi;
import cn.edu.songmx.api.HotelApi;
import cn.edu.songmx.api.RestaurantApi;
import cn.edu.songmx.bean.CommentBean;
import cn.edu.songmx.bean.InterestConstants;
import cn.edu.songmx.bean.LocationConstants;
import cn.edu.songmx.bean.PlanBean;
import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.CommentDao;
import cn.edu.songmx.dao.PlanDao;
import cn.edu.songmx.dao.UserDao;

public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String phone_number = (String) session.getAttribute("phone_number");
		if (phone_number == null || phone_number.isEmpty()) {
			request.setAttribute("infoMsg", "请尽快绑定手机号，以免影响后续使用");
		}
		
		CommentDao commentDao = new CommentDao();
		List<CommentBean> commentList = commentDao.queryAllComments();
		request.setAttribute("commentList", commentList);
		
		UserDao userDao=new UserDao();
		List<UserBean> userList = new ArrayList<>(); 
		PlanDao planDao=new PlanDao();
		List<PlanBean> planList = new ArrayList<>();
		for(int i = 0;i<commentList.size();i++){
			userList.add(userDao.queryUserById(commentList.get(i).getUser_id()));
			planList.add(planDao.queryPlanById(commentList.get(i).getTravel_plan_id()));
		}
		request.setAttribute("userList", userList);
		request.setAttribute("planList", planList);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PlanBean plan = new PlanBean();
		plan.setDestination(request.getParameter("destination"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date startDate = null;
		try {
			startDate = dateFormat.parse(request.getParameter("start_date"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
		plan.setStart_date(sqlStartDate);
		plan.setInterests(request.getParameter("interests"));
		HttpSession session = request.getSession(false);
		Integer userId = (Integer) session.getAttribute("user_id");
		plan.setUser_id(userId);

		PlanDao dao = new PlanDao();
		if (dao.addPlan(plan) >= 1) {
			String apiKey = "914f8295f358fcc5a14e0ebaecd10615";
			RestaurantApi restaurantApi = new RestaurantApi(apiKey);
			HotelApi hotelApi = new HotelApi(apiKey);
			
			double[] coordinates = LocationConstants.CityCoordinates
					.getByCityName(request.getParameter("destination"));
			String interestCode = InterestConstants.Interest
					.getByInterestName(request.getParameter("interests"));

			double longitude = coordinates[0];
			double latitude = coordinates[1];
			int radius = 10000;
			int pageSize = 30;
			int pageNum = 1;
			String extensions = "all";
			int numberOfResults = 30;

			try {
				String keywords = "餐厅";
				String restaurantData = restaurantApi.search(longitude,
						latitude, radius, keywords, pageSize, pageNum,
						extensions);
				JSONObject jsonResult = new JSONObject(restaurantData);
				JSONArray pois = jsonResult.getJSONArray("pois");
				JSONArray restaurant = new JSONArray();

				if (pois.length() > 0) {
					for (int i = 0; i < pois.length(); i++) {
						JSONObject restaurantObj = pois.getJSONObject(i); // 获取每个餐厅的信息
						restaurant.put(restaurantObj);
					}
					request.getSession().setAttribute("restaurant", restaurant);
				} else {
					System.out.println("没有找到符合条件的餐厅。");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				String keywords = "宾馆";
				String hotelData = hotelApi.search(longitude, latitude, radius,
						keywords, pageSize, pageNum, extensions);
				JSONObject jsonResult = new JSONObject(hotelData);
				JSONArray pois = jsonResult.getJSONArray("pois");
				JSONArray hotel = new JSONArray();
				if (pois.length() > 0) {
					for (int i = 0; i < pois.length(); i++) {
						JSONObject hotelObj = pois.getJSONObject(i); // 获取每个餐厅的信息
						hotel.put(hotelObj);
					}
					request.getSession().setAttribute("hotel", hotel);
				} else {
					System.out.println("没有找到符合条件的宾馆。");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				AttractionApi sightseeingApi = new AttractionApi(apiKey);
				String resultJson = sightseeingApi.searchSightseeingByCategory(
						interestCode, longitude, latitude, radius);
				JSONObject jsonObject = new JSONObject(resultJson);
				JSONArray poisArray = jsonObject.getJSONArray("pois");
				JSONArray attraction = new JSONArray();
				int counter = 0;
				if (poisArray.length() > 0) {
					for (int i = 0; i < poisArray.length(); i++) {
						if (counter >= numberOfResults) {
							break;
						}
						JSONObject poiObject = poisArray.getJSONObject(i);
						attraction.put(poiObject);
						counter++;
					}
					request.getSession().setAttribute("attraction", attraction);
				} else {
					System.out.println("没有找到符合条件的景点。");
				}
			} catch (IOException | JSONException e) {
				e.printStackTrace();
			}
			
			session.setAttribute("destination", request.getParameter("destination"));
			session.setAttribute("travel_plan_id",dao.queryLastPlanId());
			session.setAttribute("start_date",request.getParameter("start_date"));
			response.sendRedirect("RecommendationServlet");
		}
		else {
			request.setAttribute("errorMsg", "添加失败");
			doGet(request, response);
		}
	}
}

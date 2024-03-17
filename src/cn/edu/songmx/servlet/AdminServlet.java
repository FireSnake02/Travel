package cn.edu.songmx.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.songmx.dao.AttractionDao;
import cn.edu.songmx.dao.CommentDao;
import cn.edu.songmx.dao.HotelDao;
import cn.edu.songmx.dao.PlanDao;
import cn.edu.songmx.dao.RestaurantDao;
import cn.edu.songmx.dao.UserDao;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserDao userDao = new UserDao();
		session.setAttribute("userCount", userDao.queryUsersCount());
		PlanDao planDao = new PlanDao();
		session.setAttribute("planCount", planDao.queryPlanCount());
		RestaurantDao restaurantDao = new RestaurantDao();
		session.setAttribute("restaurantCount",
				restaurantDao.queryRestaurantsCount());
		HotelDao hotelDao = new HotelDao();
		session.setAttribute("hotelCount", hotelDao.queryHotelsCount());
		AttractionDao attractionDao = new AttractionDao();
		session.setAttribute("attractionCount",
				attractionDao.queryAttractionsCount());
		CommentDao commentDao = new CommentDao();
		session.setAttribute("commentCount", commentDao.queryCommentsCount());

		List<String> dateList = new ArrayList<>();
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat targetSdf = new SimpleDateFormat("MM-dd");
		String currentDate = targetSdf.format(calendar.getTime());
		dateList.add(currentDate);
		for (int i = 1; i <= 6; i++) {
			calendar.add(Calendar.DATE, -1);
			String previousDate = targetSdf.format(calendar.getTime());
			dateList.add(previousDate);
		}
		session.setAttribute("dateList", dateList);

		List<String> dateList2 = new ArrayList<>();
		Calendar calendar2 = Calendar.getInstance();
		SimpleDateFormat targetSdf2 = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate2 = targetSdf2.format(calendar2.getTime());
		dateList2.add(currentDate2);
		for (int i = 1; i <= 6; i++) {
			calendar2.add(Calendar.DATE, -1);
			String previousDate = targetSdf2.format(calendar2.getTime());
			dateList2.add(previousDate);
		}
		try {
			session.setAttribute("newUserCount",
					userDao.queryUsersCountByDate(dateList2));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			session.setAttribute("newPlanCount",
					planDao.queryPlansCountByDate(dateList2));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			session.setAttribute("newRestaurantCount",
					restaurantDao.queryRestaurantsCountByDate(dateList2));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			session.setAttribute("newHotelCount",
					hotelDao.queryHotelsCountByDate(dateList2));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			session.setAttribute("newAttractionCount",
					attractionDao.queryAttractionsCountByDate(dateList2));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			session.setAttribute("newCommentCount",
					commentDao.queryCommentsCountByDate(dateList2));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("admin.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}

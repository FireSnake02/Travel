package cn.edu.songmx.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.AttractionBean;
import cn.edu.songmx.dao.AttractionDao;

public class AttractionAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("attraction-add.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		AttractionBean attraction = new AttractionBean();
		attraction.setName(request.getParameter("name"));
		if (!request.getParameter("entrance_fee").isEmpty()) {
			String parameter = request.getParameter("entrance_fee");
			Float entrance_fee = Float.parseFloat(parameter);
			attraction.setEntrance_fee(entrance_fee);
		}
		attraction.setAddress(request.getParameter("address"));
		if (request.getParameter("open_time").isEmpty()) {
			attraction.setOpen_time("暂无信息");
		} else {
			attraction.setOpen_time(request.getParameter("open_time"));
		}
		attraction
				.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date startDate = null;
		try {
			startDate = dateFormat.parse(request.getParameter("start_date"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
		attraction.setStart_date(sqlStartDate);
		if (!request.getParameter("image_url").isEmpty()) {
			attraction.setImage_url(request.getParameter("image_url"));
		} else {
			attraction.setImage_url("static/image/404.jpg");
		}

		AttractionDao attractionDao = new AttractionDao();
		if (attractionDao.addAttraction(attraction) >= 1) {
			request.setAttribute("errorMsg", "添加成功，刷新页面后可见");
		} else {
			request.setAttribute("errorMsg", "添加失败");
		}
		doGet(request, response);
	}
}

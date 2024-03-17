package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.HotelBean;
import cn.edu.songmx.dao.HotelDao;

public class HotelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HotelDao dao = new HotelDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<HotelBean> hotels = dao.queryAllHotels();
		request.setAttribute("hotels", hotels);
		request.getRequestDispatcher("hotel-list.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("search") == 0) {
			String searchUserId = request.getParameter("searchUserId");
			List<HotelBean> searchHotels = dao.queryHotelByUserId(Integer
					.parseInt(searchUserId));
			if (searchHotels == null || searchHotels.isEmpty()) {
				request.setAttribute("errorMsg", "没有符合要求的数据");
			} else {
				request.setAttribute("searchHotels", searchHotels);
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("remove") == 0) {
			int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
			if (dao.deleteHotel(hotel_id) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("removeAll") == 0) {
			String hotelIdListStr = request.getParameter("hotelIdList");
			String[] hotelIds = hotelIdListStr.split(",");
			int[] hotelIdList = new int[hotelIds.length];
			for (int i = 0; i < hotelIds.length; i++) {
				hotelIdList[i] = Integer.parseInt(hotelIds[i]);
			}
			if (dao.deleteAllHotel(hotelIdList) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		}
		doGet(request, response);
	}
}

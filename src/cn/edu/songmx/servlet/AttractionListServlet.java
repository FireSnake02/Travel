package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.AttractionBean;
import cn.edu.songmx.dao.AttractionDao;

public class AttractionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AttractionDao dao = new AttractionDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<AttractionBean> attractions = dao.queryAllAttractions();
		request.setAttribute("attractions", attractions);
		request.getRequestDispatcher("attraction-list.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("search") == 0) {
			String searchUserId = request.getParameter("searchUserId");
			List<AttractionBean> searchAttractions = dao
					.queryAttractionByUserId(Integer.parseInt(searchUserId));
			if (searchAttractions == null || searchAttractions.isEmpty()) {
				request.setAttribute("errorMsg", "没有符合要求的数据");
			} else {
				request.setAttribute("searchAttractions", searchAttractions);
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("remove") == 0) {
			int attraction_id = Integer.parseInt(request
					.getParameter("attraction_id"));
			if (dao.deleteAttraction(attraction_id) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("removeAll") == 0) {
			String attractionIdListStr = request
					.getParameter("attractionIdList");
			String[] attractionIds = attractionIdListStr.split(",");
			int[] attractionIdList = new int[attractionIds.length];
			for (int i = 0; i < attractionIds.length; i++) {
				attractionIdList[i] = Integer.parseInt(attractionIds[i]);
			}
			if (dao.deleteAllAttraction(attractionIdList) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		}
		doGet(request, response);
	}
}

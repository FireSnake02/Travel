package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.PlanBean;
import cn.edu.songmx.dao.PlanDao;

public class PlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlanDao dao = new PlanDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<PlanBean> plans = dao.queryAllPlans();
		request.setAttribute("plans", plans);
		request.getRequestDispatcher("plan-list.jsp")
				.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("search") == 0) {
			String searchUserId = request.getParameter("searchUserId");
			List<PlanBean> searchPlans = dao.queryPlanByUserId(Integer
					.parseInt(searchUserId));
			if (searchPlans == null || searchPlans.isEmpty()) {
				request.setAttribute("errorMsg", "没有符合要求的数据");
			} else {
				request.setAttribute("searchPlans", searchPlans);
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("remove") == 0) {
			int travel_plan_id = Integer.parseInt(request
					.getParameter("travel_plan_id"));
			if (dao.deletePlan(travel_plan_id) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！请先删除这个计划的评论信息");
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("removeAll") == 0) {
			String planIdListStr = request.getParameter("planIdList");
			String[] planIds = planIdListStr.split(",");
			int[] planIdList = new int[planIds.length];
			for (int i = 0; i < planIds.length; i++) {
				planIdList[i] = Integer.parseInt(planIds[i]);
			}
			if (dao.deleteAllPlan(planIdList) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！请先删除这些计划的评论信息");
			}
		}
		doGet(request, response);
	}

}

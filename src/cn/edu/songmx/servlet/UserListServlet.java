package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.UserDao;

public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao dao = new UserDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<UserBean> users = dao.queryAllUsers();
		request.setAttribute("users", users);
		request.getRequestDispatcher("user-list.jsp")
				.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("search") == 0) {
			String searchUsername = request.getParameter("searchUsername");
			List<UserBean> searchUsers = dao.queryUsersByName(searchUsername);
			if (searchUsers == null || searchUsers.isEmpty()) {
				request.setAttribute("errorMsg", "没有符合要求的数据");
			} else {
				request.setAttribute("searchUsers", searchUsers);
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("remove") == 0) {
			int user_id = Integer.parseInt(request.getParameter("user_id"));
			if (dao.deleteUser(user_id) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg",
						"删除失败！请先删除这个用户的预定信息和历史推荐信息和评论信息");
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("removeAll") == 0) {
			String userIdListStr = request.getParameter("userIdList");
			String[] userIds = userIdListStr.split(",");
			int[] userIdList = new int[userIds.length];
			for (int i = 0; i < userIds.length; i++) {
				userIdList[i] = Integer.parseInt(userIds[i]);
			}
			if (dao.deleteAllUser(userIdList) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！请先删除这些用户的预定信息和历史推荐信息");
			}
		}
		doGet(request, response);
	}
}

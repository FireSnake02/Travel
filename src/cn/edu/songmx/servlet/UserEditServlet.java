package cn.edu.songmx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.UserDao;

public class UserEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDao dao = new UserDao();
		UserBean user = dao.queryUserById(Integer.parseInt(request
				.getParameter("user_id")));
		request.setAttribute("modifyUser", user);
		request.getRequestDispatcher("user-edit.jsp")
				.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserBean user = new UserBean();
		user.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		user.setEmail(request.getParameter("email"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setPhone_number(request.getParameter("phone"));
		user.setRole(request.getParameter("role"));

		UserDao dao = new UserDao();
		if (dao.updateUserAll(user) >= 1) {
			request.setAttribute("errorMsg", "修改成功，请刷新页面！");
		} else {
			request.setAttribute("errorMsg", "修改失败！");
		}
		doGet(request, response);
	}
}

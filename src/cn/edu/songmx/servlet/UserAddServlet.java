package cn.edu.songmx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.UserDao;

public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("user-add.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserBean user = new UserBean();
		user.setUsername(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setPhone_number(request.getParameter("phone"));
		user.setRole(request.getParameter("role"));
		UserDao userDao = new UserDao();
		if (userDao.addUser(user) >= 1) {
			request.setAttribute("errorMsg", "添加成功，刷新页面后可见");
		} else {
			request.setAttribute("errorMsg", "添加失败");
		}
		doGet(request, response);
	}
}

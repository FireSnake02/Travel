package cn.edu.songmx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.UserDao;

public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserDao userDao = new UserDao();
		UserBean user = userDao.queryUserById((Integer) session
				.getAttribute("user_id"));
		request.setAttribute("user", user);
		request.getRequestDispatcher("user-info.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDao userDao = new UserDao();
		UserBean user = new UserBean();
		HttpSession session = request.getSession();
		int user_id = (Integer) session.getAttribute("user_id");
		user.setUser_id(user_id);
		user.setUsername(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setPhone_number(request.getParameter("phone"));

		if (userDao.updateUser(user) >= 1) {
			request.setAttribute("successMsg", "修改成功");
		} else {
			request.setAttribute("errorMsg", "修改失败");
		}
		doGet(request, response);
	}

}

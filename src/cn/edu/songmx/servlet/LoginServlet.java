package cn.edu.songmx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.UserDao;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		UserDao dao = new UserDao();
		UserBean user = new UserBean();
		if (operationType != null
				&& operationType.compareToIgnoreCase("login") == 0) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			user = dao.login(email, password);
			HttpSession session = request.getSession();
			if (user != null) {
				if ("管理员".equals(user.getRole())) {
					session.setAttribute("phone_number", user.getPhone_number());
					session.setAttribute("user_id", user.getUser_id());
					session.setAttribute("username", user.getUsername());
					response.sendRedirect("AdminServlet");
				} else {
					session.setAttribute("user_id", user.getUser_id());
					session.setAttribute("phone_number", user.getPhone_number());
					response.sendRedirect("IndexServlet");
				}
			} else {
				request.setAttribute("errorMsg", "邮箱或密码错误");
				doGet(request, response);
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("register") == 0) {
			user = new UserBean();
			String reemail = request.getParameter("reemail");
			String reusername = request.getParameter("reusername");
			String repassword = request.getParameter("repassword");
			user.setEmail(reemail);
			user.setUsername(reusername);
			user.setPassword(repassword);
			user.setRole("普通用户");
			if (dao.addUser(user) >= 1) {
				request.setAttribute("successMsg", "注册成功！");
			} else {
				request.setAttribute("errorMsg", "注册失败！");
			}
			doGet(request, response);
		}
	}
}

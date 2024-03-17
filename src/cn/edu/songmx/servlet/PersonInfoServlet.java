package cn.edu.songmx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.songmx.api.VerificationApi;
import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.UserDao;

public class PersonInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserDao userDao = new UserDao();
		UserBean user = userDao.queryUserById((Integer) session
				.getAttribute("user_id"));
		request.setAttribute("user", user);
		request.getRequestDispatcher("person-info.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("update") == 0) {
			HttpSession session = request.getSession();
			String phone_number = (String) session.getAttribute("phone_number");
			if (phone_number.equals(request.getParameter("phone"))) {
				UserDao userDao = new UserDao();
				UserBean user = new UserBean();
				int user_id = (Integer) session.getAttribute("user_id");
				user.setUser_id(user_id);
				user.setUsername(request.getParameter("userName"));
				user.setEmail(request.getParameter("email"));
				user.setPassword(request.getParameter("password"));
				user.setPhone_number(request.getParameter("phone"));

				if (userDao.updateUser(user) >= 1) {
					request.getSession().setAttribute("successMsg", "修改成功!");
					response.sendRedirect("LogoutServlet");
				} else {
					request.setAttribute("errorMsg", "修改失败");
					doGet(request, response);
				}
			} else {
				String number = session.getAttribute("number").toString()
						.trim();
				String verification = request.getParameter("verification")
						.trim();
				if (number.equals(verification)) {
					UserDao userDao = new UserDao();
					UserBean user = new UserBean();
					int user_id = (Integer) session.getAttribute("user_id");
					user.setUser_id(user_id);
					user.setUsername(request.getParameter("userName"));
					user.setEmail(request.getParameter("email"));
					user.setPassword(request.getParameter("password"));
					user.setPhone_number(request.getParameter("phone"));

					if (userDao.updateUser(user) >= 1) {
						request.getSession()
								.setAttribute("successMsg", "修改成功!");
						response.sendRedirect("LogoutServlet");
					} else {
						request.setAttribute("errorMsg", "修改失败");
						doGet(request, response);
					}
				} else {
					request.setAttribute("errorMsg", "验证码验证失败");
					doGet(request, response);
				}
			}
		} else {
			String phone = request.getParameter("phone");

			int number = VerificationApi.sendLetter(phone);
			if (number > 1) {
				request.setAttribute("successMsg", "验证码已成功发送");
				HttpSession session = request.getSession();
				session.setAttribute("number", number);
			} else {
				request.setAttribute("errorMsg", "验证码发送失败");
			}
			doGet(request, response);
		}
	}
}

package cn.edu.songmx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.api.PasswordApi;
import cn.edu.songmx.bean.UserBean;
import cn.edu.songmx.dao.UserDao;

public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("forget-password.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDao dao = new UserDao();
		UserBean user = new UserBean();
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		user = dao.forgetPassword(email, phone);
		if(user != null){
			PasswordApi.sendLetter(phone, user.getPassword());
			request.setAttribute("successMsg", "密码已成功发送！");
		}else{
			request.setAttribute("errorMsg", "邮箱与手机号不匹配");
		}
		doGet(request, response);
	}
}

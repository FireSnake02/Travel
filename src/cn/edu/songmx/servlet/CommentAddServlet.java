package cn.edu.songmx.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.CommentBean;
import cn.edu.songmx.dao.CommentDao;

public class CommentAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("comment-add.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CommentBean comment = new CommentBean();
		comment.setTravel_plan_id(Integer.parseInt(request
				.getParameter("travel_plan_id")));
		if (!request.getParameter("rating").isEmpty()) {
			String parameter = request.getParameter("rating");
			Float rating = Float.parseFloat(parameter);
			comment.setRating(rating);
		}
		comment.setComment_text(request.getParameter("comment_text"));
		comment.setUser_id(Integer.parseInt(request.getParameter("user_id")));

		CommentDao commentDao = new CommentDao();
		if (commentDao.addComment(comment) >= 1) {
			request.setAttribute("errorMsg", "添加成功，刷新页面后可见");
		} else {
			request.setAttribute("errorMsg", "添加失败");
		}
		doGet(request, response);
	}
}

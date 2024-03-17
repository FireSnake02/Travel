package cn.edu.songmx.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.songmx.bean.CommentBean;
import cn.edu.songmx.dao.CommentDao;

public class CommentListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CommentDao dao = new CommentDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<CommentBean> comments = dao.queryAllComment();
		request.setAttribute("comments", comments);
		request.getRequestDispatcher("comment-list.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String operationType = request.getParameter("operationType");
		if (operationType != null
				&& operationType.compareToIgnoreCase("search") == 0) {
			String searchUserId = request.getParameter("searchUserId");
			List<CommentBean> searchComments = dao.queryCommentByUserId(Integer
					.parseInt(searchUserId));
			if (searchComments == null || searchComments.isEmpty()) {
				request.setAttribute("errorMsg", "没有符合要求的数据");
			} else {
				request.setAttribute("searchComments", searchComments);
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("remove") == 0) {
			int comment_id = Integer.parseInt(request
					.getParameter("comment_id"));
			if (dao.deleteComment(comment_id) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		} else if (operationType != null
				&& operationType.compareToIgnoreCase("removeAll") == 0) {
			String commentIdListStr = request.getParameter("commentIdList");
			String[] commentIds = commentIdListStr.split(",");
			int[] commentIdList = new int[commentIds.length];
			for (int i = 0; i < commentIds.length; i++) {
				commentIdList[i] = Integer.parseInt(commentIds[i]);
			}
			if (dao.deleteAllComment(commentIdList) >= 1) {
				request.setAttribute("errorMsg", "删除成功！");
			} else {
				request.setAttribute("errorMsg", "删除失败！");
			}
		}
		doGet(request, response);
	}

}

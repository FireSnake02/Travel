package cn.edu.songmx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import cn.edu.songmx.bean.CommentBean;

public class CommentDao {
	// 添加评论
	public int addComment(CommentBean comment) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "INSERT INTO comment_table(travel_plan_id,user_id,comment_text,rating) VALUES(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, comment.getTravel_plan_id());
			ps.setInt(2, comment.getUser_id());
			ps.setString(3, comment.getComment_text());
			ps.setDouble(4, comment.getRating());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 查找所有评论(倒序)
	public List<CommentBean> queryAllComments() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CommentBean> commentList = new ArrayList<CommentBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM comment_table ORDER BY comment_id DESC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				CommentBean comment = new CommentBean();
				comment.setComment_id(rs.getInt("comment_id"));
				comment.setTravel_plan_id(rs.getInt("travel_plan_id"));
				comment.setUser_id(rs.getInt("user_id"));
				comment.setComment_text(rs.getString("comment_text"));
				comment.setRating(rs.getDouble("rating"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return commentList;
	}

	// 查找所有评论(倒序)
	public List<CommentBean> queryAllComment() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CommentBean> commentList = new ArrayList<CommentBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM comment_table";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				CommentBean comment = new CommentBean();
				comment.setComment_id(rs.getInt("comment_id"));
				comment.setTravel_plan_id(rs.getInt("travel_plan_id"));
				comment.setUser_id(rs.getInt("user_id"));
				comment.setComment_text(rs.getString("comment_text"));
				comment.setRating(rs.getDouble("rating"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return commentList;
	}

	// 根据用户ID查找评论
	public List<CommentBean> queryCommentByUserId(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CommentBean> commentList = new ArrayList<>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM comment_table WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				CommentBean comment = new CommentBean();
				comment.setComment_id(rs.getInt("comment_id"));
				comment.setTravel_plan_id(rs.getInt("travel_plan_id"));
				comment.setUser_id(rs.getInt("user_id"));
				comment.setComment_text(rs.getString("comment_text"));
				comment.setRating(rs.getDouble("rating"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return commentList;
	}

	// 查找评论数量
	public int queryCommentsCount() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM comment_table";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 删除
	public int deleteComment(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "DELETE FROM comment_table WHERE comment_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 批量删除
	public int deleteAllComment(int[] id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			StringBuilder sqlBuilder = new StringBuilder(
					"DELETE FROM comment_table WHERE comment_id IN (");
			for (int i = 0; i < id.length; i++) {
				sqlBuilder.append("?");
				if (i < id.length - 1) {
					sqlBuilder.append(",");
				}
			}
			sqlBuilder.append(")");
			String sql = sqlBuilder.toString();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < id.length; i++) {
				ps.setInt(i + 1, id[i]);
			}
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 查找新增评论数量
	public int[] queryCommentsCountByDate(List<String> dateList)
			throws ParseException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int[] results = new int[dateList.size()];

		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM comment_table WHERE CAST(birth_date AS DATE) = ?";
			ps = conn.prepareStatement(sql);

			for (int i = 0; i < dateList.size(); i++) {
				// 将日期作为参数设置到PreparedStatement中
				String dateString = dateList.get(i);
				java.util.Date date = new SimpleDateFormat("yyyy-MM-dd")
						.parse(dateString);
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				ps.setDate(1, sqlDate);

				rs = ps.executeQuery();
				if (rs.next()) {
					results[i] = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return results;
	}
}

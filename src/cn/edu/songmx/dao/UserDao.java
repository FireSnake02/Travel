package cn.edu.songmx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import cn.edu.songmx.bean.UserBean;

public class UserDao {
	// 添加用户
	public int addUser(UserBean user) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "INSERT INTO user_table(username,email,password,phone_number,role) VALUES(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhone_number());
			ps.setString(5, user.getRole());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 登录
	public UserBean login(String email, String password) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserBean user = null;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM user_table WHERE email=? AND password=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserBean();
				user.setUser_id(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return user;
	}

	// 忘记密码
	public UserBean forgetPassword(String email, String phone_number) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserBean user = null;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM user_table WHERE email=? AND phone_number=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, phone_number);
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserBean();
				user.setUser_id(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return user;
	}

	// 更新
	public int updateUser(UserBean user) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "UPDATE user_table SET username=?,email=?,password=?,phone_number=? WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhone_number());
			ps.setInt(5, user.getUser_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 全部更新
	public int updateUserAll(UserBean user) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "UPDATE user_table SET username=?,email=?,password=?,phone_number=?,role=? WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhone_number());
			ps.setString(5, user.getRole());
			ps.setInt(6, user.getUser_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 删除
	public int deleteUser(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "DELETE FROM user_table WHERE user_id=?";
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
	public int deleteAllUser(int[] id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			StringBuilder sqlBuilder = new StringBuilder(
					"DELETE FROM user_table WHERE user_id IN (");
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

	// 查找所有用户
	public List<UserBean> queryAllUsers() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UserBean> userList = new ArrayList<UserBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM user_table";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserBean user = new UserBean();
				user.setUser_id(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setRole(rs.getString("role"));
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return userList;
	}

	// 根据ID查找用户
	public UserBean queryUserById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserBean user = null;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM user_table WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new UserBean();
				user.setUser_id(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return user;
	}

	// 根据用户名查找用户
	public List<UserBean> queryUsersByName(String searchUsername) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UserBean> userList = new ArrayList<UserBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM user_table WHERE username LIKE ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchUsername + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				UserBean user = new UserBean();
				user.setUser_id(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setRole(rs.getString("role"));
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return userList;
	}

	// 查找用户数量
	public int queryUsersCount() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM user_table";
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

	// 查找新增用户数量
	public int[] queryUsersCountByDate(List<String> dateList)
			throws ParseException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int[] results = new int[dateList.size()];

		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM user_table WHERE CAST(birth_date AS DATE) = ?";
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
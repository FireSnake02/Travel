package cn.edu.songmx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import cn.edu.songmx.bean.RestaurantBean;

public class RestaurantDao {
	public int addRestaurant(RestaurantBean restaurant) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "INSERT INTO restaurant_table(name,rating,address,phone_number,user_id,start_date,image_url) VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, restaurant.getName());
			ps.setFloat(2, restaurant.getRating());
			ps.setString(3, restaurant.getAddress());
			ps.setString(4, restaurant.getPhone_number());
			ps.setInt(5, restaurant.getUser_id());
			ps.setDate(6, restaurant.getStart_date());
			ps.setString(7, restaurant.getImage_url());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("插入饭店信息有误");
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 修改饭店信息
	public int updateRestaurant(RestaurantBean restaurant) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "UPDATE restaurant_table SET name=?,rating=?,address=?,phone_number=? WHERE restaurant_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, restaurant.getName());
			ps.setFloat(2, restaurant.getRating());
			ps.setString(3, restaurant.getAddress());
			ps.setString(4, restaurant.getPhone_number());
			ps.setInt(5, restaurant.getRestaurant_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 根据ID删除饭店
	public int deleteRestaurant(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "DELETE FROM restaurant_table WHERE restaurant_id=?";
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

	// 查询所有饭店
	public List<RestaurantBean> queryAllRestaurants() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<RestaurantBean> restaurantList = new ArrayList<RestaurantBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM restaurant_table";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				RestaurantBean restaurant = new RestaurantBean();
				restaurant.setRestaurant_id(rs.getInt("restaurant_id"));
				restaurant.setName(rs.getString("name"));
				restaurant.setRating(rs.getFloat("rating"));
				restaurant.setAddress(rs.getString("address"));
				restaurant.setPhone_number(rs.getString("phone_number"));
				restaurant.setUser_id(rs.getInt("user_id"));
				restaurant.setStart_date(rs.getDate("start_date"));
				restaurant.setImage_url(rs.getString("image_url"));
				restaurantList.add(restaurant);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return restaurantList;
	}

	// 根据旅行ID查询计划
	public RestaurantBean queryRestaurantById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		RestaurantBean restaurant = null;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM restaurant_table WHERE restaurant_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				restaurant = new RestaurantBean();
				restaurant.setRestaurant_id(rs.getInt("restaurant_id"));
				restaurant.setName(rs.getString("name"));
				restaurant.setRating(rs.getFloat("rating"));
				restaurant.setAddress(rs.getString("address"));
				restaurant.setPhone_number(rs.getString("phone_number"));
				restaurant.setUser_id(rs.getInt("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return restaurant;
	}

	// 根据用户ID查询计划
	public List<RestaurantBean> queryRestaurantByUserId(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<RestaurantBean> restaurantlist = new ArrayList<RestaurantBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM restaurant_table WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				RestaurantBean restaurant = new RestaurantBean();
				restaurant.setRestaurant_id(rs.getInt("restaurant_id"));
				restaurant.setName(rs.getString("name"));
				restaurant.setRating(rs.getFloat("rating"));
				restaurant.setAddress(rs.getString("address"));
				restaurant.setPhone_number(rs.getString("phone_number"));
				restaurant.setUser_id(rs.getInt("user_id"));
				restaurant.setStart_date(rs.getDate("start_date"));
				restaurant.setImage_url(rs.getString("image_url"));
				restaurantlist.add(restaurant);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return restaurantlist;
	}

	// 查找餐厅数量
	public int queryRestaurantsCount() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM restaurant_table";
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

	// 批量删除
	public int deleteAllRestaurant(int[] id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			StringBuilder sqlBuilder = new StringBuilder(
					"DELETE FROM restaurant_table WHERE restaurant_id IN (");
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

	// 查找新增餐厅数量
	public int[] queryRestaurantsCountByDate(List<String> dateList)
			throws ParseException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int[] results = new int[dateList.size()];

		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM restaurant_table WHERE CAST(birth_date AS DATE) = ?";
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

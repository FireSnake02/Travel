package cn.edu.songmx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import cn.edu.songmx.bean.AttractionBean;

public class AttractionDao {
	public int addAttraction(AttractionBean attraction) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "INSERT INTO attraction_table(name,open_time,entrance_fee,address,user_id,start_date,image_url) VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, attraction.getName());
			ps.setString(2, attraction.getOpen_time());
			float entranceFee = 0.0f; // 设置默认值为0.0f
			if (attraction != null) {
				Float fee = attraction.getEntrance_fee();
				if (fee != null) {
					entranceFee = fee;
				}
			}
			ps.setFloat(3, entranceFee);
			ps.setString(4, attraction.getAddress());
			ps.setInt(5, attraction.getUser_id());
			ps.setDate(6, attraction.getStart_date());
			ps.setString(7, attraction.getImage_url());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	public int updateAttraction(AttractionBean attraction) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "UPDATE attraction_table SET name=?,open_time=?,entrance_fee=?,address=?,user_id=? WHERE attraction_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, attraction.getName());
			ps.setString(2, attraction.getOpen_time());
			ps.setFloat(3, attraction.getEntrance_fee());
			ps.setString(4, attraction.getAddress());
			ps.setInt(5, attraction.getUser_id());
			ps.setInt(6, attraction.getAttraction_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	public int deleteAttraction(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "DELETE FROM attraction_table WHERE attraction_id=?";
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

	public List<AttractionBean> queryAllAttractions() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<AttractionBean> attractionList = new ArrayList<AttractionBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM attraction_table";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AttractionBean attraction = new AttractionBean();
				attraction.setAttraction_id(rs.getInt("attraction_id"));
				attraction.setName(rs.getString("name"));
				attraction.setOpen_time(rs.getString("open_time"));
				attraction.setEntrance_fee(rs.getFloat("entrance_fee"));
				attraction.setAddress(rs.getString("address"));
				attraction.setUser_id(rs.getInt("user_id"));
				attraction.setStart_date(rs.getDate("start_date"));
				attraction.setImage_url(rs.getString("image_url"));
				attractionList.add(attraction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return attractionList;
	}

	public AttractionBean queryAttractionById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		AttractionBean attraction = null;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM attraction_table WHERE attraction_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				attraction = new AttractionBean();
				attraction.setAttraction_id(rs.getInt("attraction_id"));
				attraction.setName(rs.getString("name"));
				attraction.setOpen_time(rs.getString("open_time"));
				attraction.setEntrance_fee(rs.getFloat("entrance_fee"));
				attraction.setAddress(rs.getString("address"));
				attraction.setUser_id(rs.getInt("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return attraction;
	}

	public List<AttractionBean> queryAttractionByUserId(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<AttractionBean> attractionlist = new ArrayList<AttractionBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM attraction_table WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				AttractionBean attraction = new AttractionBean();
				attraction.setAttraction_id(rs.getInt("attraction_id"));
				attraction.setName(rs.getString("name"));
				attraction.setOpen_time(rs.getString("open_time"));
				attraction.setEntrance_fee(rs.getFloat("entrance_fee"));
				attraction.setAddress(rs.getString("address"));
				attraction.setUser_id(rs.getInt("user_id"));
				attraction.setStart_date(rs.getDate("start_date"));
				attraction.setImage_url(rs.getString("image_url"));
				attractionlist.add(attraction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return attractionlist;
	}

	// 查找景点数量
	public int queryAttractionsCount() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM attraction_table";
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
	public int deleteAllAttraction(int[] id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			StringBuilder sqlBuilder = new StringBuilder(
					"DELETE FROM attraction_table WHERE attraction_id IN (");
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

	// 查找新增景点数量
	public int[] queryAttractionsCountByDate(List<String> dateList)
			throws ParseException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int[] results = new int[dateList.size()];

		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM attraction_table WHERE CAST(birth_date AS DATE) = ?";
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

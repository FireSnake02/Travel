package cn.edu.songmx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import cn.edu.songmx.bean.HotelBean;

public class HotelDao {
	public int addHotel(HotelBean hotel) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "INSERT INTO hotel_table(name,rating,address,phone_number,user_id,start_date,image_url) VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, hotel.getName());
			ps.setFloat(2, hotel.getRating());
			ps.setString(3, hotel.getAddress());
			ps.setString(4, hotel.getPhone_number());
			ps.setInt(5, hotel.getUser_id());
			ps.setDate(6, hotel.getStart_date());
			ps.setString(7, hotel.getImage_url());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 修改宾馆信息
	public int updateHotel(HotelBean hotel) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = " UPDATE hotel_table SET name=?,rating=?,address=?,phone_number=? WHERE hotel_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, hotel.getName());
			ps.setFloat(2, hotel.getRating());
			ps.setString(3, hotel.getAddress());
			ps.setString(4, hotel.getPhone_number());
			ps.setInt(5, hotel.getHotel_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 根据ID删除宾馆
	public int deleteHotel(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "DELETE FROM hotel_table WHERE hotel_id=?";
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
	public List<HotelBean> queryAllHotels() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<HotelBean> hotelList = new ArrayList<HotelBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM hotel_table";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				HotelBean hotel = new HotelBean();
				hotel.setHotel_id(rs.getInt("hotel_id"));
				hotel.setName(rs.getString("name"));
				hotel.setRating(rs.getFloat("rating"));
				hotel.setAddress(rs.getString("address"));
				hotel.setPhone_number(rs.getString("phone_number"));
				hotel.setUser_id(rs.getInt("user_id"));
				hotel.setStart_date(rs.getDate("start_date"));
				hotel.setImage_url(rs.getString("image_url"));
				hotelList.add(hotel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return hotelList;
	}

	// 根据酒店ID查询酒店
	public HotelBean queryHotelById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		HotelBean hotel = null;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM hotel_table WHERE hotel_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				hotel = new HotelBean();
				hotel.setHotel_id(rs.getInt("hotel_id"));
				hotel.setName(rs.getString("name"));
				hotel.setRating(rs.getFloat("rating"));
				hotel.setAddress(rs.getString("address"));
				hotel.setPhone_number(rs.getString("phone_number"));
				hotel.setUser_id(rs.getInt("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return hotel;
	}

	// 根据用户ID查询酒店
	public List<HotelBean> queryHotelByUserId(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<HotelBean> hotellist = new ArrayList<HotelBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM hotel_table WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				HotelBean hotel = new HotelBean();
				hotel.setHotel_id(rs.getInt("hotel_id"));
				hotel.setName(rs.getString("name"));
				hotel.setRating(rs.getFloat("rating"));
				hotel.setAddress(rs.getString("address"));
				hotel.setPhone_number(rs.getString("phone_number"));
				hotel.setUser_id(rs.getInt("user_id"));
				hotel.setStart_date(rs.getDate("start_date"));
				hotel.setImage_url(rs.getString("image_url"));
				hotellist.add(hotel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return hotellist;
	}

	// 查找宾馆数量
	public int queryHotelsCount() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM hotel_table";
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
	public int deleteAllHotel(int[] id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			StringBuilder sqlBuilder = new StringBuilder(
					"DELETE FROM hotel_table WHERE hotel_id IN (");
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
	
	// 查找新增计划数量
		public int[] queryHotelsCountByDate(List<String> dateList)
				throws ParseException {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			int[] results = new int[dateList.size()];

			try {
				conn = MyConnection.getConnection();
				String sql = "SELECT COUNT(*) FROM hotel_table WHERE CAST(birth_date AS DATE) = ?";
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

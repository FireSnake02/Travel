package cn.edu.songmx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import cn.edu.songmx.bean.PlanBean;

public class PlanDao {
	// 添加计划
	public int addPlan(PlanBean plan) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "INSERT INTO travel_plan_table(destination,start_date,interests,user_id) VALUES(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, plan.getDestination());
			ps.setDate(2, plan.getStart_date());
			ps.setString(3, plan.getInterests());
			ps.setInt(4, plan.getUser_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 查最后一条id
	public int queryLastPlanId() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT TOP 1 travel_plan_id FROM travel_plan_table ORDER BY travel_plan_id DESC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); // 使用executeQuery()执行查询语句
			if (rs.next()) {
				result = rs.getInt("travel_plan_id"); // 获取查询结果中的travel_plan_id字段值
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return result;
	}

	// 根据ID查找计划
	public PlanBean queryPlanById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PlanBean plan = null;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM travel_plan_table WHERE travel_plan_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				plan = new PlanBean();
				plan.setTravel_plan_id(rs.getInt("travel_plan_id"));
				plan.setDestination(rs.getString("destination"));
				plan.setStart_date(rs.getDate("start_date"));
				plan.setInterests(rs.getString("interests"));
				plan.setUser_id(rs.getInt("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return plan;
	}

	// 根据用户ID查找计划
	public List<PlanBean> queryPlanByUserId(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PlanBean> planList = new ArrayList<>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM travel_plan_table WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				PlanBean plan = new PlanBean();
				plan.setTravel_plan_id(rs.getInt("travel_plan_id"));
				plan.setDestination(rs.getString("destination"));
				plan.setStart_date(rs.getDate("start_date"));
				plan.setInterests(rs.getString("interests"));
				plan.setUser_id(rs.getInt("user_id"));
				planList.add(plan);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return planList;
	}

	// 查找计划数量
	public int queryPlanCount() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM travel_plan_table";
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

	// 查找所有计划
	public List<PlanBean> queryAllPlans() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PlanBean> planList = new ArrayList<PlanBean>();
		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT * FROM travel_plan_table";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				PlanBean plan = new PlanBean();
				plan.setTravel_plan_id(rs.getInt("travel_plan_id"));
				plan.setDestination(rs.getString("destination"));
				plan.setStart_date(rs.getDate("start_date"));
				plan.setInterests(rs.getString("interests"));
				plan.setUser_id(rs.getInt("user_id"));
				planList.add(plan);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(conn, ps, rs);
		}
		return planList;
	}

	// 删除
	public int deletePlan(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			String sql = "DELETE FROM travel_plan_table WHERE travel_plan_id=?";
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
	public int deleteAllPlan(int[] id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = MyConnection.getConnection();
			StringBuilder sqlBuilder = new StringBuilder(
					"DELETE FROM travel_plan_table WHERE travel_plan_id IN (");
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
	public int[] queryPlansCountByDate(List<String> dateList)
			throws ParseException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int[] results = new int[dateList.size()];

		try {
			conn = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM travel_plan_table WHERE CAST(birth_date AS DATE) = ?";
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

package cn.edu.songmx.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MyConnection {
	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("������δ�ҵ�");
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		String url = "jdbc:sqlserver://localhost:1433;databaseName=Travel";
		try {
			return DriverManager.getConnection(url, "sa", "020206");
		} catch (SQLException e) {
			System.out.println("��������ʱ����");
			e.printStackTrace();
		}
		return null;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("�ر�����ʱ����");
			e.printStackTrace();
		}
	}

	public static void close(Statement st) {
		try {
			if (st != null) {
				st.close();
			}
		} catch (SQLException e) {
			System.out.println("�ر����ʱ����");
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println("�رս����ʱ����");
			e.printStackTrace();
		}
	}

	public static void close(Connection conn, Statement st) {
		close(conn);
		close(st);
	}

	public static void close(Connection conn, Statement st, ResultSet rs) {
		close(conn);
		close(st);
		close(rs);
	}
}

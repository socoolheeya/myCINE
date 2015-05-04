package mycine.event;

import java.sql.*;

public class EventDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	// 내 포인트 조회
	public EventDTO eventMypoint(String id) {

		try {
			EventDTO dto = null;
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {

				String name = rs.getString("name");
				int point = rs.getInt("point");

				dto = new EventDTO(id, name, point);

			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/**
	 * 
	 * @param idx
	 * @param usepoint
	 * @return
	 */
	public int updatePoint(String id, int usepoint) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_member set point = point-? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, usepoint);
			ps.setString(2, id);

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}

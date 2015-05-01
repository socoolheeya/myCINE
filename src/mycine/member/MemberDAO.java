package mycine.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**
	 * 검색 관련 메서드
	 * @param requestSearchWord
	 * @return
	 */
	public boolean search(String requestSearchWord){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_movie where subject=? or director=? or actor=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, requestSearchWord);
			ps.setString(2, requestSearchWord);
			ps.setString(3, requestSearchWord);
			rs = ps.executeQuery();
			
			return rs.next();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try{
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 영화 요청 관련 메서드
	 */
	public int request(String requestName) {
		try { 
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_request (r_request_name, r_request_check) values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, requestName);
			ps.setInt(2, 1);
			int count = ps.executeUpdate();
			
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}

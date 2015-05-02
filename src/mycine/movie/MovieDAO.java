package mycine.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MovieDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MovieDAO(){
		
	}
	
	
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

}

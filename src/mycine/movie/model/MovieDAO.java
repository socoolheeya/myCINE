package mycine.movie.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class MovieDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MovieDAO(){
		
	}
	
	
	/**
	 * �˻� ���� �޼���
	 * @param requestSearchWord
	 * @return
	 */
	public MovieDTO search(String requestSearchWord){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_movie where subject like '%"+requestSearchWord+"%' or director like '%"+requestSearchWord+"%' or actor like '%"+requestSearchWord+"%'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			MovieDTO mdto = null;
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				String review = rs.getString("review");
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				Date openDate = rs.getDate("opendate");
				String playTime = rs.getString("playtime");
				double grade = rs.getDouble("grade");
				mdto = new MovieDTO(idx, subject, review, director, actor, openDate, playTime, grade);
			}		
			return mdto;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try{
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}

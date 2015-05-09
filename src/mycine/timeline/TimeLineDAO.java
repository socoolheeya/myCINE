package mycine.timeline;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mycine.member.MemberDTO;

public class TimeLineDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TimeLineDAO(){
		
	}
	/**
	 * 유저가 회원가입 했을 때 들어갈 정보
	 * @param mDTO
	 */
	public void addJoinEvent(MemberDTO mDTO){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(?,?,'님 회원가입을 축하합니다.',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, mDTO.getIdx());
			ps.setString(2, mDTO.getId());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public Date getJoinEvent(String id){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "select to_char(sysdate, 'yyyy-mm-dd-hh24:mi:ss')"
					+ " from mycine_timeline where userid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			Date dateTime = null;
			while(rs.next()) {
				dateTime = rs.getDate("datetime");
			}
			return dateTime;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Date> getSortedDate(){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "select writedate from mycine_request order by writedate desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<Date> dateArr = new ArrayList<Date>(); 
			while(rs.next()) {
				Date writeDate = rs.getDate("writedate");
				dateArr.add(writeDate);
			}
			return dateArr;
			
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}

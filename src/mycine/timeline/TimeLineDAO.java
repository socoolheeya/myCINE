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
	/**
	 * 회원가입 축하 이벤트 가져오는 메서드
	 * @param id
	 * @return
	 */
	public TimeLineDTO getJoinEvent(String id){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_timeline where userid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			TimeLineDTO tdto = null;
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String userId = rs.getString("userid");
				String subject = rs.getString("subject");
				Date dateTime = rs.getDate("datetime");
				tdto = new TimeLineDTO(idx, userId, subject, dateTime);
			}
			return tdto;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 포인트를 사용했을 때 발생할 정보 디비 삽입
	 * @param point
	 * @param prize
	 * @param id
	 */
	public void addUsePointEvent(int point, String prize, String id){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(mycine_timeline_idx.nextval,?,'님"+point+"p를 사용하여 "+prize+"를 구입하였습니다.',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 타임라인 이벤트 전체 가져오기
	 * @param userId
	 * @return
	 */
	public ArrayList<TimeLineDTO> getTimeLineEvent(String userId) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_timeline where userid =? order by datetime desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			ArrayList<TimeLineDTO> arr = new ArrayList<TimeLineDTO>();
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				Date dateTime = rs.getDate("datetime");
				TimeLineDTO tdto = new TimeLineDTO(idx, userId, subject, dateTime);
				arr.add(tdto);
			}
			return arr;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}

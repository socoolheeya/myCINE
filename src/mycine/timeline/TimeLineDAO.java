package mycine.timeline;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mycine.member.model.MemberDTO;

public class TimeLineDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TimeLineDAO(){
		
	}
	/**
	 * ������ ȸ������ ���� �� �� ����
	 * @param mDTO
	 */
	public void addJoinEvent(MemberDTO mDTO){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(?,?,'�� ȸ�������� �����մϴ�.',sysdate)";
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
	 * ȸ������ ���� �̺�Ʈ �������� �޼���
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
	 * ����Ʈ�� ������� �� �߻��� ���� ��� ����
	 * @param point
	 * @param prize
	 * @param id
	 */
	public void addUsePointEvent(int point, String prize, String id){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(mycine_timeline_idx.nextval,?,'�� "+point+"p�� ����Ͽ� "+prize+"�� �����Ͽ����ϴ�.',sysdate)";
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
	 * ���� �Խ��� ��õ���� �� �߻��ϴ� Ÿ�Ӷ��� �̺�Ʈ
	 * @param idx
	 * @param id
	 */
	public void addReviewRecommendEvent(int idx, String id){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(mycine_timeline_idx.nextval,?,'�� "+idx+"�� ����Խñ��� ��õ�Ͽ����ϴ�.',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * ���� �Խ��ǿ� ���� �ۼ��� �� �߻��ϴ� Ÿ�Ӷ��� �̺�Ʈ
	 * @param id
	 */
	public void addReviewWriteEvent(String id){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(mycine_timeline_idx.nextval,?,'�� ����Խ��ǿ� �Խù��� �ۼ��Ͽ����ϴ�.',sysdate)";
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
	 * ��ȭ ��û�� �� �߻��ϴ� Ÿ�Ӷ��� �̺�Ʈ
	 * @param id
	 * @param movieName
	 */
	public void addRequestMovieEvent(String id, String movieName) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(mycine_timeline_idx.nextval,?,'�� "+movieName+"��(��) ��û�Ͽ����ϴ�.',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * ��û�Խ��� ��õ���� �� �߻��ϴ� �̺�Ʈ
	 * @param idx
	 * @param id
	 */
	public void addRequestRecommendEvent(int idx, String id){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_timeline values(mycine_timeline_idx.nextval,?,'�� "+idx+"�� ��û�Խñ��� ��õ�Ͽ����ϴ�.',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * Ÿ�Ӷ��� �̺�Ʈ ��ü ��������
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

package mycine.recommend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RecommendDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public RecommendDAO(){
		
	}
	
	/**
	 * 추천 버튼 생성시 초기값 
	 * @param idx
	 */
	public int recommendCheck(int idx){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql ="insert into mycine_recommend values(?, 1)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count = ps.executeUpdate();
			
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try { 
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int recommendUpdate(int idx){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_recommend set checked = 0 where idx =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count = ps.executeUpdate();
			
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
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
	 * check 값 가져오는 메서드
	 * @param idx
	 * @return
	 */
	public int selectRecommendIdx(int idx){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql ="select checked from mycine_recommend where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			int checked = -1;
			while (rs.next()) {
				checked = rs.getInt("checked");
			}
			return checked;
		} catch (Exception e) {
			e.printStackTrace();
			return -2;
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

package mycine.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MemberDAO(){
		
	}
	
	/**
	 * 회원가입 관련 메서드
	 * @param memberDTO
	 * @return
	 */
	public int joinMember(MemberDTO memberDTO){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_member values(mycine_member_idx.nextval,?,?,?,?,?,?,?,1000,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberDTO.getId());	
			ps.setString(2, memberDTO.getPwd());
			ps.setString(3, memberDTO.getName());
			ps.setString(4, memberDTO.getAddr());
			ps.setString(5, memberDTO.getEmail());
			ps.setString(6, memberDTO.getTel());
			ps.setString(7, memberDTO.getBirthday());
			
			int count = ps.executeUpdate();
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 아이디 중복체크 메서드
	 * @param requestId
	 * @return
	 */
	public boolean idCheck(String requestId){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "select id from mycine_member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, requestId);
			rs = ps.executeQuery();

			return rs.next();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
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
	
	public int loginCheck(String id, String pwd){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "select count(id) from mycine_member where id=? and pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()) {
				count = count + 1;
			}
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -3;
		}
	}
	
	public String getUserInfo(String id) {
		try{
			String sql = "select name from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			String name = null;
			while(rs.next()){
				name = rs.getString("name");
			}
			return name;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

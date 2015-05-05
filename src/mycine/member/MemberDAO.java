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
			String sql = "insert into mycine_member values("
					+ "mycine_member_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,1000,sysdate,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberDTO.getId());	
			ps.setString(2, memberDTO.getPwd());
			ps.setString(3, memberDTO.getName());
			ps.setString(4, memberDTO.getAddr1());
			ps.setString(5, memberDTO.getAddr2());
			ps.setString(6, memberDTO.getEmail1());
			ps.setString(7, memberDTO.getEmail2());
			ps.setInt(8, memberDTO.getTel1());
			ps.setInt(9, memberDTO.getTel2());
			ps.setInt(10, memberDTO.getTel3());
			ps.setInt(11, memberDTO.getBirthday1());
			ps.setInt(12, memberDTO.getBirthday2());
			ps.setInt(13, memberDTO.getBirthday3());
			ps.setInt(14, memberDTO.getZipcode1());
			ps.setInt(15, memberDTO.getZipcode2());
			
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
	 * 로그인 할 때 아이디 비번 체크 
	 * @param id
	 * @param pwd
	 * @return
	 */
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
	/**
	 * 로그인 할 때 마다 10p 추가하기
	 * @param id
	 * @return
	 */
	public int getLoginPoint(String id){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_member set point = point + 10 where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
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
}
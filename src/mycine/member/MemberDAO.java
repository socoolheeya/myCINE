package mycine.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;

	public MemberDAO() {

	}

	/**
	 * 회원가입 관련 메서드
	 * 
	 * @param memberDTO
	 * @return
	 */
	public int joinMember(MemberDTO memberDTO) {
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 아이디 중복체크 메서드
	 * 
	 * @param requestId
	 * @return
	 */
	public boolean idCheck(String requestId) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select id from mycine_member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, requestId);
			rs = ps.executeQuery();

			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/** 로그인 검증관련메서드 */
	public int loginCheck(String userid, String userpwd) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select pwd from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if (rs.next()) {
				String db_pwd = rs.getString(1);
				if (db_pwd.equals(userpwd)) {
					return LOGIN_OK;
				} else {
					return NOT_PWD;
				}
			} else {
				return NOT_ID;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public int getjoinChange(MemberDTO memberDTO) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memberDTO.getId());

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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String getUserInfo(String id) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select name from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			String name = null;
			while (rs.next()) {
				name = rs.getString("name");
			}
			return name;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 로그인 할 때 마다 10p 추가하기
	 * 
	 * @param id
	 * @return
	 */
	public int getLoginPoint(String id) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_member set point = point + 10 where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
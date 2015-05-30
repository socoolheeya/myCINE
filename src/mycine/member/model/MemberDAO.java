package mycine.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

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
	 * ȸ������ ���� �޼���
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
	 * ���̵� �ߺ�üũ �޼���
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

	/** �α��� �������ø޼��� */
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

	/**
	 * �̸� �������� �޼���
	 * 
	 * @param id
	 * @return
	 */
	public String getUserName(String id) {
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
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ����� ���� �������� �޼���
	 * 
	 * @param id
	 * @return
	 */
	public MemberDTO getUserInfo(String id) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			MemberDTO mdto = null;
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String addr1 = rs.getString("addr1");
				String addr2 = rs.getString("addr2");
				String email1 = rs.getString("email1");
				String email2 = rs.getString("email2");
				int tel1 = rs.getInt("tel1");
				int tel2 = rs.getInt("tel2");
				int tel3 = rs.getInt("tel3");
				int birthday1 = rs.getInt("birthday1");
				int birthday2 = rs.getInt("birthday2");
				int birthday3 = rs.getInt("birthday3");
				int point = rs.getInt("point");
				Date joindate = rs.getDate("joindate");
				int zipcode1 = rs.getInt("zipcode1");
				int zipcode2 = rs.getInt("zipcode2");
				mdto = new MemberDTO(idx, id, pwd, name, addr1, addr2, email1,
						email2, tel1, tel2, tel3, birthday1, birthday2,
						birthday3, point, joindate, zipcode1, zipcode2);
			}
			return mdto;
		} catch (Exception e) {
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
	 * �α��� �� �� ���� 10p �߰��ϱ�
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
	
	public int addReviewPoint(String id){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_member set point = point + 10 where id=?";
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

	/**
	 * ȸ������ ���� �޼���
	 * 
	 * @param dto
	 */
	public void updateMember(MemberDTO dto, String id) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_member set pwd=?, addr1=?, addr2=?, email1=?, email2=?, tel1=?, tel2=?,tel3=?, birthday1=?, birthday2=?, birthday3=?, zipcode1=?, zipcode2=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPwd());
			ps.setString(2, dto.getAddr1());
			ps.setString(3, dto.getAddr2());
			ps.setString(4, dto.getEmail1());
			ps.setString(5, dto.getEmail2());
			ps.setInt(6, dto.getTel1());
			ps.setInt(7, dto.getTel2());
			ps.setInt(8, dto.getTel3());
			ps.setInt(9, dto.getBirthday1());
			ps.setInt(10, dto.getBirthday2());
			ps.setInt(11, dto.getBirthday3());
			ps.setInt(12, dto.getZipcode1());
			ps.setInt(13, dto.getZipcode2());
			ps.setString(14, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	/**
	 * ȸ������ ���� �޼���
	 * 
	 * @param dto
	 */
	public void updateMember(MemberDTO dto) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_member set pwd=?, addr1=?, addr2=?, email1=?, email2=?, tel1=?, tel2=?,tel3=?, birthday1=?, birthday2=?, birthday3=?, zipcode1=?, zipcode2=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPwd());
			ps.setString(2, dto.getAddr1());
			ps.setString(3, dto.getAddr2());
			ps.setString(4, dto.getEmail1());
			ps.setString(5, dto.getEmail2());
			ps.setInt(6, dto.getTel1());
			ps.setInt(7, dto.getTel2());
			ps.setInt(8, dto.getTel3());
			ps.setInt(9, dto.getBirthday1());
			ps.setInt(10, dto.getBirthday2());
			ps.setInt(11, dto.getBirthday3());
			ps.setInt(12, dto.getZipcode1());
			ps.setInt(13, dto.getZipcode2());
			ps.setString(14, dto.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/**
	 * ȸ�� Ż�� �޼���
	 * 
	 * @param id
	 * @param pwd
	 * @return
	 */
	public int deleteMember(String id, String pwd) {
		String dbpwd = "";
		int result = -1;
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select pwd from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dbpwd = rs.getString("pwd");
				if (dbpwd.equals(pwd)) {
					String sql1 = "delete from mycine_member where id = ?";
					ps = conn.prepareStatement(sql1);
					ps.setString(1, id);
					ps.executeUpdate();
					result = 1;
				} else {
					result = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}

	/**
	 * 사용자 정보 가져오기
	 * 
	 * @param id
	 * @return
	 */
	public MemberDTO getMember(String id) {
		MemberDTO member = null;
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setIdx(rs.getInt("idx"));
				member.setId(rs.getString("Id"));
				member.setPwd(rs.getString("Pwd"));
				member.setName(rs.getString("Name"));
				member.setAddr1(rs.getString("Addr1"));
				member.setAddr2(rs.getString("Addr2"));
				member.setEmail1(rs.getString("Email1"));
				member.setEmail2(rs.getString("Email2"));
				member.setTel1(rs.getInt("Tel1"));
				member.setTel2(rs.getInt("Tel2"));
				member.setTel3(rs.getInt("Tel3"));
				member.setBirthday1(rs.getInt("Birthday1"));
				member.setBirthday2(rs.getInt("Birthday2"));
				member.setBirthday3(rs.getInt("Birthday3"));
				member.setPoint(rs.getInt("Point"));
				member.setJoindate(rs.getDate("Joindate"));
				member.setZipcode1(rs.getInt("Zipcode1"));
				member.setZipcode2(rs.getInt("Zipcode2"));
			}
			return member;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
	}
}
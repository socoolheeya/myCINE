package mycine.rboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class RequestBoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public RequestBoardDAO() {

	}

	public int getMaxRef() {
		try {
			String sql = "select max(ref) from mycine_r_board";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int requestWrite(RequestBoardDTO rDTO) {
		try {
			conn = mycine.db.DBInfo.getConn();
			int ref = getMaxRef();
			String sql = "insert into mycine_r_board values(mycine_r_board_idx.nextval,'loginid',?,sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, rDTO.getMovieName());
			ps.setInt(2, ref + 1);
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
	 * 요청한 사람 요청 영화 넣기
	 */
	public int request(String id, String movieName){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_request values(mycine_request_idx.nextval,?,?,false,0,0,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, movieName);
			int count = ps.executeUpdate();
			
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public ArrayList<RequestBoardDTO> requestList(int cp, int listSize) {
		try {
			conn = mycine.db.DBInfo.getConn();
			// String sql = "select * from jsp_bbs";
			String sql = "select * from ("
					+ "select rownum as rnum, a.* from ("
					+ "select * from mycine_r_board order by recommend desc, ref desc, sunburn asc)a)b "
					+ "where rnum >= (" + cp + "-1) *" + listSize + " + 1 "
					+ "and rnum <= " + cp + "*" + listSize;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<RequestBoardDTO> list = new ArrayList<RequestBoardDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String movieName = rs.getString("moviename");
				Date writeDate = rs.getDate("writedate");
				Boolean requestCheck = rs.getBoolean("requestcheck");
				int recommend = rs.getInt("recommend");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				RequestBoardDTO rdto = new RequestBoardDTO(idx, writer, movieName, writeDate, requestCheck, recommend, ref, lev, sunbun);
				list.add(rdto);
			}
			return list;
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int getTotalCnt(){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql ="select count(*) from mycine_r_board";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1: count;
		} catch(Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try{
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean movieCheck(String movieName){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select subject from mycine_movie from where subject=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, movieName);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs !=null) rs.close();
				if(ps !=null) ps.close();
				if(conn !=null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int writeRequestContent(String movieName, String user){
		try{
			conn = mycine.db.DBInfo.getConn();
			String sql ="insert into mycine_request values(mycine_request_idx.nextval,?,?,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, movieName);
			ps.setString(2, user);
			int count = ps.executeUpdate();
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if(ps!=null) ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}

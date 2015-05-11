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

	/**
	 * 요청 영화 중복 체크 메서드
	 * 
	 * @param movieName
	 * @return
	 */
	public boolean movieCheck(String movieName) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select subject from mycine_movie from where subject=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, movieName);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
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

	public int getMaxRef() {
		try {
			String sql = "select max(ref) from mycine_request";
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
			String sql = "insert into mycine_request values(mycine_request_idx.nextval,?,?,0,?,0,0,2,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, rDTO.getWriter());
			ps.setString(2, rDTO.getMovieName());
			ps.setInt(3, ref + 1);
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
	public int request(String id, String movieName) {
		try {
			conn = mycine.db.DBInfo.getConn();
			int ref = getMaxRef();
			String sql = "insert into mycine_request values(mycine_request_idx.nextval,?,?,0,?,0,0,2,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, movieName);
			ps.setInt(3, ref + 1);
			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
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

	public ArrayList<RequestBoardDTO> requestList(int cp, int listSize) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from ("
					+ "select rownum as rnum, a.* from ("
					+ "select * from mycine_request order by recommend desc, ref desc)a)b "
					+ "where rnum >= (" + cp + "-1) *" + listSize + " + 1 "
					+ "and rnum <= " + cp + "*" + listSize;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<RequestBoardDTO> list = new ArrayList<RequestBoardDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String movieName = rs.getString("moviename");
				int recommend = rs.getInt("recommend");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				int requestCheck = rs.getInt("requestcheck");
				Date writeDate = rs.getDate("writedate");
				RequestBoardDTO rdto = new RequestBoardDTO(idx, writer,
						movieName, recommend, ref, lev, sunbun, requestCheck,
						writeDate);
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

	/**
	 * 총 게시글 수 관련 메서드
	 * 
	 * @return
	 */
	public int getTotalCnt() {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select count(*) from mycine_request";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
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

	/**
	 * 추천하기 메서드
	 * 
	 * @param idx
	 * @return
	 */
	public int recommend(int idx) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_request set recommend = recommend + 1 where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
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
	 * 
	 * @param id
	 * @return
	 */
	public ArrayList<RequestBoardDTO> getRequestEvent(String id) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_request where writer = ? order by writedate desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			ArrayList<RequestBoardDTO> arr = new ArrayList<RequestBoardDTO>();
			while (rs.next()) {
				String writer = rs.getString("writer");
				String movieName = rs.getString("moviename");
				Date writeDate = rs.getDate("writedate");
				RequestBoardDTO rbDTO = new RequestBoardDTO(writer, movieName,
						writeDate);
				arr.add(rbDTO);
			}
			return arr;
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
}

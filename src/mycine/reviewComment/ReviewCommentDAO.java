package mycine.reviewComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class ReviewCommentDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public ReviewCommentDAO() {

	}

	/** 댓글 순번 관련 메서드 */
	public void updateSun(int ref, int sun) {
		try {
			String sql = "update mycine_board_comment set sunbun=sunbun+1 where ref=? and sunbun>=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun + 1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e2) {
			}
		}
	}

	/** cmt수정하기 메서드 */
	public int cmtRewrite(ReviewCommentDTO cmtdto) {
		try {
			conn = mycine.db.DBInfo.getConn();
			updateSun(cmtdto.getRef(), cmtdto.getSunbun());
			String sql = "insert into mycine_board_comment values"
					+ "(mycine_board_comment_idxcmt.nextval,?,?,?,sysdate,0,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cmtdto.getIdx());
			ps.setString(2, cmtdto.getWriter_cmt());
			ps.setString(3, cmtdto.getContent_cmt());
			ps.setInt(4, cmtdto.getRef());
			ps.setInt(5, cmtdto.getLev() + 1);
			ps.setInt(6, cmtdto.getSunbun() + 1);
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
			} catch (Exception e2) {
			}
		}
	}

	/** cmt ref 최고값 구하기 */
	public int getcmtMaxRef() {
		try {
			String sql = "select max(ref) from mycine_board_comment";
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
					rs.close();
			} catch (Exception e) {
			}
		}
	}

	/** cmt쓰기 메서드 */
	public int cmtWrite(ReviewCommentDTO cmtdto) {
		try {
			conn = mycine.db.DBInfo.getConn();
			int ref = getcmtMaxRef();
			String sql = "insert into mycine_board_comment values "
					+ "(mycine_board_comment_idxcmt.nextval,?,?,?,sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cmtdto.getIdx());
			ps.setString(2, cmtdto.getWriter_cmt());
			ps.setString(3, cmtdto.getContent_cmt());
			ps.setInt(4, ref + 1);
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
			} catch (Exception e2) {
			}
		}
	}

	/** cmt 목록 메서드 */
	public ArrayList<ReviewCommentDTO> cmtList(String fkey) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_board_comment where idx=? order by idxcmt desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, fkey);
			rs = ps.executeQuery();
			ArrayList<ReviewCommentDTO> cmtarr = new ArrayList<ReviewCommentDTO>();
			while (rs.next()) {
				int idxcmt = rs.getInt("idxcmt");
				int idx = rs.getInt("idx");
				String writer_cmt = rs.getString("writer_cmt");
				String content_cmt = rs.getString("content_cmt");
				Date writedate_cmt = rs.getDate("writedate_cmt");
				int recommend_cmt = rs.getInt("recommend_cmt");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");

				ReviewCommentDTO cmtdtos = new ReviewCommentDTO(idxcmt, idx,
						writer_cmt, content_cmt, writedate_cmt, recommend_cmt,
						ref, lev, sunbun);
				cmtarr.add(cmtdtos);
			}
			return cmtarr;
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
			}
		}
	}

	/** cmt 삭제 메서드 */
	public int cmtDel(ReviewCommentDTO cmtdto) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "delete from mycine_board_comment where idxcmt=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cmtdto.getIdxcmt());
			System.out.println(cmtdto.getIdxcmt());
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
			} catch (Exception e2) {
			}
		}
	}

	/**
	 * 댓글 달면 comment 테이블에 insert하는 메서드
	 * 
	 * @param idx
	 * @param commentID
	 * @param comment
	 * @return
	 */
	public int insertComment(int idx, String commentID, String comment) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_board_comment values "
					+ "(mycine_board_comment_idxcmt.nextval,?,?,?,sysdate,0,0,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setString(2, commentID);
			ps.setString(3, comment);

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
	 * 댓글 리스트 가져오기 메서드
	 * @param idx
	 * @return
	 */
	public ArrayList<ReviewCommentDTO> getComment(int idx) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_board_comment where idx=? order by writedate_cmt asc";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			ArrayList<ReviewCommentDTO> comment = new ArrayList<ReviewCommentDTO>();
			while (rs.next()) {
				int idxcmt = rs.getInt("idxcmt");
				String writer_cmt = rs.getString("writer_cmt");
				String content_cmt = rs.getString("content_cmt");
				Date writedate_cmt = rs.getDate("writedate_cmt");
				int recommend_cmt = rs.getInt("recommend_cmt");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				ReviewCommentDTO rcdto = new ReviewCommentDTO(idxcmt, idx,
						writer_cmt, content_cmt, writedate_cmt, recommend_cmt,
						ref, lev, sunbun);
				comment.add(rcdto);
			}
			return comment;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 댓글 숫자를 가져오는 메서드
	 * @param idx
	 * @return
	 */
	public int getCommentCount(int idx) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select count(idxcmt) from mycine_board_comment where idx =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
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

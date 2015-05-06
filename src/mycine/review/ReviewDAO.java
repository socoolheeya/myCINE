package mycine.review;

import java.sql.*;
import java.util.*;

public class ReviewDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ReviewDAO(){
		System.out.println("dao생성자 호출됨");
	}
	
	/**조회수 증가*/
	public void getReadnum(int idx){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="update mycine_board set readnum=readnum+1 where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**ref 최고값 구하기*/
	public int getMaxRef(){
		try{
			String sql="select max(ref) from jsp_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}else{
				return 0;
			}
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
			}catch(Exception e){}
		}
	}
	
	/**글쓰기관련 메서드*/
	public int reviewWrite(ReviewDTO redto){
		try {
			conn=mycine.db.DBInfo.getConn();
			int ref=getMaxRef();
			String sql="insert into mycine_board values (mycine_board_idx.nextval,?,?,?,sysdate,0,0,?,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, redto.getWriter());
			ps.setString(2, redto.getSubject());
			ps.setString(3, redto.getContent());
			ps.setInt(4, redto.getGrade());
			ps.setInt(5, ref+1);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**총 게시글 관련 메소드*/
	public int getTotalCnt(){
		try{
			conn=mycine.db.DBInfo.getConn();
			String sql="select count(*) from mycine_board";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return rs.getInt(1)==0?1:count;
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e){}
		}
	}
	
	/**글목록 관련 메서드*/
	public ArrayList<ReviewDTO> reviewList(int cp, int ls){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="select * from (select rownum as rnum,a.* from "
					+ "(select * from mycine_board order by idx desc)a)b "
					+ "where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<ReviewDTO> arr=new ArrayList<ReviewDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int readnum=rs.getInt("readnum");
				int recommend=rs.getInt("recommend");
				int grade=rs.getInt("grade");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");
				
				ReviewDTO redtos=new ReviewDTO(idx, writer, subject, content, 
						writedate, readnum, recommend, grade, ref, lev, sunbun);
				arr.add(redtos);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**글목록 관련 메서드*/
	public ArrayList<ReviewDTO> reviewfind(int cp, int ls, String fkey, String fvalue){
		try {
			conn=mycine.db.DBInfo.getConn();
			//String sql="select * from mycine_board order by idx desc";
			String sql="select * from (select rownum as rnum,a.* from "
					+ "(select * from mycine_board where "+fkey+" like "+"'%"+fvalue+"%'"+" order by idx desc)a)b "
					+ "where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<ReviewDTO> arr=new ArrayList<ReviewDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int readnum=rs.getInt("readnum");
				int recommend=rs.getInt("recommend");
				int grade=rs.getInt("grade");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");
				
				ReviewDTO redtos=new ReviewDTO(idx, writer, subject, content, 
						writedate, readnum, recommend, grade, ref, lev, sunbun);
				arr.add(redtos);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**글보기 관련 메서드*/
	public ReviewDTO reviewContent(int idx){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="select * from mycine_board where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			if(rs.next()){
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int readnum=rs.getInt("readnum");
				int recommend=rs.getInt("recommend");
				int grade=rs.getInt("grade");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");
				
				ReviewDTO redto=new ReviewDTO(idx, writer, subject, content, 
						writedate, readnum, recommend, grade, ref, lev, sunbun);
				return redto;
			}else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**글 수정하기 메서드*/
	public int reviewUpdateWrite(ReviewDTO redto){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="update mycine_board set subject=?, content=? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, redto.getSubject());
			ps.setString(2, redto.getContent());
			ps.setInt(3, redto.getIdx());
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**글삭제 관련 메서드*/
	public int reviewDel(ReviewDTO redto){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="delete from mycine_board where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, redto.getIdx());
			System.out.println(redto.getIdx());
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**
	 * 추천하기 메서드
	 * @param idx
	 * @return
	 */
	public int recommend(int idx){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "update mycine_board set recommend = recommend + 1 where idx = ?";
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
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}

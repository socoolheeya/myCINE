package mycine.review;

import java.sql.*;
import java.util.*;

public class ReviewDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ReviewDAO(){
	}
	
	
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
	
	
	public int reviewWrite(ReviewDTO redto){
		try {
			conn= mycine.db.DBInfo.getConn();
			int ref=getMaxRef();
			String sql="insert into mycine_board values "
					+ "(mycine_board_idx.nextval,?,?,?,sysdate,0,0,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, redto.getWriter());
			ps.setString(2, redto.getSubject());
			ps.setString(3, redto.getContent());
			ps.setInt(4, ref+1);
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
	
	/**湲�紐⑸줉 愿��젴 硫붿꽌�뱶*/
	public ArrayList<ReviewDTO> reviewList(){
		try {
			conn= mycine.db.DBInfo.getConn();
			String sql="select * from mycine_board order by idx desc";
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
				
				ReviewDTO redtos=new ReviewDTO
						(idx, writer, subject, content, writedate, readnum, 
								recommend, grade, ref, lev, sunbun);
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
	
	/**湲�蹂닿린 愿��젴 硫붿꽌�뱶*/
	public ReviewDTO reviewContent(int idx){
		try {
			conn= mycine.db.DBInfo.getConn();
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
				
				ReviewDTO redto=new ReviewDTO
						(idx, writer, subject, content, writedate, readnum, 
								recommend, grade, ref, lev, sunbun);
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
	
	/**湲��궘�젣 愿��젴 硫붿꽌�뱶*/
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
}

package mycine.qna;

import java.sql.*;
import java.util.*;

public class QnaDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public QnaDAO() {
		System.out.println("myCINE생성자 호출됨");
	}
	
	/**q_ref최고값*/
	public int getMaxRef(){
		try{
			String sql="select max(q_ref) from mycine_qna";
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
				if(ps!=null)ps.close();
			}catch(Exception e){}
		}
	}
	
	/**질문하기 관련*/
	public int QnAwriter(QnaDTO dto){
		try{
			conn= mycine.db.DBInfo.getConn();
			int q_ref=getMaxRef();
			String sql="insert into mycine_qna values(myCINE_QnA_Q_idx.nextval,?,?,?,?,sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getQ_writer());
			ps.setString(2, dto.getQ_pwd());
			ps.setString(3, dto.getQ_subject());
			ps.setString(4, dto.getQ_content());
			ps.setInt(5, q_ref+1);
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e){}
		}
		
	}
	/**수정관련 메소드*/
	public void updateSun(int q_ref,int q_sun){
		try{
			
			String sql="update mycine_qna set q_sunbun=q_sunbun+1 where q_ref=? and q_sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, q_ref);
			ps.setInt(2, q_sun+1);
			ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {}
		}
	}
	/**답변쓰기 관련 메소드*/
	public int QnAReWrite(QnaDTO dto){
		try{
			conn= mycine.db.DBInfo.getConn();
			updateSun(dto.getQ_ref(), dto.getQ_sunbun());
			String sql="insert into mycine_qna values(myCINE_QnA_Q_idx.nextval,?,?,?,?,sysdate,0,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getQ_writer());
			ps.setString(2, dto.getQ_pwd());
			ps.setString(3, dto.getQ_subject());
			ps.setString(4, dto.getQ_content());
			ps.setInt(5, dto.getQ_ref());
			ps.setInt(6, dto.getQ_lev()+1);
			ps.setInt(7, dto.getQ_sunbun()+1);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
			}catch(Exception e){}
		}
	}

	/**목록보기관련*/
	public ArrayList<QnaDTO> QnAList(int cp,int ls){
		try{
			conn= mycine.db.DBInfo.getConn();
			String sql="select * from "+
					"(select rownum as rnum,a.* from "+
					"(select * from mycine_qna order by q_ref desc,q_sunbun asc)a)b "+
					"where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
		//	String sql="select * from mycine_qna order by q_idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<QnaDTO> arr=new ArrayList<QnaDTO>();
			while(rs.next()){
				int q_idx=rs.getInt("q_idx");
				String q_writer=rs.getString("q_writer");
				String q_pwd=rs.getString("q_pwd");
				String q_subject=rs.getString("q_subject");
				String q_content=rs.getString("q_content");
				java.sql.Date q_writedate=rs.getDate("q_writedate");	
				int q_readnum=rs.getInt("q_readnum");
				int q_ref=rs.getInt("q_ref");
				int q_lev=rs.getInt("q_lev");
				int q_sunbun=rs.getInt("q_sunbun");
				
				QnaDTO dto=new QnaDTO(q_idx, q_writer, q_pwd, q_subject, q_content,
						q_writedate, q_readnum, q_ref, q_lev, q_sunbun);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e){
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
/**본문관련*/
	public QnaDTO QnAContent(int q_idx){
		try{
			conn= mycine.db.DBInfo.getConn();
			String sql="select * from mycine_qna where q_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, q_idx);
			rs=ps.executeQuery();
			if(rs.next()){
				String q_writer=rs.getString("q_writer");
				String q_pwd=rs.getString("q_pwd");
				String q_subject=rs.getString("q_subject");
			   String q_content=rs.getString("q_content");
			   java.sql.Date q_writedate=rs.getDate("q_writedate");
				int q_readnum=rs.getInt("q_readnum");
				int q_ref=rs.getInt("q_ref");
				int q_lev=rs.getInt("q_lev");
				int q_sunbun=rs.getInt("q_sunbun");
				QnaDTO dto=new QnaDTO(q_idx, q_writer, q_pwd, q_subject,
						q_content, q_writedate, q_readnum, q_ref, q_lev, q_sunbun);
				return dto;
			}else{
				return null;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			}catch(Exception e){}
		}
	}
	/**총게시글수*/
	public int getTotalCnt(){
		try{
			conn= mycine.db.DBInfo.getConn();
			String sql="select count(*) from mycine_qna";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
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

	/**삭제관련*/
	public int QnADel(QnaDTO dto){
		try{
			conn= mycine.db.DBInfo.getConn();
			String sql="delete from mycine_qna where q_pwd=?";

			//String sql="delete from mycine_qna where q_idx=? and q_pwd=?";
			ps=conn.prepareStatement(sql);
			//ps.setInt(1, dto.getQ_idx());
			ps.setString(1, dto.getQ_pwd());
			int count =ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e){}
		}
	}
}


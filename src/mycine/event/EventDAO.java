package mycine.event;

import java.sql.*;
import java.util.*;

public class EventDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public EventDAO(){
	System.out.println("EventDAO 호출!");	
	}

	// 내 포인트 조회 (포인트 조회)
	public EventDTO eventMypoint(String id) {

		try {
			EventDTO dto = null;
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {

				int point = rs.getInt("point");

				dto = new EventDTO(id, point);

			}
			return dto;
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
				// TODO: handle exception
			}
		}
	}
	
	//포인트 조회(교환 가능한 상품)
	public ArrayList<EventDTO> eventPrize(String id){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="select e_prize from MYCINE_EVENT where E_POINT <=(select point from MYCINE_MEMBER where id=?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			ArrayList<EventDTO> arr=new ArrayList<EventDTO>();
			while(rs.next()){
				String e_prize=rs.getString("e_prize");
				
				EventDTO dto=new EventDTO(id,e_prize);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	//상품교환 (포인트차감)
	public int updatePoint(String id,int usepoint){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="update mycine_member set point=point-? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, usepoint);
			ps.setString(2, id);
			
			int count=ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	//상품교환 (상품리스트 추가)
	public int insertPrize(String id,String userprize){
		try {
			conn=mycine.db.DBInfo.getConn();
			String sql="insert into mycine_prize values(mycine_prize_idx.nextval,?,'unused',?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, userprize);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	//상품 리스트
		public ArrayList<EventDTO> prizeList(String id,int cp, int listSize){
			try {
				
				conn=mycine.db.DBInfo.getConn();
				String sql = "select * from ("
			               + "select rownum as rnum, a.* from ("
			               + "select * from mycine_prize where id=?)a)b "
			               + "where rnum >= (" + cp + "-1) *" + listSize + " + 1 "
			               + "and rnum <= " + cp + "*" + listSize;
				
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				
				ArrayList<EventDTO> arr= new ArrayList<EventDTO>();
				
				while(rs.next()){
					
					
					int idx=rs.getInt("idx");
					String user_prize=rs.getString("user_prize");
					String use=rs.getString("use");
					int rnum=rs.getInt("rnum");
					
					EventDTO dto= new EventDTO(id,idx,user_prize,use,rnum);
					arr.add(dto);

				}
			
				return arr;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}finally{
				try {
					if (rs != null)
						rs.close();
					if (ps != null)
						ps.close();
					if (conn != null)
						conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
		
		//상품리스트에서수령
		public int exPrize(int idx){
			try {
				conn=mycine.db.DBInfo.getConn();
				String sql="update mycine_prize set use='used' where idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx);
				
				int count=ps.executeUpdate();
				
				return count;
			} catch (Exception e) {
				e.printStackTrace();
				return -1;
			}finally{
				try {
					
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			
		}
		//상품리스트에서삭제
		public int dePrize(int idx){
			try {
				conn=mycine.db.DBInfo.getConn();
				String sql="delete from mycine_prize where idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx);
				
				int count=ps.executeUpdate();
				
				return count;
			} catch (Exception e) {
				e.printStackTrace();
				return -1;
			}finally{
				try {
					
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			
		}
		public int getTotalCnt (String id){
			try {
				conn=mycine.db.DBInfo.getConn();
				String sql="select count(*) from MYCINE_PRIZE where id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				int count=rs.getInt(1);
				return count==0?1:count;
			} catch (Exception e) {
				e.printStackTrace();
				return -1;
			}finally{
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				} catch (Exception e) {
				
				}
			}
		}
	
}

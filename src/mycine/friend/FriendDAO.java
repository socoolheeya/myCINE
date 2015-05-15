package mycine.friend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FriendDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public FriendDAO(){
		
	}
	/**
	 * 친구 추가
	 * @param fdto
	 */
	public void addFreind(FriendDTO fdto){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "insert into mycine_friend values(?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fdto.getIdx());
			ps.setString(2, fdto.getFriendId());
			ps.setString(3, fdto.getFriendName());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
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
	 * 
	 * @return
	 */
	public ArrayList<FriendDTO> getFriendList() {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_friend";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<FriendDTO> list = new ArrayList<FriendDTO>();
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String friendId = rs.getString("friendId");
				String friendName = rs.getString("friendName");
				FriendDTO fdto = new FriendDTO(idx, friendId, friendName);
				list.add(fdto);	
			}
			return list;
		} catch(Exception e) {
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
}
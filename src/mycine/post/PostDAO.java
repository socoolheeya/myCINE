package mycine.post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public PostDAO() {

	}
	/**
	 * 우편번호 리스트 
	 * @param requestDong
	 * @return
	 */
	public ArrayList<PostDTO> findAddr(String requestDong) {
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_post where dong like '%"+requestDong+"%'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<PostDTO> arr = new ArrayList<PostDTO>();
			while (rs.next()) {
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String ri = rs.getString("ri");
				String bldg = rs.getString("bldg");
				String bunji = rs.getString("bunji");
				int seq = rs.getInt("seq");
				PostDTO postDTO = new PostDTO(seq, zipcode, sido, gugun,
						requestDong, ri, bldg, bunji);
				arr.add(postDTO);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean postCheck(String zipcode){
		try{		
			String sql = "select zipcode from mycine_post where zipcode = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, zipcode);
			rs = ps.executeQuery();

			return rs.next();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}

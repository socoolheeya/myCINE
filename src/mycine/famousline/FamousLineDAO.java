package mycine.famousline;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FamousLineDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public int getRandomIdx(){
		
		int num = (int)(Math.random()*10) + 1;
		System.out.println(num);
		return num;
	}
	
	public FamousLineDTO getFamousLine(int idx){
		try {
			conn = mycine.db.DBInfo.getConn();
			String sql = "select * from mycine_famousline where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			FamousLineDTO fdto = null;
			while(rs.next()) {
				String famousLine = rs.getString("famousline");
				String name = rs.getString("name");
				
				fdto = new FamousLineDTO(idx, name, famousLine);
			}
			return fdto;
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

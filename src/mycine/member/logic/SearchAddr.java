package mycine.member.logic;

import javax.servlet.http.HttpServletRequest;

public class SearchAddr {
	
	public static String searchAddr(HttpServletRequest req){
		
		String str = null;
		StringBuffer sb = new StringBuffer();
		
		if (req.getMethod().equals("GET")) {
			sb.append("<h4>위 검색란에 검색어를 입력해주세요</h4>");
			
		} else {
			str = "addrList.jsp";
			sb.append("<jsp:include page='");
			sb.append(str);
			sb.append("'/>");
		}

		return sb.toString();
	}
}

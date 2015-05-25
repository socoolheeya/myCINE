package mycine.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.post.PostDAO;
import mycine.post.PostDTO;

public class UpdateSearchAddrFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String requestDong = req.getParameter("dong");
		StringBuffer sb = new StringBuffer();
		PostDAO dao = new PostDAO();
		ArrayList<PostDTO> arr = dao.findAddr(requestDong);
		if(req.getMethod().equals("GET")) {
			sb.append("<h4>위 검색란에 검색어를 입력해주세요</h4>");
		} else {
			sb.append("	<jsp:include page='addrList2.jsp' />");
		}
		String str = sb.toString();
		
		req.setAttribute("str", str);
		req.setAttribute("arr", arr);
		
		return "updateSearchAddr.jsp";
	}

}

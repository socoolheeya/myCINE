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
		PostDAO dao = new PostDAO();
		ArrayList<PostDTO> arr = dao.findAddr(requestDong);
		
	
		String updateSearchAddrResult = mycine.member.logic.SearchAddr.searchAddr(req);
		
		req.setAttribute("updateSearchAddrResult", updateSearchAddrResult);
		req.setAttribute("arr", arr);
		
		return "updateSearchAddr.jsp";
	}

}

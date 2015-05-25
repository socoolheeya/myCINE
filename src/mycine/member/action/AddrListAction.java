package mycine.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.post.PostDAO;
import mycine.post.PostDTO;

public class AddrListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		PostDAO dao = new PostDAO();
		String requestDong = req.getParameter("dong");
		ArrayList<PostDTO> arr = dao.findAddr(requestDong);
		String zipcode = null;
		String addr = null;
		
		String str = mycine.member.logic.AddrList.addrList(req, requestDong, arr, zipcode, addr);
		req.setAttribute("str", str);
		
		return "/member/addrList.jsp";
	}
}

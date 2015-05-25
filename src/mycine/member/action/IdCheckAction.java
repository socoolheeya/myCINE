package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.member.model.MemberDAO;

public class IdCheckAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		MemberDAO dao = new MemberDAO();
		boolean result = dao.idCheck(id);
		
		req.setAttribute("result", result);
		req.setAttribute("id", id);
		
		return "/member/idCheck_ok.jsp";
	}

}

package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.member.model.MemberDAO;

public class MemberDeleteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO(); 
		String id = (String) req.getSession().getAttribute("id");
		String pwd = req.getParameter("pwd");
		int check = dao.deleteMember(id, pwd);
		if (check == 1) {
			req.getSession().invalidate();
		}
		req.setAttribute("check", check);
		
		return "/member/memberDelete_ok.jsp";
	}

}

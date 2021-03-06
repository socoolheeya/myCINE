package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.member.model.MemberDAO;
import mycine.member.model.MemberDTO;

public class MemberInfoFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String id = (String) req.getSession().getAttribute("id");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(id);
		
		req.setAttribute("dto", dto);
		
		return "/member/memberInfo.jsp";
	}

}

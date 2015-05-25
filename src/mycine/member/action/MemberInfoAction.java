package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.member.model.MemberDAO;
import mycine.member.model.MemberDTO;

public class MemberInfoAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = (String)req.getSession().getAttribute("id");
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto.setId(id);
		dao.updateMember(dto);
		
		return "/member/memberInfo_ok.jsp";
	}

}

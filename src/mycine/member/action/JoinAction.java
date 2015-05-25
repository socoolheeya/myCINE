package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.member.model.MemberDAO;
import mycine.member.model.MemberDTO;
import mycine.timeline.TimeLineDAO;

public class JoinAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx"));
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		int tel1 = Integer.parseInt(req.getParameter("tel1"));
		int tel2 = Integer.parseInt(req.getParameter("tel2"));
		int tel3 = Integer.parseInt(req.getParameter("tel3"));
		int birthday1 = Integer.parseInt(req.getParameter("birthday1"));
		int birthday2 = Integer.parseInt(req.getParameter("birthday2"));
		int birthday3 = Integer.parseInt(req.getParameter("birthday3"));
		int zipcode1 = Integer.parseInt(req.getParameter("zipcode1"));
		int zipcode2 = Integer.parseInt(req.getParameter("zipcode2"));
		String msg = null;
		MemberDTO dto = new MemberDTO(idx, id, pwd, name, addr1, addr2, email1,
				email2, tel1, tel2, tel3, birthday1, birthday2, birthday3,
				zipcode1, zipcode2);
		MemberDAO dao = new MemberDAO();
		TimeLineDAO tdao = new TimeLineDAO();
		int result = dao.joinMember(dto);
		if(result > 0 ) {
			tdao.addJoinEvent(dto);
		} else {
			msg = "가입 실패!";
		}
		req.setAttribute("result", result);
		req.setAttribute("msg", msg);
		
		return "/member/joinMsg.jsp";
	}
}

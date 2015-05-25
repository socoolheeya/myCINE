package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.member.model.MemberDAO;

public class LoginAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String userid = req.getParameter("id");
		String userpwd = req.getParameter("pwd");
		String saveid = req.getParameter("saveid");
		MemberDAO dao = new MemberDAO();
		int result = dao.loginCheck(userid, userpwd);
		String dbName = null;
		String msg = null;
		Cookie ck = null;
		
		if (result == dao.LOGIN_OK) {
			dbName = dao.getUserName(userid);
			dao.getLoginPoint(userid); // 로그인하면 10포인트 주기

			if (saveid == null || saveid.equals("")) {
				ck = new Cookie("saveid", userid);
				ck.setMaxAge(0);
				//resp.addCookie(ck);
			} else {
				ck = new Cookie("saveid", userid);
				ck.setMaxAge(60 * 60 * 24 * 30);
				//resp.addCookie(ck);
			}
			
		} else if (result == dao.NOT_ID) {
			msg = "잘못된 ID 입니다.";
	
		} else if (result == dao.NOT_PWD) {
			 msg = "잘못된 비밀번호 입니다.";
		
		}
		resp.addCookie(ck);
		req.setAttribute("msg", msg);
		req.getSession().setAttribute("name", dbName);
		req.getSession().setAttribute("id", userid);
		
		return "/member/msg/loginMsg.jsp";		 
	}
}
package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class LoginFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String saveid = "";
		Cookie cks[] = req.getCookies();
		if (cks != null && cks.length != 0) {
			for (int i = 0; i < cks.length; i++) {
				if (cks[i].getName().equals("saveid")) {
					saveid = cks[i].getValue();
				}
			}
		}
		String str = saveid.equals("") ? "" : "checked";
		
		req.setAttribute("saveid", saveid);
		req.setAttribute("str", str);
		
		return "/member/login.jsp";
	}

}
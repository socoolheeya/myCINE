package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class JoinFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String zipcode = req.getParameter("zipcode");
		String addr = req.getParameter("addr");
		
		req.setAttribute("zipcode", zipcode);
		req.setAttribute("addr", addr);
		
		return "/member/join.jsp";
	}

}

package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class UpdateSearchAddrAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String zipcode = req.getParameter("zipcode");
		String zip[] = zipcode.split("-");
		String zipcode1 = zip[0];
		String zipcode2 = zip[1];
		String addr = req.getParameter("addr");
		
		req.setAttribute("zipcode1", zipcode1);
		req.setAttribute("zipcode2", zipcode2);
		req.setAttribute("addr", addr);
		
		return "/member/updateSearchAddr_ok.jsp";
	}

}

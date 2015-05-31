package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class ReviewDelFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		req.setAttribute("idx", idx);		
		
		return "/review/reviewDel.jsp";
	}

}

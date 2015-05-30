package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class ReviewUpdateFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int idx_s = Integer.parseInt(req.getParameter("idx"));
		String writer = req.getParameter("writer");
		String subject = req.getParameter("subject");
		String content_s = req.getParameter("content");
		String content = content_s.replace("\n", "<br>");
		int grade_s = Integer.parseInt(req.getParameter("grade"));
		
		req.setAttribute("idx", idx_s);
		req.setAttribute("writer", writer);
		req.setAttribute("subject", subject);
		req.setAttribute("content", content);
		req.setAttribute("grade", grade_s);
		
		return "review/reviewUpdateWrite.jsp";
	}

}

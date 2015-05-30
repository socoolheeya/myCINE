package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class ReviewCommentFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String id = (String)req.getSession().getAttribute("id");
		String contentIdx = req.getParameter("idx");
		
		req.setAttribute("id", id);
		req.setAttribute("contentIdx", contentIdx);
		
		return "/review/reviewComment.jsp";
	}

}

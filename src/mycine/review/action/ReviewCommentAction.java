package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.reviewComment.ReviewCommentDAO;

public class ReviewCommentAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String idx_s = req.getParameter("idx");
		int idx = Integer.parseInt(idx_s);
		String commentID = req.getParameter("writer_cmt");
		String comment = req.getParameter("content_cmt");
		ReviewCommentDAO dao = new ReviewCommentDAO();
		int result = dao.insertComment(idx, commentID, comment);
		
		req.setAttribute("result", result);
		req.setAttribute("idx", idx);
		return "/review/reviewComment_ok.jsp";
	}

}

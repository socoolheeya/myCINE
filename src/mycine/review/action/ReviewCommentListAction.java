package mycine.review.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.reviewComment.ReviewCommentDAO;
import mycine.reviewComment.ReviewCommentDTO;

public class ReviewCommentListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int contentidx = Integer.parseInt(req.getParameter("idx"));
		ReviewCommentDAO dao = new ReviewCommentDAO();
		ArrayList<ReviewCommentDTO> arr = dao.getComment(contentidx);
		
		req.setAttribute("contentIdx", contentidx);
		req.setAttribute("arr", arr);
		
		return "/review/reviewCommentList.jsp";
	}

}

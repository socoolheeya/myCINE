package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.review.model.ReviewDAO;
import mycine.review.model.ReviewDTO;

public class ReviewUpdateAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		int idx = Integer.parseInt(req.getParameter("idx"));
		String writer = req.getParameter("writer");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		int grade = Integer.parseInt(req.getParameter("grade"));
		
		ReviewDTO dto = new ReviewDTO(idx, writer, subject, content, grade);
		int result = dao.reviewUpdateWrite(dto);
		String msg=result > 0 ? "수정완료" : "수정실패";
		
		req.setAttribute("msg", msg);
		
		return "/review/reviewUpdateWrite_ok.jsp";
	}

}

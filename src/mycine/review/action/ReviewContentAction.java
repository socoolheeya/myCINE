package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.review.model.ReviewDAO;
import mycine.review.model.ReviewDTO;

public class ReviewContentAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String idx_s = req.getParameter("idx");
		if(idx_s == null || idx_s.equals("")) {
			idx_s = "0";
		}
		
		int idx = Integer.parseInt(idx_s);
		String id = (String)req.getSession().getAttribute("id");
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.reviewContent(idx);
		String rcontent = dto.getContent().replace("\n", "<br>");
		dao.getReadnum(idx);
		
		req.setAttribute("dto", dto);
		req.setAttribute("rcontent", rcontent);
		
		return "/review/reviewContent.jsp";
	}

}

package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.review.model.ReviewDAO;
import mycine.review.model.ReviewDTO;

public class ReviewDelAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		ReviewDAO dao = new ReviewDAO();
		int idx = Integer.parseInt(req.getParameter("idx"));
		ReviewDTO dto = new ReviewDTO(idx);
		int result = dao.reviewDel(dto);

		String msg = result > 0 ? "삭제되었습니다." : "삭제실패";
		
		req.setAttribute("msg", msg);
		
		return "/review/reviewDel_ok.jsp";
	}

}

package mycine.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.member.model.MemberDAO;
import mycine.review.model.ReviewDAO;
import mycine.review.model.ReviewDTO;
import mycine.timeline.model.TimeLineDAO;

public class ReviewWriteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String id = (String)req.getSession().getAttribute("id");
		ReviewDAO dao = new ReviewDAO();
		MemberDAO mdao = new MemberDAO();
		TimeLineDAO tdao = new TimeLineDAO();
		String writer = req.getParameter("writer");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		int grade = Integer.parseInt(req.getParameter("grade"));
		ReviewDTO dto = new ReviewDTO(writer, subject, content, grade);
		int result = dao.reviewWrite(dto);
		String msg = null;
		if (result > 0) {
			if(id == null || id.equals("")) {
				msg = "작성 성공!";
			} else {
				int count = mdao.addReviewPoint(id);
				if(count > 0) {
					tdao.addReviewWriteEvent(id);
					msg = "작성 성공!";
				}
			}
		} else {
			msg = "작성 실패!";
		}
		
		req.setAttribute("msg", msg);
		
		return "/review/reviewWrite_ok.jsp";
	}
}
package mycine.review.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.review.model.ReviewDAO;
import mycine.review.model.ReviewDTO;

public class ReviewFindMyContentAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		ReviewDAO dao = new ReviewDAO();
		int totalCnt = dao.getTotalCnt();//총 게시물 수
		int listSize = 15;//보여줄 리스트 수
		int pageSize = 10;//보여줄 페이지 수

		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}

		int cp = Integer.parseInt(cp_s);
		String pageLogic = mycine.page.PageController.pageLogic("reviewFindMyContnent.do", totalCnt, listSize, pageSize, cp);
		
		String fkey = req.getParameter("fkey");
		String fvalue = req.getParameter("fvalue");
		
		String loginID = (String)req.getSession().getAttribute("id");
		ArrayList<ReviewDTO> arr = dao.showMyReviewContent(loginID);
		
		req.setAttribute("fkey", fkey);
		req.setAttribute("fvalue", fvalue);
		req.setAttribute("arr", arr);
		req.setAttribute("pageLogic", pageLogic);
		
		
		return "/review/reviewFindMyContent.do";
	}

}

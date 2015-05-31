package mycine.review.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.review.model.ReviewDAO;
import mycine.review.model.ReviewDTO;

public class ReviewSearchListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		int totalCnt = dao.getTotalCnt();// 총 게시물 수
		int listSize = 15;// 보여줄 리스트 수
		int pageSize = 10;// 보여줄 페이지 수

		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}

		int cp = Integer.parseInt(cp_s);
		String pageLogic = mycine.page.PageController.pageLogic(
				"reviewSearchList.do", totalCnt, listSize, pageSize, cp);
		
		//String fkey=req.getParameter("fkey");
		//String fvalue=req.getParameter("fvalue");
		
		String requestSubject = req.getParameter("searchKeyword");
		ArrayList<ReviewDTO> arr = dao.reviewList(cp, listSize);
		
		if(arr != null && arr.equals("") == false ) {
			for(int i = 0; i < arr.size(); i++) {
				if (arr.get(i).getSubject().contains(requestSubject)) {
					
				}
			}
		}
		
		
		req.setAttribute("pageLogic", pageLogic);
		req.setAttribute("requestSubject", requestSubject);
		req.setAttribute("arr", arr);

		return "/review/reviewSearchList.jsp";
	}

}

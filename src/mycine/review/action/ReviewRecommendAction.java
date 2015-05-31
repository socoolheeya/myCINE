package mycine.review.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.recommend.RecommendDAO;
import mycine.recommend.RecommendDTO;
import mycine.review.model.ReviewDAO;
import mycine.timeline.model.TimeLineDAO;

public class ReviewRecommendAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(req.getParameter("idx"));
		String id = req.getParameter("id");
		ReviewDAO dao = new ReviewDAO();
		TimeLineDAO tdao = new TimeLineDAO();
		RecommendDAO rdao = new RecommendDAO();
		ArrayList<RecommendDTO> arr = rdao.getRecommendID2(idx, id);
		String msg = null;
		
		if(arr == null || arr.size() == 0) {
			int count=rdao.recommendUpdate2(idx, id);
			if(count >0){
				dao.recommend(idx);
				tdao.addReviewRecommendEvent(idx, id);
				msg = "추천되었습니다.";
			}
		} else {
			msg = "이미 추천되었습니다.";
		}
		
		req.setAttribute("msg", msg);
		
		return "/review/reviewRecommend.jsp";
	}

}

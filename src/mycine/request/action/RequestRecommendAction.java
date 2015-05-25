package mycine.request.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.recommend.RecommendDAO;
import mycine.recommend.RecommendDTO;
import mycine.request.model.RequestBoardDAO;
import mycine.timeline.model.TimeLineDAO;

public class RequestRecommendAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		String id = req.getParameter("id");
		int count = 0;
		
		RecommendDAO dao = new RecommendDAO();
		RequestBoardDAO rdao = new RequestBoardDAO();
		TimeLineDAO tdao = new TimeLineDAO();
	
		ArrayList<RecommendDTO> arr = dao.getRecommendID(idx, id);
		if(arr == null || arr.size() == 0) {
			count = dao.recommendUpdate(idx, id);
			if(count > 0) {
				rdao.recommend(idx);
				tdao.addRequestRecommendEvent(idx, id);
			}
		}
		req.setAttribute("count", count);
		
		return "/request/recommend.jsp";
	}

}
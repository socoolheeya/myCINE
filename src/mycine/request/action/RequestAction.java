package mycine.request.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.request.model.RequestBoardDAO;
import mycine.timeline.model.TimeLineDAO;

public class RequestAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String movieName = req.getParameter("searchword");
		RequestBoardDAO dao = new RequestBoardDAO();
		TimeLineDAO tdao = new TimeLineDAO();
		String id = (String)req.getSession().getAttribute("id"); 
		
		boolean result = dao.movieCheck(movieName);
		int count = dao.request(id, movieName);
		
		String msg = null;
		if(result) {
			msg = "이미 존재하는 영화입니다.";
		} else {
			if(count > 0) {
				tdao.addRequestMovieEvent(id, movieName);
				msg = "요청성공!";
			} else {
				msg = "요청실패!";
			}
		}
		
		req.setAttribute("count", count);
		req.setAttribute("result", result);
		req.setAttribute("msg", msg);
		
		return "/request/request_ok.jsp";
	}

}

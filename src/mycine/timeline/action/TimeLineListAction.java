package mycine.timeline.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.timeline.model.TimeLineDAO;
import mycine.timeline.model.TimeLineDTO;

public class TimeLineListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id = (String)req.getSession().getAttribute("id");
		TimeLineDAO dao = new TimeLineDAO();
		ArrayList<TimeLineDTO> timeArr = dao.getTimeLineEvent(id);
		
		req.setAttribute("timeArr", timeArr);
		
		return "/timeLine.jsp";
	}

}

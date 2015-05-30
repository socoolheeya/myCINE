package mycine.event.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.event.model.EventDAO;
import mycine.main.CommandHandler;

public class EventDePrizeAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		EventDAO dao = new EventDAO();
		String idx_s = req.getParameter("idx");
		int idx = Integer.parseInt(idx_s);
		String use = req.getParameter("use");
		String msg = null;
		if (use.equals("X")) {
			msg = "사용후에 삭제가 가능합니다.";
		} else {
			int count = dao.event_DePrize(idx);
			if (count > 0) {
				msg = "삭제되었습니다.";
			}
		}
		
		req.setAttribute("msg", msg);
		
		return "/event/event_Deprize.jsp";
	}

}

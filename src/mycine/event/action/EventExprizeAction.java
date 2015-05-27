package mycine.event.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.event.model.EventDAO;
import mycine.main.CommandHandler;

public class EventExprizeAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String idx_s = req.getParameter("idx");
		int idx = Integer.parseInt(idx_s);
		String use = req.getParameter("use");
		EventDAO dao = new EventDAO();
		
		int count = 0;
		if (use.equals("O")) {

		} else {
			count = dao.event_UsePrize(idx);
		}
		req.setAttribute("use", use);
		req.setAttribute("count", count);
		
		return "/event/event_Exprize.jsp";
	}

}

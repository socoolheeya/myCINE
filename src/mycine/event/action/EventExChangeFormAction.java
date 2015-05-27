package mycine.event.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.event.model.EventDAO;
import mycine.event.model.EventDTO;
import mycine.main.CommandHandler;

public class EventExChangeFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		EventDAO dao = new EventDAO();
		String id = (String) req.getSession().getAttribute("id");
		if (id == null || id.equals("")) {
			id = "0";
		}
		EventDTO dto = dao.event_MyPoint(id);
		req.setAttribute("dto", dto);
		
		return "/event/event_Exchange.jsp";
	}
}
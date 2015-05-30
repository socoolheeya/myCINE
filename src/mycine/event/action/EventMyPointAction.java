package mycine.event.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.event.model.EventDAO;
import mycine.event.model.EventDTO;
import mycine.main.CommandHandler;

public class EventMyPointAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		EventDAO dao = new EventDAO();
		String id_s = (String)req.getSession().getAttribute("id");
		if (id_s == null || id_s.equals("")) {
			id_s = "0";
		}
		EventDTO dto = dao.event_MyPoint(id_s);
		ArrayList<EventDTO> arr = dao.event_PrizeList(id_s);
		
		req.setAttribute("dto", dto);
		req.setAttribute("arr", arr);
		
		return "/event/event_Mypoint.jsp";
	}

}

package mycine.event.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.event.model.EventDAO;
import mycine.event.model.EventDTO;
import mycine.main.CommandHandler;
import mycine.timeline.model.TimeLineDAO;

public class EventExChangeAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id = (String)req.getSession().getAttribute("id");
		String num_s = req.getParameter("c1");
		int num = Integer.parseInt(num_s);
		TimeLineDAO tdao = new TimeLineDAO();
		EventDAO dao = new EventDAO();
		EventDTO dto = dao.event_MyPoint(id);
		int count1 = 0;
		int count2 = 0;

		int usepoint = 0;
		String prize = null;
		switch (num) {
			case 700 :
				usepoint = 700;
				prize = "CGV SET 교환권";
				break;
			case 800 :
				usepoint = 800;
				prize = "쉐이크 SET 교환권";
				break;
			case 900 :
				usepoint = 900;
				prize = "에이드 SET 교환권";
				break;
			case 1000 :
				usepoint = 1000;
				prize = "오징어 SET 교환권";
				break;
			case 1100 :
				usepoint = 1100;
				prize = "즉석버터구이 SET 교환권";
				break;
			case 2000 :
				usepoint = 2000;
				prize = "영화관람권 2매";
				break;
		}
		int point = dto.getPoint();
		if ((point - usepoint) >= 0) {
			count1 = dao.event_SubPoint(id, usepoint);
			count2 = dao.event_AddMyPrize(id, prize);

			if (count1 > 0 && count2 > 0) {
				tdao.addUsePointEvent(usepoint, prize, id);
				
			}
		}
		req.setAttribute("point", point);
		req.setAttribute("usepoint", usepoint);
		req.setAttribute("count1", count1);
		req.setAttribute("count2", count2);
		req.setAttribute("prize", prize);
		
		return "/event/event_Exchange_ok.jsp";
	}

}

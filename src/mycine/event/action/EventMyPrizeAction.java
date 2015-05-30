package mycine.event.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.event.model.EventDAO;
import mycine.event.model.EventDTO;
import mycine.main.CommandHandler;

public class EventMyPrizeAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String id = (String) req.getSession().getAttribute("id");
		String msg = null;
		if (id == null || id.equals("")) {
			msg = "로그인 후 사용 가능합니다.";
		}
		EventDAO dao = new EventDAO();
		EventDTO dto = dao.event_MyPoint(id);

		int totalCnt = dao.getTotalCnt(id); // 총 게시글 수
		int listSize = 10; // 보여줄 리스트의 수
		int pageSize = 5; // 보여줄 페이지의 수

		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}

		int cp = Integer.parseInt(cp_s); // 현재 페이지
		String str = null;
		String pageLogic = mycine.page.PageController.pageLogic(
				"EventMyPrize.do", totalCnt, listSize, pageSize, cp);
		ArrayList<EventDTO> arr = dao.event_MyPrizeList(id, cp, listSize);

		if (arr != null && arr.size() != 0) {
			for (int i = 0; i < arr.size(); i++) {
				switch (i % 3) {
				case 0:
					str = "danger";
					break;
				case 1:
					str = "info";
					break;
				case 2:
					str = "success";
					break;
				}
			}		
		}
		req.setAttribute("msg", msg);
		req.setAttribute("dto", dto);
		req.setAttribute("pageLogic", pageLogic);
		req.setAttribute("arr", arr);
		req.setAttribute("str", str);
		
		return "/event/event_Myprize.jsp";
	}
}
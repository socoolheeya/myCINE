package mycine.company.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.event.model.EventDAO;
import mycine.event.model.EventDTO;
import mycine.main.CommandHandler;

public class CompanyMainAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		EventDAO dao = new EventDAO();
		String id = (String)req.getSession().getAttribute("id");
		String idx_s = req.getParameter("idx");
		int idx = Integer.parseInt(idx_s);
		String use = req.getParameter("use");
		String msg = null;
		if (use.equals("O")) {
			msg = "이미 사용되어 취소가 불가합니다.";
		} else {
			String user_prize = req.getParameter("user_prize");
			EventDTO dto = dao.event_RePoint1(user_prize);
			int e_point = dto.getE_point();
			int count1 = dao.event_RePoint2(e_point, id);
			int count2 = dao.event_DePrize(idx);
			if (count1 > 0 && count2 > 0) {
				msg = "결제취소가 완료되었습니다.";
			}
		}
		
		req.setAttribute("msg", msg);
		
		return "/company/companyMain.jsp";
	}

}

package mycine.request.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.qna.model.QnaDAO;
import mycine.qna.model.QnaDTO;
import mycine.request.model.RequestBoardDAO;
import mycine.request.model.RequestBoardDTO;

public class RequestListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		RequestBoardDAO dao = new RequestBoardDAO();
		
		int totalCnt = dao.getTotalCnt();
		totalCnt = totalCnt == 0 ? 1 : totalCnt;
		int listSize = 10;
		int pageSize = 5;

		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}
		int cp = Integer.parseInt(cp_s);
		String pageLogic = mycine.page.PageController.pageLogic("requestList.do", totalCnt, listSize, pageSize, cp);
		ArrayList<RequestBoardDTO> arr = dao.requestList(cp, listSize);
		
		req.setAttribute("arr", arr);
		req.setAttribute("pageLogic", pageLogic);
		
		return "/request/requestList.jsp";
	}
}
package mycine.qna.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.qna.model.QnaDAO;
import mycine.qna.model.QnaDTO;

public class QnaListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		QnaDAO dao = new QnaDAO();
		
		int totalCnt = dao.getTotalCnt();
		totalCnt = totalCnt == 0 ? 1 : totalCnt;
		int listSize = 10;
		int pageSize = 5;

		String cp_s = req.getParameter("cp");
		if (cp_s == null || cp_s.equals("")) {
			cp_s = "1";
		}
		int cp = Integer.parseInt(cp_s);
		String pageLogic = mycine.page.PageController.pageLogic("qnaList.do", totalCnt, listSize, pageSize, cp);
		ArrayList<QnaDTO> arr = dao.QnAList(cp, listSize);
		
		req.setAttribute("arr", arr);
		req.setAttribute("pageLogic", pageLogic);
		
		return "/qna/QnAList.jsp";
	}

}

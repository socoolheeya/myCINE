package mycine.qna.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.qna.model.QnaDAO;
import mycine.qna.model.QnaDTO;

public class QnaSearchAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");		
		
		String fkey = req.getParameter("fkey");
		String fvalue = req.getParameter("fvalue");
		QnaDAO dao = new QnaDAO();
		int totalCnt = dao.getTotalCnt1(fkey, fvalue);
		
		int listSize=10;
		int pageSize=5;

		String cp_s=req.getParameter("cp");
		if(cp_s==null||cp_s.equals("")){
			cp_s="1";
		}
		int cp=Integer.parseInt(cp_s);
		String pageLogic = mycine.page.PageController.pageLogic("qnaSearch.do", totalCnt, listSize, pageSize, cp);
		ArrayList<QnaDTO> arr = dao.QnASearch(fkey, fvalue);
		
		req.setAttribute("arr", arr);
		req.setAttribute("pageLogic", pageLogic);
		
		
		
		return "/qna/QnASearch.jsp";
	}

}

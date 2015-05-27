package mycine.qna.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.qna.model.QnaDAO;
import mycine.qna.model.QnaDTO;

public class QnaContentAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		QnaDAO dao = new QnaDAO();
		String idx_s = req.getParameter("idx");

		//첫번째 유효성검사
		if (idx_s == null || idx_s.equals("")) {
			idx_s = "0";
		}
		int q_idx = Integer.parseInt(idx_s);
		QnaDTO dto = dao.QnAContent(q_idx);
		String content  =null;
		if(dto != null && dto.equals("") == false) {
			content = dto.getQ_content().replace("\n", "<br>");
		}
		req.setAttribute("dto", dto);
		req.setAttribute("content", content);
		
		return "/qna/QnAContent.jsp";
	}

}

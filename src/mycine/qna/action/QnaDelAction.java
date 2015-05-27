package mycine.qna.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.qna.model.QnaDAO;
import mycine.qna.model.QnaDTO;

public class QnaDelAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		QnaDAO dao = new QnaDAO();
		int idx = Integer.parseInt(req.getParameter("q_idx"));
		QnaDTO dto = new QnaDTO(idx);
		int result = dao.QnADel(dto);
		
		req.setAttribute("result", result);
		req.setAttribute("idx", idx);
		
		return "/qna/QnADel_ok.jsp";
	}

}

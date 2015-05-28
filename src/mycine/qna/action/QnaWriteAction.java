package mycine.qna.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.qna.model.QnaDAO;
import mycine.qna.model.QnaDTO;

public class QnaWriteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String q_writer = (String)req.getSession().getAttribute("id");
		String q_pwd = req.getParameter("q_pwd");
		String q_subject = req.getParameter("q_subject");
		String q_content = req.getParameter("q_content");
		
		QnaDTO dto = new QnaDTO(q_writer, q_pwd, q_subject, q_content);
		QnaDAO dao = new QnaDAO();
		
		int result = dao.QnAwriter(dto, q_writer);
		String msg = result > 0 ? "질문하기 성공!" : "질문하기 실패!";
		
		req.setAttribute("msg", msg);
		
		
		return "qna/QnAWrite_ok.jsp";
	}

}

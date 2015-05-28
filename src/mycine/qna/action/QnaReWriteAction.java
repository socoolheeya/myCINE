package mycine.qna.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;
import mycine.qna.model.QnaDAO;
import mycine.qna.model.QnaDTO;

public class QnaReWriteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		QnaDAO dao = new QnaDAO();
		String writer = (String)req.getSession().getAttribute("id");
		
		
		String pwd = req.getParameter("q_pwd");
		String subject = req.getParameter("q_subject");
		String content = req.getParameter("q_content");
		
		int ref = Integer.parseInt(req.getParameter("q_ref"));
		int lev = Integer.parseInt(req.getParameter("q_lev"));
		int sunbun = Integer.parseInt(req.getParameter("q_sunbun"));
		QnaDTO dto = new QnaDTO(writer, pwd, subject, content, ref, lev, sunbun);
		int result = dao.QnAReWrite(dto ,writer);
		String msg = result > 0 ? "답글달기 성공!" : "답글달기 실패!";

		req.setAttribute("msg", msg);
		
		return "/qna/QnAReWrite_ok.jsp";
	}

}

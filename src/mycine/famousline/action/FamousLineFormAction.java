package mycine.famousline.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mycine.famousline.model.FamousLineDAO;
import mycine.famousline.model.FamousLineDTO;
import mycine.main.CommandHandler;

public class FamousLineFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		FamousLineDAO dao = new FamousLineDAO();
		
		int idx = dao.getRandomIdx();
		FamousLineDTO fdto = dao.getFamousLine(idx);
		String url = fdto.getFamousLine();
		
		req.getSession().setAttribute("url", url);
		return "/popup.jsp";
	}

}

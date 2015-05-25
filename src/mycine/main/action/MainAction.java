package mycine.main.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class MainAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String popupCheck = null;
		Cookie cks[] = req.getCookies();
		if(cks != null && cks.length != 0) {
			for(int i = 0; i < cks.length; i++) {
				if(cks[i].getName().equals("popupCheck")){
					popupCheck = cks[i].getValue();
				}
			}
		}
		String msg = popupCheck == null ? "onload='openPopup()'":"";
		
		req.setAttribute("msg", msg);
		
		return "/index.jsp";
	}
}

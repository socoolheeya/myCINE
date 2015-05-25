package mycine.famousline.action;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class FamousLineAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String popupCk = req.getParameter("popupCheck");
		if (popupCk != null && popupCk.equals("on")) {
			Calendar now = Calendar.getInstance();
			int h = now.get(Calendar.HOUR_OF_DAY) * 60 * 60; 
			int m = now.get(Calendar.MINUTE) * 60;
			int s = now.get(Calendar.SECOND);
			int sum = h + m + s;
			int h24 = 60 * 60 * 24;
			Cookie ck = new Cookie("popupCheck", "on");
			ck.setMaxAge(h24 - sum);
			resp.addCookie(ck);
			
		}
		return "/popup_ok.jsp";
	}
}
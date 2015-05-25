package mycine.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mycine.main.CommandHandler;

public class IdCheckFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "/member/idCheck.jsp";
	}

}

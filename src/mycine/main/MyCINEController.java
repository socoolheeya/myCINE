package mycine.main;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyCINEController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map commandMap;
	
	public MyCINEController(){
		commandMap = new HashMap();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String fileName = config.getInitParameter("configFile");
		String path = config.getServletContext().getRealPath(fileName);
		
		Properties pro = new Properties();
		try {
			FileInputStream fs = new FileInputStream(path);
			pro.load(fs);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Iterator keys = pro.keySet().iterator();
		while(keys.hasNext()) {
			String key = (String)keys.next();
			String className = pro.getProperty(key);
			
			try {
				Class makeClass = Class.forName(className);
				Object obj = makeClass.newInstance();
				commandMap.put(key, obj);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	public void userProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String type = req.getRequestURI();
		if(type.indexOf(req.getContextPath())==0) {
			type = type.substring(req.getContextPath().length());
		}
		CommandHandler cmd = (CommandHandler)commandMap.get(type);
		String goPage = cmd.process(req, resp);
		
		RequestDispatcher dis = req.getRequestDispatcher(goPage);
		dis.forward(req, resp);
	}
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="mycine.member.MemberDAO" />
<%
	String userid=request.getParameter("userid");
	String userpwd=request.getParameter("userpwd");
	String saveid=request.getParameter("saveid");
	int result=memberDAO.loginCheck(userid, userpwd);
	String name = "";
	int loginCount = 0; //로그인 횟수 체크 카운트

	if(result==memberDAO.LOGIN_OK){
		String dbName=memberDAO.getUserName(userid);
		memberDAO.getLoginPoint(userid); //로그인하면 10포인트 주기
		session.setAttribute("id",userid);
		session.setAttribute("sname", dbName);
		
		if(saveid==null || saveid.equals("")){
			Cookie ck=new Cookie("saveid",userid);
			ck.setMaxAge(0);
			response.addCookie(ck);
		} else {
			Cookie ck = new Cookie("saveid", userid);
			ck.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(ck);
		}
		session.setAttribute("name", name);
		session.setAttribute("saveid", userid);
		%>
		<script>
		window.alert("<%=dbName%>님 환영합니다.");
		opener.location.reload();
		window.self.close();
		</script>
		<%
		
	}else if(result==memberDAO.NOT_ID){
		%>
		<script>
		window.alert("등록된 ID가 아닙니다.");
		location.href="login.jsp";
		</script>
		<%
		out.println("고객센터 연락바랍~");
	}else if(result==memberDAO.NOT_PWD){
		%>
		<script>
		window.alert("잘못된 비밀번호 입니다.");
		location.href="login.jsp";
		</script>
		<%
	}else if(result==memberDAO.ERROR){
		
	}
%>
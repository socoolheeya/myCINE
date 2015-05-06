<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/myweb_2/css/mainLayout.css">
<script>
	function show() {
		window.alert("취소되었습니다");
		location.href = "QnAList.jsp";
	}
</script>
<%
	String q_idx = request.getParameter("q_idx");
%>
</head>
<body>
	<article>
		<section>
			<form name="QnADel" action="QnADel_ok.jsp">
				<fieldset>
					게시물을 삭제하시겠습니까?
					<h3>비밀번호를 입력해 주세요</h3>
					<input type="hidden" name="q_idx" value="<%=q_idx%>"> pwd:<input
						type="password" name="q_pwd"> <input type="submit"
						value="삭제하기"> <input type="Button" value="취소"
						onclick="show()">
				</fieldset>
			</form>
		</section>
	</article>
</body>
</html>
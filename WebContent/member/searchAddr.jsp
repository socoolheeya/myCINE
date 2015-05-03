<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mycine.post.*"%>
<jsp:useBean id="pDAO" class="mycine.post.PostDAO" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
<script type="text/javascript">
	function searchAddr() {
		window.open("addrList.jsp?dong=", "addrList", "width=1500 height=500");
	}
</script>
</head>
<%
	String requestDong = request.getParameter("dong");
	ArrayList<PostDTO> arr = pDAO.findAddr(requestDong);
%>
<body>
	<section>
		<article>
			<fieldset>
				<legend>주소 찾기</legend>
				<form name="addrFind" method="post">
					<table>
						<tr>
							<td>주소검색</td>
							<td><input type="text" name="dong"
								placeholder="동(dong)을 입력하세요 "> <input type="submit"
								value="검색"></td>
						</tr>
					</table>
				</form>
			</fieldset>
		</article>
		<article>
			<fieldset>
				<legend>주소검색결과</legend>
				<%
					if (request.getMethod().equals("GET")) {
				%>
				<h4>위 검색란에 검색어를 입력해주세요</h4>
				<%
					} else {
				%>
				<jsp:include page="addrList.jsp" />
				<%
					}
				%>
			</fieldset>
		</article>
		<hr>
		<article>
			<fieldset>
				<legend>주소</legend>
				<table>
					<tr>
						<td>우편번호</td>
						<td><input type="text" name="zipcode"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="addr"></td>
					</tr>
				</table>
			</fieldset>
		</article>
	</section>
</body>
</html>
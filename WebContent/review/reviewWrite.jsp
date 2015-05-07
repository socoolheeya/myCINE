<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/myCINE/css/rating-star.css">
<style>
table {
	margin: 0px auto;
	width: 900px;
	border-top: 3px double;
	border-spacing: 0px;
	text-align: center;
}
thead td{
	height: 50px;
	border-bottom: 1px double;
}
</style>
</head>
<body>
<section>
	<article>
		<form name="reviewwrite" action="reviewWrite_ok.jsp">
		<table>
		<thead>
			<tr>
				<td colspan="2">
				작성자&nbsp;&nbsp;<input type="text" name="writer">
				</td>
				<td colspan="2">
				제목&nbsp;&nbsp;<input type="text" name="subject">
				</td>
		</thead>
		<tfoot>
			<tr>
				<td>평점:</td>
				<td class="rating" colspan="2" align="right">
    				<input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="슈퍼울트라캡짱!">5 stars</label>
   					<input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="좀 괜찮은데?!">4 stars</label>
  					<input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="보통이에요!">3 stars</label>
    				<input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="그럭저럭!">2 stars</label>
    				<input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="최악이야!">1 star</label>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
				<input type="reset" value="다시쓰기">
				<input type="submit" value="작성완료">
				</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<td colspan="4">
				<textarea name="content" rows="20" cols="130"></textarea>
				</td>
			</tr>
		</tbody>
		</table>
		</form>
	</article>
</section>
</body>
</html>
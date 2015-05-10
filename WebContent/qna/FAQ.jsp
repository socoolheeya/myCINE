<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<style type="text/css">
#faq {
	background-color: #ffffcc;
	border: 1px solid; 
	border-color: #cccccc; 
	margin: 10px;
}
#title {
	margin: 10px; 
	padding: 10px; 
	color: #0000ff; 
	font-weight: bold;
}
</style>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>FAQ</h2>
				<p style="font-size: 15px; color: gray;">자주하는 질문의 목록입니다.</p>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8"><hr></div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div id="faq">
					<div id="title">여기는 무엇을 하는 곳인가요?</div>
					<div style="padding: 10px;">여기는 영화를 좋아하는 평범한 사람들의 시끄러운 공간입니다. 전문가의 전문적인 평가는 절대적으로 배제하고 있으며, 감상하신 영화에 대해서는 자유롭게 생각을 적어주세요^^</div>
				</div>
				<div id="faq">
					<div id="title">회원가입을 하며 어떤 혜택이 있는건가요?</div>
					<div style="padding: 10px;">회원 가입을 하게 되면 가입축하 포인트 1000포인트를 제공하고 있으며 로그인시 10포인트, 리뷰 작성시 10포인트, 댓글 작성시 5포인트를 제공하고 있습니다. 포인트를 통해 영화 관람권 및 영화관 먹거리 set로 교환하실 수 있습니다.</div>
				</div>
				<div id="faq" >
					<div id="title">궁금증이나 질문이 있을 때에는 어떻게 하나요?</div>
					<div style="padding: 10px;">QnA 게시판을 통해 궁금증이나 질문을 자유롭게 해주세요!! 친절하게 답변해 드리겠습니다.</div>
				</div>
				<div id="faq">
					<div id="title">비밀번호를 분실하였습니다. 어떻게 해야하나요?</div>
					<div style="padding: 10px;">비밀번호를 분실하신 경우 고객센터로 연락주세요!! 친절하게 해결해 드리겠습니다.</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>
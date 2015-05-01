<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">myCINE</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="#">Home</a></li>
				<li><a href="#">Page 1</a></li>
				<li><a href="#">Page 2</a></li>
				<li><a href="#">Page 3</a></li>
			</ul>
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li>
						<div class="col-sm-12"
							style="padding-bottom: 8px; padding-top: 8px;">
							<form action="">
								<table>
									<tr>
										<td><input type="text" class="form-control"
											placeholder="search"></td>
										<td><a href="#" class="btn btn-info btn"><span
												class="glyphicon glyphicon-search" data-toggle="tooltip"
												title="검색"></span> Search</a></td>
									</tr>
								</table>
							</form>
						</div>
					</li>
				</ul>
			</div>
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li><a href="login.j	sp"> <span
							class="glyphicon glyphicon-user" data-toggle="tooltip"
							title="로그인"></span>
					</a></li>
					<li><a href="join.jsp"><span
							class="glyphicon glyphicon-plus" data-toggle="tooltip"
							title="회원가입"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
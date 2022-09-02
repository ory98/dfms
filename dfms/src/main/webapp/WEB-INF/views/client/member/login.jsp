<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br>
	<br>
		
	<div class="container">

	<div class="row" style="margin-top:20px">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form action="${contextPath }/member/login" method="post" class="checkout__form">
				<fieldset>
					<h2 align="center">로그인</h2>
					<hr class="colorgraph">
					<div class="form-group">
	                    <input type="text" name="memberId" id="memberId" class="form-control input-lg" placeholder="아이디">
					</div>
					<div class="form-group">
	                    <input type="password" name="passwd" id="passwd" class="form-control input-lg" placeholder="비밀번호">
					</div>
					<span class="checkbox" >
						<a href="${contextPath }/member/findPw" class="btn btn-link pull-right">비밀번호 찾기</a>
						<a href="${contextPath }/member/findId" class="btn btn-link pull-right">아이디 찾기</a>
					</span>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
	                        <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인">
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a href="${contextPath }/member/register" class="btn btn-lg btn-primary btn-block">회원가입</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	
</body>
</html>
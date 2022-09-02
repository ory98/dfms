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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<br>
	<br>
		
	<div class="container">

	<div class="row" style="margin-top:20px">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form action="${contextPath }/admin/member/adminLogin" method="post" class="checkout__form">
				<fieldset>
					<h2 align="center">관리자 로그인</h2>
					<hr class="colorgraph">
					<div class="form-group">
	                    <input type="text" name="adminId" id="adminId" class="form-control input-lg" placeholder="아이디">
					</div>
					<div class="form-group">
	                    <input type="password" name="passwd" id="passwd" class="form-control input-lg" placeholder="비밀번호">
					</div>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-12">
	                        <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	$(function() {
		
		$("#conf_passwd").keyup(function() {
			
			if ($("#passwd").val() != $("#conf_passwd").val()) {
				$("#chkNotice").html("비밀번호 일치하지 않음.");
				$("#chkNotice").attr('color', 'red');
			}
			else {
				$("#chkNotice").html("비밀번호 일치함.");
				$("#chkNotice").attr('color', 'blue');
			}
			
		});
		
	});
	

</script>
</head>
<body>

	
	<br>
	<br>
		
	<div class="container">

	<div class="row" style="margin-top:20px">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form action="${contextPath }/member/updatePw" method="post" class="checkout__form">
				<fieldset>
					<h2 align="center">비밀번호 재설정</h2>
					<hr class="colorgraph">
					<div class="form-group">
	                    <input type="password" name="passwd" id="passwd" class="form-control input-lg" placeholder="새로운 비밀번호">
					</div>
					<div class="form-group">
	                    <input type="password" name="conf_passwd" id="conf_passwd" class="form-control input-lg" placeholder="새로운 비밀번호 확인">
					</div>
					<font id="chkNotice" size="2"></font>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
	                        <input type="submit" class="btn btn-lg btn-success btn-block" value="비밀번호 재설정">
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a href="${contextPath }/member/register" class="btn btn-lg btn-primary btn-block">회원가입</a>
						</div>
					</div>
				</fieldset>
				<input type="hidden" name="memberId" value="${memberId }"/>
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
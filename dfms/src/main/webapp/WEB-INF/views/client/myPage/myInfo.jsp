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

	$().ready(function(){
		
		var dateBirth = $("[name='dateBirth']").val().split("-");
		$("#birthY").val(dateBirth[0]);
		$("#birthM").val(dateBirth[1]);
		$("#birthD").val(dateBirth[2]);
		
		$("form").submit(function(){
			var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='dateBirth']").val(dateBirth);
		});
		
	});
	
	function removeMember(){
		if (confirm("정말로 탈퇴하시겠습니까?")) {
			location.href = "${contextPath}/myPage/removeMember?memberId=" + $("#memberId").val();
		}
	}

</script>
</head>
<body>
	
	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>	
	
	<div class="container" >
		<div class="col-xs-12 col-sm-8 col-md-8">
			<div class="col-xs-6 col-sm-4 col-md-4" >
				<a href="javascript:removeMember();" class="btn btn-success btn-block btn-lg" ><span class="icon_trash_alt"></span>탈퇴</a>
			</div>
		</div>
		<form action="${contextPath }/myPage/modifyInfo" method="post" class="checkout__form">
   			<div class="col-xs-12">
				<h2 align="center">회원 정보</h2>
				<hr class="colorgraph">
			</div>
  
			<div class="col-xs-6 col-sm-6 col-md-6">
				<div class="form-group">
					<p>아이디 <span>*</span></p>
					<input type="text" id="memberId" name="memberId"  class="form-control input-lg" value="${memberDto.memberId }" readonly>
				</div>
			</div>
			
			<div class="col-xs-6 col-sm-6 col-md-6">
				<div class="form-group">
					<p>이름 <span>*</span></p>
					 <input type="text" name="memberNm" class="form-control input-lg" value="${memberDto.memberNm }">
				</div>
			</div>
		
			<div class="col-xs-6 col-sm-6 col-md-6">
				<div class="form-group">
					<p>비밀번호 <span>*</span></p>
					<input type="password" name="passwd" id="passwd" class="form-control input-lg" value="${memberDto.passwd }" readonly>
				</div>
			</div>
			
			<div class="col-xs-6 col-sm-6 col-md-6">
				<div class="checkout__form__input">
           			<p>생년월일 <span>*</span></p>
					<div class="row">
		               <input type="text" size ="3" name="birthY" id="birthY">년&emsp;
		               <input type="text" size ="3" name="birthY" id="birthM">월&emsp;
		               <input type="text" size ="3" name="birthY" id="birthD">일
           			</div>
	       			<input type="hidden" name="dateBirth" value="${memberDto.dateBirth }"/>
        		</div>
        	</div>
        	
        	<div class="col-sm-12" style="margin-bottom: 20"></div>
        	
			<div class="col-xs-6 col-sm-6 col-md-6">
        		<div class="form-group">
					<p>이메일 <span>*</span></p>
					<input type="text" name="email" id="email" class="form-control input-lg" value="${memberDto.email }">
					<div class="checkout__order__widget">
		                <label for="emailstsYn">
		                    halfood24에서 발송하는 E-mail을 수신합니다.
		                    <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y" <c:if test="${memberDto.emailstsYn eq 'Y'}">checked</c:if>>
		                    <span class="checkmark"></span>
		                </label>
	             	</div>
				</div>
			</div>
			
        	
			<div class="col-xs-6 col-sm-6 col-md-6">
        		<div class="form-group">
					<p>연락처 <span>*</span></p>
					<input type="text" name="hp" id="hp" class="form-control input-lg" value="${memberDto.hp }">
					<div class="checkout__order__widget">
			        	<label for="smsstsYn">
			        		halfood24에서 발송하는 SMS 소식을 수신합니다.
			                <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y" <c:if test="${memberDto.smsstsYn eq 'Y'}">checked</c:if>>
			                <span class="checkmark"></span>
			            </label>
	             	</div>
				</div>
			</div>			
			<div class="col-lg-12">
				<div class="form-group">
					<p>우편번호 <span>*</span></p>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<input type="text" name="zipcode" id="zipcode" class="form-control input-lg"  value="${memberDto.zipcode }" style="width: 100%; padding-left: 0" >
						</div>
						<div class="col-xs-6 col-sm-4 col-md-4">
							<span class="button-checkbox">
								<input type="button" value="주소 검색" onclick="execDaumPostcode();"  class="form-control input-lg" style="width:50%;">
							</span> 
						</div>
					</div>
				</div>
			
				<div class="form-group">
					<p>도로명 주소 <span>*</span></p>
					<input type="text" name="roadAddress" id="roadAddress" class="form-control input-lg" value="${memberDto.roadAddress }">
				</div><br>
				
				<div class="form-group">
					<p>지번 주소 <span>*</span></p>
					<input type="text" name="jibunAddress" id="jibunAddress" class="form-control input-lg" value="${memberDto.jibunAddress }">
				</div><br>
				
				<div class="form-group">
					<p>나머지 주소 <span>*</span></p>
					<input type="text" name="namujiAddress" id="namujiAddress" class="form-control input-lg" value="${memberDto.namujiAddress }">
				</div><br>
			</div>
			
			<hr class="colorgraph">
			
			<div class="col-lg-12" align="right">
				<button type="submit" class="btn btn-primary btn-block btn-lg"><span class="icon_pencil-edit"></span>수정</button>
			</div>
		</form>
	</div>
	
	<br>
	<br>
	<br>
</body>
</html>
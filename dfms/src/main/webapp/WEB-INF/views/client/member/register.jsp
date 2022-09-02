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
<script>

	$().ready(function() {
	
		$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		   
		    if (memberId == ''){
		   		alert("ID를 입력하세요");
		   		return;
		    }
		   
		    $.ajax({
		       type : "get",
		       url  : "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
		       success : function (data){
		          if (data == "duplicate"){
					  alert("사용할 수 있는 ID입니다.");
		          }
		          else {
		          	  alert("중복된 ID입니다.");
		          }
		       }
		    });
		    
		 });	
		
		
		$("form").submit(function(){
			
			var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='dateBirth']").val(dateBirth);
			
			if ($("#smsstsYn").val() != "Y") {
				$(this).val("N");
			}
			if ($("#emailstsYn").val() != "Y") {
				$(this).val("N")
			}
			
			if ($("#passwd").val() != $("#confirmPasswd").val()) {
				alert("비밀번호를 확인하세요.");
				$("#passwd").focus();
				return false;
			}
			
			
		});
		
	});
</script>
</head>
<body>

   <div class="container">
   
   <div class="row">
   <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="${contextPath }/member/register" method="post" class="checkout__form">
			<h2 align="center">회원가입</h2>
			<hr class="colorgraph">
			<div class="form-group">
				<p>아이디 <span>*</span></p>
				<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-8">
					<input type="text" id="memberId" name="memberId" style="width: 100%;"  class="form-control input-lg" placeholder="아이디를 입력하세요." required>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<span class="button-checkbox">
						<input type="button" id="btnOverlapped" value="중복확인"  class="form-control input-lg" style="width: 70%;">
					</span> 
				</div>
			</div><br>
			
			<div class="form-group">
				<p>비밀번호 <span>*</span></p>
				<input type="password" name="passwd" id="passwd" class="form-control input-lg" placeholder="비밀번호를 입력하세요" required>
			</div><br>
			
			<div class="form-group">
				<p>비밀번호 확인 <span>*</span></p>
				<input type="password" name="confirmPasswd" id="confirmPasswd" class="form-control input-lg" placeholder="비밀번호를 확인하세요." >
			</div><br>
			
			<div class="form-group">
				<p>이름 <span>*</span></p>
				<input type="text" name="memberNm" id="memberNm" class="form-control input-lg" placeholder="이름를 입력하세요">
			</div><br>
			
	        <div class="form-group">
	            <p>생년월일 <span>*</span></p>
	    		<div class="row">
	                <input type="text" size ="3" name="birthY" id="birthY">년&emsp;
		            <input type="text" size ="3" name="birthY" id="birthM">월&emsp;
		            <input type="text" size ="3" name="birthY" id="birthD">일
	               <input type="hidden" name="dateBirth"/>
           		</div>
        	</div><br>
        	
			<div class="form-group">
				<p>연락처 <span>*</span></p>
				<input type="text" name="hp" id="hp" class="form-control input-lg" placeholder="-를 포함해서 입력하세요.">
				<br>
				<div class="checkout__order__widget">
	                <label for="smsstsYn">
	                    halfood24에서 발송하는 SMS 소식을 수신합니다.
	                    <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y">
	                    <span class="checkmark"></span>
	                </label>
	               </div>
			</div><br>
			
			<div class="form-group">
				<p>이메일 <span>*</span></p>
				<input type="text" name="email" id="email" class="form-control input-lg" placeholder="이메일을 입력하세요.">
				<br>
				<div class="checkout__order__widget">
	                <label for="emailstsYn">
	                    halfood24에서 발송하는 E-mail을 수신합니다.
	                    <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
	                    <span class="checkmark"></span>
	                </label>
	               </div>
			</div><br>
			
			<div class="form-group">
				<p>우편번호 <span>*</span></p>
				<div class="row">
				<div class="col-xs-12 col-sm-5 col-md-5">
					<input type="text" name="zipcode" id="zipcode" class="form-control input-lg"  style="width: 100%; padding-left: 0">
				</div>
				<div class="col-xs-8 col-sm-5 col-md-5">
					<span class="button-checkbox">
						<input type="button" value="검색" onclick="execDaumPostcode();"  class="form-control input-lg" style="width:30%;">
					</span> 
				</div>
			</div><br>
			
			<div class="form-group">
				<p>도로명 주소 <span>*</span></p>
				<input type="text" name="roadAddress" id="roadAddress" class="form-control input-lg" placeholder="도로명주소를 입력하세요">
			</div><br>
			
			<div class="form-group">
				<p>지번 주소 <span>*</span></p>
				<input type="text" name="jibunAddress" id="jibunAddress" class="form-control input-lg" placeholder="지번를 입력하세요">
			</div><br>
			
			<div class="form-group">
				<p>나머지 주소 <span>*</span></p>
				<input type="text" name="namujiAddress" id="namujiAddress" class="form-control input-lg" placeholder="나머지주소를 입력하세요">
			</div><br>
			
			<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="7"><span>*</span>이용 약관 동의<span>*</span></button>
                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					<strong class="label label-primary">회원가입</strong>을 누르면, 이 사이트에서 정한 <a href="" data-toggle="modal" data-target="#t_and_c_m">이용 약관</a>에 동의 하는 것입니다.	 
				</div>
			</div>
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="회원가입" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				<div class="col-xs-12 col-md-6"><a href="${contextPath }/member/login" class="btn btn-success btn-block btn-lg">로그인</a></div>
			</div>
		</form>
	</div>
	</div>
	<br>
	<br>
	<br>
<!-- Modal -->
	<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">이용 약관 동의</h4>
				</div>
				<div class="modal-body">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">동의</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	</div>
</body>
</html>
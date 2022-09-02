<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="checkout spad">
        <div class="container" align="center">
             <form class="checkout__form">
                <div class="row" >
                    <div class="col-lg-12">
	                	<br><br><br>
                        <h2>공지 사항 상세</h2>
                        <hr class="colorgraph">
                        <div class="row" >
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>제목 </p>
                                    <input type="text" value="${noticeDto.subject }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상세 내용 </p>
                                    <textarea cols="130" rows="10" disabled>${noticeDto.content }</textarea>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>

</body>
</html>
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
<!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
             <form class="checkout__form">
                <div class="row">
                    <div class="col-lg-12">
                    <input type="hidden" name="contactCd" value="${contactDto.contactCd }">
	                	<br><br><br>
                        <h4>컨텍트 상세</h4>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>주문자 성함 </p>
                                    <input type="text" value="${contactDto.name }" disabled>
                                </div>
                            </div> <br>
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>주문자 연락처 </p>
                                    <input type="text"value="${contactDto.email }" disabled>
                                </div>
                            </div> <br>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>제목 </p>
                                    <input type="text" value="${contactDto.subject }" disabled>
                                </div>
                            </div> <br>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상세 내용 </p>
                                    <textarea cols="130" rows="10" disabled>${contactDto.content }</textarea>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->
</body>
</html>
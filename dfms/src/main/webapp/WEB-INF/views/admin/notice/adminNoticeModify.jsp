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

	<!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <form action="${contextPath }/admin/notice/adminNoticeModify" method="post" enctype="multipart/form-data" class="checkout__form" >
                <input type="hidden" name="noticeCd" value="${noticeDto.noticeCd }">
                <div class="col-lg-8">
                    <h5>공지 수정</h5>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="checkout__form__input">
                                <p>제목 <span>*</span></p>
                                <input type="text" name="subject" value="${noticeDto.subject }">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="checkout__form__input">
                                <p>공지 내용<span>*</span></p>
                                <textarea rows="5" cols="100" name="content">${noticeDto.content }</textarea> 
                           		<script>CKEDITOR.replace("content");</script>
                            </div>
                        </div>
                    </div>
                   	<br>
	                <div align="right">
	                	<button type="submit" class="site-btn">수정하기</button>
	                </div>
                   </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

</body>
</html>
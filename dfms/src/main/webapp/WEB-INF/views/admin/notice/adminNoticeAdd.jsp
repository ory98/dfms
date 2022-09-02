<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="contact spad">
        <div class="container">
            <form action="${contextPath }/admin/notice/adminNoticeAdd" method="post" enctype="multipart/form-data" class="checkout__form" >
                <input type="hidden" name="noticeCd" value="${noticeDto.noticeCd }">
                <div class="row">
                    <div class="col-lg-12">
                        <h5>공지 등록</h5>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>제목 <span>*</span></p>
                                    <input type="text" name="subject" placeholder="제목을 입력하세요.">
                                </div>
                            </div><br><br>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>공지 내용<span>*</span></p>
                                    <textarea rows="5" cols="100" name="content" placeholder="공지내용을 입력하세요."></textarea> 
                               		<script>CKEDITOR.replace("content");</script>
                                </div>
                            </div>
                        </div>
		                <div align="right">
		                	<button type="submit" class="site-btn"><span class="icon_plus"></span> 등록</button>
		                </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

</body>
</html>
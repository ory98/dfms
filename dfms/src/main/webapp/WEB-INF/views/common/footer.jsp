<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
        <h5><strong>회사정보</strong></h5><br>
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer__about">
                        <ul>
                            <li>주소: 역삼동 818-15</li>
                            <li>전화번호: +65 10-2424-2424</li>
                            <li>이메일: halfood24@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__about">
                        <ul>
                            <li>운영시간: 오전 10시 ~ 오후 10시</li>
                            <li>점심시간: 1시 ~ 2시</li>
                            <li>업무휴무: 토,일,공휴일 휴무</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>전체메뉴</h6>
  						<ul>
                           <li><a href="${contextPath }/">HOME</a></li>
                           <li><a href="${contextPath }/goods/goodsList?sort=all&part=all">SHOP</a></li>
                       </ul>
                       <ul>
                           <li><a href="${contextPath }/noticeList">공지사항</a></li>
                           <li><a href="${contextPath }/contact">문의하기</a></li>
                       </ul><br><br><br><br>
                       <div class="footer__copyright__payment"><img src="${contextPath }/resources/bootstrap/img/payment-item.png"></div>
                    </div>
                </div>
            </div>
        </div>
	</footer>
    <!-- Footer Section End -->

</body>
</html>
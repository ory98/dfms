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

	<!-- Header Section Begin -->
	<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> halfood24@gmail.com</li>
                                <li>halfood24를 방문해주셔서 감사합니다.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                      		<div class="header__top__right__social">
                                <a href="${contextPath }/noticeList">공지사항</a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="${contextPath }/contact">문의하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="${contextPath }/"><img src="${contextPath }/resources/bootstrap/img/logo.png" height="50" width="100"></a>
                    </div>
                </div>
		        <div class="col-lg-6">
                    <nav class="header__menu">
	                   	<c:choose>
	                       	<c:when test="${sessionScope.role eq 'admin'}">
		                     	<ul>
		                        	<li><a href="${contextPath }/admin/member/adminMemberList">사용자 관리</a></li>
		                        	<li><a href="${contextPath }/admin/goods/adminGoodsList">상품 관리</a></li>
		                            <li><a href="${contextPath }/admin/order/adminOrderList">주문 관리</a></li>
		                            <li><a href="#">게시판 관리</a>
		                               <ul class="header__menu__dropdown">
		                                   <li><a href="${contextPath }/admin/notice/adminNoticeList">공지사항 관리</a></li>
		                                   <li><a href="${contextPath }/contactList">문의사항 관리</a></li>
		                               </ul>
		                           </li>
		                       </ul>  
	                    	</c:when>
	                        <c:otherwise>
		                        <ul>
		                            <li class="active"><a href="${contextPath }/">Home</a></li>
		                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=all">Shop</a></li>
		                            <li><a href="#">My Pages</a>
		                                <ul class="header__menu__dropdown">
		                                    <li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}">회원정보수정</a></li>
		                                    <li><a href="${contextPath }/myPage/myOrderList">주문내역조회</a></li>
		                                </ul>
		                            </li>
		                            <li><a href="${contextPath }/company">Company</a></li>
		                        </ul>
	                        </c:otherwise>
	                    </c:choose>
		        	</nav>
		        </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                        	<div class="header__top__right__auth">
                                <c:choose>
                    				<c:when test="${sessionScope.memberId eq null }">
		                        		<div class="header__right__auth">
		                            		<a href="${contextPath }/member/login"><i class="fa fa-user"></i> Login</a>
		                       			</div>
                    				</c:when>
                    				<c:otherwise>
		                        		<div class="header__right__auth">
		                            		<a href="${contextPath }/member/logout"><i class="fa fa-user"></i>logout</a>
		                        		</div>
                    				</c:otherwise>
                    			</c:choose>
                            </div> &emsp;
                            <li><a href="${contextPath }/myPage/heartList"><i class="fa fa-heart"></i> 
                            	<span>
                            		<c:choose>
		                               	<c:when test="${sessionScope.role == 'client'}">
			                                <div class="tip">${sessionScope.myHeartCnt }</div>
		                               	</c:when>
		                               	<c:otherwise>
		                               		<div class="tip">0</div>
		                               	</c:otherwise>
		                    		</c:choose>
                            	</span></a>
                            </a></li>
                            <li><a href="${contextPath }/myPage/myCartList"><i class="fa fa-shopping-bag"></i> 
                            	<span>
                            		<c:choose>
		                               	<c:when test="${sessionScope.role == 'client'}">
			                                <div class="tip">${sessionScope.myCartCnt }</div>
		                               	</c:when>
		                               	<c:otherwise>
		                               		<div class="tip">0</div>
		                               	</c:otherwise>
		                    		</c:choose>
                            	</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
	            <div class="humberger__open">
	                <i class="fa fa-bars"></i>
	            </div>
			</div>	
        </div>
    </header>
    <!-- Header Section End -->
   
   <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=all">전체 상품</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=shake">식사대용 쉐이크</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=protein">보충제</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=pill">영양제</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=tea">TEA</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=vitamin">비타민</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=chicken">닭가슴살</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=meal">도시락</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=salad">샐러드</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=vegetable">채소</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=snack">간식</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=juice">음료</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="${contextPath }/goods/searchGoods" method="get">
                                <input type="text" name="word" placeholder="What do yo u need?">
                                <input type="hidden" name="method" value="search">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__text">
                                <h5>My Point</h5>
                                <span align="right">
	                                <c:choose>
		                               	<c:when test="${sessionScope.role == 'client'}">
			                                <div class="tip">${sessionScope.point } P</div>
		                               	</c:when>
		                               	<c:otherwise>
		                               		<div class="tip">적립P</div>
		                               	</c:otherwise>
		                    		</c:choose>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
	
</body>
</html>
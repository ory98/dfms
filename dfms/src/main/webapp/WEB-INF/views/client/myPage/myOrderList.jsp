<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath }/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>My OrderList</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <span>My OrderList</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Order List Section Begin -->
    <section class="shoping__cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품명</th>
                                    <th></th>
                                    <th>상품가격</th>
                                    <th>주문개수</th>
                                    <th>주문날짜</th>
                                    <th>주문상세</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myOrderList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myOrder" items="${myOrderList }">
		                            		 <tr>
		                            		 	<td class="cart__product__item">
		                            		 		<img src="${contextPath }/thumbnails?goodsFileName=${myOrder.goodsFileName }" width="100" height="100">
		                            		 	</td>
                                    			<td class="cart__product__item">
			                                        <div class="cart__product__item__title">
			                                            <h6><a href="${contextPath }/goods/goodsDetail?goodsCd=${myOrder.goodsCd}">${myOrder.goodsNm } / ${myOrder.totalAmount }g</a></h6>
			                                        </div> 
			                                    </td>
			                                    <td class="cart__price">
			                                    	<div class="product__price" >
			                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myOrder.price }"/>원 (${myOrder.discountRate}%)</span><br>
				                                    	<fmt:formatNumber value="${(myOrder.price - (myOrder.price * myOrder.discountRate / 100)) * myOrder.orderGoodsQty}"/>원
														<input type="hidden" id="price${myOrder.orderCd }" value="${myOrder.price -  myOrder.price * (myOrder.discountRate / 100)}">	
			                                    	</div>																
			                                   	</td>
			                                    <td class="cart__total"><fmt:formatNumber value="${myOrder.orderGoodsQty }"/>개</td>
			                                    <td class="cart__time"><fmt:formatDate value="${myOrder.payOrderTime }" pattern="yyyy-MM-dd"/> </td>
			                                    <td class="cart__time"><a href="${contextPath }/myPage/myOrderDetail?orderCd=${myOrder.orderCd}&memberId=${myOrder.memberId}"><span class="icon_bag_alt"></span></td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
		</div>
	</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function processToCart(goodsCd) {
		
		$.ajax({
			
			url : "${contextPath }/myPage/addCart",
			method : "get",
			data : {"goodsCd" : goodsCd , "cartGoodsQty" : 1},
			success : function(result) {
				
				if (result == "duple") {
					alert('이미 추가된 품목입니다.');
				}
				else {
					alert('장바구니에 추가되었습니다.');
					location.href = "${contextPath}/myPage/removeHeart?goodsCd=" + goodsCd;
				}
					
			}
		})
	}

	function removeHeart(goodsCd) {
		
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "${contextPath}/myPage/removeHeart?goodsCd=" + goodsCd;
		}
		
	}
	
	function modifyHeartGoodsQty(heartCd){
		$.ajax({
			type : "get",
			url : "${contextPath}/myPage/modifyHeartGoodsQty",
			data : {
				"heartCd"   : heartCd,
				"heartGoodsQty" : $("#heartGoodsQty" + heartCd).val()
			},
			success:function(){
				getTotalPrice();
			}
		});
		
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
	
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath }/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>HeartList</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <span>HeartList</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th></th>
                                    <th>상품가격</th>
                                    <th>장바구니 넣기/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty heartList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>찜한 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="heart" items="${heartList }">
		                            		 <tr>
                                    			<td class="cart__product__item">
			                                        <div class="cart__product__item__title">
			                                        	<img src="${contextPath }/thumbnails?goodsFileName=${heart.goodsFileName }" width="100" height="100">
			                                        </div>
			                                    </td>
			                                    <td>
		                                        	<p>
		                                            	<a href="${contextPath }/goods/goodsDetail?goodsCd=${heart.goodsCd}">${heart.goodsNm }</a>
		                                            	<input type="hidden" id="goodsCd${heart.heartCd }" value="${heart.goodsCd }"/>
		                                            </p>
		                                            <h6>${heart.producer } / ${heart.totalAmount }g</h6>
			                                    </td>
			                                    <td class="cart__price">
			                                    	<div class="product__price" >
			                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${heart.price }"/>원 (${heart.discountRate}%)</span><br>
				                                    	<fmt:formatNumber value="${heart.price -  heart.price * (heart.discountRate / 100)}"/>원
														<input type="hidden" id="price${heart.heartCd }" value="${heart.price -  heart.price * (heart.discountRate / 100)}">	
			                                    	</div>
			                                    </td>
			                                    <td class="cart__close">
			                                		<a href="javascript:processToCart(${heart.goodsCd});"><span class="fa fa-shopping-bag"></span></a>
			                                		<a href="javascript:removeHeart(${heart.heartCd});"><span class="icon_trash_alt"></span></a>
			                                	</td>
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
    <!-- Shoping Cart Section End -->
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function processToCart(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addCart",
				method : "get",
				data : {"goodsCd" : goodsCd , "cartGoodsQty" : $("#orderGoodsQty").val()},
				success : function(result) {
					
					if (result == "duple") {
						alert('이미 추가된 품목입니다. 장바구니에서 개수를 추가해주세요.');
					}
					else {
						alert('장바구니에 추가되었습니다.');
					}
					
				}
			})
			
		}
	}
	
	function processToHeart(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addHeart",
				method : "get",
				data : {"goodsCd" : goodsCd , "heartGoodsQty" : $("#orderGoodsQty").val() },
				success : function(result) {
					
					if (result == "duple") {
						alert('이미 추가된 품목입니다.');
					}
					else {
						alert('찜 목록에 추가되었습니다.');
					}
					
				}
			})
			
		}
	}

	function processToOrder(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			location.href = "${contextPath }/order/orderGoods?goodsCd="+goodsCd+"&orderGoodsQty=1";	
		}
		
	}
	
	
</script>
</head>
<body>
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath }/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>PRODUCT</h2>
                        <div class="breadcrumb__option">
                            <span>${goodsDto.part }</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item" href="#product-1">
                            <img class="product__details__pic__item--large"
                                src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${goodsDto.goodsNm }</h3>
                        <div class="product__details__rating">
                            <h5>제조원 : ${goodsDto.producer } | 내용량 : ${goodsDto.totalAmount }g</h5>
                        </div><br>
                        <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${goodsDto.price }"/>원 (${goodsDto.discountRate}%)</div>
			            <div class="product__details__price"><fmt:formatNumber value="${goodsDto.price }"/> 원</span></div><br>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="orderGoodsQty" name="orderGoodsQty" >
                                </div>
                            </div>
                        </div>
                        <a href="javascript:processToCart(${goodsDto.goodsCd});" class="primary-btn"><i class="fa fa-shopping-bag"></i>CART</a>
                        <a href="javascript:processToOrder(${goodsDto.goodsCd });" class="primary-btn">ORDER</a>
                        <a href="javascript:processToHeart(${goodsDto.goodsCd });" class="heart-icon"><span class="icon_heart_alt"></span></a>
  						<ul>
                            <li>
                            	<b>제조일:</b> <span><fmt:formatDate value="${goodsDto.productionDt }" pattern="yyyy-MM-dd"/></span>
                            </li>
                            <li>
                            	<b>유통기간:</b> <span><fmt:formatDate value="${goodsDto.expirationDt }" pattern="yyyy-MM-dd"/></span>
                            </li>
                            <li>
                            	<b>포인트:</b> <span>${goodsDto.point } P</span>
                            </li>
                            <li>
                            	<b>할인률:</b> <span>${goodsDto.discountRate } %</span>
                            </li>
                            <li>
                            	<b>배송비:</b> <span>${goodsDto.deliveryPrice } 원</span>
                            </li>
                            <li>
                            	<b>재고:</b> <span>${goodsDto.stock } 개</span>
                            </li>
                            <li>
                            	<b>칼로리:</b> <span>${goodsDto.kcal } kcal</span>
                            </li>
                            <li>
                            	<b>단백질 함량:</b> <span>${goodsDto.proteinContent } g</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">원재료</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">영양정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">주의사항 </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <p>${goodsDto.materialContent }</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <p>${goodsDto.nutritionalInfo }</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                     <p>${goodsDto.precaution }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	 <div class="categories__slider owl-carousel">
	            	<c:forEach var="relatedGoods" items="${relatedGoodsList }">
		               <div class="col-lg-3 col-md-4 col-sm-6">
		                   <div class="product__item">
		                       <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${relatedGoods.goodsFileName}">
		                           <ul class="product__item__pic__hover">
		                               	<li><a href="javascript:processToHeart(${heartDto.goodsCd})"><i class="fa fa-heart"></i></a></li>
		                                <li><a href="javascript:processToCart(${relatedGoods.goodsCd})"><i class="fa fa-shopping-cart"></i></a></li>
		                                <li><a href="javascript:processToOrder(${relatedGoods.goodsCd})"><i class="icon_bag_alt"></i></a></li>
		                           </ul>
		                       </div>
		                       <div class="product__item__text">
		                           <h6>
	                               	<a href="${contextPath }/goods/goodsDetail?goodsCd=${relatedGoods.goodsCd}">${relatedGoods.goodsNm }<br>
	                                	${relatedGoods.producer } | ${relatedGoods.totalAmount }g
	                               	</a>
	                               </h6>
	                               <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${relatedGoods.price }"/>원 (${relatedGoods.discountRate}%)</div>
	                               <div class="product__price"><fmt:formatNumber value="${relatedGoods.price - relatedGoods.price * relatedGoods.discountRate / 100 }"/>원</div>
		                       </div>
		                   </div>
		               </div>
		            </c:forEach>
		    	 </div>
	    	</div>
        </div>
    </section>
    <!-- Related Product Section End -->

</body>
</html>
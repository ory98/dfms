<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
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
				data : {"goodsCd" : goodsCd , "cartGoodsQty" : 1},
				success : function(result) {
					
					if (result == "duple") {
						alert('이미 추가된 품목입니다.');
					}
					else {
						alert('장바구니에 추가되었습니다.');
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

	<!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
            	<div class="col-lg-12">
                	<div class="hero__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/banner.jpg">
		                <div class="hero__text">
		                    <span>HALFOOD24</span>
		                    <h2>BODY를 <br />HALF로<br/>halfood24</h2>
		                    <p>#누구나즐기는<br>#body #half #food #Diet</p>
		                    <a href="${contextPath }/goods/goodsList?sort=all&part=all" class="primary-btn">SHOP NOW</a>
		                </div>
               		</div>
                </div>
        	</div>
        </div>
    </section>
    <!-- Hero Section End -->
   
    <section class="categories">
        <div class="container">
        	<div class="section-title">
                <h2>New Product (${newGoodsCnt })</h2>
            </div>
           	<div class="row">
                <div class="categories__slider owl-carousel">
		            <c:forEach var="newGoods" items="${newGoodsInfo }">
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${newGoods.goodsFileName}"></div>
	                        <div class="featured__item__text">
	                            <h5><a href="${contextPath }/goods/goodsDetail?goodsCd=${newGoods.goodsCd}">${newGoods.goodsNm }</a></h5>
	                            <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${newGoods.price }"/>원 (${newGoods.discountRate}%)</div>
			                    <div class="product__price"><fmt:formatNumber value="${newGoods.price - newGoods.price * newGoods.discountRate / 100 }"/>원</div>
	                        </div>
	                    </div>
			    	</c:forEach>
                </div>
           	</div><br><br>
           	
           	<div class="section-title">
                <h2>Best Product (${bestGoodsCnt })</h2>
            </div>
           	<div class="row">
                <div class="categories__slider owl-carousel">
		            <c:forEach var="bestGoods" items="${bestGoodsInfo }">
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${bestGoods.goodsFileName}"></div>
	                        <div class="featured__item__text">
	                            <h5><a href="${contextPath }/goods/goodsDetail?goodsCd=${bestGoods.goodsCd}">${bestGoods.goodsNm }</a></h5>
	                            <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${bestGoods.price }"/>원 (${bestGoods.discountRate}%)</div>
			                    <div class="product__price"><fmt:formatNumber value="${bestGoods.price - bestGoods.price * bestGoods.discountRate / 100 }"/>원</div>
	                        </div>
	                    </div>
			    	</c:forEach>
                </div>
           	</div><br><br>
           	
           	<div class="section-title">
                <h2>Sale Product (${saleGoodsCnt })</h2>
            </div>
           	<div class="row">
                <div class="categories__slider owl-carousel">
		            <c:forEach var="saleGoods" items="${saleGoodsInfo }">
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${saleGoods.goodsFileName}"></div>
	                        <div class="featured__item__text">
	                            <h5><a href="${contextPath }/goods/goodsDetail?goodsCd=${saleGoods.goodsCd}">${saleGoods.goodsNm }</a></h5>
	                            <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${saleGoods.price }"/>원 (${saleGoods.discountRate}%)</div>
			                    <div class="product__price"><fmt:formatNumber value="${saleGoods.price - saleGoods.price * saleGoods.discountRate / 100 }"/>원</div>
	                        </div>
	                    </div>
			    	</c:forEach>
                </div>
           	</div><br><br>
           	
           	<div class="section-title">
                <h2>MD-Pick Product (${pickGoodsCnt })</h2>
            </div>
           	<div class="row">
                <div class="categories__slider owl-carousel">
		            <c:forEach var="pickGoods" items="${pickGoodsInfo }">
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${pickGoods.goodsFileName}"></div>
	                        <div class="featured__item__text">
	                            <h5><a href="${contextPath }/goods/goodsDetail?goodsCd=${pickGoods.goodsCd}">${pickGoods.goodsNm }</a></h5>
	                            <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${pickGoods.price }"/>원 (${pickGoods.discountRate}%)</div>
			                    <div class="product__price"><fmt:formatNumber value="${pickGoods.price - pickGoods.price * pickGoods.discountRate / 100 }"/>원</div>
	                        </div>
	                    </div>
			    	</c:forEach>
                </div>
           	</div>
    	</div>
    
    </section><br><br>
	
</body>
</html>
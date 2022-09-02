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
	
	function processToHeart(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addHeart",
				method : "get",
				data : {"goodsCd" : goodsCd , "heartGoodsQty" : 1 },
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
	
	function getGoodsListByPrice(){
		location.href =  "${contextPath }/goods/searchGoods?method=price&min="+$("#minamount").val() + "&max=" + $("#maxamount").val();
	}
	
	function selectSort() {
		location.href = "${contextPath }/goods/goodsList?sort="+document.getElementById("sortBy").value + "&part=all";
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
                        <h2>Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
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
                        <div class="sidebar__item">
                            <h4>Category</h4>
                            <div class="sidebar__item__size">
                                <label for="large">
                                    <a href="${contextPath }/goods/searchGoods?method=keyword&keyword=productionDt">최신순</a>
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="tiny">
                                     <a href="${contextPath }/goods/searchGoods?method=keyword&keyword=discountRate">할인률이 높은순</a>
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="medium">
                                     <a href="${contextPath }/goods/searchGoods?method=keyword&keyword=highPrice">높은 가격순</a>
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="small">
                                     <a href="${contextPath }/goods/searchGoods?method=keyword&keyword=lowPrice">낮은 가격순</a>
                                </label>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select id="sortBy" onchange="selectSort()">
                                        <option value="new">NEW</option>
                                        <option value="best">BEST</option>
                                        <option value="sale">SALE</option>
                                        <option value="pick">MD-PICK</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<c:choose>
                    		<c:when test="${empty goodsList}">
	                            <div class="product__item">
	                    			<h3>등록된 상품이 없습니다.</h3>
	                            </div>
                    		</c:when>
                    		<c:otherwise>
		                    	<c:forEach var="goodsDto" items="${goodsList }">
                        			<div class="col-lg-4 col-md-6 col-sm-6">
                           				<div class="product__item">
                                			<div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}">
                                				<c:choose>
			                                    	<c:when test="${goodsDto.sort eq 'new' }"> <div class="label new"><strong>New</strong></div></c:when>
			                                    	<c:when test="${goodsDto.sort eq 'best' }"> <div class="label best"><strong>Best</strong></div></c:when>
			                                    	<c:when test="${goodsDto.sort eq 'sale' }"> <div class="label sale"><strong>Sale</strong></div></c:when>
			                                    	<c:when test="${goodsDto.sort eq 'pick' }"> <div class="label pick"><strong>MD-Pick</strong></div></c:when>
			                                    </c:choose>
			                                   <ul class="product__item__pic__hover">
			                                       <li><a href="javascript:processToHeart(${goodsDto.goodsCd})"><i class="fa fa-heart"></i></a></li>
			                                       <li><a href="javascript:processToCart(${goodsDto.goodsCd})"><i class="fa fa-shopping-cart"></i></a></li>
			                                       <li><a href="javascript:processToOrder(${goodsDto.goodsCd})"><i class="icon_bag_alt"></i></a></li>
			                                   </ul>
                                			</div>
			                               <div class="product__item__text">
			                                   <h6>
			                                    	<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsNm }<br>
				                                    ${goodsDto.producer } | ${goodsDto.totalAmount }g
			                                    	</a>
			                                    </h6>
			                                   <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${goodsDto.price }"/>원 (${goodsDto.discountRate}%)</div>
			                                   <div class="product__price"><fmt:formatNumber value="${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100 }"/>원</div>
			                               </div>
                            			</div>
                       				</div>
                    			</c:forEach>   
                    		</c:otherwise>
                   		</c:choose>				
                	</div>
            	</div>
        	</div>
        </div>
    </section>
    <!-- Product Section End -->



</body>
</html>
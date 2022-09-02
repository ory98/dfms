<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	$().ready(function(){
	
		getTotalPrice();
		
		$("[name='cartCd']").change(function(){
			getTotalPrice();
		});
		
	});
	
	
	function getTotalPrice () {
		var totalPrice = 0;
		$("[name='cartCd']:checked").each(function(){
			var tempCartCd = $(this).val();
			totalPrice += Number($("#price" + tempCartCd).val()) * Number($("#cartGoodsQty" + tempCartCd).val());
		});
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#totalPrice").html(totalPrice);
	}
	
	
	function removeCart() {

		var cartCdList = "";
		
		$("[name='cartCd']:checked").each(function(){
			
			var cartCd = $(this).val();
			cartCdList += cartCd + ",";
			
		});
		
		if (cartCdList == "") {
			alert("장바구니에 담은 상품이 없습니다. 쇼핑몰로 넘어갑니다.");
			location.href = "${contextPath }/goods/goodsList?sort=all&part=all";
		}
		
		else {
			if (confirm("정말로 삭제하시겠습니까?")) {
				
				$("input[name='cartCd']:checked").each(function(){
					cartCdList;
				});

				location.href = "${contextPath}/myPage/removeCart?cartCdList=" + cartCdList;
			}
		}
		
	}
	
	
	function modifyCartGoodsQty(cartCd){
		$.ajax({
			type : "get",
			url : "${contextPath}/myPage/modifyCartGoodsQty",
			data : {
				"cartCd"   : cartCd,
				"cartGoodsQty" : $("#cartGoodsQty" + cartCd).val()
			},
			success:function(){
				getTotalPrice();
			}
		});
		
	}
	
	
	function processOrderCart() {
	
		var goodsCdList = "";
		var cartGoodsQtyList = "";
		var cartCdList = ""
		
		$("[name='cartCd']:checked").each(function(){
			
			var cartCd = $(this).val();
			var goodsCd =  $("#goodsCd" + cartCd).val();
			var cartGoodsQty = $("#cartGoodsQty" + cartCd).val();
			
			goodsCdList += goodsCd + ",";
			cartGoodsQtyList += cartGoodsQty +",";
			cartCdList += cartCd + ",";
			
		});
		
		if (goodsCdList == "") {
			alert("주문 목록이 없습니다.");
			return false;
		}
		
		var url = "${contextPath}/order/orderCartGoods";
		    url += "?goodsCdList="+goodsCdList;
		    url += "&cartGoodsQtyList="+cartGoodsQtyList;
		    url += "&cartCdList="+cartCdList;
		
		location.href = url;
		
		
	}
	
	
	function selectAllCart() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='cartCd']").prop("checked" , true);
		}
		else {
			$("[name='cartCd']").prop("checked" , false);
		}
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
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <span>Shopping Cart</span>
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
                    	<h6><input type="checkbox" id="changeAllChoice" onchange="selectAllCart()"> &nbsp;전체선택</h6>
                        <br>
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product"></th>
                                    <th>상품</th>
                                    <th></th>
                                    <th>상품가격</th>
                                    <th>주문수량</th>
                                    <th>등록일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myCartList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myCart" items="${myCartList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="cartCd" value="${myCart.cartCd }" checked></td>
                                    			<td class="cart__product__item">
			                                        <div class="cart__product__item__title">
			                                        	<img src="${contextPath }/thumbnails?goodsFileName=${myCart.goodsFileName }" width="100" height="100">
			                                        </div>
			                                    </td>
			                                    <td>
		                                        	<p>
		                                            	<a href="${contextPath }/goods/goodsDetail?goodsCd=${myCart.goodsCd}">${myCart.goodsNm }</a>
		                                            	<input type="hidden" id="goodsCd${myCart.cartCd }" value="${myCart.goodsCd }"/>
		                                            </p>
		                                            <h6>${myCart.producer } / ${myCart.totalAmount }g</h6>
			                                    </td>
			                                    <td class="cart__price">
			                                    	<div class="product__price" >
			                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/>원 (${myCart.discountRate}%)</span><br>
				                                    	<fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}"/>원
														<input type="hidden" id="price${myCart.cartCd }" value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}">	
			                                    	</div>
			                                    </td>
			                                    <td class="cart__quantity">
			                                        <div class="pro-qty" onmouseleave="modifyCartGoodsQty(${myCart.cartCd })">
			                                            <input type="text" id="cartGoodsQty${myCart.cartCd }" value="${myCart.cartGoodsQty }" />
			                                        </div>
			                                    </td>
			                                    <td><h6><fmt:formatDate value="${myCart.enrollDt }" pattern="yyyy-MM-dd"/></h6></td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                    	<a href="${contextPath }/goods/goodsList?sort=all&part=all" class="primary-btn cart-btn">계속 쇼핑하기</a>
                        <a href="javascript:removeCart();" class="primary-btn cart-btn cart-btn-right"><span class="icon_trash"></span>삭제하기</a>
                    </div>
                </div><br><br><br>
                <div class="col-lg-8 col-md-6"></div>
                <div class="col-lg-4 col-md-6">
                    <div class="checkout__order">
	                    <h4>Cart Total</h4>
	                    <div class="checkout__order__total">
	                    	<ul>
                            	<li>Total<span id="totalPrice">원</span></li>
                            </ul>
                        </div>
	                    <button type="button" onclick="javascript:processOrderCart()" class="site-btn">주문하기</button>
	                </div>
                </div>
            </div>
        </div>
    </section>
    
</body>
</html>
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

	$().ready(function(){
		
		$("[name='cardCompanyNm']").val("${myOrder.cardCompanyNm}");
		$("[name='payMethod']").val("${myOrder.payMethod}");
		$("[name='cardPayMonth']").val("${myOrder.cardPayMonth}");
		$("[name='deliveryStatus']").val("${myOrder.deliveryStatus}");
	
		$("[name='deliveryMethod']").each(function(){
			if ($(this).val() == "${myOrder.deliveryMethod}"){
				$(this).prop("checked", true);
			}
		})
		
		
	});

</script>
</head>
<body>

	<section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>주문 상세</h4>
                <form action="${contextPath }/order/orderGoods" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 성함 </p>
                                		<input type="text" name="ordererNm" value="${myOrder.ordererNm }" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 연락처 </p>
                                		<input type="text" name="myOrderHp" value="${myOrder.ordererHp }" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>배송방법 </p>
                               			<input type="text" name="deliveryMethod" value="${myOrder.deliveryMethod }" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>지불방법 </p>
                                		<input type="text" name="payMethod" value="${myOrder.payMethod }" disabled>
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                        		<c:when test="${myOrder.payMethod eq 'card'}">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
		                                    <p>카드회사 </p>
		                                  	<input type="text" name="cardCompanyNm" value="${myOrder.cardCompanyNm }" disabled>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>할부개월 </p>
		                                  	<c:choose>
			                                  	<c:when test="${myOrder.cardPayMonth == 0}">
			                                  		<input type="text" name="cardPayMonth" value="일시불" disabled>
			                                  	</c:when>
			                                  	<c:otherwise>
			                                    <input type="text" name="cardPayMonth" value="${myOrder.cardPayMonth }개월" disabled>
			                                  	</c:otherwise>
		                                  	</c:choose>
	                                    </div>
	                                </div>
	                       		</c:when>
	                       		<c:otherwise>
									<div class="col-lg-6">
		                                <div class="checkout__input">
		                                    <p>구매자연락처 </p>
		                                    <input type="text" name="paymyOrderHp" value="${myOrder.ordererHp }" disabled>
		                                </div>
		                            </div>                            	
                            	</c:otherwise>
	                        </c:choose>
                            <div class="checkout__input">
                                <p>배송상태 </p>
                                <input type="text" name="deliveryStatus" value="${myOrder.deliveryStatus }" disabled>
                            </div>
                            <div class="checkout__input">
                                <p>배송메세지 </p>
                                <input type="text" name="deliveryMessage" disabled>
                            </div>
                            <div class="checkout__input">
                                <p>우편번호 </p>
                                <input type="text" id="zipcode" name="zipcode" value="${myOrder.zipcode }" style="width: 30%;" disabled>
                                <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 20%; padding-left: 0" disabled>
                            </div>
                            <div class="checkout__input">
                                <p>도로명 주소 </p>
                                <input type="text" id="roadAddress" name="roadAddress" value="${myOrder.roadAddress }" disabled>
                            </div>
                            <div class="checkout__input">
                                <p>지번 주소 </p>
                                <input type="text" id="jibunAddress" name="jibunAddress" value="${myOrder.jibunAddress }" disabled>
                            </div>
                            <div class="checkout__input">
                                <p>나머지 주소 </p>
                                <input type="text" id="namujiAddress" name="namujiAddress" value="${myOrder.namujiAddress }" disabled>
                            </div>
                        </div>    
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>My Order</h4>
                                <div class="checkout__order__products">Products <span></span></div>
                                <ul>
                                    <li>${myOrder.goodsNm } <span><fmt:formatNumber value="${myOrder.orderGoodsQty }"/>개</span></li>
                                </ul><br><br>																	
                                <div class="checkout__order__subtotal">Price <span><fmt:formatNumber value="${(myOrder.price - (myOrder.price * myOrder.discountRate / 100)) * myOrder.orderGoodsQty}"/>원</span></div>
                                <div class="checkout__order__products">DeliveryPrice <span><fmt:formatNumber value="${myOrder.deliveryPrice}"/>원</span></div><br>
                                <div class="checkout__order__subtotal">Point <span><fmt:formatNumber value="${myOrder.point}"/>P</span></div><br><br>
                                <div class="checkout__order__total">Total <span><fmt:formatNumber value="${(myOrder.price - (myOrder.price * myOrder.discountRate / 100)) * myOrder.orderGoodsQty + myOrder.deliveryPrice}"/>원</span></div>
                             </div>   
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
	

</body>
</html>
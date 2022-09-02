<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function setPayMethod(){
		
		var method = $("[name='payMethod']").val();
		if (method == 'card') {
			$("#cardPayMonth,#cardCompanyNm").show();
			$("#payOrdererHp").hide();
		}
		else {
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#payOrdererHp").show();
			$("[name='payOrdererHp']").val("${orderer.hp }");
		}
		
	}

</script>
</head>
<body>

	<section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>주문 상세</h4>
                <form action="${contextPath }/order/orderGoods" method="post">
                	<input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
	                <input type="hidden" name="orderGoodsQty" value="${orderGoodsQty}">
	                <input type="hidden" name="memberId" value="${orderer.memberId}">
	                <input type="hidden" name="point" value="${goodsDto.point * orderGoodsQty}">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 성함 <span>*</span></p>
                                		<input type="text" name="ordererNm" value="${orderer.memberNm }">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주문자 연락처 <span>*</span></p>
                                		<input type="text" name="myOrderHp" value="${orderer.hp }">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__form__input">
                                        <p>배송방법 <span>*</span></p>
                                        <div class="row">
	                               			<input type="radio" name="deliveryMethod" value="일반택배" checked> 일반택배 &emsp; 
								 			<input type="radio" name="deliveryMethod" value="편의점택배"> 편의점택배 &emsp;
								 			<input type="radio" name="deliveryMethod" value="해외배송"> 해외배송 &emsp;
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
	                                 <div class="checkout__input">
		                                <p>배송메세지 </p>
		                                <input type="text" name="deliveryMessage">
		                            </div>
		                        </div>
		                   	</div>  
                          	<div class="row">
                                <div class="col-lg-6">
	                           		<div class="checkout__input">
	                                  	<p>지불방법 <span>*</span></p>
		                          		<select name="payMethod" onchange="setPayMethod()">
		                            		<option value="card">카드결제</option>
		                            		<option value="phone">휴대폰결제</option>
		                          		</select>
	                              	</div>
                          		</div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p></p>
                                    </div>
                                </div>
                            </div><br>
                            <div class="row">
	                            <div class="col-lg-6" id="cardCompanyNm">
	                                <div class="checkout__form__input">
	                                	<p>카드회사 <span>*</span></p>
			                     		<select name="cardCompanyNm">
											<option value="삼성">삼성</option>
											<option value="하나SK">하나SK</option>
											<option value="현대">현대</option>
											<option value="KB">KB</option>
											<option value="신한">신한</option>
											<option value="롯데">롯데</option>
											<option value="BC">BC</option>
											<option value="시티">시티</option>
											<option value="NH농협">NH농협</option>
						   				</select>
	                                </div>
	                            </div>
	                            <div class="col-lg-6">
	                                <div class="checkout__input" id="cardPayMonth">
	                                    <p>할부개월 <span>*</span></p>
	                               		<select name="cardPayMonth">
											<option value="0">일시불</option>                                    
											<option value="1">1개월</option>                                    
											<option value="2">2개월</option>                                    
											<option value="3">3개월</option>                                    
											<option value="4">4개월</option>                                    
											<option value="5">5개월</option>                                    
											<option value="6">6개월</option>                                    
				                    	</select>
	                                </div>
	                            </div>
	                        </div>
							<div class="col-lg-6">
                                <div class="checkout__input" id="payOrdererHp">
                                    <p>결제 휴대폰 번호  <span>*</span></p>
                                    <input type="text" name="paymyOrderHp" value="${orderer.hp }">
                                </div>
                            </div>
                            <br><div class="checkout__input">
                                <p>우편번호 <span>*</span></p>
                                <input type="text" id="zipcode" name="zipcode" value="${orderer.zipcode }" style="width: 30%;">
                                <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 20%; padding-left: 0">
                            </div>
                            <div class="checkout__input">
                                <p>도로명 주소 <span>*</span></p>
                                <input type="text" id="roadAddress" name="roadAddress" value="${orderer.roadAddress }">
                            </div>
                            <div class="checkout__input">
                                <p>지번 주소 <span>*</span></p>
                                <input type="text" id="jibunAddress" name="jibunAddress" value="${orderer.jibunAddress }">
                            </div>
                            <div class="checkout__input">
                                <p>나머지 주소 <span>*</span></p>
                                <input type="text" id="namujiAddress" name="namujiAddress" value="${orderer.namujiAddress }">
                            </div>
                        </div>    
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span></span></div>
                                <ul>
                                    <li>${goodsDto.goodsNm } <span><fmt:formatNumber value="${orderGoodsQty }"/>개</span></li>
                                </ul><br><br>
                                <div class="checkout__order__subtotal">Price <span><fmt:formatNumber value="${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100}"/>원</span></div>
                                <div class="checkout__order__products">DeliveryPrice <span><fmt:formatNumber value="${goodsDto.deliveryPrice}"/>원</span></div><br>
                                <div class="checkout__order__subtotal">Point <span><fmt:formatNumber value="${goodsDto.point}"/>P</span></div><br><br>
                                <div class="checkout__order__total">
                                	<c:set var="paymentAmt" value="${(goodsDto.price - (goodsDto.price * goodsDto.discountRate / 100)) * orderGoodsQty + goodsDto.deliveryPrice}"/>
                                	<ul>
                                    	<li>Total<span><fmt:formatNumber value="${paymentAmt }"/>원</span></li>
                                	</ul>
                                	<input type="hidden" name="paymentAmt" value='<fmt:parseNumber integerOnly="true" value="${paymentAmt }"/>'/>
                                </div>
                                <button type="submit" class="site-btn"><span class="icon_check"></span> 주문</button>
                             </div>   
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
</body>
</html>
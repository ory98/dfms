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

	$().ready(function() {
		
		var orderGoodsQtyList = "${orderGoodsQtyList}".split(",");
		
		var viewPaymentAmt = 0;
		var paymentAmtList = 0;
		var totalDeliveryPrice = 0;
		var totalPoint = 0;
		for (var i = 0; i < orderGoodsQtyList.length - 1; i++) {
			
			$("#qty"+i).text(orderGoodsQtyList[i] + "개");
			$("#orderGoodsQty"+i).val(orderGoodsQtyList[i] );
			
			var price = Number($("#price"+i).val());
			var discountRate = Number($("#discountRate"+i).val());
			var orderGoodsQty = Number($("#orderGoodsQty"+i).val());
			var deliveryPrice =  Number($("#deliveryPrice"+i).val());
			
			viewPaymentAmt += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty + deliveryPrice;
			
			paymentAmtList += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty + deliveryPrice;
			paymentAmtList += ",";
		
			totalDeliveryPrice += deliveryPrice;
			totalPoint += Number($("#point"+i).val() * Number($("#orderGoodsQty"+i).val()));
			
		}
		
		$("#totalDeliveryPrice").html(totalDeliveryPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("#totalPoint").html(totalPoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "P");
		$("#viewPaymentAmt").html(viewPaymentAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("[name='paymentAmtList']").val(paymentAmtList);
		$("[name='totalPoint']").val(totalPoint);
		
		
	});
	
	function setPayMethod(){
		
		var method = $("[name='payMethod']").val();
		if (method == 'card') {
			$("#cardPayMonth,#cardCompanyNm").show();
			$("#payOrdererHp").hide();
		}
		else {
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#payOrdererHp").show();
		}
		
	}
	
</script>
</head>
<body>
	
	<section class="checkout spad">
        <div class="container">
        	<div class="checkout__form">
            	<h4>주문 목록</h4>
            	<form action="${contextPath }/order/orderCartGoods" method="post" >
	                <div class="row">
	               	  <div class="col-lg-12">
	                        <div class="checkout__order">
	                            <div class="checkout__order__product">Product<br><br>
		                             <ul>
			                              <c:set var="point" value="0"/>
			                              <c:forEach var="goodsDto" items="${goodsList }" varStatus="i">
			                              <c:set var="point" value="${point + goodsDto.point }"/>
			                              <li>
			                              	${i.index + 1}.&nbsp; ${goodsDto.goodsNm } 
			                               <span id="qty${i.index }"></span>
			                               <span><fmt:formatNumber value="${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100}"/>원 &emsp;</span>
			                               <input type="hidden" id="price${i.index }" value="${goodsDto.price}" />
			                               <input type="hidden" id="discountRate${i.index }" value="${goodsDto.discountRate}" />
			                               <input type="hidden" id="orderGoodsQty${i.index }"/>
			                               <input type="hidden" id="deliveryPrice${i.index }" value="${goodsDto.deliveryPrice}" />
			                               <input type="hidden" id="point${i.index }" value="${goodsDto.point}" />
			                              </li>
			                             </c:forEach>
			                          <hr class="colorgraph">
			                          <li>DeliveryPrice <span id="totalDeliveryPrice"></span></li>
			                          <li>Point <span id="totalPoint"></span></li>
		                         	</ul>
	                                <input type="hidden" name="goodsCdList" value="${goodsCdList }">
	              					<input type="hidden" name="orderGoodsQtyList" value="${orderGoodsQtyList}">		
	              					<input type="hidden" name="cartCdList" value="${cartCdList}">		
	              					<input type="hidden" name="memberId" value="${orderer.memberId}">
	              					<input type="hidden" name="paymentAmtList">
	              					<input type="hidden" name="totalPoint" value="${totalPoint }">
	                            </div>
	                            <div class="checkout__order__total">
	                                <ul>
	                                    <li>Total <span id="viewPaymentAmt"></span></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                	<br><br><br>
                	
                	<div class="row">
		               	<div class="col-lg-12 col-md-12">
		                    <h4>주문 상세</h4>
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
		                                <input type="text" name="ordererHp" value="${orderer.hp }">
		                            </div>
		                        </div>
		                        <div class="col-lg-6">
		                            <div class="checkout__form__input">
		                                <p>배송방법 <span>*</span></p>
		                                 <input type="radio" name="deliveryMethod" value="일반택배" checked> 일반택배 &emsp; 
							 			<input type="radio" name="deliveryMethod" value="편의점택배"> 편의점택배 &emsp;
							 			<input type="radio" name="deliveryMethod" value="해외배송"> 해외배송 &emsp;
		                            </div>
		                        </div>
		                        <div class="col-lg-6">
		                            <div class="checkout__input">
		                                <p>배송메세지 <span>*</span></p>
		                                <input type="text" name="deliveryMessage" placeholder="배송메세지 작성">
		                            </div>
		                        </div>
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
		                            <div class="checkout__form__input">
		                            	<p></p>
                                    </div>
		                        </div>
		                   	</div><br>
		                   	<div class="row">
		                   		<div class="col-lg-6" id="cardCompanyNm">
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
		                        <div class="checkout__input" id="payOrdererHp" style="display: none">
                                	<p>결제 휴대폰 번호 <span>*</span></p>
	                                <input type="text" name="payOrdererHp" value="${orderer.hp }">
		                        </div>
		                    </div>
		                   
		                    <div class="checkout__input">
                               <p>우편번호 <span>*</span></p>
                               <input type="text" id="zipcode" name="zipcode" value="${orderer.zipcode }" style="width: 10%;">
                               <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 7%; padding-left: 0">
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
                            <div align="right">
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
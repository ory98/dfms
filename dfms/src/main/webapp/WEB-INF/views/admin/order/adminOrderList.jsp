<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function gerateOrderExcelExport() {
		location.href = "${contextPath}/admin/order/orderExcelExport";
	}
</script>
</head>
<body>

	<!-- Order List Section Begin -->
    <section class="shoping__cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<div class="cart__btn update__btn" align="right">
						<a href="javascript:gerateMemberExcelExport();" class="site-btn"><span class="icon_folder_download"></span>  Excel</a>
					</div>
					<br>
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문정보</th>
                                    <th></th>
                                    <th>주문자</th>
                                    <th>주문날짜</th>
                                    <th>배송상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty orderList}">
                            			<tr>
                            				<td colspan="6"><h3>주문내역이 없습니다.</h3></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="order" items="${orderList }">
		                            		 <tr>
                                    			<td class="cart__product__item">
                                    				<img src="${contextPath }/thumbnails?goodsFileName=${order.goodsFileName }" width="70" height="70">
                                    			</td>
                                    			<td>
                                    				<div class="cart__product__item__title">
		                                            	<h6>
		                                            		<a href="${contextPath }/myPage/myOrderDetail?orderCd=${order.orderCd}&memberId=${order.memberId}">
		                                            		상품명 : ${order.goodsNm }<br>
		                                            		제조원 : ${order.producer } / 상품가격 : <fmt:formatNumber value="${order.price }"/> 원 / 주문수량 : ${order.orderGoodsQty }개
		                                        			</a>
		                                        		</h6>
			                                        </div>
			                                    </td>
			                                	<td><h6><strong>${order.memberId }</strong></h6></td>
			                                    <td><h6><fmt:formatDate value="${order.payOrderTime }" pattern="yyyy-MM-dd"/></h6> </td>
			                                    <td><h6>${order.deliveryStatus }</h6></td>
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
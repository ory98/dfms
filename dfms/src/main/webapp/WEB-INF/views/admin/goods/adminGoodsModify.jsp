<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
	$().ready(function(){
		
		$("[name='part']").val("${goodsDto.part}");
		$("[name='sort']").val("${goodsDto.sort}");
		
	});

</script>
<body>
	
	<!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <form action="${contextPath }/admin/goods/adminGoodsModify" method="post" enctype="multipart/form-data" class="checkout__form" >
                <input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
                <div class="row">
                    <div class="col-lg-8">
                        <h5>상품수정</h5>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품이미지<span>*</span></p>
                                    <input type="file" name="goodsFileName" value="${goodsDto.goodsFileName }">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품명 <span>*</span></p>
                                    <input type="text" name="goodsNm" value="${goodsDto.goodsNm }">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>제조원 <span>*</span></p>
                                    <input type="text" name="producer" value="${goodsDto.producer }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>가격 <span>*</span></p>
                                    <input type="text" name="price" value="${goodsDto.price }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>할인률 <span>*</span></p>
                                    <input type="text" name="discountRate" value="${goodsDto.discountRate }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>재고 <span>*</span></p>
                                    <input type="text" name="stock" value="${goodsDto.stock }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>분류 <span>*</span></p>
                                      <select name="sort">
                                    	<option value="new">최신상품</option>
                                    	<option value="best">베스트상품</option>
                                    	<option value="sale">특가상품</option>
                                    	<option value="pick">추천상품</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>적립포인트(P) <span>*</span></p>
                                    <input type="text" name="point" value="${goodsDto.point }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>배송비 <span>*</span></p>
                                    <input type="text" name="deliveryPrice" value="${goodsDto.deliveryPrice }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>제조일 <span>*</span></p>
                                    <input type="date" name="productionDt" value='<fmt:formatDate value="${goodsDto.productionDt }" pattern="yyyy-MM-dd"/>'>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>유통기한 <span>*</span></p>
                                    <input type="date" name="expirationDt" value='<fmt:formatDate value="${goodsDto.expirationDt }" pattern="yyyy-MM-dd"/>'>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>내용량 <span>*</span></p>
                                    <input type="text" name="totalAmount" value="${goodsDto.totalAmount }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>칼로리 <span>*</span></p>
                                    <input type="text" name="kcal" value="${goodsDto.kcal }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>단백질 함량 <span>*</span></p>
                                    <input type="text" name="proteinContent" value="${goodsDto.proteinContent }">
                                </div>
                            </div>
                           <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>분야<span>*</span></p>
                                    <select name="part">
                                    	<option value="shake">식사대용 쉐이크</option>
                                    	<option value="protein">보충제</option>
                                    	<option value="pill">영양제</option>
                                    	<option value="tea">TEA</option>
                                    	<option value="vitamin">비타민</option>
                                    	<option value="chicken">닭가슴살</option>
                                    	<option value="meal">도시락</option>
                                    	<option value="salad">샐러드</option>
                                    	<option value="vegetable">채소</option>
                                    	<option value="snack">간식</option>
                                    	<option value="juice">음료</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>영양정보<span>*</span></p>
                                    <textarea rows="5" cols="100" name="nutritionalInfo">${goodsDto.nutritionalInfo }</textarea> 
                               		<script>CKEDITOR.replace("nutritionalInfo");</script>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>원재료명 및 함량<span>*</span></p>
                                    <textarea rows="5" cols="100" name="materialContent" > ${goodsDto.materialContent }</textarea> 
                                	<script>CKEDITOR.replace("materialContent");</script>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>주의사항<span>*</span></p>
                                    <textarea rows="5" cols="100" name="precaution">${goodsDto.precaution }</textarea> 
                                	<script>CKEDITOR.replace("precaution");</script>
                                </div>
                            </div>
                        </div>
                    <br>
	                <div align="right">
	                	<button type="submit" class="site-btn">수정하기</button>
	                </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->
</body>
</html>
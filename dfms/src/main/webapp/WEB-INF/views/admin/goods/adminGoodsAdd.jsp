<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <form action="${contextPath }/admin/goods/adminGoodsAdd" method="post" enctype="multipart/form-data" class="checkout__form" >
                <div class="row">
                    <div class="col-lg-12">
                        <h5>상품등록</h5>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품이미지<span>*</span> <span class="icon_upload"></span> </p>
                                    <input type="file" name="goodsFileName">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품명 <span>*</span></p>
                                    <input type="text" name="goodsNm" placeholder="상품명을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>제조원 <span>*</span></p>
                                    <input type="text" name="producer" placeholder="제조원를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>가격 <span>*</span></p>
                                    <input type="text" name="price" placeholder="가격을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>할인률 <span>*</span></p>
                                    <input type="text" name="discountRate" placeholder="할인률을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>재고 <span>*</span></p>
                                    <input type="text" name="stock" placeholder="재고를 입력하세요.">
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
                                    <input type="text" name="point" placeholder="적립 포인트(P)를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>배송비 <span>*</span></p>
                                    <input type="text" name="deliveryPrice" placeholder="배송비를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>제조일 <span>*</span></p>
                                    <input type="date" name="productionDt">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>유통기한 <span>*</span></p>
                                    <input type="date" name="expirationDt">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>내용량 <span>*</span></p>
                                    <input type="text" name="totalAmount" placeholder="내용량를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>칼로리 <span>*</span></p>
                                    <input type="text" name="kcal" placeholder="칼로리를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>단백질 함량 <span>*</span></p>
                                    <input type="text" name="proteinContent" placeholder="담백질 함량를 입력하세요.">
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
                                    <textarea rows="5" cols="100" name="nutritionalInfo" placeholder="영양정보를 입력하세요."></textarea> 
                               		<script>CKEDITOR.replace("nutritionalInfo");</script>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>원재료명 및 함량<span>*</span></p>
                                    <textarea rows="5" cols="100" name="materialContent" placeholder="원재료명 및 함량을 입력하세요."></textarea> 
                                	<script>CKEDITOR.replace("materialContent");</script>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>주의사항<span>*</span></p>
                                    <textarea rows="5" cols="100" name="precaution" placeholder="주의사항을 입력하세요."></textarea> 
                                	<script>CKEDITOR.replace("precaution");</script>
                                </div>
                            </div>
                        </div>
                        <br>
		                <div align="right">
		                	<button type="submit" class="site-btn"><span class="icon_plus"></span> 등록</button>
		                </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

</body>
</html>
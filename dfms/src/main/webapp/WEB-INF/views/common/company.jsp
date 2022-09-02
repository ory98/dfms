<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath }/resources/bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Company</h2>
                        <div class="breadcrumb__option">
                            <a href="${contextPath }/">Home</a>
                            <span>Company</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Phone</h4>
                        <p>+01-3-8888-6868</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>Address</h4>
                        <p>역삼동 818-15</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>Open time</h4>
                        <p>10:00 am to 22:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>halfood24@gmail.com</p>
                    </div>
                </div>
            	
            	<div class="col-lg-12">

					<!-- 지도 -->
					<div id="daumRoughmapContainer1600749162322"
						class="mymap root_daum_roughmap root_daum_roughmap_landing os_mac"
						style="z-index: 2; width: 450px;">

					<script charset="UTF-8" class="daum_roughmap_loader_script"
						src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
					<script charset="UTF-8"
						src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
					<script charset="UTF-8"
						src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
					<!-- 3. 실행 스크립트 -->
					<script charset="UTF-8">
						new daum.roughmap.Lander({
							"timestamp" : "1600749162322",
							"key" : "226ga",
							"mapWidth" : "1200",
							"mapHeight" : "500"
						}).render();
					</script>
				</div>
			</div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
    
    <!-- Related Blog Section Begin -->
    <section class="related-blog spad">
        <div class="container">
            <div class="row">
            	<div class="col-lg-12">
                    <div class="section-title related-blog-title">
                        <h2 align="center">회사 인증처</h2>
                        <br><br>
                        <h4>인증받은 저희  <strong>Halfood24</strong>는 항상 올바르고 깨끗한 원료를 사용하여 고객님의 건강향상을 촉진하는 일을 최우선적으로 생각하고 행동합니다.</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${contextPath }/resources/bootstrap/img/company/health.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <h4 align="center">건강기능식품</h4><br>
                            <p>식품의약품안전처의 엄격한 관리 및 심사 아래 까다로운 검사(기능성검사,성분함량, 아미노산 스코어, 대장균군 검사 등)에 모두 합격하였습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${contextPath }/resources/bootstrap/img/company/gmp.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <h4 align="center">GMP</h4><br>
                            <p>우수 건강기능식품 제조 및 품질관리 및 기준을 준수하여 안전하고 우수한 품질의 건강기능식품을 제조하는 생산 설비로 식품의약품안전처의 인증을 받았습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${contextPath }/resources/bootstrap/img/company/trace.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <h4 align="center">이력추적관리시스템</h4><br>
                            <p>식품의약품안전처 이력추적관리 시스템에 식품의 원재료 및 생산 이력을 공개하여 안전한 식품선택을 위한 소비자의 알권리를 보장하고 있습니다. </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Blog Section End -->
</body>
</html>
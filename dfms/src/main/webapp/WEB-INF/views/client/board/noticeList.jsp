<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="shoping__cart spad">
        <div class="container">
            <div class="row" align="center">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                	<th>번호</th>
                                    <th>제목</th>
                                    <th>등록날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                            		<c:when test="${empty noticeList}">
                            			<tr>
		                                    <td colspan="4" align="center"><h6>작성된 공지가 없습니다.</h6></td>
		                                </tr>	
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="noticeDto" items="${noticeList }" varStatus="i">
		                            		 <tr>
		                            		 	<td class="cart__product__item" align="center">
		                            		 		<h6>${noticeDto.noticeCd }</h6>
			                                    </td>
			                                    <td class="shoping__cart__item">
			                                        <div class="cart__product__item__title" align="left">
			                                            <h6 align="center"><a href="${contextPath }/admin/notice/noticeDetail?noticeCd=${noticeDto.noticeCd}">${noticeDto.subject }</a></h6>
			                                        </div>
			                                    </td>
			                                    <td class="cart__total"><fmt:formatDate value="${noticeDto.enrollDt }" pattern="yyyy-MM-dd"/> </td>
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
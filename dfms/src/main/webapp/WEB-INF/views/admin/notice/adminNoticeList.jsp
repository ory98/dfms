<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	function adminNoticeRemove(noticeCd) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "${contextPath}/admin/notice/adminNoticeRemove?noticeCd="+noticeCd;
		}
	}

</script>
<title>Insert title here</title>
</head>
<body>

	<!-- Order List Section Begin -->
    <section class="shoping__cart spad">
        <div class="container">
        	<div align="right">
	        	<button type="button" onclick="javascript:location.href='${contextPath}/admin/notice/adminNoticeAdd'" class="site-btn"><span class="icon_plus"></span> 등록</button>
	        </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                	<th width="10%">번호</th>
                                    <th width="50%">제목</th>
                                    <th width="20%">등록날짜</th>
                                    <th width="10%">수정/삭제</th>
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
			                                            <h6><a href="${contextPath }/admin/notice/noticeDetail?noticeCd=${noticeDto.noticeCd}">${noticeDto.subject }</a></h6>
			                                        </div>
			                                    </td>
			                                    <td class="cart__total"><fmt:formatDate value="${noticeDto.enrollDt }" pattern="yyyy-MM-dd"/> </td>
			                                	<td class="cart__close">
			                                		<a href="${contextPath }/admin/notice/adminNoticeModify?noticeCd=${noticeDto.noticeCd}"><span class="icon_pencil-edit"></span></a>
			                                		<a href="javascript:adminNoticeRemove(${noticeDto.noticeCd });"><span class="icon_trash_alt"></span></a>
			                                	</td>
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
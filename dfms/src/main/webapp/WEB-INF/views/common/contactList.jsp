<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">
<script>

	function removeContact(contactCd) {
		
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "${contextPath}/removeContact?contactCd="+contactCd;
		}
	}
	
</script>
</head>
<body>

    <section class="shoping__cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table" >
                        <table>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>메일</th>
                                    <th>작성일</th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty contactList}">
                            			<tr>
                            				<td colspan="6" align="center"><h3>문의 내용이 없습니다.</h3></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="contactDto" items="${contactList }">
		                            		 <tr>
		                            		 	<td>${contactDto.contactCd }</td>
                                    			<td class="cart__product__item">
		                                            <h6><a href="${contextPath }/contactDetail?contactCd=${contactDto.contactCd}">${contactDto.subject }</a></h6>
			                                    </td>
			                                    <td>${contactDto.name }</td>
			                                    <td>${contactDto.email }</td>
			                                    <td class="cart__total"><fmt:formatDate value="${contactDto.regDt }" pattern="yyyy-MM-dd"/> </td>
			                                    <td class="cart__close"><a href="javascript:removeContact(${contactDto.contactCd });"><span class="icon_trash_alt"></span> </td>
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
 d
</body>
</html>
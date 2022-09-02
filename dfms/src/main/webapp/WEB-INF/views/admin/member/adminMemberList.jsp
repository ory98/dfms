<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
	function gerateMemberExcelExport() {
		location.href = "${contextPath}/admin/member/memberExcelExport";
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
						<a href="javascript:gerateMemberExcelExport();"><span class="icon_folder_download"></span> Excel</a>
					</div>
					<br>
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>회원아이디</th>
                                    <th>회원이름</th>
                                    <th>포인트</th>
                                    <th>가입일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty memberList}">
                            			<tr>
                            				<td colspan="6"><h3>가입된 회원이 없습니다.</h3></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="memberDto" items="${memberList }" varStatus="i">
		                            		 <tr>
		                            		 	<td>
		                            		 		<h6>${i.count }</h6>
			                                    </td>
                                    			<td class="cart__product__item">
			                                        <h6><a href="${contextPath }/myPage/myInfo?memberId=${memberDto.memberId}">${memberDto.memberId} </a></h6>
			                                    </td>
			                                	<td class="cart__product__item__title"><strong>${memberDto.memberNm }</strong></td>
			                                	<td class="cart__total"><fmt:formatNumber value="${memberDto.point }"/> P</td>			                          
			                                    <td><fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"/> </td>
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
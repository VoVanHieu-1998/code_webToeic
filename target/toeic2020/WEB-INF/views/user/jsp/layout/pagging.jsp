<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div class="dataTables_paginate paging_simple_numbers">

	<ul class="pagination" style="font-size: 20px;">
		<c:forEach begin="1" end="${pageInfo.totalPages }" varStatus="loop">
			<!-- neu la trang hien tai, thi hightlight len -->

			<c:choose>
				<c:when test="${pageInfo.indexPage == loop.index}">
					<li class="paginate_button active" style="background-color: teal; margin-right: 5px; width: 20px; text-align: center;color: black;"><a
						href="javascript:void(0);">${loop.index}</a></li>
				</c:when>
				<c:otherwise>
					<li class="paginate_button" style="background-color: teal; margin-right: 5px; width: 20px; text-align: center;"><a href="<c:url value="/train/part3/${loop.index}" />"
						>${loop.index}</a></li>
					
				</c:otherwise>

			</c:choose>

			<li></li>
		</c:forEach>

	</ul>
</div>
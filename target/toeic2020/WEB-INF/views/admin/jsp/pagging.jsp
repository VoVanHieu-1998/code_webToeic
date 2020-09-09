<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div class="dataTables_paginate paging_simple_numbers">

	<ul class="pagination">
		<c:forEach begin="1" end="${pageInfo.totalPages }" varStatus="loop">
			<!-- neu la trang hien tai, thi hightlight len -->

			<c:choose>
				<c:when test="${pageInfo.indexPage == loop.index}">
					<li class="paginate_button active"><a
						href="javascript:void(0);">${loop.index}</a></li>
				</c:when>
				<c:otherwise>
					<li class="paginate_button"><a href="javascript:void(0);"
						onclick="goToPage(${loop.index})">${loop.index}</a></li>
				</c:otherwise>

			</c:choose>

			<li></li>
		</c:forEach>

	</ul>
</div>
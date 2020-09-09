<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hướng dẫn ngữ pháp</title>
</head>
<body>
	
	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h1>Hướng dẫn ngữ pháp</h1>

					</div>
				</div>

			</div>
			<hr>

			<div class="row">
				<div class="col-9 row" style="margin-top: 3vh">

					<c:forEach items="${grammarGuidelines}" var="list">
						<div class="container bg-light border"
							style="border-radius: 10px; padding: 3vh">


							<div class="question">
								<a
									href='<c:url value="/grammar-guideline/detail/${list.id}"></c:url>'><h3>-
										${list.name}</h3></a>
							</div>

						</div>

					</c:forEach>



				</div>

				<div class="col-3">
					<div class="col-md-11 col-xs-11 card card-body bg-light"
						style="margin-top: 30px; margin-bottom: 30px;">
						<div>
							<h3 style="color: dimgray">Exams</h3>
						</div>
						<br>
						<h4>
							<a href="#">Quizzes</a>
						</h4>
						<br>
						<h4>
							<a href="#">Vocabulary</a>
						</h4>
						<br>
						<h4>
							<a href="#">Reading</a>
						</h4>
						<br>
						<h4>
							<a href="#">Listening</a>
						</h4>

					</div>
				</div>

			</div>

		<!-- pagging -->
			<div class="dataTables_paginate paging_simple_numbers">

				<ul class="pagination" style="font-size: 20px;">
					<c:forEach begin="1" end="${pageInfo.totalPages }" varStatus="loop">
						<!-- neu la trang hien tai, thi hightlight len -->

						<c:choose>
							<c:when test="${pageInfo.indexPage == loop.index}">
								<li class="paginate_button active"
									style="background-color: teal; margin-right: 5px; width: 20px; text-align: center; color: black;"><a
									href="javascript:void(0);">${loop.index}</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button"
									style="background-color: teal; margin-right: 5px; width: 20px; text-align: center;"><a
									href="<c:url value="/grammar-guideline/${loop.index}" />">${loop.index}</a></li>

							</c:otherwise>

						</c:choose>

						<li></li>
					</c:forEach>

				</ul>
			</div>
		</div>

	</div>
	
</body>
</html>
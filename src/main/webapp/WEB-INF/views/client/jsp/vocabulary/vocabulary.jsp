<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vocabulary</title>
<link href="<c:url value="/resources/Client/Css/vocabulary.css" />"
	rel="stylesheet">


</head>
<body>

	<div class="super_container">


		<!-- body -->

		<div class="features">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div>
							<h1>Các chủ đề từ vựng!</h1>

						</div>
					</div>

				</div>
				<hr>

				<div class="row">
					<div class="col-9 row" style="margin-top: 3vh" id="danhsachtuvung">

						<c:forEach var="tuvung" items="${listtuvung }">

							<div class="col-md-4 col-sm-6">

								<a style="text-decoration: none;"
									href='<c:url value="/vocabularycontent/${tuvung.getIdvocabulary() }"/>'>
									
								<div class=" sanpham wow zoomIn">
									<img style="width: 100%; height: 150px;" alt="hinh"
										src="<c:url value='/resources/Client/vocabularyline/${tuvung.getImagevocabulary()}' />" /><br />
									<span style="padding-left: 80px; color: violet;">${tuvung.getNamevocabulary() }</span><br />

								</div>
								</a>
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
								<a href="<c:url value="/vocabulary/list/"></c:url>">Vocabulary</a>
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
						<c:forEach begin="1" end="${pageInfo.totalPages }"
							varStatus="loop">
							<!-- neu la trang hien tai, thi hightlight len -->

							<c:choose>
								<c:when test="${pageInfo.indexPage == loop.index}">
									<li class="paginate_button active"
										style="background-color: #336699; margin-right: 5px; width: 20px; text-align: center; color: black;"><a
										href="javascript:void(0);">${loop.index}</a></li>
								</c:when>
								<c:otherwise>
									<li class="paginate_button"
										style="background-color: #999999; margin-right: 5px; width: 20px; text-align: center;"><a
										href="<c:url value="/vocabulary/list/${loop.index}" />">${loop.index}</a></li>

								</c:otherwise>

							</c:choose>

							<li></li>
						</c:forEach>

					</ul>
				</div>
			</div>

		</div>


		<!-- /body -->



	</div>


</body>
</html>
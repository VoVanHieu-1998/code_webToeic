<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vocabulary</title>


</head>
<body>

	<div class="super_container">

		<!-- Header -->


			

		<!-- search -->


		<!-- body -->
		<div class="features">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div>
							<h3>Chủ đề Vocabulary: <span style="color:red;">${vocabularyline.getNamevocabulary() }</span></h3>

						</div>
						<div style="float:right;">
						<button class="btn btn-info" ><a style="color: red" href="<c:url value="/vocabulary/test/question/${23 }"/>">Luyện tập</a></button>
						
						
						</div>
					</div>

				</div>
				<hr>

				<div class="row">
					<div class="col-9 row" style="margin-top: 3vh">

						<div class="row">
							<c:forEach var="listtuvung" items="${vocabularyline.getVocabularycontent() }">
							<a href="<c:url value="/vocabulary/test/question/${listtuvung.getIdvocabularycontent() }"/>">
								<div class="col-sm-4 col-md-4">
									<img style= "width:100%; margin-top: 50px;" id="anhchinh" alt=""
										src="<c:url value='/resources/Client/vocabularyline/contentvocabulary/${ listtuvung.getImagevocabularycontent()}' />" />
								</div>
								<div id="span" class="col-sm-8 col-md-8">

									<span style="font-size: 20px;color: violet">${ listtuvung.getNamevocabularycontent()}</span> <span
										style="font-size: 20px; color: red">${ listtuvung.getTranscribe()}</span> <br />
									<h4 style="color: blue; ">${listtuvung.getMean() }</h4>
									<audio controls="controls"
										style=" margin-left: 50px;">
										<source src="<c:url value='/resources/Client/vocabularyline/contentvocabulary/${ listtuvung.getAudiomp3()}' />" type="audio/mpeg">
									</audio>

								</div>

							</a>
							</c:forEach>


						</div>
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
				
			</div>

		</div>


		<!-- /body -->



		

</body>
</html>
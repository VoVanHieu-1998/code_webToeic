
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link
	href="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/Client/styles/main_styles.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Client/styles/styles/responsive.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/Client/Css/style.css" />"
	rel="stylesheet">

</head>
<body>

	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h3>Part VII: Reading Comprehension</h3>

					</div>
				</div>


			</div>
			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">


						<div class="row" style="padding: 3vh">

							<p>Directions: In this part you will read a selection of
								texts, such as magezine and newspaper articles, letters, and
								advertisements. Each text is followed by several questions.
								Select the best answer for each question and mark the letter
								(A), (B), (C) or (D) on your answer sheet.</p>

							<br />
							<h5>Example:</h5>
							<br />
							<p>Are you someone who enjoys trying new things and does not
								feel uncomfortable in new environment? Then why not get paid for
								it? CULTURE magazine is looking for individuals to go to new
								clubs, event, etc and write about the cultural scene they
								observe in these place. Interested? Send your resume to
								CULTURE@hotmail.com. Please no phone calls.</p>
						</div>
						
						<div class="row answers"
								style="color: black; border-bottom: solid 1px #e5e5e5;">
								<p style="font-weight: bold;">What type of person would be best qualified for this job?</p>

								<div class="row col-md-12" style="margin: auto; color: black;">
									<input name="question_1" value="" type="radio">A. a homebody</>
								</div>

								<div class="row col-md-12"
									style="margin: auto; color: black; font-weight: bold;">
									<input id="@op2_${q.id}" name="question_1" value=""
										type="radio">B. an introvert</>
								</div>

								<div class="row col-md-12" style="margin: auto; color: black;">
									<input id="@op3_${q.id}" name="question_1" value=""
										type="radio">C. a clumsy person</>
								</div>
								
								<div class="row col-md-12" style="margin: auto; color: black;">
									<input id="@op3_${q.id}" name="question_1" value="" 
										type="radio" checked="checked">D.  a risk-taker</>
								</div>



							</div>






						<form class="form" name="form"
							action="${pageContext.request.contextPath}/exam/part-7/0"
							method="get">
							<input type="hidden" name="minute" /> <input type="hidden"
								name="second" />
							<button type="submit" class="btn btn-danger" onclick="sub();">Start</button>
						</form>
					</div>



				</div>





			</div>


		</div>


	</div>

	<script type="text/javascript">
		var min = document.getElementById("min").value;
		var sec = document.getElementById("sec").value;

		function sub() {
			document.form.minute.value = min;
			document.form.second.value = sec;

			document.form.submit();

		};
	</script>


	<script
		src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.js" />"></script>
</body>
</html>
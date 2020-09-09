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
						<h3>Part2: Question - Response</h3>

					</div>
				</div>


			</div>
			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">


						<div class="row" style="padding: 3vh">

							<p>Directions: In this part of the test, you will hear a
								question or statement spoken in English, followed by three
								responses, also spoken in English. The question or statement and
								the responses will be spoken just one time. They will not be
								printed in your test book, so you must listen carefully. You are
								to choose the best response to each question or statement. Now
								listen to a sample question.</p>

						</div>



						<hr />

						<div class="question">

							<div class="row col-md-12"
								style="padding: 3vh; margin-top: 20px; color: black;">

								<audio controls style="margin: auto">
									<source
										src="<c:url value="/resources/Client/mp3/part_2_intro.mp3" />">
								</audio>

								<hr />


							</div>
							<div class="row col-md-12"
								style="padding: 3vh; margin-top: 20px; color: black;">

								<p>EXAMPLE:</p>
								<br>
								<p>Now listen to the four statements.</p>
								<br>
								<p>The best response is choice B. "My car broke down".
									Therefore, you should choose B.</p>

								<hr />


							</div>



							<div class="row answers"
								style="color: black; border-bottom: solid 1px #e5e5e5;">
								<p style="font-weight: bold;">Why are you late?</p>

								<div class="row col-md-12" style="margin: auto; color: black;">
									<input name="question_1" value="" type="radio">A. I
									hope I won't be</>
								</div>

								<div class="row col-md-12"
									style="margin: auto; color: black; font-weight: bold;">
									<input id="@op2_${q.id}" name="question_1" value=""
										type="radio">B. My car broke down</>
								</div>

								<div class="row col-md-12" style="margin: auto; color: black;">
									<input id="@op3_${q.id}" name="question_1" value=""
										type="radio">C. He alway is</>
								</div>



							</div>


							<a href="<c:url value="/exam/part-2"/>"><button
									type="submit" class="btn btn-danger">Start</button></a>
						</div>

						<hr />


					</div>





				</div>


			</div>


		</div>

	</div>

	<script type="text/javascript">
		function setInput(button, input, out1, out2, out3) {

			var valueQues = document.getElementById(button).name;
			document.getElementById(input).value = valueQues;

			console.log(valueQues);

			document.getElementById(button).style.color = "green";
			document.getElementById(out1).style.color = "deepskyblue";
			document.getElementById(out2).style.color = "deepskyblue";
			document.getElementById(out3).style.color = "deepskyblue";

		}
		/// check email exist
		$(document).ready(function() {
			$.ajax({
				url : "/train/part3/check",
				type : "POST",
				data : {

				},
				success : function(value) {
					if (value) {

					}

				}
			});

		});
	</script>
	<script
		src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.js" />"></script>
</body>
</html>
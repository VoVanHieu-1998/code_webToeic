<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Practice Part3</title>

</head>
<body>


	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h3>Practice part3</h3>

					</div>
				</div>

			</div>
			<hr>

			<div class="row">
				<div class="col-9 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">
						<form:form modelAttribute="part3Form"
							servletRelativeAction="/train-part3/check" method="POST">

							<div class="row" style="padding: 3vh">
								<audio controls style="margin: auto">

									<source src="<c:url value="/resources/luyenPart3_1.mp3" />">

									Your browser does not support the audio element.
								</audio>


							</div>
							<div class="row">
								<h6 style="margin: auto">A small text to lead the audio.</h6>
							</div>

							<hr />

							<c:forEach items="${part3Form.part3s}" var="list">
								<div class="question">

									<c:forEach items="${list.part3Questions}" var="q"
										varStatus="loop">
										<div class="row ask" style="padding: 3vh">

											<p>
											<h6 style="margin: auto">${loop.index + 1}.${q.content}</h6>
											</p>


											<input name="@anwser${q.id}" id="@input_${q.id}" /> 
											<input name="qessId" value="${q.id}">

										</div>
										<div class="row answers">


											<div class="row col-md-12" style="margin: auto;">
												<button id="@op1_${q.id}" name="${q.op1}" class="col btn-de"
													style="color: deepskyblue; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh"
													onclick="setInput('@op1_${q.id}', '@input_${q.id}','@op2_${q.id}','@op3_${q.id}','@op4_${q.id}')"
													type="button">A. ${q.op1}</button>


												<button id="@op2_${q.id}" name="${q.op2}" class="col btn-de"
													style="color: deepskyblue; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh"
													onclick="setInput('@op2_${q.id}','@input_${q.id}','@op1_${q.id}','@op3_${q.id}','@op4_${q.id}')"
													type="button">B. ${q.op2}</button>
											</div>
											<br>
											<div class="row col-md-12" style="margin: auto;">
												<button id="@op3_${q.id}" name="${q.op3}" class="col btn-de"
													style="color: deepskyblue; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh"
													onclick="setInput('@op3_${q.id}', '@input_${q.id}','@op1_${q.id}','@op2_${q.id}','@op4_${q.id}')"
													type="button">C. ${q.op3}</button>
												<button id="@op4_${q.id}" name="${q.op4}" class="col btn-de"
													style="color: deepskyblue; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh"
													onclick="setInput('@op4_${q.id}','@input_${q.id}','@op1_${q.id}','@op2_${q.id}','@op3_${q.id}')"
													type="button">D. ${q.op4}</button>
											</div>


										</div>


									</c:forEach>





									<button type="submit" class="btn btn-danger">Check</button>

								</div>
							</c:forEach>
							<hr />

						</form:form>

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

			<jsp:include page="../jsp/layout/pagging.jsp"></jsp:include>
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
</body>

</html>
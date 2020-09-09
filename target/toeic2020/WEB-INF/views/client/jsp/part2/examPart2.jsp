<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<div class="features">
		<div class="container">
			<div >
			<h4>Mark your answer on your answer sheet:</h4>
			</div>
			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">
						<form method="post"
							action="${pageContext.request.contextPath}/exam/part2/submit?examinationId=${idExam}&part=2">

							<c:forEach items="${part2s}" var="list" varStatus="status">

								<div class="row" style="padding: 3vh">
									<audio controls style="margin: auto">
										<source src="<c:url value="${list.mp3}" />">
									</audio>
								</div>



								<hr />
								<div class="row col-md-12">
									<c:forEach items="${part2QuesList}" var="q"
										varStatus="loop">
										
										<div class="col-md-3" style="margin-top: 5px;">
										<p>Câu ${q.indexQ}</p>
										<input type="hidden" name="questionIdPart2" value="${q.id }">
										
											<div class="col-md-12">
											<input id="@op1_${q.id}" name="questionPart2_${q.id}"
													value="${q.op1}" type="radio">A</>
											</div>
											<div class="col-md-12">
											<input id="@op1_${q.id}" name="questionPart2_${q.id}"
													value="${q.op2}" type="radio">B</>
											</div>
											<div class="col-md-12">
											<input id="@op1_${q.id}" name="questionPart2_${q.id}"
													value="${q.op3}" type="radio">C</>
											</div>
										</div>
									</c:forEach>

									
								</div>


								
							</c:forEach>
							<hr />
							<div class="question">

									
									<button type="submit" class="btn btn-danger">Next</button>
								</div>

						</form>

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

</body>
</html>
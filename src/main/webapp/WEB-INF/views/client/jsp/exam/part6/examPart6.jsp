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

			<div class="row">
				<div class="col-md-12 row" style="margin-top: 3vh">


					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh; margin-left: 20px;">
						<form method="post" name="form"
							action="${pageContext.request.contextPath}/exam/part6/submit?examinationId=${idExam}&groupNum=${groupNum}">

							<div class="row" style="padding: 3vh">
								<p>${part6.content }</p>

							</div>


						

							<hr />


							<div class="question">


								<c:forEach items="${part6QuesList}" var="q" varStatus="loop">

									<div class="row ask" style="padding: 3vh; color: black;">
										<h5 style="text-align: left; color: black;">${q.order}.${q.content}</h5>


									</div>


									<div class="row answers"
										style="color: black; border-bottom: solid 1px #e5e5e5;">
										<input type="hidden" name="questionIdPart6" value="${q.id }">


										<div class="row col-md-12" style="margin: auto; color: black;">
											<input id="@op1_${q.id}" name="questionPart6_${q.id}"
												value="${q.op1}" type="radio">A. ${q.op1 }</>
										</div>

										<div class="row col-md-12" style="margin: auto; color: black;">
											<input id="@op2_${q.id}" name="questionPart6_${q.id}"
												value="${q.op2}" type="radio">B. ${q.op2 }</>
										</div>

										<div class="row col-md-12" style="margin: auto; color: black;">
											<input id="@op3_${q.id}" name="questionPart6_${q.id}"
												value="${q.op3}" type="radio">C. ${q.op3 }</>
										</div>

										<div class="row col-md-12" style="margin: auto; color: black;">
											<input id="@op4_${q.id}" name="questionPart6_${q.id}"
												value="${q.op4}" type="radio">D. ${q.op4 }</>
										</div>
									</div>

								</c:forEach>
								<input type="hidden" name="minute" /> <input type="hidden"
									name="second" />

								<button type="submit" class="btn btn-danger"
									style="margin-top: 10px;" onclick="sub();">Next</button>

							</div>

							<hr />

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

</body>
</html>
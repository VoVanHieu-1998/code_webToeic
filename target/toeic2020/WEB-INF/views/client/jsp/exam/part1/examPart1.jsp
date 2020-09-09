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

			<hr>

			<div class="row">
				<div class="col-md-12 row" style="margin-top: 3vh">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="container bg-light border"
							style="border-radius: 10px; padding: 3vh; margin-left: 20px;">

							<c:choose>
								<c:when test="${!isView}">
									<form method="post" name="form"
										action="${pageContext.request.contextPath}/exam/part1/submit?examinationId=${idExam}&part=1">
								</c:when>
								<c:otherwise>
									<form>
								</c:otherwise>

							</c:choose>
							<c:forEach items="${part1ss}" var="list" varStatus="status">

								<div class="row" style="padding: 3vh">
									<audio controls style="margin: auto">
										<source src="<c:url value="${list.mp3}" />">
									</audio>

								</div>

								<div class="row">
									<h6 style="margin: auto">A small text to lead the audio.</h6>
								</div>

								<hr />

								<div class="question">



									<c:forEach items="${part1QuesList}" var="q" varStatus="loop">

										<div class="row col-md-12"
											style="padding: 3vh; margin-top: 20px; color: black;">
											<p>Câu ${loop.index + 1 }</p>

											<img src="<c:url value="${q.img}" />" width="450px"
												height="400px" />
											<hr />
										</div>

										<div class="row answers"
											style="color: black; border-bottom: solid 1px #e5e5e5;">
											<input type="hidden" name="questionIdPart1" value="${q.id }">



											<div class="row col-md-12" id="@div1_${q.id}"
												style="margin: auto; color: black;">
												<input id="@op1_${q.id}" name="questionPart1_${q.id}"
													value="${q.op1}" type="radio">A
											</div>

											<div class="row col-md-12" id="@div2_${q.id}"
												style="margin: auto; color: black;">
												<input id="@op2_${q.id}" name="questionPart1_${q.id}"
													value="${q.op2}" type="radio">B</>
											</div>

											<div class="row col-md-12" id="@div3_${q.id}"
												style="margin: auto; color: black;">
												<input id="@op3_${q.id}" name="questionPart1_${q.id}"
													value="${q.op3}" type="radio">C</>
											</div>

											<div class="row col-md-12" id="@div4_${q.id}"
												style="margin: auto; color: black;">
												<input id="@op4_${q.id}" name="questionPart1_${q.id}"
													value="${q.op4}" type="radio">D</>
											</div>
										</div>

									</c:forEach>

									<input type="hidden" name="minute" /> <input type="hidden"
										name="second" />

									<c:choose>
										<c:when test="${!isView}">
											<button type="submit" class="btn btn-danger"
												style="margin-top: 10px;" onclick="sub();">Next</button>
										</c:when>
										<c:otherwise>
											<a href="<c:url value="/exam/finished" />">
												<button type="button" class="btn btn-danger"
													style="margin-top: 10px;">Quay lại</button>
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
							<hr />

							</form>

						</div>
					</div>
					<div class="col-md-2"></div>



				</div>


			</div>


		</div>

	</div>

	<script type="text/javascript">
		var min = document.getElementById("min").value;
		var sec = document.getElementById("sec").value;
		console.log("fsfsdf cccccccccccccccccccc" + time);

		function sub() {
			document.form.minute.value = min;
			document.form.second.value = sec;

			document.form.submit();

		};
	</script>


	<c:if test="${isView }">
		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$
										.ajax({
											type : "GET",
											contentType : "application/json",
											url : "/toeic2020/API/exam/part1/setStatusAnswer",

											success : function(res) {
												console.log(res);
												var span = "<span><i class=\"fa fa-check\" style=\"color: #37abf2;font-size:20px;\"></i></span>";
												var spanWrong = "<span><i class=\"fa fa-close\" style=\"color: red;font-size:20px;\"></i></span>";

												for (var i = 0; i < res.length; i++) {

													document
															.getElementById("@div1_"
																	+ res[i].id).innerHTML = "<input type=\"radio\">"
															+ "A. "
															+ res[i].op1
															+ "</input>";

													document
															.getElementById("@div2_"
																	+ res[i].id).innerHTML = "<input type=\"radio\">"
															+ "B. "
															+ res[i].op2
															+ "</input>";

													document
															.getElementById("@div3_"
																	+ res[i].id).innerHTML = "<input type=\"radio\">"
															+ "C. "
															+ res[i].op3
															+ "</input>";

													document
															.getElementById("@div4_"
																	+ res[i].id).innerHTML = "<input type=\"radio\">"
															+ "D. "
															+ res[i].op4
															+ "</input>";

													if (res[i].op_true != res[i].opSelected
															|| '') {
														if (res[i].op1 == res[i].op_true) {
															console
																	.log("dcm"
																			+ res[i].op_true);
															document
																	.getElementById("@div1_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "A. "
																	+ res[i].op1
																	+ "</input>"
																	+ span;

														}

														if (res[i].op2 == res[i].op_true) {

															document
																	.getElementById("@div2_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "B. "
																	+ res[i].op2
																	+ "</input>"
																	+ span;

														}
														if (res[i].op3 == res[i].op_true) {

															document
																	.getElementById("@div3_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "C. "
																	+ res[i].op3
																	+ "</input>"
																	+ span;

														}
														if (res[i].op4 == res[i].op_true) {

															document
																	.getElementById("@div4_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "D. "
																	+ res[i].op4
																	+ "</input>"
																	+ span;

														}

														if (res[i].opSelected) {
															if (res[i].op1 == res[i].opSelected) {

																document
																		.getElementById("@div1_"
																				+ res[i].id).innerHTML = "<input type=\"radio\">"
																		+ "A. "
																		+ res[i].op1
																		+ "</input>"
																		+ spanWrong;

															}
															;

															if (res[i].op2 == res[i].opSelected) {

																document
																		.getElementById("@div2_"
																				+ res[i].id).innerHTML = "<input type=\"radio\">"
																		+ "B. "
																		+ res[i].op2
																		+ "</input>"
																		+ spanWrong;

															}
															;

															if (res[i].op3 == res[i].opSelected) {

																document
																		.getElementById("@div3_"
																				+ res[i].id).innerHTML = "<input type=\"radio\">"
																		+ "C. "
																		+ res[i].op3
																		+ "</input>"
																		+ spanWrong;

															}
															;
															if (res[i].op4 == res[i].opSelected) {

																document
																		.getElementById("@div4_"
																				+ res[i].id).innerHTML = "<input type=\"radio\">"
																		+ "D. "
																		+ res[i].op4
																		+ "</input>"
																		+ spanWrong;

															}
															;

														}

													} else {

														if (res[i].op1 == res[i].op_true) {

															document
																	.getElementById("@div1_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "A. "
																	+ res[i].op1
																	+ "</input>"
																	+ span;
														}
														if (res[i].op2 == res[i].op_true) {

															document
																	.getElementById("@div2_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "B. "
																	+ res[i].op2
																	+ "</input>"
																	+ span;
														}
														if (res[i].op3 == res[i].op_true) {

															document
																	.getElementById("@div3_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "C. "
																	+ res[i].op3
																	+ "</input>"
																	+ span;
														}

														if (res[i].op4 == res[i].op_true) {

															document
																	.getElementById("@div4_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "D. "
																	+ res[i].op4
																	+ "</input>"
																	+ span;
														}

													}

												}
											}
										});

							});
		</script>

	</c:if>

</body>
</html>
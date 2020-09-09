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
			<div>
				<h4>Mark your answer on your answer sheet:</h4>
			</div>
			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">

						<c:choose>
							<c:when test="${!isView}">
								<form method="post" name="form"
									action="${pageContext.request.contextPath}/exam/part2/submit?examinationId=${idExam}&part=2">
							<input type="hidden" name="minute" /> <input type="hidden"
										name="second" />
							
							
							</c:when>
							<c:otherwise>
								<form>
							</c:otherwise>

						</c:choose>



						<c:forEach items="${part2s}" var="list" varStatus="status">

							<div class="row" style="padding: 3vh">
								<audio controls style="margin: auto">
									<source src="<c:url value="${list.mp3}" />">
								</audio>
							</div>


						</c:forEach>




						<hr />
						<div class="row col-md-12">




							<c:forEach items="${part2QuesList}" var="q" varStatus="loop">
							
									<div class="col-md-3" style="margin-top: 5px;">
										<p>Câu ${q.indexQ}</p>
										<input type="hidden" name="questionIdPart2" value="${q.id }">

										<div class="col-md-12" id="@div1_${q.id}">
											<input id="@op1_${q.id}" name="questionPart2_${q.id}"
												value="${q.op1}" type="radio">A</>
										</div>
										<div class="col-md-12" id="@div2_${q.id}">
											<input id="@op1_${q.id}" name="questionPart2_${q.id}"
												value="${q.op2}" type="radio">B</>
										</div>
										<div class="col-md-12" id="@div3_${q.id}">
											<input id="@op1_${q.id}" name="questionPart2_${q.id}"
												value="${q.op3}" type="radio">C</>
										</div>
									</div>
								
							</c:forEach>


						</div>



						<hr />
						<div class="question">


						

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

	<c:if test="${isView }">
		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$
										.ajax({
											type : "GET",
											contentType : "application/json",
											url : "/toeic2020/API/exam/part2/setStatusAnswer",

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

										
													
													
													if (res[i].op_true != res[i].opSelected
															|| '') {
														if (res[i].op1 == res[i].op_true) {
															console
																	.log("dcm"
																			+ res[i].op_true);
															document
																	.getElementById("@div1_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "A. "+res[i].op1
																	+ "</input>"
																	+ span;

														}

														if (res[i].op2 == res[i].op_true) {

															document
																	.getElementById("@div2_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "B. "+res[i].op2
																	+ "</input>"
																	+ span;

														}
														if (res[i].op3 == res[i].op_true) {

															document
																	.getElementById("@div3_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "C. "+res[i].op3
																	+ "</input>"
																	+ span;

														}

														if (res[i].opSelected) {
															if (res[i].op1 == res[i].opSelected) {

																document
																		.getElementById("@div1_"
																				+ res[i].id).innerHTML = "<input type=\"radio\">"
																		+ "A. "+res[i].op1
																		+ "</input>"
																		+ spanWrong;

															}
															;

															if (res[i].op2 == res[i].opSelected) {

																document
																		.getElementById("@div2_"
																				+ res[i].id).innerHTML = "<input type=\"radio\">"
																		+ "B. "+res[i].op2
																		+ "</input>"
																		+ spanWrong;

															}
															;

															if (res[i].op3 == res[i].opSelected) {

																document
																		.getElementById("@div3_"
																				+ res[i].id).innerHTML = "<input type=\"radio\">"
																		+ "C. "+res[i].op3
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
																	+ "A. "+res[i].op1
																	+ "</input>"
																	+ span;
														}
														if (res[i].op2 == res[i].op_true) {

															document
																	.getElementById("@div2_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "B. "+res[i].op2
																	+ "</input>"
																	+ span;
														}
														if (res[i].op3 == res[i].op_true) {

															document
																	.getElementById("@div3_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ "C. "+res[i].op3
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
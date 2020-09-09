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
						<form>

							<div class="row" style="padding: 3vh">
								<audio controls style="margin: auto">
									<source src="<c:url value="${part4.mp3}" />">
								</audio>

							</div>


							<div class="row">
								<h6 style="margin: auto">A small text to lead the audio.</h6>
							</div>


							<hr />


							<div class="question">

								<c:forEach items="${part4.part4Questions}" var="q" varStatus="loop">

									<div class="row ask" style="padding: 3vh; color: black;">
										<h5 style="text-align: left; color: black;">${q.order}.${q.content}</h5>


									</div>


									<div class="row answers"
										style="color: black; border-bottom: solid 1px #e5e5e5;">
										<input type="hidden" name="questionIdPart4" value="${q.id }">


										<div class="row col-md-12" id="@div1_${q.id}" style="margin: auto; color: black;">
											<input id="@op1_${q.id}" name="questionPart4_${q.id}"
												value="${q.op1}" type="radio">A. ${q.op1 }</>
										</div>

										<div class="row col-md-12" id="@div2_${q.id}" style="margin: auto; color: black;">
											<input id="@op2_${q.id}" name="questionPart4_${q.id}"
												value="${q.op2}" type="radio">B. ${q.op2 }</>
										</div>

										<div class="row col-md-12" id="@div3_${q.id}" style="margin: auto; color: black;">
											<input id="@op3_${q.id}" name="questionPart4_${q.id}"
												value="${q.op3}" type="radio">C. ${q.op3 }</>
										</div>

										<div class="row col-md-12" id="@div4_${q.id}" style="margin: auto; color: black;">
											<input id="@op4_${q.id}" name="questionPart4_${q.id}"
												value="${q.op4}" type="radio">D. ${q.op4 }</>
										</div>
									</div>

								</c:forEach>

								<a href="<c:url value="/exam/part4/detail/${groupNum}"/>"><button
										type="button" class="btn btn-danger" style="margin-top: 10px;">Next</button></a>
							</div>

							<hr />

						</form>

					</div>
				</div>



			</div>


		</div>


	</div>

<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$
										.ajax({
											type : "GET",
											contentType : "application/json",
											url : "/toeic2020/API/exam/part4/setStatusAnswer/"+${groupNum - 1},

											success : function(res) {
												console.log(res);
												var span = "<span><i class=\"fa fa-check\" style=\"color: #37abf2;font-size:20px;\"></i></span>";
												var spanWrong = "<span><i class=\"fa fa-close\" style=\"color: red;font-size:20px;\"></i></span>";

												for (var i = 0; i < res.length; i++) {

													
													
                                                    
                                                    	
                                                        
													if (res[i].op_true != res[i].opSelected) {
														if (document
																.getElementById("@op1_"
																		+ res[i].id).value == res[i].op_true) {
															console
																	.log("dcm"
																			+ res[i].op_true);
															document
																	.getElementById("@div1_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op1
																	+ "</input>"
																	+ span;

														}

														if (document
																.getElementById("@op2_"
																		+ res[i].id).value == res[i].op_true) {

															document
																	.getElementById("@div2_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op2
																	+ "</input>"
																	+ span;

														}
														
														if (document
																.getElementById("@op3_"
																		+ res[i].id).value == res[i].op_true) {

															document
																	.getElementById("@div3_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op3
																	+ "</input>"
																	+ span;

														}

														if (document
																.getElementById("@op4_"
																		+ res[i].id).value == res[i].op_true) {

															document
																	.getElementById("@div4_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op4
																	+ "</input>"
																	+ span;

														}
														;
														
															

															
															
														if (res[i].op1 == res[i].opSelected) {

															document
																	.getElementById("@div1_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op1
																	+ "</input>"
																	+ spanWrong;

														};	
														
														if (res[i].op2 == res[i].opSelected) {

															document
																	.getElementById("@div2_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op2
																	+ "</input>"
																	+ spanWrong;

														};	
														
														if (res[i].op3 == res[i].opSelected) {

															document
																	.getElementById("@div3_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op3
																	+ "</input>"
																	+ spanWrong;

														};
														
														if (res[i].op4 == res[i].opSelected) {

															document
																	.getElementById("@div4_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op4
																	+ "</input>"
																	+ spanWrong;

														};	
													
                                                    
														
														

													} else {

														if (document
																.getElementById("@op1_"
																		+ res[i].id).value == res[i].op_true) {

															document
																	.getElementById("@div1_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op1
																	+ "</input>"
																	+ span;
														}
														if (document
																.getElementById("@op2_"
																		+ res[i].id).value == res[i].op_true) {

															document
																	.getElementById("@div2_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op2
																	+ "</input>"
																	+ span;
														}
														if (document
																.getElementById("@op3_"
																		+ res[i].id).value == res[i].op_true) {

															document
																	.getElementById("@div3_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
																	+ res[i].op3
																	+ "</input>"
																	+ span;
														}
														if (document
																.getElementById("@op4_"
																		+ res[i].id).value == res[i].op_true) {

															document
																	.getElementById("@div4_"
																			+ res[i].id).innerHTML = "<input type=\"radio\">"
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


</body>
</html>
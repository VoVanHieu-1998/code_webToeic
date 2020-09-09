<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="col-md-12">
					<div>
						<h3 style="color: green; text-align: center;">Xem để tiến bộ
							nhanh bạn nhé</h3>

					</div>
					<h2 style="text-align: center;">
						<span style="color: #09c">${countTrue }</span>/10
					</h2>
					<div style="max-width: 340px; margin: 0 auto; font-size: 18px;">
						Trong số <span style="color: #ee473b;">${countFalse}</span> câu trả lời chưa
							đúng
						<ul style="list-style: inside; margin-left: 40px;">
							<li>Số câu sai: ${countFalse }</li>
							<li>Chưa trả lời: ${countNonSelected }</li>
						</ul>
					</div>
				</div>

			</div>
			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">

					<c:forEach items="${part5Questions}" var="q" varStatus="loop">
						<div class="container bg-light border"
							style="border-radius: 10px; padding: 3vh; margin-top: 15px;">


							<div id="explan" style="color: black;"></div>


							<hr />



							<div class="question">


								<div class="row ask" style="padding: 3vh">

									<h5>Giải thích</h5>
									<div id="explantation" style="margin-top: 10px;">
										${q.part5QuestionExplantaion.explantation }</div>

								</div>

								<div class="row ask" style="padding: 3vh">
									<h5 id="@qesstionContent_${q.id}" style="text-align: left;">${q.order}.${q.content}

									</h5>
									<br>
									<h6>(${q.part5QuestionExplantaion.meanContent})</h6>
									<br> <input type="hidden" name="@anwser_${q.id}"
										id="@input_${q.id}" /> <input id="qessId" type="hidden"
										name="qessId" value="${q.id}"> <input type="hidden"
										name="" id="@btnClick_${q.id}" />

								</div>

								<div class="row answers" id="showCheck">


									<div class="row col-md-12" style="margin: auto;">
										<button id="@op1_${q.id}" name="${q.op1}" class="col btn-de"
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											type="button">
											A. ${q.op1} <br>
											<p>${q.part5QuestionExplantaion.mean_op1 }</p>
										</button>


										<button id="@op2_${q.id}" name="${q.op2}" class="col btn-de"
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											type="button">
											B. ${q.op2} <br>
											<p>${q.part5QuestionExplantaion.mean_op2 }</p>
										</button>

									</div>



									<br>

									<div class="row col-md-12" style="margin: auto;">
										<button id="@op3_${q.id}" name="${q.op3}" class="col btn-de"
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											type="button">
											C. ${q.op3} <br>
											<p>${q.part5QuestionExplantaion.mean_op3 }</p>
										</button>



										<button id="@op4_${q.id}" name="${q.op4}" class="col btn-de"
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											type="button">
											D. ${q.op4} <br>
											<p>${q.part5QuestionExplantaion.mean_op4 }</p>
										</button>
									</div>


								</div>

							</div>

							<hr />



						</div>
					</c:forEach>


					<a href="<c:url value="/practice/part5/ "/>"><button id="btnCheck" class="btn btn-danger">Quay lại</button></a>

				</div>



			</div>


		</div>

	</div>
	
	<script
		src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$.ajax({
										type : "GET",
										contentType : "application/json",
										url : "/toeic2020/API/practice/part5/setStatusAnswer",

										success : function(res) {
											console.log(res);

											for (var i = 0; i < res.length; i++) {

												//disable cac btn
												document.getElementById("@op1_"
														+ res[i].id).disabled = true;
												document.getElementById("@op2_"
														+ res[i].id).disabled = true;
												document.getElementById("@op3_"
														+ res[i].id).disabled = true;
												document.getElementById("@op4_"
														+ res[i].id).disabled = true;

												//	console.log(document.getElementById("@input_"+x[i].value).value);

												if (res[i].isTrue == 0) {

													// neu content cua op1 == vs op_true, thi hien thi mau xanh
													//@op1_8,@op1_9,@op1_10
													if (document
															.getElementById("@op1_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op1_"
																		+ res[i].id).style.color = "green";
													}
													if (document
															.getElementById("@op2_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op2_"
																		+ res[i].id).style.color = "green";
													}
													if (document
															.getElementById("@op3_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op3_"
																		+ res[i].id).style.color = "green";
													}
													if (document
															.getElementById("@op4_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op4_"
																		+ res[i].id).style.color = "green";
													}

													// neu content cua op1 == vs op_true, thi hien thi mau xanh
													//@op1_8,@op1_9,@op1_10
													if (document
															.getElementById("@op1_"
																	+ res[i].id).name == res[i].opSelected) {
														document
																.getElementById("@op1_"
																		+ res[i].id).style.color = "red";
													}
													if (document
															.getElementById("@op2_"
																	+ res[i].id).name == res[i].opSelected) {
														document
																.getElementById("@op2_"
																		+ res[i].id).style.color = "red";
													}
													if (document
															.getElementById("@op3_"
																	+ res[i].id).name == res[i].opSelected) {
														document
																.getElementById("@op3_"
																		+ res[i].id).style.color = "red";
													}
													if (document
															.getElementById("@op4_"
																	+ res[i].id).name == res[i].opSelected) {
														document
																.getElementById("@op4_"
																		+ res[i].id).style.color = "red";
													}
												} else {
													if (document
															.getElementById("@op1_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op1_"
																		+ res[i].id).style.color = "green";
													}
													if (document
															.getElementById("@op2_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op2_"
																		+ res[i].id).style.color = "green";
													}
													if (document
															.getElementById("@op3_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op3_"
																		+ res[i].id).style.color = "green";
													}
													if (document
															.getElementById("@op4_"
																	+ res[i].id).name == res[i].op_true) {
														document
																.getElementById("@op4_"
																		+ res[i].id).style.color = "green";
													}
												}

											}
										}
									});

						});
	</script>
</body>
</html>
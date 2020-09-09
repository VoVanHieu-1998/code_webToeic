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
				<div class="col-md-9">
					<div>
					<p id="time_down"></p>
					</div>
				</div>

			</div>
			<hr>

			<div class="row">
				<div class="col-md-12 row" style="margin-top: 3vh">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="container bg-light border"
							style="border-radius: 10px; padding: 3vh; margin-left: 20px;">
							<form method="post"
								action="${pageContext.request.contextPath}/exam/part1/submit?examinationId=${idExam}&part=1">

								<c:forEach items="${part1s}" var="list" varStatus="status">

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

										<c:forEach items="${part1QuesList}" var="q"
											varStatus="loop">

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

												<div class="row col-md-12"
													style="margin: auto; color: black;">
													<input id="@op1_${q.id}" name="questionPart1_${q.id}"
														value="${q.op1}" type="radio">A</>
												</div>

												<div class="row col-md-12"
													style="margin: auto; color: black;">
													<input id="@op2_${q.id}" name="questionPart1_${q.id}"
														value="${q.op2}" type="radio">B</>
												</div>

												<div class="row col-md-12"
													style="margin: auto; color: black;">
													<input id="@op3_${q.id}" name="questionPart1_${q.id}"
														value="${q.op3}" type="radio">C</>
												</div>

												<div class="row col-md-12"
														style="margin: auto; color: black;">
													<input id="@op4_${q.id}" name="questionPart1_${q.id}"
														value="${q.op4}" type="radio">D</>
												</div>
											</div>

										</c:forEach>
										
										<button type="submit" class="btn btn-danger" style="margin-top: 10px;">Next</button>
									</div>
								</c:forEach>
								<hr />

							</form>

						</div>
					</div>



				</div>


			</div>


		</div>

	</div>

<script type="text/javascript">
//Set the date we're counting down to
var countDownDate = new Date("Jan 5, 2021 15:37:25").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("time_down").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("time_down").innerHTML = "EXPIRED";
  }
}, 1000);

</script>
	

</body>
</html>
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
						<h3>Part I: Picture Description</h3>

					</div>
				</div>


			</div>
			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">


						<div class="row" style="padding: 3vh">

							<p>Directions: For each question, you will see a picture and
								you will hear four short statements. The statements will be
								spoken just one time. They will not be printed in your test book
								so you must listen carefully to understand what the speaker
								says. When you hear the four statements, look at the picture and
								choose the statement that best describes what you see in the
								picture. Choose the best answer A, B, C or D</p>

						</div>

						<div class="row">

							<img
								src="<c:url value="/resources/Client/images/part1-intro.png" />"
								width="450px" height="400px" />

						</div>

						<hr />

						<div class="question">

							<div class="row col-md-12"
								style="padding: 3vh; margin-top: 20px; color: black;">

								<audio controls style="margin: auto">
									<source
										src="<c:url value="/resources/Client/mp3/part_1_intro.mp3" />">
								</audio>

								<hr />


							</div>
							<div class="row col-md-12"
								style="padding: 3vh; margin-top: 20px; color: black;">

								<p>EXAMPLE:</p>
								<br>
								<p>Now listen to the four statements.</p>
								<br>
								<p>Statement (D) best describes what you see in the picture.
									Therefore, you should choose answer (D).</p>

								<hr />


							</div>

						
							<div class="row answers"
								style="color: black; border-bottom: solid 1px #e5e5e5;">

								<div class="row col-md-12" style="margin: auto; color: black;">
									<input name="question_1" value="" type="radio">A.He is
									on the phone</>
								</div>

								<div class="row col-md-12" style="margin: auto; color: black;">
									<input id="@op2_${q.id}" name="question_1" value=""
										type="radio">B.She is driving the car</>
								</div>

								<div class="row col-md-12" style="margin: auto; color: black;">
									<input id="@op3_${q.id}" name="question_1" value=""
										type="radio">C.She is typing on the computer</>
								</div>

								<div class="row col-md-12"
									style="margin: auto; color: black; font-weight: bold;">
									<input id="@op4_${q.id}" name="question_1" value=""
										type="radio">D. He is sitting next to her</>
								</div>

							</div>
                          
								<form class="form" name="form" action="${pageContext.request.contextPath}/exam/part-1" method="post">
                            <input type="hidden" name="minute"/> <input type="hidden" name="second" />
								<button type="submit"
									class="btn btn-danger" onclick="sub();">Start</button>
                            </form>	
                           
                            

							
						</div>

						<hr />


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
    	 
    	
    	 document.questionForm.submit(); 
    	 
	
	};
	</script>	
	
	<script
		src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.js" />"></script>
		
	<script type="text/javascript">

	</script>	
</body>
</html>
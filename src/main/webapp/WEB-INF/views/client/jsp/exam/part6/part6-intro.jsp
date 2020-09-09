
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
						<h3>Part VI: Short Talks</h3>

					</div>
				</div>


			</div>
			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">


						<div class="row" style="padding: 3vh">

							<p>Directions: You will hear some talks given by a single
								speaker. You will be asked to answer three questions about what
								the speaker says in each talk. Select the best response to each
								question and mark the letter (A), (B), (C) or (D) on your answer
								sheet. The talks will not be printed in your test book and will
								be spoken only one time.</p>

						</div>

				
                    <form class="form" name="form" action="${pageContext.request.contextPath}/exam/part-6/0" method="post">
                            <input type="hidden" name="minute"/> <input type="hidden" name="second" />
								<button type="submit"
									class="btn btn-danger" onclick="sub();">Start</button>
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



	<script
		src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.js" />"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/Client/Css/style.css" />" rel="stylesheet">

<link
	href="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.css" />"
	rel="stylesheet">

</head>
<body id="body-login">
	<c:url value="dangnhap/" var="dangnhap" />
	<div id="body-flex-login">
		<div id="container-login">

			<div id="container-login-left">
				

			</div>

			<div id="container-login-right">

				<div class="header-login" id="header-right-login">

					<span class="actived" id="dangnhap">Đăng nhập</span> <span>/</span>
					<span id="dangki"> Đăng kí</span>
				</div>

				<div id="container-center-right">

					<form:form class="validate"  modelAttribute="loginForm" servletRelativeAction="/processLogin"
						method="POST" onsubmit="return(validate(event));">
						<div class="container-login-form" id="container-center-right ">
							<form:input path="username" name="username" class="text-in input-icon-email email"
								id="username" type="text" placeholder="Tài khoản"
								required="required"/>
								 <br>
						    <form:input path="password" name="password"
								class="text-in input-icon-password" type="password"
								id="password" placeholder="Mật khẩu" required="required"/>
								
							<br> <span style="color: red;" id="message"></span> <input
								type="submit" class="primary-button" id="sub" value="Đăng nhập">

						</div>
					</form:form>
					<div class="container-signup-form" id="container-center-right">





						<form:form class="validate" onsubmit="return(validate(event));"
							action="" method="post">

							<input name="email" class="text-in input-icon-email"
								id="username1" type="text" placeholder="Tài khoản"
								required="required">
							<br>

							<input name="matkhau" class="text-in input-icon-password"
								type="password" id="password1" placeholder="Mật khẩu"
								required="required">
							<br>

							<input name="nhaplaimatkhau" class="text-in input-icon-password"
								type="password" id="password2" placeholder="Nhập lại mật khẩu"
								required="required">
							<br>

							<button class="primary-button" type="submit">Đăng kí</button>
						</form:form>


					</div>

					<span style="color: black;" id="message"></span> <span
						style="color: black;"> ${ktdangki}</span>



				</div>

				<div id="icon-login-right">
					<img alt="icon-oval"
						src="<c:url value="/resources/Client/images/search.png"/>"> <img
						alt="icon-oval"
						src="<c:url value="/resources/Client/images/facebook.png"/>">
				</div>

			</div>
		</div>

	</div>


	<script
		src="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.js" />"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="<c:url value="/resources/Client/JS/validator.js" />"></script>
	<script src="<c:url value="/resources/Client/JS/custom1.js" />"></script>


</body>

</html>
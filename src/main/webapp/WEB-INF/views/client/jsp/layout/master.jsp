<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link
	href="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.css" />"
	rel="stylesheet">

<link
	href="<c:url value="/resources/Client/plugins/font-awesome-4.7.0/css/font-awesome.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Client/plugins/OwlCarousel2-2.2.1/owl.carousel.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Client/plugins/OwlCarousel2-2.2.1/owl.theme.default.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Client/styles/plugins/OwlCarousel2-2.2.1/animate.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/Client/styles/main_styles.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/Client/styles/styles/responsive.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/Client/Css/style.css" />"
	rel="stylesheet">	


</head>
<body>

	<div class="super_container">

		<!-- Header -->
		<tiles:insertAttribute name="header"></tiles:insertAttribute>

		<!-- search -->
		<tiles:insertAttribute name="search"></tiles:insertAttribute>



		<!-- body -->
		<tiles:insertAttribute name="body"></tiles:insertAttribute>

		<!-- /body -->



		<!-- Footer -->
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>

	</div>
  

	<script src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>
			 
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
	<script src="<c:url value="/resources/Client/styles/bootstrap4/popper.js" />"></script>
	<script
		src="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.js" />"></script>
	<script
		src="<c:url value="/resources/Client/plugins/greensock/TweenMax.min.js" />"></script>
	<script
		src="<c:url value="/resources/Client/plugins/greensock/TimelineMax.min.js" />"></script>
	<script
		src="<c:url value="/resources/Client/plugins/scrollmagic/ScrollMagic.min.js" />"></script>
	<script
		src="<c:url value="/resources/Client/plugins/greensock/animation.gsap.min.js" />"></script>

	<script
		src="<c:url value="/resources/Client/plugins/greensock/ScrollToPlugin.min.js" />"></script>

	<script
		src="<c:url value="/resources/Client/plugins/OwlCarousel2-2.2.1/owl.carousel.jss" />"></script>

	<script src="<c:url value="/resources/Client/plugins/easing/easing.js" />"></script>

	<script
		src="<c:url value="/resources/Client/plugins/parallax-js-master/parallax.min.js" />"></script>
	<script src="<c:url value="/resources/Client/JS/custom.js" />"></script>


</body>
</html>
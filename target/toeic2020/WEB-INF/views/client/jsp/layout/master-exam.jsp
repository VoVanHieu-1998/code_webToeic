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
<link href="<c:url value="/resources/Client/styles/main_styles.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Client/styles/styles/responsive.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/Client/Css/style.css" />"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




</head>
<body>

	<div class="super_container">

		<!-- Header -->
		<tiles:insertAttribute name="header"></tiles:insertAttribute>




		<!-- body -->
		<tiles:insertAttribute name="body"></tiles:insertAttribute>

		<!-- /body -->


	</div>

	<script
		src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>

	<script
		src="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.js" />"></script>
<script type="text/javascript" src="https://toeic24.vn/js/jquery.countdown.min.js"></script>


	
	
	
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gentelella Alela! |</title>
<style>
.errorForm {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}
</style>

<!-- Bootstrap -->
<link
	href="<c:url value="/resources/Admin/vendors/bootstrap/dist/css/bootstrap.min.css" />"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="<c:url value="/resources/Admin/vendors/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<c:url value="/resources/Admin/vendors/nprogress/nprogress.css" />"
	rel="stylesheet">
<!-- jQuery custom content scroller -->
<link
	href="<c:url value="/resources/Admin/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" />"
	rel="stylesheet" />

<!-- Custom Theme Style -->
<link href="<c:url value="/resources/Admin/build/css/custom.min.css" />"
	rel="stylesheet">

<link
	href="<c:url value="/resources/Admin/vendors/pnotify/dist/pnotify.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Admin/vendors/pnotify/dist/pnotify.buttons.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Admin/vendors/pnotify/dist/pnotify.nonblock.css"/>"
	rel="stylesheet">
<!-- bootstrap-datetimepicker -->

<link
	href="<c:url value="/resources/Admin/vendors/bootstrap-daterangepicker/daterangepicker.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/Admin/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css"/>"
	rel="stylesheet">
<script
	src="<c:url value="/resources/Admin/vendors/jquery/dist/jquery.min.js" />"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>

</head>

<body class="nav-md footer_fixed">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>Gentelella Alela!</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="<c:url value="/resources/Admin/images/img.jpg"/>"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>${userInfo.name}</h2>



						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="login.html"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>

			<!-- top navigation -->
			<tiles:insertAttribute name="top-nav"></tiles:insertAttribute>
			<!-- /top navigation -->

			<!-- page content -->
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
			<!-- /page content -->

			<!-- footer content -->
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>

			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->

	<!-- Bootstrap -->
	<script
		src="<c:url value="/resources/Admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js" />"></script>
	<!-- FastClick -->
	<script
		src="<c:url value="/resources/Admin/vendors/fastclick/lib/fastclick.js" />"></script>
	<!-- NProgress -->
	<script
		src="<c:url value="/resources/Admin/vendors/nprogress/nprogress.js" />"></script>
	<!-- jQuery custom content scroller -->
	<script
		src="<c:url value="/resources/Admin/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js" />"></script>
	<!-- Custom Theme Scripts -->
	<script src="<c:url value="/resources/Admin/build/js/custom.min.js" />"></script>

	<!-- PNotify -->
	<script
		src="<c:url value="/resources/Admin/vendors/pnotify/dist/pnotify.js"/>"></script>
	<script
		src="<c:url value="/resources/Admin/vendors/pnotify/dist/pnotify.buttons.js"/>"></script>
	<script
		src="<c:url value="/resources/Admin/vendors/pnotify/dist/pnotify.nonblock.js"/>"></script>

	<!-- bootstrap-datetimepicker -->
	<!-- bootstrap-daterangepicker -->
	<script
		src="<c:url value="/resources/Admin/vendors/moment/min/moment.min.js"/>"></script>
	<script
		src="<c:url value="/resources/Admin/vendors/bootstrap-daterangepicker/daterangepicker.js"/>"></script>

	<script
		src="<c:url value="/resources/Admin/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"/>"></script>

	<!-- CKEditor -->
<script
		src="<c:url value="/resources/Admin/ckeditor/ckeditor.js"/>"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header">

	<!-- Top Bar -->
	<div class="top_bar">
		<div class="top_bar_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div
							class="top_bar_content d-flex flex-row align-items-center justify-content-start">
							<div class="top_bar_login ml-auto">

								<c:choose>
									<c:when test="${user != null}">
										<span>Xin chào , ${user.name }</span>
									</c:when>
									<c:otherwise>
										<div class="login_button">
											<a href="<c:url value="/login"/>">Đăng nhập</a>
										</div>
									</c:otherwise>
								</c:choose>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Header Content -->
	<div class="header_container">
		<div class="container">
			<div class="row">
				<div class="col">
					<div
						class="header_content d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<a href="#">
								<div class="logo_text">
									Toeic<span>là</span>Dễ
								</div>
							</a>
						</div>
						<nav class="main_nav_contaner ml-auto">
							<ul class="main_nav">
								<li><a href='<c:url value="/"></c:url>'>Trang chủ</a></li>
								<li><a href='<c:url value="/practice"></c:url>'>Luyện
										tập</a></li>
								<li><a href='<c:url value="/exam/part-1-intro"></c:url>'>Thi</a></li>
								<li class="active"><a href="#">Q&A</a></li>

							</ul>

							<!-- Hamburger -->


							<div class="hamburger menu_mm">
								<i class="fa fa-bars menu_mm" aria-hidden="true"></i>
							</div>
						</nav>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Header Search Panel -->
	<div class="header_search_container">
		<div class="container">
			<div class="row">
				<div class="col">
					<div
						class="header_search_content d-flex flex-row align-items-center justify-content-end">
						<form action="#" class="header_search_form">
							<input type="search" class="search_input" placeholder="Search"
								required="required">
							<button
								class="header_search_button d-flex flex-column align-items-center justify-content-center">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</header>

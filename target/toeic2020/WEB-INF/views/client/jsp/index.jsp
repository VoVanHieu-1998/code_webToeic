<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="<c:url value="/resources/Client/Css/style.css" />" rel="stylesheet">
</head>
<body>

	<div class="home">
		<div class="home_slider_container">

			<!-- Home Slider -->
			<div class="">

				<!-- Home Slider Item -->
				<div class="">
					<div class="home_slider_background slider1">
					<img src="<c:url value="/resources/Client/images/books.jpg"/>" alt="">
					</div>
					<div class="home_slider_content">
						<div class="container"></div>
					</div>
				</div>

				
			</div>
		</div>

		<!-- Home Slider Nav -->

		<div class="home_slider_nav home_slider_prev">
			<i class="fa fa-angle-left" aria-hidden="true"></i>
		</div>
		<div class="home_slider_nav home_slider_next">
			<i class="fa fa-angle-right" aria-hidden="true"></i>
		</div>
	</div>

	<!-- Features -->

	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<h2 class="section_title">Chào mừng bạn đến với chúng tôi</h2>
						<div class="section_subtitle">
							<h4>Chúng ta càng học, chúng ta càng phát triển!</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="row features_row">

				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<h3 class="feature_title">Chúng tôi cập nhật đề TOEIC mới liên tục</h3>
						
						<div class="feature_icon">
							<img src="<c:url value="/resources/Client/images/icon_1.png"/>" alt="">
						</div>
						
						<div class="feature_text">
							<p>
							Các bộ đề TOEIC quốc tế, ETS... luôn được cập nhật liên tục và thường xuyên.
							</p>
						</div>
					</div>
				</div>

				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<h3 class="feature_title">Nâng cao kĩ năng làm bài thi TOEIC</h3>
						<div class="feature_icon">
							<img src="<c:url value="/resources/Client/images/icon_2.png"/>" alt="">
						</div>
						
						<div class="feature_text">
							<p>
							Rèn luyện 2 kỹ năng TOEIC Reading và TOEIC Listening nhanh nhất.
							</p>
						</div>
					</div>
				</div>

				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<h3 class="feature_title">Đề thi TOEIC có đáp án và giải thích</h3>
						<div class="feature_icon">
							<img src="<c:url value="/resources/Client/images/icon_4.png"/>" alt="">
						</div>
					
						<div class="feature_text">
							<p>
							Sau khi làm bài bạn có thể kiểm tra đáp án, giải thích chi tiết từng đáp án.
							</p>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>
<script type="text/javascript">
<script type="text/javascript">
$(function() {

	var fiveSeconds = new Date().getTime() + 7200000;
	var time = document.getElementById("time-countdown").value;

	$('.countdown')
			.countdown(time)
			.on('update.countdown', function(event) {
				var $this = $(this);
				document.getElementById("time-countdown").value = event.timeStamp;
				console.log("fsdfsdfsdfs"+document.getElementById("time-countdown").value);
				$this.html(event.strftime('%H:%M:%S'));
			})
			.on(
					'finish.countdown',
					function() {
						swal(
								{
									text : "Thời gian làm bài đã hết, xem kết quả thi...",
									icon : "warning",
									title : "Thông báo!",
									button : "OK",
									closeOnClickOutside : false
								}

						)
								.then(
										function() {
											window.location
													.replace("http://localhost:8080/toeic2020/exam/finished");
										});
					});



});
</script>

</script>


</body>
</html>
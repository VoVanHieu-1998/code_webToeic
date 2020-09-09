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

	<!-- Features -->

	<div class="features row" style="padding-top: 1vh">
		<div class="container">

			<div class="row features_row">

				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<div class="feature_icon">
							<img src="Images/icon_2.png" alt="">
						</div>
						<h3 class="feature_title">Phần 1</h3>
						<div class="feature_text">
							<p class="text-primary">Mô tả hình ảnh</p>
							<p>Luyện nghe và mẹo thi Topic Past 1</p>
							<a href='<c:url value="/practice/part1"></c:url>'>
								<button type="button" class="btn btn-warning">Luyện</button>
							</a>

						</div>
					</div>
				</div>
				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<div class="feature_icon">
							<img src="Images/icon_3.png" alt="">
						</div>
						<h3 class="feature_title">Phần 2</h3>
						<div class="feature_text">
							<p class="text-primary">Hỏi và Đáp</p>
							<p>Luyện nghe và mẹo thi Topic Past 2</p>
						<a href='<c:url value="/practice/part2"></c:url>'>
								<button type="button" class="btn btn-warning">Luyện</button>
							</a>

						</div>
					</div>
				</div>
				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<div class="feature_icon">
							<img src="Images/icon_1.png" alt="">
						</div>
						<h3 class="feature_title">Phần 3</h3>
						<div class="feature_text">
							<p class="text-primary">Đoạn hội thoại</p>
							<p>Luyện nghe và mẹo thi Topic Past 3</p>
							<a href='<c:url value="/practice/part3"></c:url>'>
								<button type="button" class="btn btn-warning">Luyện</button>
							</a>


						</div>
					</div>
				</div>
				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<div class="feature_icon">
							<img src="Images/icon_5.png" alt="">
						</div>
						<h3 class="feature_title">Phần 4</h3>
						<div class="feature_text">
							<p class="text-primary">Bài nói chuyện ngắn</p>
							<p>Luyện nghe và mẹo thi Topic Past 4</p>
							<a href='<c:url value="/practice/part4"></c:url>'>
								<button type="button" class="btn btn-warning">Luyện</button>
							</a>

						</div>
					</div>
				</div>

				<!-- Features Item -->
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<div class="feature_icon">
							<img src="Images/icon_6.png" alt="">
						</div>
						<h3 class="feature_title">Phần 5</h3>
						<div class="feature_text">
							<p class="text-primary">Câu không hoàn chỉnh</p>
							<p>
								chiến lược làm phần topic 5<br>Mẹo thi topic Part 5 gồm
								(từvựng,ngữ pháp và từ loại)
							</p>
							<a href='<c:url value="/practice/part5"></c:url>'>
								<button type="button" class="btn btn-warning">Luyện</button>
							</a>

						</div>
					</div>
				</div>
				
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<div class="feature_icon">
							<img src="Images/icon_6.png" alt="">
						</div>
						<h3 class="feature_title">Từ vựng</h3>
						<div class="feature_text">
							<p class="text-primary">Ôn tập từ vựng</p>
							
							<a href='<c:url value="/vocabulary/list"/>'>
								<button type="button" class="btn btn-warning">luyện</button>
							</a>

						</div>
					</div>
				</div>
				
				<div class="col-lg-4 feature_col">
					<div class="feature text-center trans_400">
						<div class="feature_icon">
							<img src="Images/icon_6.png" alt="">
						</div>
						<h3 class="feature_title">Ngữ pháp</h3>
						<div class="feature_text">
							<p class="text-primary">Ôn tập ngữ pháp</p>
							
							<a href='<c:url value="/grammar-guideline"/>'>
								<button type="button" class="btn btn-warning">Ôn tập</button>
							</a>

						</div>
					</div>
				</div>





			</div>
		</div>
	</div>


</body>
</html>
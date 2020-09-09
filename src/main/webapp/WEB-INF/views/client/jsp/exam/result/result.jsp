<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900'
	rel='stylesheet' type='text/css'>

<link
	href="<c:url value="/resources/Client/styles/bootstrap4/bootstrap.min.css" />"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://toeic24.vn/css/md-font.css">

<link
	href="<c:url value="/resources/Client/styles/exam/exam.css" />"
	rel="stylesheet">	
	
<title>Kết quả thi</title>
</head>
<body>
<body id="page-top">
	<div id="page-wrap">

		<section id="quizz-intro-section"
			class="quizz-intro-section learn-section">
			<div class="container">
				<div class="question-content-wrap">
					<div class="row">
						<div class="col-md-12">
							<div class="question-content">
								<h4 class="sm">Đề số ${exam.id} - SUCCEED</h4>

								<i>Cảm ơn bạn đã thi thử trên TOEICISEAZY.COM</i><br>
								<div class="row" style="margin: 20px 0px 20px 0px">
									<style>
									@media all and (max-width: 426px) {
										.myiframe {
											min-height: 440px !important;
										}
									}
									</style>

								</div>
								<table class="table-question" style="border: none">
									<thead>
									<tr>
											<th colspan="2" style="color: #D93425">Listening: 0 /100
											</th>
											<th class="right-answer" style="color: #D93425">Điểm
												nghe: ${totalScoreReading }</th>
										</tr>
									</thead>
									<tbody>
										
										<tr>
											<td><b>1 - 10</b></td>
											<td class="td-quest">Part I: Picture Description <b>(${countCorrectAnswerPart1}
													/10)</b></td>
												<td class="td-right-answer"><a
												href="<c:url value="/exam/part1/detail/" />">Chi tiết</a></td>
										</tr>
										
										<tr>
											<td><b>11 - 40</b></td>
											<td class="td-quest">Part II: Question - Response <b>(${countCorrectAnswerPart2}
													/30)</b></td>
												<td class="td-right-answer"><a
												href="<c:url value="/exam/part2/detail/" />">Chi tiết</a></td>
										</tr>
										
										<tr>
											<td><b>41 - 70</b></td>
											<td class="td-quest">Part III: Short Conversations <b>(${countCorrectAnswerPart3 }
													/30)</b></td>
											<td class="td-right-answer"><a
												href="<c:url value="/exam/part3/detail/0" />">Chi tiết</a></td>
										</tr>
										<tr>
											<td><b>71 - 100</b></td>
											<td class="td-quest">Part IV: Short Talks <b>(0 /30)</b></td>
										<td class="td-right-answer"><a
												href="<c:url value="/exam/part4/detail/0" />">Chi tiết</a></td>
										</tr>
									</tbody>
								</table>

								<table class="table-question" style="border: none">
									<thead>
										<tr>
											<th colspan="2" style="color: #D93425">Reading: 0 /100</th>
											<th class="right-answer" style="color: #D93425">Điểm
												đọc: ${totalScoreReading }</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><b>101 - 140</b></td>
											<td class="td-quest">Part V: Incomplete Sentences <b>(${countCorrectAnswerPart5 }
													/40)</b></td>
											<td class="td-right-answer"><a
												href="<c:url value="/exam/part5/detail" />">Chi tiết</a></td>
										</tr>
										<tr>
											<td><b>141 - 152</b></td>
											<td class="td-quest">Part VI: Text Completion <b>(0
													/12)</b></td>
											<td class="td-right-answer"><a
												href="<c:url value="/exam/part6/detail/0" />">Chi tiết</a></td>
										</tr>
										<tr>
											<td><b>153 - 200</b></td>
											<td class="td-quest">Part VII: Reading Comprehension <b>(${countCorrectAnswerPart7 }
													/48)</b></td>
											<td class="td-right-answer"><a
												href="<c:url value="/exam/part7/detail/0" />">Chi tiết</a></td>
										</tr>
									</tbody>
								</table>
								<div class="text-center">
									<a href="<c:url value="/exam/exit"/> "
										class="mc-btn btn-style-6">Exit</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
</body>

</body>
</html>
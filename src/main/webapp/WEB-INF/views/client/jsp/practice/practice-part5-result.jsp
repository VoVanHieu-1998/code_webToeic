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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div>
					<h3>Kết quả phần part 5</h3>
					<div>
					<p>${countTrue }/${total }</p>
					</div>
				</div>
				<div>
				<a href="<c:url value="/practice/part5/review"/>"><button style="text-align: center;">Xem lại</button><a>
				</div>
			</div>


		</div>
	</div>

</body>
</html>
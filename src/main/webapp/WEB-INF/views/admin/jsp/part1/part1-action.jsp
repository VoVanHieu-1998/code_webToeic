<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h2>${titlePage}</h2>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">

					<div class="x_content">
						<br />

						<form:form modelAttribute="part1"
							cssClass="form-label-left input_mask"
							servletRelativeAction="/admin/part1/add" method="POST"
							enctype="multipart/form-data">
							<form:hidden path="id" />
							<form:hidden path="activeFlag" />
							<form:hidden path="createDate" />


							<c:if test="${viewOnly }">
								<c:if test="${part1 != null }">
									<div class="row" style="padding: 3vh">
									
										<audio controls style="margin: auto">
											<source src="<c:url value="${part1.mp3 }" />">
										</audio>

									</div>
								</c:if>


								<c:forEach items="${part1Questions}" var="p1" varStatus="loop">


									<div class="col-md-12 col-sm-12 col-xs-12 has-feedback" style="text-align: center;">

										<img src="<c:url value="${p1.img}" />" width="100px"
											height="100px" />

										<p>${p1.op1}</p>
										<br>
										<p>${p1.op2}</p>
										<br>
										<p>${p1.op3}</p>
										<br>
										<p>${p1.op4}</p>
										<br>
										<p>${p1.op_true}</p>

									</div>
								</c:forEach>
							</c:if>

							<div class="ln_solid"></div>

							<div class="form-group row">
								<div class="col-md-12 col-sm-12  offset-md-3">
									<button type="button" class="btn btn-primary"
										onclick="cancel();">Cancel</button>
									<c:if test="${!viewOnly}">
										<button class="btn btn-primary" type="reset">Reset</button>
										<button type="submit" class="btn btn-success">Submit</button>
									</c:if>

								</div>
							</div>

						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#product-infolistId').addClass('current-page').siblings()
						.removeClass('current-page');
				var parent = $('#product-infolistId').parents('li');
				parent.addClass('active').siblings().removeClass('active');
				$('#product-infolistId').parents().show();
			})

	function cancel() {
		window.location.href = '<c:url value="/admin/part1/list" />'
	}
</script>
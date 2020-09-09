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

						<form:form modelAttribute="modelForm"
							cssClass="form-label-left input_mask"
							servletRelativeAction="/admin/exam/add" method="POST"
							enctype="multipart/form-data">
							<form:hidden path="id" />
							<form:hidden path="activeFlag" />
							<form:hidden path="createDate" />
							<form:hidden path="img" />



							

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="code">Title <span class="required">*</span>
								</label>


								<div class="col-md-12 col-sm-12 col-xs-12 has-feedback">
									<form:input path="tittle"
										cssClass="form-control has-feedback-left"
										disabled="${viewOnly}" />

									<div class="has-error" style="color: red;">
										<form:errors path="tittle" cssClass="help-block"></form:errors>
									</div>
								</div>

							</div>

							
							<c:if test="${!viewOnly }">

								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="multipartFile">Image upload <span
										class="required">*</span>
									</label>
									<div class="col-md-12 col-sm-12 col-xs-12 has-feedback">
										<form:input path="multipartFile"
											class="form-control has-feedback-left" type="file" />

										<div class="has-error" style="color: red;">
											<form:errors path="multipartFile" cssClass="help-block"></form:errors>
										</div>
									</div>
								</div>
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
		window.location.href = '<c:url value="/practice/grammar/list" />'
	}
</script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="right_col" role="main">
	<div class="">

		<div class="clearfix"></div>
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>Category List</h2>

					<div class="clearfix"></div>
				</div>

				<div class="x_content">
				
					<div class="container">
						<a href="<c:url value="/admin/management/part3/add"/>" class="btn btn-app"><i
							class="fa fa-plus"></i>Add</a>
					</div>

					<div class="col-md-3 col-sm-3"></div>
					<div class="col-md-6 col-sm-6">
						<form:form modelAttribute="searchGrammarform"
							cssClass="form-label-left input_mask"
							servletRelativeAction="/practice/grammar/list/1" method="POST">

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Name </label>
								<div class="col-md-12 col-sm-12 col-xs-12 has-feedback">
									<form:input path="name" class="form-control has-feedback-left" />
								</div>
							</div>

							<div class="ln_solid"></div>

							<div class="form-group row">
								<div class="col-md-12 col-sm-12  offset-md-3">

									<button type="submit" class="btn btn-success">Search</button>


								</div>
							</div>

						</form:form>
					</div>
					<div class="col-md-3 col-sm-3"></div>



					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">
									<th class="column-title">#</th>
									<th class="column-title">Id</th>
									<th class="column-title">Name</th>
									<th class="column-title">Image</th>
									<th class="column-title">Content</th>
									<th class="column-title no-link last text-center" colspan="3"><span
										class="nobr">Action</span></th>
								</tr>
							</thead>

							<tbody>


								<c:forEach items="${grammars}" var="g" varStatus="loop">

									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr class="even pointer">
										</c:when>
										<c:otherwise>
											<tr class="odd pointer">
										</c:otherwise>
									</c:choose>

									<td class=" ">${pageInfo.getOffset() + loop.index+1}</td>
									<td class=" ">${g.id }</td>
									<td class=" ">${g.name }</td>

									<td class=" "><img src="<c:url value="${g.image }" />"
										width="100px" height="100px" /></td>
									<td class=" ">${g.content }</td>
									
									<td class="text-center"><a
										href="<c:url value="/admin/practice/grammar/view/${g.id }"/>"
										class="btn btn-round btn-default">View</a> <a
										href="<c:url value="/admin/practice/grammar/edit/${g.id }"/>"
										class="btn btn-round btn-primary">Edit</a> <a
										href="javascript:void(0);" onclick="confirmDelete(${g.id});"
										class="btn btn-round btn-danger">Delete</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<jsp:include page="../pagging.jsp"></jsp:include>

					</div>


				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	 function confirmDelete(id){
		 if(confirm('Do you want delete this record?')){
			 window.location.href = '<c:url value="/admin/management/part3/delete/"/>'+id;
		 }
	 }
	 
	 function goToPage(page){
		 $('#searchGrammarform').attr('action','<c:url value="/admin/management/part3/list/" />'+page);
		 $('#searchGrammarform').submit();
	 }
	 
	 
	 $(document).ready(function(){
		 processMessage();
		
	 })
	 function processMessage(){
		 var msgSuccess ='${msgSuccess}';
		 var msgError ='${msgError}';
		 if(msgSuccess){
			 new PNotify({
                 title: ' Success',
                 text: msgSuccess,
                 type: 'success',
                 styling: 'bootstrap3'
             });
		 }
		 if(msgError){
			 new PNotify({
                 title: 'Error',
                 text: msgError,
                 type: 'error',
                 styling: 'bootstrap3'
             });
		 }
	 }
</script>
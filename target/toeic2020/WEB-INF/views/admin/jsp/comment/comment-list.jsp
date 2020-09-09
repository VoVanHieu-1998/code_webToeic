<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
					

					<div class="col-md-3 col-sm-3"></div>
					<div class="col-md-6 col-sm-6">
						
					</div>
					<div class="col-md-3 col-sm-3"></div>



					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">
									<th class="column-title">#</th>
									<th class="column-title">Id</th>
									<th class="column-title">Name</th>
									<th class="column-title">Email</th>
									<th class="column-title">Content</th>
									<th class="column-title no-link last text-center" colspan="3"><span
										class="nobr">Action</span></th>
								</tr>
							</thead>

							<tbody>


								<c:forEach items="${comment}" var="g" varStatus="loop">
									<tr>
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr class="even pointer">
										</c:when>
										<c:otherwise>
											<tr class="odd pointer">
										</c:otherwise>
									</c:choose>

									<td class=" ">${pageInfo.getOffset() + loop.index+1}</td>
									<td class=" ">${g.commentId }</td>
									<td class=" ">${g.name }</td>

									<td class=" ">${g.email }</td>
									<td class=" ">${g.content }</td>
									
									<td class="text-center">
										<a href="javascript:void(0);" onclick="confirmDelete(${g.commentId});"
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
			 window.location.href = '<c:url value="/admin/comment/delete/"/>'+id;
		 }
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
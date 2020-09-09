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
					<h2>Vocabulary List</h2>

					<div class="clearfix"></div>
				</div>

				<div class="x_content">
					<div class="container">
						<a href="<c:url value="/admin/vocabulary/add"/>"
							class="btn btn-app"><i class="fa fa-plus"></i>Add</a>
					</div>

					<div class="col-md-3 col-sm-3"></div>
					<div class="col-md-6 col-sm-6"></div>
					<div class="col-md-3 col-sm-3"></div>



					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">
									<th class="column-title">#</th>
									<th class="column-title">Id</th>
									<th class="column-title">Name</th>
									<th class="column-title">Image</th>

									<th class="column-title no-link last text-center" colspan="3"><span
										class="nobr">Action</span></th>
								</tr>
							</thead>

							<tbody>


								<c:forEach items="${vocabulary}" var="vocabulary"
									varStatus="loop">
									<tr>
										<c:choose>
											<c:when test="${loop.index%2==0 }">
												<tr class="even pointer">
											</c:when>
											<c:otherwise>
												<tr class="odd pointer">
											</c:otherwise>
										</c:choose>

										<td class=" "><a style="text-decoration: none;"
											href='<c:url value="/admin/vocabularycontent/${vocabulary.getIdvocabulary()}"/>'>
												${pageInfo.getOffset() + loop.index+1}</a></td>
										<td class=" "><a style="text-decoration: none;"
											href='<c:url value="/admin/vocabularycontent/${vocabulary.getIdvocabulary()}"/>'>${vocabulary.getIdvocabulary() }</a></td>
										<td class=" "><a style="text-decoration: none;"
											href='<c:url value="/admin/vocabularycontent/${vocabulary.getIdvocabulary()}"/>'>
												${vocabulary.getNamevocabulary() }</a></td>

										<td class=" "><img
											src="<c:url value="/resources/Client/vocabularyline/${vocabulary.getImagevocabulary() }" />"
											width="100px" height="100px" /></td>

										<td class="text-center"><a
											href="<c:url value="/admin/vocabulary/view/${vocabulary.getIdvocabulary() }"/>"
											class="btn btn-round btn-info">View</a> <a
											class="btn btn-round btn-primary"
											href="<c:url value="/admin/vocabulary/edit/${vocabulary.getIdvocabulary() }"/>">Edit</a>
											<a href="javascript:void(0);"
											onclick="confirmDelete(${vocabulary.getIdvocabulary() });"
											class="btn btn-round btn-danger">Delete</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<!-- pagging -->
						<div class="dataTables_paginate paging_simple_numbers">

							<ul class="pagination" style="font-size: 20px;">
								<c:forEach begin="1" end="${pageInfo.totalPages }"
									varStatus="loop">
									<!-- neu la trang hien tai, thi hightlight len -->

									<c:choose>
										<c:when test="${pageInfo.indexPage == loop.index}">
											<li class="paginate_button active"
												style="background-color: #336699; margin-right: 5px; width: 20px; text-align: center; color: black;"><a
												href="javascript:void(0);">${loop.index}</a></li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button"
												style="background-color: #999999; margin-right: 5px; width: 20px; text-align: center;"><a
												href="<c:url value="/admin/vocabulary/list/${loop.index}" />">${loop.index}</a></li>

										</c:otherwise>

									</c:choose>

									<li></li>
								</c:forEach>

							</ul>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	 function confirmDelete(id){
		 if(confirm('Do you want delete this record?')){
			 window.location.href = '<c:url value="/admin/vocabulary/delete/"/>'+id;
		 }
	 }
	 
	 function goToPage(page){
		 $('#vocabularyline').attr('action','<c:url value="/admin/vocabulary/list/" />'+page);
		 $('#vocabularyline').submit();
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
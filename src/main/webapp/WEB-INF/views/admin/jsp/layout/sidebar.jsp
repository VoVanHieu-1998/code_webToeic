<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	<div class="menu_section">
		<h3>General</h3>
		<ul class="nav side-menu">
			<c:forEach items="${menuSession}" var="menu">
				<li id="${menu.menuId }"><a><i class="fa fa-home"></i> ${menu.name} <span
						class="fa fa-chevron-down"></span></a>
					<ul class="nav child_menu">
					<c:forEach items="${menu.child }" var="mc">
						<li id="${mc.menuId}"><a href='<c:url value="${mc.url}"></c:url>'>${mc.name}</a></li>
					</c:forEach>
					</ul></li>
					
			</c:forEach>
		</ul>
	</div>

</div>
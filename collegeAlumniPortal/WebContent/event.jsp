<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>College Alumni Portal</title>
<%@include file="css.html"%>
<jsp:include page="/DisplayEvent"></jsp:include>
<%@page import="com.shared.UserBean"%>
</head>
<body onload="valid()">
	<jsp:include page="nav.jsp" />
	<br>
	<br>
	<div class="content-wrapper">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><b>Event</b></li>

			</ol>
				<table border=2 class="breadcrumb" cellpadding="5" cellspacing="5" class="table table-bordered">
					<tr>
						<th>Event Name</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Venue</th>
						<th>Time</th>
						<th>Description</th>
						<th>Posted Date</th>
						<th>Update</th>
						<th>Delete</th>
						<c:if  test="${utype}== ADMIN" >
							<th id="aproveh" >Approve</th>
							<th id="disapph" >Disapprove</th>
						</c:if>
					</tr>
					<c:forEach items="${eventList}" var="bean">
						<c:url var="delete" value="DeleteEvent">
							<c:param name="id" value="${bean.id }"></c:param>
						</c:url>
						<c:url var="update" value="UpdateEvent">
							<c:param name="upid" value="${bean.id }"></c:param>
						</c:url>
						<c:url var="approve" value="approveEventServlet">
							<c:param name="apid" value="${bean.id }"></c:param>
							<c:param name="status" value="1"></c:param>
						</c:url>
						 <tr>
							<td><c:out value="${bean.ename }"></c:out></td>
							<td><c:out value="${bean.startdate }"></c:out></td>
							<td><c:out value="${bean.enddate}"></c:out></td>
							<td><c:out value="${bean.venue}"></c:out></td>
							<td><c:out value="${bean.time}"></c:out></td>
							<td><c:out value="${bean.desc}"></c:out></td>
							<td><c:out value="${bean.posteddate}"></c:out></td>
							<td><a id ="up" href="${update}">Update</a></td>
							<td><a id="del" href="${delete}">Delete</a></td>
							<c:if  test="${utype}== ADMIN" >
							<td id="aprove" > <a href="${approve}">Approve</a></td>
							<td id="disapp" > <a href="${delete}">Disapprove</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
					<a href="AddUserEvent.jsp" class="btn btn-primary btn-block"> Add an Event</a>
			</div>
		</div>
	<%@include file="js.html"%>
	
</body>
</html>
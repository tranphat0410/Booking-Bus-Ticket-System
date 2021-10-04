<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="icon" type="image/png" href="public/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Ticket Seller - List Travels</title>

<jsp:include page="--css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>
</head>
<body>
	<%
		if (session.getAttribute("unameSeller") == null) {
		response.sendRedirect("login");
	}
	%>
	<div class="wrapper">

		<div class="sidebar" data-color="green"
			data-image="public/img/sidebar.jpg">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="listseller" class="simple-text"> <b>Ticket Seller
							of System</b>
					</a>
				</div>

				<ul class="nav">
					<li><a href="listseller"> <i class="fa fa-info-circle"
							aria-hidden="true"></i>
							<p>Information travel</p>
					</a></li>
					<li class="active"><a href="selleralltravel"> 
							<i class='fas fa-map-marked-alt' aria-hidden="true"></i>
							<p>List Travel</p>
					</a></li>
					<li class="listseller"><a href="sellerallticket"> 
							<i class="fa fa-ticket" aria-hidden="true"></i>
							<p>List Ticket Travel</p>
					</a></li>



				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navigation-example-2">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">List Travel</a>
					</div>
					<div class="collapse navbar-collapse">


						<ul class="nav navbar-nav navbar-right">


							<li><a href="logout"> Log out </a></li>
							<li class="separator hidden-lg hidden-md"></li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">

							<c:choose>
								<c:when test="${error!=null}">
									<div class="col-12 ">
										<div class="alert alert-danger text-center mx-auto mt-2">${error}</div>
									</div>
								</c:when>
							</c:choose>
							<div class="card">
								<div class="header">
									<div class="row">
										<div class="col-md-6">
											<h4 class="title">List travel</h4>
											<p class="category">Here is an information of travel</p>
										</div>
										<div class="col-md-6">
											<form action="sellerSearchtravel" method="get"
												class="form-inline text-right" style="margin-bottom: 2px">
												<select  class="form-control form-control-lg" name="SearchStatus">
                                                                <option value="TB" selected>Type Bus</option>
                                                                <option value="NB">Number Bus</option>
                                                                <option value="PS">Place Start</option>
                                                                <option value="PF">Place Finish</option>
                                                                <option value="TT">Type Travel</option>
                                                                <option value="Status">Status</option>
                                                            </select>
												<input class="form-control mr-sm-2" type="text"
													placeholder="Search name user" name="word"
													aria-label="Search">
												<button type="submit" class="btn btn-primary">Search</button>
											</form>
										</div>
									</div>

								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">Type Bus</th>
												<th scope="col">Number Bus</th>
												<th scope="col">Seats</th>
												<th scope="col">Place Start</th>
												<th scope="col">Place Finish</th>
												<th scope="col">From</th>
												<th scope="col">To</th>
												<th scope="col">Type Travel</th>
												<th scope="col">Status</th>
												<th class="text-center" scope="col">Option</th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach items="${travel}" var="travels">
												<tr>
													<th class="text-center" scope="row">${travels.getIdTravel()}</th>
													<th>${travels.getTypeBus()}</th>
													<td>${travels.getNumberBus()}</td>
													<td>${travels.getResidualSeats()}/${travels.getTotalSeats()}</td>
													<td>${travels.getPlaceStart()}</td>
													<td>${travels.getPlaceFinish()}</td>
													<td>${travels.getTime()}</td>
													<td>${travels.getTimeout()}</td>
													<td>${travels.getTypeTravel()}</td>
													<td>${travels.getStatus()}</td>
													<td class="text-right">
														<form action="sellerdeleteticket" method="post">
															<input type="hidden" value="0" name="RS"> <input
																type="hidden" value="${tickets.getIdtravel()}"
																name="idTravel"> <input type="hidden"
																value="${tickets.getIdbook()}" name="idTicket">
															<a class="btn btn-info btn-fill"
																href="sellerupinfo?id=${travels.getIdTravel()}"> <i
																class="fa fa-cog" aria-hidden="true"></i> Update
															</a>
														</form>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

</body>

<jsp:include page="--js.jsp"></jsp:include>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Ticket Seller - Update Ticket</title>

<jsp:include page="--css.jsp"></jsp:include>
</head>
<body>
<%
		if (session.getAttribute("unameSeller") == null) {
		response.sendRedirect("login");
	}
	%>
	<div class="wrapper">
		
		<div class="sidebar" data-color="green" data-image="public/img/sidebar.jpg">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="listseller" class="simple-text">
                        <b>Ticket Seller of System</b>
                    </a>
                </div>

                <ul class="nav">
                    <li>
                        <a href="listseller">
                            <i class="fa fa-info-circle" aria-hidden="true"></i>
                            <p>Information travel</p>
                        </a>
                    </li>
                    <li class="listseller">
                        <a href="selleralltravel">
                            <i class='fas fa-map-marked-alt' aria-hidden="true"></i>
                            <p>List Travel</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="sellerallticket">
                            <i class="fa fa-ticket" aria-hidden="true"></i>
                            <p>List Ticket Travel</p>
                        </a>
                    </li>
                    
                   
                    
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
						<a class="navbar-brand" href="#">Update informations of travel</a>
					</div>
					<div class="collapse navbar-collapse">


						<ul class="nav navbar-nav navbar-right">

							<li><a href="logout">
									<p>Log out</p>
							</a></li>
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
									<h4 class="title">Add new User</h4>
								</div>
								
								<div class="content">
								
									<c:forEach items="${ticket}" var="tickets">
										<form action="sellerupusertick" method="post">

											<div class="row">
												<div class="col-md-6">
													<input type="hidden" name="id" value="${tickets.getIdbook()}">
													<p>
														ID: <span style="color: red">${tickets.getIdbook()}</span>
													</p>
												</div>
												<div class="col-md-6">
													<p>
														
														ID Travel: <span style="color: red">${tickets.getIdtravel()}</span>
													</p>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Email</label>
														<input class="form-control" value="${tickets.getEmail()}" disabled>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Last Name</label>
														<input type="text" name="lastname" placeholder="Last Name" class="form-control" value="${tickets.getLastname()}">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Name User</label>
														<input type="text" name="name" placeholder="Name User" class="form-control" value="${tickets.getName()}">
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Phone</label>
														<input type="text" name="phone" placeholder="Phone" class="form-control" value="${tickets.getPhone()}">
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Number Bus</label>
														<input class="form-control" value="${tickets.getNumberbus()}" disabled>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Number Bus</label>
														<input class="form-control" value="${tickets.getNumberseat()}" disabled>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Total Seats</label>
														 <input class="form-control" value="${tickets.getPlacestart()}" disabled>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Residual Seats</label>
														 <input class="form-control" value="${tickets.getPlacefinish()}" disabled>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Place Start</label>
														 <input class="form-control" value="${tickets.getTypetravel()}" disabled>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Place Finish</label>
														 <input class="form-control" value="${tickets.getDatebooking()}" disabled>
													</div>
												</div>
											</div>
											
											<button type="submit"
												class="btn btn-info btn-fill pull-right">Perform
												
											</button>
											
											<div class="clearfix"></div>
										</form>
									</c:forEach>
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

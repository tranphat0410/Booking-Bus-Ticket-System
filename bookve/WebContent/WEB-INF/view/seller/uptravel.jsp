<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Ticket Seller - Update Travel</title>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <li class="active">
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
                    <li>
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
						<a class="navbar-brand" href="#">Update informations of ticket in travel</a>
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
									<h4 class="title">Update informations of ticket in travel</h4>
								</div>
								<div class="content">
									<c:forEach items="${travels}" var="travel">
										<form action="sellerupinfo" method="post">

											<div class="row">
												<div class="col-md-12">
													<input type="hidden" name="id"value="${travel.getIdTravel()}">
													<p>
														ID: <span style="color: red">${travel.getIdTravel()}</span>
													</p>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Type Bus</label>
														 <input class="form-control" value="${travel.getTypeBus()}" disabled>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Number Bus</label>
														 <input class="form-control" value="${travel.getNumberBus()}" disabled>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Total Seats</label>
														 <input class="form-control" value="${travel.getTotalSeats()}" disabled>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Residual Seats</label>
														 <input class="form-control" value="${travel.getResidualSeats()}" disabled>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Place Start</label>
														 <input class="form-control" value="${travel.getPlaceStart()}" disabled>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Place Finish</label>
														 <input class="form-control" value="${travel.getPlaceFinish()}" disabled>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Type Travel</label>
														<input class="form-control" value="${travel.getTypeTravel()}" disabled>
													</div>
												</div>
											</div>
											<div class="row">
												<c:choose>
													<c:when test="${travel.getTypeTravel() == 'Round-trip'}">
														<div class="col-md-6">
															<div class="form-group">
																<label>Departure</label>
																<input type="date" name="time" placeholder="time" class="form-control" value="${travel.getTime()}">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label>Return</label>
																<input type="date" name="timeout" placeholder="timeout" class="form-control" value="${travel.getTimeout()}">
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="col-md-12">
															<div class="form-group">
																<label>Departure</label>
																<input type="date" name="time" placeholder="time" class="form-control" value="${travel.getTime()}">
															</div>
														</div>
													</c:otherwise>
												</c:choose>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Status</label>
														<c:if test="${travel.getStatus() == 'wait'}">
															<c:set var="checkWait" value="selected"></c:set>
														</c:if>
														<c:if test="${travel.getStatus() == 'done'}">
															<c:set var="checkDone" value="selected"></c:set>
														</c:if>
														<c:if test="${travel.getStatus() == 'cancelled'}">
															<c:set var="checkCan" value="selected"></c:set>
														</c:if>
														<select  class="form-control form-control-lg" name="Status">
                                                                <option value="" selected>Status</option>
                                                                <option value="wait" ${checkWait}>Wait</option>
                                                                <option value="done" ${checkDone}>Done</option>
                                                                <option value="cancelled" ${checkCan}>Cancelled</option>
                                                            </select>
													</div>
												</div>
											</div>
											
											<button type="submit"
												class="btn btn-info btn-fill pull-right">Perform
												
											</button>
											<a class="btn btn-danger btn-fill pull-left"
											href="sellertickettravel?id=${travel.getIdTravel()}">View tickets</a>
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

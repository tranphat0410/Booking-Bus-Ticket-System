<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="icon" type="image/png" href="public/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Ticket Seller - List Tickets</title>

<jsp:include page="--css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
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
						<a class="navbar-brand" href="#">Ticket in Travel</a>
					</div>
					<div class="collapse navbar-collapse">


						<ul class="nav navbar-nav navbar-right">
							

							<li><a href="logout">
									Log out
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
								<c:forEach items="${travels}" var="travel">
									<div class="row">
										<div class="col-md-6">
											<h4 class="title">List Ticket of Number Bus: <b><span style="color: red;">${travel.getNumberBus()}</span></b></h4>
										</div>
										<div class="col-md-6">
											<form action="sellertickettravel" method="post"
												class="form-inline text-right" style="margin-bottom: 2px">
												<select  class="form-control form-control-lg" name="SearchStatus">
                                                                <option value="LastName">Last name</option>
                                                                <option value="name" selected>Name</option>
                                                                <option value="Phone">Phone</option>
                                                                <option value="Email">Email</option>
                                                                <option value="Seat">Seat</option>
                                                            </select>
                                                <input type="hidden" name="id" value="${ID }">
												<input class="form-control mr-sm-2" type="text"
													placeholder="Search name user" name="word"
													aria-label="Search">
												<button type="submit" class="btn btn-primary">Search</button>
											</form>
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
									</c:forEach>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">Last Name</th>
												<th scope="col">Name</th>
												<th scope="col">Phone</th>
												<th scope="col">Email</th>
												<th scope="col">Number Seat</th>
												<th scope="col">Date Booking</th>
												<th class="text-center" scope="col">Option</th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach items="${ticket}" var="tickets">
												<tr>
													<th class="text-center" scope="row">${tickets.getIdbook()}</th>
													<th>${tickets.getLastname()}</th>
													<th>${tickets.getName()}</th>
													<td>${tickets.getPhone()}</td>
													<td>${tickets.getEmail()}</td>
													<td>${tickets.getNumberseat()}</td>
													<td>${tickets.getDatebooking()}</td>
													<td class="text-right">
													<c:forEach items="${travels}" var="travel">
													<form action="sellerdeleteticket" method="post">
														<input type="hidden" value="${travel.getResidualSeats()}" name="RS"> 
														<input type="hidden"value="${travel.getIdTravel()}" name="idTravel">
														<input type="hidden" value="${tickets.getIdbook()}" name="idTicket">
														<a 
														class="btn btn-info btn-fill"
														href="sellerupusertick?id=${tickets.getIdbook()}"> <i
															class="fa fa-cog" aria-hidden="true"></i> Update
													</a>
														<button type="submit" class="btn btn-danger btn-fill pull-rightr" 
														onclick="return confirm('Do you really want to delete ticket ?');">
																<i class="fa fa-times-circle" aria-hidden="true"></i>
																	Delete
														</button>
																
														
													</form> 
													</c:forEach>
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
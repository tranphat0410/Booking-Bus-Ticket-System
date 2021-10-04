<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Create User</title>

<jsp:include page="--css.jsp"></jsp:include>
</head>
<body>
<%
		if (session.getAttribute("unameAdmin") == null) {
		response.sendRedirect("login");
	}
	%>
	<div class="wrapper">
		
			<!-- -----menu----- -->
            <div class="sidebar" data-color="green" data-image="public/img/sidebar.jpg">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="listuser" class="simple-text"> <b>Admin of System</b>
                        </a>
                    </div>
                    <ul class="nav">
                        <li class="active">
                        	<a href="listuser"> 
                        		<i class="fa fa-list-alt" aria-hidden="true"></i>
                                <p>Table List</p>
                            </a></li>
                        <li>
                        	<a href="createadmin">
                        		<i class="fa fa-user-plus" aria-hidden="true"></i>
                                <p>Create User</p>
                            </a></li>
                    </ul>
                </div>
            </div>
            <!-- -----menu----- -->

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
						<a class="navbar-brand" href="#">Update User</a>
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
									<c:forEach items="${updateadmin}" var="user">
										<form action="${pageContext.request.contextPath}/updateadmin"
											method="post">

											<div class="row">
												<div class="col-md-12">
													<input name="id" value="${user.getIduser()}" type="hidden">
													<p>
														ID: <span style="color: red">${user.getIduser()}</span>
													</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-7">
													<div class="form-group">
														<label>User Name</label> <input type="text"
															class="form-control" name="name"
															placeholder="User Name" value="${user.getName()}"
															required>
													</div>
												</div>
												<div class="col-md-5">
													<div class="form-group">
														<label>Last Name</label> <input class="form-control"
															type="text" name="lastname" placeholder="Last Name"
															value="${user.getLastname()}" required>
													</div>
												</div>

											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Phone</label> <input type="text"
															class="form-control" name="phone" placeholder="Phone"
															value="${user.getPhone()}" required>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Area</label> <input type="text"
															class="form-control" name="area" placeholder="Area"
															value="${user.getArea()}" required>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Email</label>
														
											<input type="hidden" name="mail" value="${user.getEmail()}">
														 <input type="email"
															class="form-control"  placeholder="Email"
															value="${user.getEmail()}" disabled>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Old Password</label> <input type="hidden"
															name="oldpass" value="${user.getPassword()}"> <input
															type="text" class="form-control"
															value="${user.getPassword()}" disabled>

													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>New Password</label> <input type="password"
															class="form-control" name="pass" id="pass"
															placeholder="Password" onkeyup='check();'>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Comfirm Password</label> <input type="password"
															class="form-control" name="passagain" id="passagain"
															placeholder="Comfirm Password" onkeyup='check();'>
														<span id="message"> </span>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Role: </label>
														<c:if test="${user.getRole() == 'Customer'}">
															<c:set var="checkCus" value="checked"></c:set>
														</c:if>

														<c:if test="${user.getRole() == 'TicketSeller'}">
															<c:set var="checkSell" value="checked"></c:set>
														</c:if>
														<input style="margin-left: 20px;" class="form-check-input"
															type="radio" name="role" value="Customer" ${checkCus}>
														<label class="form-check-label"> Customer</label> <input
															style="margin-left: 20px;" class="form-check-input"
															type="radio" name="role" value="TicketSeller"
															${checkSell}> <label class="form-check-label">Ticket
															Seller</label>

													</div>
												</div>
											</div>
											<input type="hidden" name="cSeat" value="${user.getRole()}">
											<button type="submit"
												class="btn btn-info btn-fill pull-right">Perform</button>
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
<script type="text/javascript">
	function check() {
		if (document.getElementById('pass').value == document
				.getElementById('passagain').value) {
			document.getElementById('message').innerHTML = '';
		} else {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'Passwords dont match ';

		}

	}
</script>

</html>

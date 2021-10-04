<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="icon" type="image/png" href="public/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Admin - List Users</title>

<jsp:include page="--css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						<a class="navbar-brand" href="#">List User</a>
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
								<div class="row">
									<div class="col-md-7">
										<h4 class="title">List user</h4>
										<p class="category">Here is an information of User</p>
									</div>
										<div class="col-md-5">
											<form action="listuser" method="post"
												class="form-inline text-right" style="margin-bottom: 2px">
												<select  class="form-control form-control-lg" name="SearchStatus">
                                                    <option value="LastName">Last name</option>
													<option value="Name" selected>Name</option>
													<option value="Phone">Phone</option>
													<option value="Email">Email</option>
													<option value="Area">Area</option>
													<option value="Role">Role</option>
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
												<th scope="col">Last Name</th>
												<th scope="col">Name</th>
												<th scope="col">Phone</th>
												<th scope="col">Email</th>
												<th scope="col">Area</th>
												<th scope="col">role</th>
												<th class="text-center" scope="col">Option</th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach items="${listuser}" var="user">
												<tr>
													<th class="text-center" scope="row">${user.getIduser()}</th>
													<th>${user.getLastname()}</th>
													<th>${user.getName()}</th>
													<td>${user.getPhone()}</td>
													<td>${user.getEmail()}</td>
													<td>${user.getArea()}</td>
													<td>${user.getRole()}</td>
													<td class="text-right"><a style="width: 100px; margin-bottom: 3px; margin-top: 3px; margin-left: 3px "
														class="btn btn-danger btn-fill pull-right"
														onclick="return confirm('Do you really want to delete user ?');"
														href="deleteadmin?id=${user.getIduser()}"> <i
															class="fa fa-times-circle  " aria-hidden="true"></i>
															Delete
													</a> <a style="width: 100px; margin-bottom: 3px; margin-top: 3px"
														class="btn btn-info btn-fill pull-right"
														href="updateadmin?id=${user.getIduser()}"> <i
															class="fa fa-cog" aria-hidden="true"></i> Update
													</a></td>
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
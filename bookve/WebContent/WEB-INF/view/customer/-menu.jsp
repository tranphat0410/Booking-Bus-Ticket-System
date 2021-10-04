<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
		<div class="container">
			<a class="navbar-brand" href="home"><img style="width:150px;" src="style/Images/logo.png" class="img-fluid"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="home"><i
							class="fas fa-home"></i> Home </a></li>

					<c:choose>
						<c:when test="${unameAdmin != null }">
							<c:forEach items="${unameAdmin }" var="user">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"><i class="fas fa-user-circle"></i> Hi
										${user.getName() } </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown"
										style="background-color: rgba(4, 77, 32, 0.9);">
										<a class="dropdown-item" href="listuser"> Account</a> <a
											class="dropdown-item" href="logout"> Logout</a>
									</div></li>
							</c:forEach>
						</c:when>
						<c:when test="${unameSeller != null }">
							<c:forEach items="${unameSeller }" var="user">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"><i class="fas fa-user-circle"></i> Hi
										${user.getName() } </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown"
										style="background-color: rgba(4, 77, 32, 0.9);">
										<a class="dropdown-item" href="listseller"> Account</a> <a
											class="dropdown-item" href="logout"> Logout</a>
									</div></li>
							</c:forEach>
						</c:when>
						<c:when test="${unameCustomer != null }">
							<c:forEach items="${unameCustomer }" var="user">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"><i class="fas fa-user-circle"></i> Hi
										${user.getName()} </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown"
										style="background-color: rgba(4, 77, 32, 0.9);">
										<a class="dropdown-item" href="userAccount?mail=${user.getEmail()}"> Account</a>
										<a class="dropdown-item" href="logout"> Logout</a>
									</div></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li class="nav-item active"><a class="nav-link" href="login"><i
									class="fa fa-sign-in"></i> Login</a></li>
						</c:otherwise>
					</c:choose>

				</ul>

			</div>
		</div>
	</nav>
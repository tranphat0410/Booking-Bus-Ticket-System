<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
		if (session.getAttribute("unameSeller") == null) {
		response.sendRedirect("login");
	}
	%>
    <div class="wrapper">
        <div class="wrapper">

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                                    class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Add new Travel</a>
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
                                    <c:when test="${thongbao!=null}">
                                        <div class="col-12 ">
                                            <div class="alert alert-success text-center mx-auto mt-2">${thongbao}</div>
                                        </div>
                                    </c:when>
                                    <c:when test="${error!=null}">
                                        <div class="col-12 ">
                                            <div class="alert alert-danger text-center mx-auto mt-2">${error}</div>
                                        </div>
                                    </c:when>
                                </c:choose>
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Add new Travel</h4>
                                    </div>
                                    <div class="content">
                                        <form action="createtravel" method="post">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                            <label>Type Bus</label> <select
                                                                class="form-control form-control-lg" name="tbus">
                                                                <option value="" selected>Type Bus</option>
                                                                <option value="Normal" >Normal</option>
                                                                <option value="Limousine" >Limousine</option>
                                                                <option value="Small" >Small</option>
                                                            </select>
                                                        </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Number Bus</label> <input class="form-control" type="text"
                                                            name="nbus" placeholder="Number Bus" required>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Place start</label> <input type="text" class="form-control"
                                                            name="plstart" placeholder="Place start" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Area</label> <input type="text" class="form-control"
                                                            name="area" placeholder="Place finish" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Email</label> <input type="email" class="form-control"
                                                            name="mail" placeholder="Email" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Password</label> <input type="password"
                                                            class="form-control" name="pass" id="pass"
                                                            placeholder="Password" onkeyup='check();' required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Comfirm Password</label> <input type="password"
                                                            class="form-control" name="passagain" id="passagain"
                                                            placeholder="Comfirm Password" onkeyup='check();' required>
                                                        <span class="mx-auto" id="message"> </span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Role: </label>
                                                        <input style="margin-left: 20px;" class="form-check-input"
                                                            type="radio" name="role" value="Customer"> <label
                                                            class="form-check-label"> Customer</label>
                                                        <input style="margin-left: 20px;" class="form-check-input"
                                                            type="radio" name="role" value="TicketSeller"> <label
                                                            class="form-check-label">Ticket Seller</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-info btn-fill pull-right">Add</button>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
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
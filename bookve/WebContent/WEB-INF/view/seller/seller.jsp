<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Ticket Seller</title>
    <jsp:include page="--css.jsp"></jsp:include>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Seller view</a>
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
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Search</h4>
                                        </div>
                                        <div class="content">
                                            <form action="listseller" method="post">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Type Bus</label> 
                                                            <select  class="form-control form-control-lg" name="tbus">
                                                                <option value="" selected>Type Bus</option>
                                                                <option value="Normal" >Normal</option>
                                                                <option value="Limousine" >Limousine</option>
                                                                <option value="Royal" >Royal</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Date start</label> <input type="date"
                                                                class="form-control form-control-lg" name="time" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Start</label> <select
                                                                class="form-control form-control-lg" name="ps">
                                                                <option value="" selected>Start</option>
                                                                <c:forEach items="${travels}" var="travel">
                                                                    <option value="${travel.getPlaceStart() }">
                                                                        ${travel.getPlaceStart() }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Finish</label> <select
                                                                class="form-control form-control-lg" name="pf">
                                                                <option value="" selected>Finish</option>
                                                                <c:forEach items="${travels}" var="travel">
                                                                    <option value="${travel.getPlaceFinish()}">
                                                                        ${travel.getPlaceFinish()}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Type Ticket</label> <select
                                                                class="form-control form-control-lg" name="tt">
                                                                <option selected>Type Ticket</option>
                                                                <option value="One-way-trip">One-way-trip</option>
                                                                <option value="Round-trip">Round-trip</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <button type="submit"
                                                                class="btn btn-info btn-fill pull-right"
                                                                style="margin-top: 24px; text-align: center;">Search</button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Information</h4>
                                            <p class="category">Here is an information of travel</p>
                                        </div>
										<c:forEach items="${MyTravel }" var="mytravel">
											<c:choose>

												<c:when
													test="${error !=null && mytravel.getIdTravel() == 0}">
													<div class="col-12 ">
														<div class="alert alert-danger text-center mx-auto ">${error}</div>
													</div>

												</c:when>

											</c:choose>
										</c:forEach>
										<div class="content">
											
                                            <jsp:include page="-travelview.jsp"></jsp:include>
                                           
                                        </div>
                                        <div class="row" style="padding-right: 15px;padding-bottom: 10px">
                                        	<div class="col-md-12" >
												<c:choose>
													<c:when test="${MyTravel!=null}">
														<c:forEach items="${MyTravel}" var="mytravel">
															<c:choose>
																<c:when test="${mytravel.getIdTravel() != 0}">

																	<a class="btn btn-info btn-fill pull-right"
																		href="sellerupinfo?id=${mytravel.getIdTravel()}">
																		 Next to Update information
																		tickets and seats</a>

																</c:when>
																<c:otherwise>
																	<a class="btn btn-info btn-fill pull-right" href=""> Next to Update information
																		tickets and seats</a>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<a class="btn btn-info btn-fill pull-right" href=""> Next to Update information
															tickets and seats</a>
													</c:otherwise>
												</c:choose>
											</div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div> <!-- card information -->
                        </div> <!-- main left  -->
                        <div class="col-md-4">
                        	<div class="row">
                        		<div class="col-md-12">
                        		<c:forEach items="${MyTravel}" var="mytravel">
                        			<c:choose>
                        				<c:when test="${mytravel.getTypeBus() =='Normal'}">
                        				<jsp:include page="NormalBus.jsp"></jsp:include>
                        				</c:when>
                        				<c:when test="${mytravel.getTypeBus() =='Limousine'}">
                        				<jsp:include page="Limousine.jsp"></jsp:include>
                        				</c:when>
                        				<c:when test="${mytravel.getTypeBus() =='Royal'}">
                        				<jsp:include page="Royal.jsp"></jsp:include>
                        				</c:when>
                        			</c:choose>
                        		</c:forEach>
                        		
                        		
                        		
                        		
                        		</div>
                        	</div>
                        </div><!-- main right  -->
                    </div>
                </div>
            </div>
        </div><!-- main-panel -->
    </div>
</body>

<jsp:include page="--js.jsp"></jsp:include>


</html>
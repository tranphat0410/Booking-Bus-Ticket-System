<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<title>Book Fast - Travels</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<jsp:include page="--css.jsp"></jsp:include>
<link rel="stylesheet" href="style/css/buslist.css">
<link rel="stylesheet" href="style/fontawesome-free-5.13.1-web/css/all.min.css">

</head>

<body>
	<jsp:include page="-menu.jsp"></jsp:include>

	<div id="slides" class="carousel slide text-center"
		data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#slides" data-slide-to="0" class="active"></li>
			<li data-target="#slides" data-slide-to="1"></li>
			<li data-target="#slides" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<!-- -----------------------------------------------searche travel END--------------------------------------------- -->
			<div class="row carousel-caption " style="height: 200px;">
				<div class="container-fluid">
					<div class="row h-100">
						<div class="col-lg-12 my-auto " style="padding: 0;">
							<div class="card"
								style="background-color: rgba(41, 29, 29, 0.6);">
								<form action="home" method="post">
									<div class="row">
										<div class="col-lg-12  text-left ml-2 mt-1">
											<div class="row loaichuyen">
												<div class="ml-3">
													<input
														onclick="document.getElementById('to').disabled = true"
														id="nut1" type="radio" name="nut" value="One-way-trip">
													<label for="nut1"> One way trip </label>
												</div>
												<div class="ml-3 khuhoi">
													<input
														onclick="document.getElementById('to').disabled = false"
														id="nut2" type="radio" name="nut" value="Round-trip"
														checked> <label for="nut2"> Round trip </label>
												</div>
											</div>
										</div>
									</div>
									<div class="row searchdiadiem p-2">
										<div class="col-lg-11 text-left">
											<div class="row">
												<div class="col-lg-6 col-md-12">
													<div class="row">
														<div class="col-lg-5 col-md-5 diadiemtrai">
															<div class="form-group">
																<label>From</label> <select name="PS"
																	class="form-control form-control-md w-100 mx-auto"
																	style="width: 95%;">
																	<c:forEach items="${travels}" var="travel">
																		<option value="${travel.getPlaceStart() }">${travel.getPlaceStart() }</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="col-lg-2 col-md-2 doilai1">
															<div class="form-group">
																<i style="color: white;" class="fas fa-exchange-alt "></i>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 diadiemphai">
															<div class="form-group">
																<label>To</label> <select name="PF"
																	class="form-control form-control-md w-100 mx-auto"
																	style="width: 95%;">
																	<c:forEach items="${travels}" var="travel">
																		<option value="${travel.getPlaceStart() }">${travel.getPlaceStart() }</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="row">
														<div class="col-lg-5 col-md-5 diadiemtrai">
															<div class="form-group">
																<label for="nkh"> Departure</label> <input id="from"
																	class="form-control form-control-md" type="text"
																	name="nkh">
															</div>
														</div>
														<div class="col-lg-2 col-md-2 doilai1">
															<div class="form-group">
																<i class="fas fa-angle-double-right"></i>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 diadiemphai">
															<div class="form-group">
																<label for="nv"> Return</label> <input id="to"
																	class="form-control form-control-md" type="text"
																	name="nv">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-1 col-md-12 doilaibtn1">
											<button type="submit" value="Submit" class="btn btn-success">
												Search</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- -----------------------------------------------searche travel END--------------------------------------------- -->
			<div class="carousel-item active">
				<img class="img-fluid"
					style="height: 270px; width: 100%; margin: auto;"
					src="style/Images/ban4.jpg">
			</div>
			<div class="carousel-item ">
				<img class="img-fluid"
					style="height: 270px; width: 100%; margin: auto;"
					src="style/Images/ban5.jpg">
			</div>
			<div class="carousel-item ">
				<img class="img-fluid"
					style="height: 270px; width: 100%; margin: auto;"
					src="style/Images/ban6.jpg">
			</div>
		</div>
	</div>
	<div class="trip-list">
		<div class="container search-result-new">
			<div class="row">
				<div class="col-sm-8">
					<h2 style="display: inline-block;">${GO}</h2>
					<div style="display: inline-block;">
						<i style="font-size: 30px;"
							class="fas fa-long-arrow-alt-right p-3"></i>
					</div>
					<h2 style="display: inline-block;">${END}</h2>

				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<c:forEach items="${MyTravel}" var="mytravel">
        <c:set var="error" value="no Error"></c:set>
			<form action="userbooking">
				<div class="row h-100 mt-5 mb-5">
					<div class="col-lg-12 my-auto">
						<div class="card"
							style="box-shadow: 5px 5px 15px #000; padding-top: 20px; background: linear-gradient(to top right, rgba(55, 56, 10, 0.67), rgba(202, 235, 84, 0.67))">
							<div class="row searchdiadiem">
								<div class="col-lg-11 text-left">
									<div class="row">
										<div class="col-lg-7 col-md-12">
											<div class="row">
												<div class="col-lg-4 col-md-4 diemdi">
													<div class="form-group">
														<h5>Depart day</h5>
														<div>
															<fmt:formatDate type="date" value="${mytravel.getTime()}" />
														</div>
														<c:choose>
															<c:when
																test="${mytravel.getTypeTravel() == 'Round-trip'}">
																<div style="margin-left: 30px;">
																	<i class="fas fa-arrow-down"></i>
																</div>
																<div>
																	<fmt:formatDate type="date"
																		value="${mytravel.getTimeout()}" />
																</div>
															</c:when>
														</c:choose>

													</div>
												</div>
												<div class="col-lg-3 col-md-3 diemdi">
													<div class="form-group">
														<h5>${mytravel.getStationStart()}</h5>
														<p>( ${mytravel.getPlaceStart()} )</p>
													</div>
												</div>
												<div class="col-lg-2 col-md-2 doilai pl-5">
													<div class="form-group">
														<i class="fas fa-angle-right"></i>
													</div>
												</div>
												<div class="col-lg-3 col-md-3 diemden">
													<div class="form-group">
														<h5>${mytravel.getStationFinish()}</h5>
														<p>( ${mytravel.getPlaceFinish()} )</p>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-5 col-md-6">
											<div class="row">
												<div class="col-lg-3 col-md-4">
													<div class="form-group sf">
														<h5>Seat</h5>
														<p>${mytravel.getResidualSeats()}/
															${mytravel.getTotalSeats()} chỗ</p>
													</div>
												</div>
												<div class="col-lg-9 col-md-8 sf">
													<div class="form-group">
														<h5 style="text-align: center;">Fare</h5>
														<div class="row pl-3">
															<div class="col-lg-4">
																Font:
																<div>
																	<strong> <fmt:formatNumber type="number"
																			groupingUsed="true"
																			value="${mytravel.getPriceFront()}" /> VND
																	</strong>
																</div>
															</div>
															<div class="col-lg-4">
																Middle:
																<div>
																	<strong><fmt:formatNumber type="number"
																			groupingUsed="true"
																			value="${mytravel.getPriceMiddle()}" /> VND</strong>
																</div>
															</div>
															<div class="col-lg-4">
																Last:
																<div>
																	<strong><fmt:formatNumber type="number"
																			groupingUsed="true"
																			value="${mytravel.getPriceLast()}" /> VND</strong>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-1 col-md-12 doilaibtn pl-1">
									<a
										href="userbooking?id=${mytravel.getIdTravel() }&action=${mytravel.getTypeBus() }"
										class="btn btn-success"> Choose </a>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12  text-left ml-2 mb-2">
									<hr
										style="border-top: 1px solid rgba(13, 19, 13, 0.637); width: 95%; margin-bottom: 1rem;">
									<a style="color: #111; margin-left: 20px;" href="#"><img
										src="https://easycdn.blob.core.windows.net/images/bus/cid-3274-avigo.png">
										AVIGO • ${mytravel.getTypeBus()} ${mytravel.getTotalSeats()}
										chỗ </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</c:forEach>
		<c:choose>
			<c:when test="${error == null}">
				<div class="alert alert-danger" style="text-align: center;">There is not route from ${GO } to ${END }</div>
			</c:when>
		</c:choose>
	</div>
	<jsp:include page="-footer.jsp"></jsp:include>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script>
    let today = new Date().toISOString().substr(0, 10);
    document.querySelector("#from").value = today;
    document.querySelector("#to").value = today; 
        var dateToday = new Date();
        var dates = $("#from, #to").datepicker({
    changeMonth: true,
    showAnim: 'drop',
    minDate: dateToday,
    dateFormat: 'yy-mm-dd',
    onSelect: function(selectedDate) {
        var option = this.id == "from" ? "minDate" : "maxDate",
            instance = $(this).data("datepicker"),
            date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
        dates.not(this).datepicker("option", option, date);
    }
});
  </script>
</body>

</html>
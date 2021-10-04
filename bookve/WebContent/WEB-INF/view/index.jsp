<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<title>Book Fast</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>

<jsp:include page="customer/--css.jsp"></jsp:include>

</head>

<body>
	<jsp:include page="customer/-menu.jsp"></jsp:include>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" style="height: 600px;"
					src="style/Images/ban1.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h5>Hồ Chí Minh - Vũng Tàu</h5>
					<p>Chỉ 200.000vnd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="height: 600px;"
					src="style/Images/ban2.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h5>Hà Nội - Sơn La</h5>
					<p>Chỉ 300.000vnd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="height: 600px;"
					src="style/Images/ban3.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h5>Cần Thơ - Hồ Chí Minh</h5>
					<p>Chỉ 200.000vnd</p>
				</div>
			</div>
			<!-- --------------------------------------------------------------------------------------------------- -->
			<!-- -------------------------------------------search travel------------------------------------------- -->
			<!-- --------------------------------------------------------------------------------------------------- -->
			<div class="row carousel-caption" data-radio="khuhoi"
				style="height: 680px;">
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
									<div class="hop motchieu"></div>
									<div class="row searchdiadiem p-3">
										<div class="col-lg-11 text-left">
											<div class="row hop khuhoi">
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
														<div class="col-lg-2 col-md-2 doilai">
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
																<label for="form"> Departure</label> <input id="from"
																	class="form-control form-control-md" type="text"
																	name="nkh">
															</div>
														</div>
														<div class="col-lg-2 col-md-2 doilai">
															<div class="form-group">
																<i class="fas fa-angle-double-right"></i>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 diadiemphai" id="return">
															<div class="form-group">
																<label for="to"> Return</label> <input id="to"
																	class="form-control form-control-md" type="text"
																	name="nv">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-1 col-md-12 doilaibtn">
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
			<!-- ------------------------------------------------------------------------------------------------------- -->
			<!-- -------------------------------------------search travel END------------------------------------------- -->
			<!-- ------------------------------------------------------------------------------------------------------- -->
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="main-f">
		<div class="row text-center">
			<div class="col-lg-12 p-3">
				<h3 class="display-5">Các tuyến phổ biến</h3>
			</div>
		</div>
	</div>
	<div class="main-f">
		<div class="row">
			<div class=" col-lg-3 col-md-6 col-sm-12 the"
				style="border: 1px solid white;">
				<img src="style/Images/card1.jpg">
				<div class="info">
					<h1>
						<strong> Hồ Chí Minh - Đà Lạt</strong>
					</h1>
					<p>Hiện nay Đà Lạt đang là xu hướng của giới trẻ bởi vẻ thơ
						mộng cũng như không khi mát mẻ</p>
					<p>Gía vé : 220.000 vnd</p>
					<div>
						<form action="userFamousTravelServlet" method="post">
							<input style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PS" placeholder="Type Bus"
								value="TP.Hồ Chí Minh"> <input
								style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PF" placeholder="Type Bus" value="Đà Lạt">
							<button type="submit" class="btn btn-success">Đặt ngay</button>
						</form>
					</div>
				</div>
			</div>
			<div class=" col-lg-3 col-md-6 col-sm-12 the"
				style="border: 1px solid white;">
				<img src="style/Images/card2.png">
				<div class="info">
					<h1>
						<strong> Hồ Chí Minh - Đà Nẵng</strong>
					</h1>
					<p>Hiện nay Đà Nẵng đang là xu hướng của giới trẻ bởi vẻ thơ
						mộng cũng như không khi mát mẻ</p>
					<p>Gía vé : 320.000 vnd</p>
					<div>
						<form action="userFamousTravelServlet" method="post">
							<input style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PS" placeholder="Type Bus"
								value="TP.Hồ Chí Minh"> <input
								style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PF" placeholder="Type Bus" value="Đà Nẵng">
							<button type="submit" class="btn btn-success">Đặt ngay</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 col-sm-12 the"
				style="border: 1px solid white;">
				<img src="style/Images/card3.jpg">
				<div class="info">
					<h1>
						<strong> Hồ Chí Minh - Vũng Tàu</strong>
					</h1>
					<p>Hiện nay Vũng Tàu đang là xu hướng của giới trẻ bởi vẻ thơ
						mộng cũng như không khi mát mẻ</p>
					<p>Gía vé : 120.000 vnd</p>
					<div>
						<form action="userFamousTravelServlet" method="post">
							<input style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PS" placeholder="Type Bus"
								value="TP.Hồ Chí Minh"> <input
								style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PF" placeholder="Type Bus" value="Vũng Tàu">
							<button type="submit" class="btn btn-success">Đặt ngay</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 the"
				style="border: 1px solid white;">
				<img src="style/Images/card4.jpg">
				<div class="info">
					<h1>
						<strong> Hồ Chí Minh - Hội An</strong>
					</h1>
					<p>Hiện nay Hội An đang là xu hướng của giới trẻ bởi vẻ thơ
						mộng cũng như không khi mát mẻ</p>
					<p>Gía vé : 350.000 vnd</p>
					<div>
						<form action="userFamousTravelServlet" method="post">
							<input style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PS" placeholder="Type Bus"
								value="TP.Hồ Chí Minh"> <input
								style="border-width: 1px; border-radius: 4px; width: 100%"
								type="hidden" name="PF" placeholder="Type Bus" value="Hội An">
							<button type="submit" class="btn btn-success">Đặt ngay</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid padding mt-5">
		<div class="row welcome text-center">
			<div class="col-lg-12">
				<h3 class="display-8">Booking Bus Ticket Online</h3>
				<p>Được thành lập năm 2020, chúng tôi cung cấp các dịch vụ đặt
					chỗ vận chuyển tuyệt vời cho khách du lịch khắp Việt Nam. Khách du
					lịch giờ đây không cần rời khỏi nhà để xếp hàngtại phòng vé. Tại
					Việt Nam, quý khách có thể đặt vé trực tuyến chỉ trong vài phút!</p>
			</div>
			<div class="col-sm-12">
				<img class="img-fluid" src="style/Images/thequocte.gif">
			</div>
		</div>
		<hr class="my-3">
	</div>

	<section class="section-2 container-fluid p-0 pb-5">
		<div class="cover">
			<div class="content text-center">
				<h1>Some Features That Made Us Unique</h1>
			</div>
		</div>
		<div class="container-fluid text-center">
			<div
				class="number d-flex flex-md-row flex-wrap justify-content-center">
				<div class="inner-width">
					<div class="col">
						<i class="fas fa-route"></i>
						<div class="num">25</div>
						Bus route
					</div>
					<div class="col">
						<i class="fas fa-briefcase"></i>
						<div class="num">2</div>
						Services
					</div>

					<div class="col">
						<i class="fas fa-hands-helping"></i>
						<div class="num">15</div>
						Cooperation transport companies
					</div>

					<div class="col">
						<i class="fas fa-users"></i>
						<div class="num">100</div>
						Users
					</div>
				</div>
			</div>
		</div>
	</section>


	<jsp:include page="customer/-footer.jsp"></jsp:include>
	<!--  -->


	<jsp:include page="customer/--js.jsp"></jsp:include>

	<script type="text/javascript">
		$('.num').counterUp({
			delay : 10,
			time : 2000
		});
	</script>
	<script>
		let today = new Date().toISOString().substr(0, 10);
		document.querySelector("#from").value = today;
		document.querySelector("#to").value = today;
		var dateToday = new Date();
		var dates = $("#from, #to")
				.datepicker(
						{
							changeMonth : true,
							showAnim : 'drop',
							minDate : dateToday,
							dateFormat : 'yy-mm-dd',
							onSelect : function(selectedDate) {
								var option = this.id == "from" ? "minDate"
										: "maxDate", instance = $(this).data(
										"datepicker"), date = $.datepicker
										.parseDate(
												instance.settings.dateFormat
														|| $.datepicker._defaults.dateFormat,
												selectedDate, instance.settings);
								dates.not(this).datepicker("option", option,
										date);
							}
						});
	</script>
</body>

</html>
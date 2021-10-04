<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <title>Book Fast - Details</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="style/css/detailbooking.css">
    <link rel="stylesheet" href="style/fontawesome-free-5.13.1-web/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<link rel="stylesheet" href="style/css/buslist.css">
<jsp:include page="--css.jsp"></jsp:include>
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
    <div class="container">
        <div class="box animate__animated animate__backInLeft">
            <h2> Thông tin khởi hành</h2><br>
            <p> Ngày khởi hành: ${form }</p>
            <c:choose>
            <c:when test="${TT == 'Round-trip' }">
            <p> Ngày ve: ${to }</p>
            </c:when>
            </c:choose>
            <p> Khởi hành từ: ${PS }</p>
            <p> Đến: ${PF }</p>
            <p> Xe Buýt: <img style="width: 80px;" src="/Images/brandname.png"></p>
        </div>
        <div class="box animate__animated animate__backInDown ">
            <h2> Hình thức Thanh toán</h2><br>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1"
                    checked>
                <label class="form-check-label" for="exampleRadios1"><img src="style/Images/iconpay.png">
                    Ví điện tử Momo
                </label>
            </div>
            <hr>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                <label class="form-check-label" for="exampleRadios2">
                    <img src="style/Images/iconpay3.png">
                    <img src="style/Images/iconpay2.png">
                    <img src="style/Images/iconpay4.jpg">
                    <img src="style/Images/iconpay5.jpg">
                    <br>
                    Ví điện tử ZaloPay/Thẻ ATM nội địa/Internetbanking và thẻ Visa & Mastercard.
                </label>
            </div>
            <hr>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option3">
                <label class="form-check-label" for="exampleRadios2"><img src="style/Images/iconpay4.jpg">
                    Thẻ ATM nội địa
                </label>
            </div>
        </div>
        <div class="box animate__animated animate__backInRight boxchinh">
            <h2> Kiểm tra lại thông tin trước khi thanh toán.</h2><br>
            <p> 1.Số lượng vé: ${numberSeat }</p>
            
            <p> 2.Tổng tiền: <fmt:formatNumber type="number" groupingUsed="true" value="${Totalmoney }" /> VND</p>
            <div class="btn ">
            <form action="userPay" method="post">
            	<input type="hidden" name="seat" value="${NSeat }"> 
				<input type="hidden" name="lastname" value="${lastname }">
				<input type="hidden" name="name" value="${name }">
				<input type="hidden" name="mail" value="${mail }">
				<input type="hidden" name="phone" value="${phone }">
									
				<input type="hidden" name="id" value="${id }">
				<input type="hidden" name="TBus" value="${TBus }">
				<input type="hidden" name="NBus" value="${NBus }">
				<input type="hidden" name="fontP" value="${fontP }">
				<input type="hidden" name="midP" value="${midP }">
				<input type="hidden" name="lastP" value="${lastP }">
				<input type="hidden" name="RS" value="${RS }">
				<input type="hidden" name="PS" value="${PS }">
				<input type="hidden" name="PF" value="${PF }">
				<input type="hidden" name="TT" value="${TT }">
                <button type="submit" class="btn btn-success">Thanh Toán Ngay</button>
            </form>
            </div>
        </div>
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
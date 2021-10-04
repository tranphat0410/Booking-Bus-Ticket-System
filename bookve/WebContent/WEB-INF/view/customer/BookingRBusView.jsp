<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
    <title>Book Fast - Booking</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="style/css/bookingroyal.css">
    <link rel="stylesheet" href="style/fontawesome-free-5.13.1-web/css/all.min.css">
</head>

<body>
	<%
		if (session.getAttribute("unameCustomer") == null) {
		response.sendRedirect("login");
	}
	%>
    <jsp:include page="-menu.jsp"></jsp:include>
    <article>
        <section>
            <div style="width: 85%" class="row mx-auto">

                <div class="col-lg-8 mt-3 mb-3">
                    <div class="row">
                        <!-------------------------Type Bus----------------------------------->
                        <div class="col-lg-6 mx-auto text-center">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h5><span>Type Bus: </span></h5>
                                </div>
                            </div>
                            <div class="col-lg-12 mt-1 mb-2">
                                <marquee behavior="alternate" direction="">
                                    <a style="color: gold; font-size: 40px;"><i class="fas fa-bus-alt"></i> Royal <i class="fas fa-bus-alt"></i></a>
                                </marquee>
                            </div>
                        </div>
                    </div>
                    <!--------------------------------------------------------------------->

                    <!---------------------Number Bus--------------------------------------->
                    <div class="row mt-2">
                        <div class="col-lg-6">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Seat :</div>
                                </div>
                                <input type="text" class="form-control" id="seat" placeholder="None...">
                            </div>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">VND :</div>
                                </div>
                                <input type="text" class="form-control" id="money" placeholder="0">
                            </div>
                            
                        </div>
                        <!---------------------------------------------------------------------->

                        <!------------------------------Type trip----------------------------------------->
                        <div class="col-lg-6">
                            <div class="find"
                                style="background: linear-gradient(to right, green,yellow); text-align: center;height: 40px; padding: 7px;">
                                <a class="pick text-white">
                                    Please choose one or more seat in this bus
                                    <i class="fas fa-angle-double-right"></i>
                                    <i class="fas fa-angle-double-right"></i>
                                    <i class="fas fa-angle-double-right"></i>
                                </a>
                            </div>
                            <button onclick="getvalue2();" class="btn text-white mt-1" 
                            style="background: linear-gradient(to right, rgb(236, 21, 21), rgb(236, 91, 98));"> 
                            DELETE TICKET</button>
                        </div>
                    </div>
                    <div class="main mt-3">
                        <div class="box">
                        	<c:forEach items="${travels}" var="travel">
                            <h4> Thông tin khởi hành</h4><br>
                            <p> Ngày khởi hành: <fmt:formatDate type="date" value="${travel.getTime()}" /></p>
                            <c:choose>
                				<c:when test="${travel.getTypeTravel() == 'Round'}">
                					<p>Ngày về: <fmt:formatDate type="date" value="${travel.getTimeout()}" /></p>
                				</c:when>
                			</c:choose>
                            <p> Khởi hành từ: ${travel.getPlaceStart() }</p>
                            <p> Đến: ${travel.getPlaceFinish()}</p>
                            <p> Xe Buýt: ${travel.getNumberBus()}</p>
                            
                            </c:forEach>
                        </div>
                    </div>
                	<c:forEach items="${travels}" var="travel">
                	<c:forEach items="${unameCustomer}" var="user"> 
                    <div class="row mt-3">
                        <div class="col-lg-3 ">
									<form action="home" method="post">
									<input type="hidden" name="nut"
											value="${travel.getTypeTravel()}"> 
									<input type="hidden" name="PS"
											value="${travel.getPlaceStart()}"> 
									<input type="hidden" name="PF"
											value="${travel.getPlaceFinish()}"> 
									<input type="hidden" name="nkh"
											value="${travel.getTime()}"> 
									<input type="hidden" name="nv"
											value="${travel.getTimeout()}"> 
									<button type="submit" class="btn text-white"
											style="background: linear-gradient(to right, rgb(236, 21, 21), rgb(236, 91, 98));"><i
											class="far fa-arrow-alt-circle-left"></i> Back</button>
									</form>
								</div>
								<div class="col-lg-9 ">
									<form action="userbooking" method="post">
										<input type="hidden" name="seat" id="seat2"> 
									<input type="hidden" name="lastname" value="${user.getLastname()}">
									<input type="hidden" name="name" value="${user.getName()}">
									<input type="hidden" name="mail" value="${user.getEmail()}">
									<input type="hidden" name="phone" value="${user.getPhone()}">
									
									<input type="hidden" name="id" value="${travel.getIdTravel()}">
									<input type="hidden" name="TBus" value="${travel.getTypeBus()}">
									<input type="hidden" name="NBus" value="${travel.getNumberBus()}">
									<input type="hidden" name="P" value="0">
									<input type="hidden" name="fontP" value="${travel.getPriceFront()}">
									<input type="hidden" name="midP" value="${travel.getPriceMiddle()}">
									<input type="hidden" name="lastP" value="${travel.getPriceLast()}">
									<input type="hidden" name="RS" value="${travel.getResidualSeats()}">
									<input type="hidden" name="PS" value="${travel.getPlaceStart()}">
									<input type="hidden" name="PF" value="${travel.getPlaceFinish()}">
									<input type="hidden" name="TT" value="${travel.getTypeTravel()}">
									<input type="hidden" name="form" value="${travel.getTime()}">
									<input type="hidden" name="to" value="${travel.getTimeout()}">
									<input type="hidden" name="numberSeat" class="form-control" id="seat3">
									<input type="hidden" name="Totalmoney" class="form-control" id="money2">

										<button type="submit" class="btn text-white"
											style="background: linear-gradient(to right, green, rgb(70, 202, 70));">
											Confirm and Next <i class="far fa-arrow-alt-circle-right"></i>
										</button>
									</form>
								</div>
                    </div>
                    </c:forEach>
                    </c:forEach>
                </div>
                <div id="myDIV3" style="width: 400px;" class="mb-4 mt-2 ml-3">
                    <div style="color: yellow;font-size: larger" class="row">
                        <div style="margin-left: 16%;" class="light">
                            <i class="fas fa-map-marker"></i><i class="fas fa-map-marker"></i>
                        </div>
                        <div style="margin-left: 53%;" class="light">
                            <i class="fas fa-map-marker"></i><i class="fas fa-map-marker"></i>
                        </div>
                    </div>
                    <div style="border-top-left-radius: 80px;border-top-right-radius: 80px" class="card border">
                        <div style="color:white;background-color: gold;border-top-left-radius: 80px;border-top-right-radius: 80px"
                            class="card-header text-center">Type Bus: Royal</div>
                        <div style="background-color: #FFFFE0;" class="card-body">
                            <h5 class="card-title text-center">Number: </h5>
                            <div class="row">
                                <div style="margin-left:5%;" class="driver">
                                    <i style="color:#006400;font-size:x-large; margin-left: 5px;"
                                        class="fas fa-couch"></i>
                                    <p>Driver</p>
                                </div>
                                <div style="margin-left:70%;" class="exit">
                                    <i style="color: red;font-size:x-large" class="fas fa-door-open"></i>
                                    <p>EXIT</p>
                                </div>
                            </div>
                            <div style="border-radius: 5px;background-color: Gainsboro;border-style: double;width: 100%; text-align: center;"
                                class="row mt-3 m-auto">
                                <div class="col-lg-6">
                                    <i class="fas fa-couch"> N/A</i>
                                </div>
                                <div class="col-lg-6">
                                    <i style="color: brown;" class="fas fa-couch"></i> <span>Selected</span>
                                </div>
                            </div>
                            <!--Front row------------------------------------------------------------------->
                            <div style="border-top-style: dotted;" class="row text-center mt-3">
                                <div class="chair ml-4 mt-3">
                                    <%
											int f;
										for (int i = 1; i <= 3; i += 2) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: x-large;"></i>
												<p style="font-size: x-large; color: brown;">
													F0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<c:forEach items="${travels}" var="travel">
										<a href="#" onclick="getvalue(this, ${travel.getPriceFront()})"
										id="f<%=String.valueOf(i)%>" class="btncolor"><i
										class="fas fa-couch" style="font-size: x-large;"></i>
										<p style="font-size: x-large;">
											F0<%=String.valueOf(i)%></p></a>
									</c:forEach>

									<%
											}
										%>
									<%
											}
										%>
                                </div>
                                <div class="typerow mx-auto mt-3">
                                    <p>Front row</p>
                                </div>
                                <div class="chair mr-4 mt-3">
                                    <%
										for (int i = 2; i <= 4; i += 2) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: x-large;"></i>
												<p style="font-size: x-large; color: brown;">
													F0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<c:forEach items="${travels}" var="travel">
										<a href="#" onclick="getvalue(this, ${travel.getPriceFront()})"
										id="f<%=String.valueOf(i)%>" class="btncolor"><i
										class="fas fa-couch" style="font-size: x-large;"></i>
										<p style="font-size: x-large;">
											F0<%=String.valueOf(i)%></p></a>
									</c:forEach>

									<%
											}
										%>
									<%
											}
										%>
                                </div>
                            </div>
                            <!--Center row--------------------------------------------------------------------->
                            <div class="row text-center mt-3">
                                <div class="chair ml-4 mt-3">
                                    <%
										for (int i = 1; i <= 3; i += 2) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: x-large;"></i>
												<p style="font-size: x-large; color: brown; ">
													C0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<c:forEach items="${travels}" var="travel">
										<a href="#" onclick="getvalue(this, ${travel.getPriceFront()})"
										id="f<%=String.valueOf(i)%>" class="btncolor"><i
										class="fas fa-couch" style="font-size: x-large;"></i>
										<p style="font-size: x-large;">
											C0<%=String.valueOf(i)%></p></a>
									</c:forEach>

									<%
											}
										%>
									<%
											}
										%>
                                </div>
                                <div class="typerow mx-auto mt-3">
                                    <p>Center row</p>
                                </div>
                                <div class="chair mr-4 mt-3">
                                    <%
										for (int i = 2; i <= 4; i += 2) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: x-large;"></i>
												<p style="color: brown;font-size: x-large;">
													C0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<c:forEach items="${travels}" var="travel">
										<a href="#" onclick="getvalue(this, ${travel.getPriceFront()})"
										id="f<%=String.valueOf(i)%>" class="btncolor"><i
										class="fas fa-couch" style="font-size: x-large;"></i>
										<p style="font-size: x-large;">
											C0<%=String.valueOf(i)%></p></a>
									</c:forEach>

									<%
											}
										%>
									<%
											}
										%>
                                </div>
                            </div>
                            <!-----------------------------------------------Last row--------------------------->
                            <div class="row text-center mt-3">
                                <div class="chair ml-4 mt-3">
                                    <%
										for (int i = 1; i <= 3; i += 2) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: x-large;"></i>
												<p style="color: brown;font-size: x-large;">
													L0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<c:forEach items="${travels}" var="travel">
										<a href="#" onclick="getvalue(this, ${travel.getPriceFront()})"
										id="f<%=String.valueOf(i)%>" class="btncolor" style="font-size: x-large;"><i
										class="fas fa-couch"></i>
										<p style="font-size: x-large;">
											L0<%=String.valueOf(i)%></p></a>
									</c:forEach>

									<%
											}
										%>
									<%
											}
										%>
                                </div>
                                <div class="typerow mx-auto mt-3">
                                    <p>Last row</p>
                                </div>
                                <div class="chair mr-4 mt-3">
                                    <%
										for (int i = 2; i <= 4; i += 2) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: x-large;"></i>
												<p style="font-size: x-large; color: brown;">
													L0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<c:forEach items="${travels}" var="travel">
										<a href="#" onclick="getvalue(this, ${travel.getPriceFront()})"
										id="f<%=String.valueOf(i)%>" class="btncolor"><i
										class="fas fa-couch" style="font-size: x-large;"></i>
										<p style="font-size: x-large;">
											L0<%=String.valueOf(i)%></p></a>
									</c:forEach>

									<%
											}
										%>
									<%
											}
										%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---------------------------------------------------------------------------------------->
            </div>
        </section>
    </article>
    <footer class="page-footer" style="background-color: black; margin-top: 30px;">
        <div class="mau" style="background: linear-gradient( to right, rgba(4, 77, 32),yellow)">
            <div class="container">
                <div class="row-py-4 d-flex align-item-center">
                    <div class="col-md-12 text-center p-3">
                        <a href=" #" class="fab fa-facebook-square text-white mr-5">
                        </a>
                        <a href="#" class="fab fa-instagram text-white mr-5">
                        </a>
                        <a href="#" class="fab fa-youtube text-white mr-5">
                        </a>
                        <a href="#" class="fab fa-twitter-square text-white mr-5"></a>
                        <a href="#" class="far fa-paper-plane text-white mr-5"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container text-center text-md-left mt-5">
            <div class="row">
                <div class="col-md-3 mx-auto mb-4">
                    <h6 class="text-uppercase font-weight-bold text-white"> Trang Chủ</h6>
                    <hr class="bg-success mb-4 mt-0 d-inline-block mx-auto" style="width:125px;height:2px">
                    <a href="#" style="color: white;">
                        <li> Về Chúng Tôi</li>
                    </a>
                    <a href="#" style="color: white;">
                        <li> Hướng Dẫn Đặt Vé</li>
                    </a>
                    <a href="#" style="color: white;">
                        <li> Tin mới nhất</li>
                    </a>
                </div>
                <div class="col-md-3 mx-auto mb-4">
                    <h6 class="text-uppercase font-weight-bold text-white">Tuyến Bus Phổ Phiến</h6>
                    <hr class="bg-success mb-4 mt-0 d-inline-block mx-auto" style="width:125px;height:2px">
                    <a href="#" style="color: white;">
                        <li> Hồ Chí Minh đến Đà Lạt</li>
                    </a>
                    <a href="#" style="color: white;">
                        <li> Hồ Chí Minh đến Phan Thiết</li>
                    </a>
                    <a href="#" style="color: white;">
                        <li> Hồ Chí Minh đến Hà Nội</li>
                    </a>
                    <a href="#" style="color: white;">
                        <li> Hồ Chí Minh đến Vũng Tàu</li>
                    </a>
                    <a href="#" style="color: white;">
                        <li> Hồ Chí Minh đến Sơn La</li>
                    </a>
                </div>
                <div class="col-md-3 mx-auto mb-4 text-white">
                    <h6 class="text-uppercase font-weight-bold text-white"> Liên Hệ Với Chúng Tôi</h6>
                    <hr class="bg-success mb-4 mt-0 d-inline-block mx-auto" style="width:125px;height:2px">
                    <p><i class="fa fa-envelope " aria-hidden="true"></i> letheduc0812@gmail.com</p>
                    <p><i class="fa fa-map-marker " aria-hidden="true"></i> Hoang Hoa Tham Street, Ho Chi Minh City,
                        Viet
                        Nam</p>
                    <p><i class="fa fa-phone " aria-hidden="true"></i> 1111-2222-3333</p>
                </div>
            </div>
        </div>
    </footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <script type="text/javascript">
        function getvalue(element, money)
        {
        	var ghe = element.innerText;
        	var getmoney = money;
        	
        	if (document.getElementById("seat").value == "" && document.getElementById("seat2").value == "") {
                document.getElementById("seat").value = ghe;
                document.getElementById("seat2").value = ghe;
                document.getElementById("seat3").value = ghe;
                document.getElementById("money").value = money;
                document.getElementById("money2").value = money;
                element.style.color = "red";
            }
            else {
                if (document.getElementById("seat").value.indexOf(ghe) == -1 && document.getElementById("seat2").value.indexOf(ghe) == -1) {
                    document.getElementById("seat").value += "," + ghe;
                    document.getElementById("seat2").value +=  ghe;
                    document.getElementById("seat3").value += "," + ghe;
                    var moremoney = parseInt(document.getElementById("money").value);
                    moremoney += getmoney;
                    document.getElementById("money").value = moremoney;
                    document.getElementById("money2").value = moremoney;
                    element.style.color = "red";
                }
                else {
                    var test = (document.getElementById("seat").value.replace(ghe, '') + "," + ghe).replace(',,', ',');
                    if (test.indexOf(',') == 0) {
                        document.getElementById("seat").value = test.slice(1, test.length);
                    }
                    else {
                        document.getElementById("seat").value = test;
                    }
                }
            }
            
        }
        </script>
        <script type="text/javascript">
        function getvalue2()
        {
        	if(confirm('Do you really want to delete ticket ?')){
        	var NodeObject = document.getElementsByClassName("demo");
        	var color = document.getElementsByClassName("btncolor");
        	document.getElementById("seat").value = "";
            document.getElementById("seat2").value = "";
            document.getElementById("seat3").value = "";
            document.getElementById("money").value = "";
            document.getElementById("money2").value = "";
            for(var i = 0; i < 37; i++){color[i].style.color = "black";}
        	}
            
        }
        </script>
</body>

</html>
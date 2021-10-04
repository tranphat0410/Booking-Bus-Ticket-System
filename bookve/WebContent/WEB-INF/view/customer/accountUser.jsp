<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<title>Information account</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style/css/inforaccount.css">
<link rel="stylesheet"
	href="/fontawesome-free-5.13.1-web/css/all.min.css">
</head>
<style>
.my-custom-scrollbar {
	position: relative;
	height: 300px;
	overflow-x: auto;
}

.table-wrapper-scroll-y {
	display: block;
}
</style>
<body>
	<%
		if (session.getAttribute("unameCustomer") == null) {
		response.sendRedirect("login");
	}
	%>
	<jsp:include page="-menu.jsp"></jsp:include>

	<div style="width: 100%; height: 100%;" class="row">
		<div class="col-md-2">
			<div class="list">
				<button onclick="myFunction1()"
					style="width: 100%; border: none; color: white; background: rgb(27, 77, 27)">
					<i class="fas fa-info-circle"> Account</i>
				</button>
				<br> <br>
				<button onclick="myFunction2()"
					style="width: 100%; border: none; color: white; background: rgb(27, 77, 27)">
					<i class="fas fa-user-edit"> Change Account</i>
				</button>
			</div>
		</div>
		<div id="myDIV1" style="height: 100%; display: block;"
			class="col-md-10 mt-4">
			<div class="row">
				<div class="col-md-4 mt-2">
					<div class="title">
						<p>Information account</p>
					</div>
					<div class="box">
						<div class="infor">
							<c:forEach items="${unameCustomer}" var="account">
								<div class="lable">
									<div class="textlable">
										<p>Name:</p>
										<p>Last Name:</p>
										<p>Phone:</p>
										<p>Mail:</p>
										<p>Area:</p>
									</div>
								</div>
								<div class="value">

									<div class="textvalue">
										<p>${account.getName()}</p>
										<p>${account.getLastname()}</p>
										<p>${account.getPhone()}</p>
										<p>${account.getEmail()}</p>
										<p>${account.getArea()}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-md-8 mt-2">
					<div class="title">
						<p>Booking history
						<p>
					</div>
					<div class="boxticket ">
						<table id=""
							class="table table-wrapper-scroll-y my-custom-scrollbar"
							style="font-size: small; width: 100%;">

							<tr style="background-color: green; color: white" class="sticky">
								<th style="padding: 1%; width: 13%;" scope="col">Type Bus</th>
								<th style="padding: 1%;" scope="col">Number Bus</th>
								<th style="padding: 1%;" scope="col">Number Seat</th>
								<th style="padding: 1%; width: 13%;" scope="col">Price</th>
								<th style="padding: 1%;" scope="col">Start</th>
								<th style="padding: 1%;" scope="col">Finish</th>
								<th style="padding: 1%; width: 15%;" scope="col">Date
									Booking</th>
								<th style="padding: 1%" scope="col">Type Travel</th>
								<th class="text-center" scope="col">Option</th>
							</tr>

							<c:forEach items="${Seat }" var="Seats">
								<tr>
									<td style="padding: 1%">${Seats.getTypebus() }</td>
									<td style="padding: 1%">${Seats.getNumberbus() }</td>
									<td style="padding: 1%">${Seats.getNumberseat() }</td>
									<td style="padding: 1%"><fmt:formatNumber type="number"
											groupingUsed="true" value="${Seats.getPrice()}" /></td>
									<td style="padding: 1%">${Seats.getPlacestart() }</td>
									<td style="padding: 1%">${Seats.getPlacefinish() }</td>
									<td style="padding: 1%">${Seats.getDatebooking() }</td>
									<td style="padding: 1%">${Seats.getTypetravel() }</td>
									<td class="text-right">
										<form action="userDeleteTicket" method="post">
											<input type="hidden" value="${Seats.getIdtravel()}" name="idTravel"> 
											<input type="hidden" value="${Seats.getIdbook()}" name="idTicket">
											<c:forEach items="${unameCustomer}" var="account">
												<input type="hidden" value="${account.getEmail()}"
													name="mail">
											</c:forEach>
											<button type="submit"
												class="btn btn-danger btn-fill pull-rightr"
												onclick="return confirm('Do you really want to delete ticket ?');">
												<i class="fa fa-times-circle" aria-hidden="true"></i> Delete
											</button>


										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="next">
						<button onclick="myFunction2()" class="btn text-white"
							style="margin-top: 15px; background: linear-gradient(to right, green, rgb(70, 202, 70));">
							Change Information <i class="far fa-arrow-alt-circle-right"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="myDIV2" style="height: 100%; display: none;"
			class="col-md-10 mt-4">
			<div class="boxupdate">
				<div class="titleupdate">
					<p>Update account
					<p>
				</div>
				<form action="userAccount" method="post" class="row">
					<c:forEach items="${unameCustomer}" var="account">
						<div class="col-lg-12">
							<input name="id" value="${account.getIduser()}" type="hidden">
							<div style="font-size: smaller;" class="row">
								<div class="col-md-6">
									<label>NAME</label> <input
										style="border-width: 1px; border-radius: 4px; width: 100%"
										class="form-control" type="text" name="name"
										placeholder="Name" value="${account.getName()}">
								</div>
								<div class="col-md-6">
									<label>LAST NAME</label> <input
										style="border-width: 1px; border-radius: 4px; width: 100%"
										class="form-control" type="text" name="lastname"
										placeholder="Last Name" value="${account.getLastname()}">
								</div>
							</div>
						</div>
						<div style="font-size: smaller;" class="col-lg-12 mt-3">
							<div class="row">
								<div class="col-md-6">
									<label>PHONE</label> <input
										style="border-width: 1px; border-radius: 4px; width: 100%"
										class="form-control" type="text" name="phone"
										placeholder="Phone" value="${account.getPhone()}">
								</div>
								<div class="col-md-6">
									<label>AREA</label> <input
										style="border-width: 1px; border-radius: 4px; width: 100%"
										class="form-control" type="text" name="area"
										placeholder="Area" value="${account.getArea()}">
								</div>
							</div>
						</div>
						<div style="font-size: smaller;" class="col-lg-12 mt-3">
							<label>EMAIL</label> <input type="hidden" name="mail"
								placeholder="Email" value="${account.getEmail()}"> <input
								style="border-width: 1px; border-radius: 4px; width: 100%"
								class="form-control" type="email" name="mail"
								placeholder="Email" value="${account.getEmail()}" disabled>
						</div>
						<div style="font-size: smaller;" class="col-lg-12 mt-3">

							<input type="hidden" name="oldpass"
								value="${account.getPassword()}">
						</div>
						<div style="font-size: smaller;" class="col-lg-12 mt-3">
							<label>Enter Password Again</label> <input
								style="border-width: 1px; border-radius: 4px; width: 100%"
								type="password" class="form-control" name="nhappass"
								placeholder="Password">
						</div>
						<div style="font-size: smaller;" class="col-lg-12 mt-3">
							<div class="row">
								<div class="col-lg-6">
									<label>NEW PASSWORD</label> <input
										style="border-width: 1px; border-radius: 4px; width: 100%"
										type="password" class="form-control" name="pass" id="PW"
										onkeyup='check();' placeholder="New Password">
								</div>
								<div class="col-lg-6">
									<label>CONFIRM PASSWORD</label> <input
										style="border-width: 1px; border-radius: 4px; width: 100%"
										class="form-control" type="password" id="PWA"
										onkeyup='check();' name="passagain"
										placeholder="Confirm Password"> <span class="mx-auto"
										id="message"> </span>
								</div>
							</div>
						</div>
						<div class="update">
							<button type="submit" class="btn text-white"
								style="margin-top: 15px; background: linear-gradient(to right, green, rgb(70, 202, 70));">

								<i class="fas fa-user-edit"></i> Update
							</button>
						</div>
					</c:forEach>
				</form>
			</div>
		</div>
	</div>
	<script>
        function myFunction1() {
            var x1 = document.getElementById('myDIV1');
            var x2 = document.getElementById('myDIV2');
            if (x1.style.display === 'none') {
                x1.style.display = 'block';
                x2.style.display = 'none';
            }
        }
        function myFunction2() {
            var x1 = document.getElementById('myDIV1');
            var x2 = document.getElementById('myDIV2');
            if (x2.style.display === 'none') {
                x2.style.display = 'block';
                x1.style.display = 'none'
            } else {
                x1.style.display = 'none';
                x2.style.display = 'block';
            }
        }
    </script>
	<jsp:include page="-footer.jsp"></jsp:include>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
    function check() {
        if (document.getElementById('PW').value == document
            .getElementById('PWA').value) {
            document.getElementById('message').innerHTML = '';
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'Passwords dont match ';
        }
    }
</script>

</body>

</html>
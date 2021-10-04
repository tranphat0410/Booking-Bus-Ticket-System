<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>Book Fast - Login and Sign up</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <link rel="stylesheet" href="style/css/signinandupp.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css">
</head>

<body>
	<%
		if (session.getAttribute("unameSeller") != null) {
		response.sendRedirect("listseller");
	}
	%>
	<%
		if (session.getAttribute("unameAdmin") != null) {
		response.sendRedirect("listuser");
	}
	%>
	<%
		if (session.getAttribute("unameCustomer") != null) {
		response.sendRedirect("home");
	}
	%>
    <div class="container-f">
        <div class="row">
            <div class="col-md-6 mx-auto p-0 animate__animated animate__backInLeft" style="margin: 5% 5%;">
                <div class="card">
                    <div class="login-box">
                        <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in"
                                checked><label for="tab-1" class="tab">Login</label> <input id="tab-2" type="radio"
                                name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                            <div class="login-space animate__animated animate__backInDown animate__delay-1s">
                                <div class="login">
                                <form action="login" method="post">
                                    <div class="group "> <label for="user" class="label">Your Gmail</label> <input
                                            id="user" type="text" class="input" placeholder="Enter your gmail" name="mail">
                                    </div>
                                    <div class="group"> <label for="pass" class="label">Password</label> <input
                                            id="pass" type="password" class="input" data-type="password"
                                            placeholder="Enter your password" name="pass"> </div>
                                    <div class="group"> <input type="submit" class="button" value="Sign In"> </div>
                                    
                                    
                                    </form>
                                </div>
                                <div class="sign-up-form ">
                                	<form action="userSignUpServlet" method="post">
                                	<div class="group"> <label for="user" class="label">Last name</label> <input
                                            id="user" type="text" class="input" name="lname" placeholder="Create your Username">
                                    </div>
                                    <div class="group"> <label for="user" class="label">User name</label> <input
                                            id="user" type="text" class="input" name="uname" placeholder="Create your Username">
                                    </div>
                                    <div class="group"> <label for="pass" class="label">Email Address</label> <input
                                            id="mail" type="text" class="input" name="Cmail" placeholder="Enter your email address">
                                    </div>
                                    <div class="group"> <label for="pass" class="label">Phone</label> <input
                                            id="mail" type="text" class="input" name="Cphone" placeholder="Enter your email address">
                                    </div>
                                    <div class="group"> <label class="label">Password</label> <input
                                            name="Npass" id="PW" onkeyup='check();'  type="password" class="input" data-type="password"
                                            placeholder="Create your password"required> </div>
                                    <div class="group"> <label class="label">Repeat Password</label> <input
                                            name="Npassagain" id="PWA" onkeyup='check();' type="password" class="input" data-type="password"
                                            placeholder="Repeat your password" required>
                                            <span class="mx-auto" id="message"> </span> 
                                            </div>
                                    <div class="group"> <label for="user" class="label">Area</label> <input
                                            id="user" type="text" name="Carea" class="input" placeholder="Create your Username">
                                    </div>
                                    <div class="group"> <input type="submit" class="button" value="Sign Up"> </div>
                                    
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="customer/--js.jsp"></jsp:include>
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
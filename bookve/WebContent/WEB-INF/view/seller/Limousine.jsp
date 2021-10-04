<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div id="myDIV1" style="display: block;" class="ml-4 mb-4 mt-2">
        <div style="text-align: center;" class="chassit">
            <span><i class="fas fa-map-marker" id="light"></i></span>
            <span><i class="fas fa-map-marker" id="light"></i></span>
            <span><i class="fas fa-map-marker" id="light"></i></span>
            <span><i class="fas fa-map-marker" id="light"></i></span>
            <div class="card-header" id="typebus">
                <p>Type Bus: Normal</p>
            </div>
            <div class="inforbus" id="inforbus">
                <div>
                    <h6 style="padding-top: 1%;" class="card-title">Number: </h6>
                    <i class="fas fa-couch" id="driver"></i>
                    <i class="fas fa-door-open" id="door"></i>
                </div>
                <br>
                <br>
                <div style="padding-bottom: 2%;">
                    <span id="textdriver">Driver</span>
                    <span id="textdoor">EXIT</span>
                </div>
                <br>
                <div style="border-style: double;"></div>
                <div style="padding-top: 3%;padding-bottom: 1%;">
				<div
					style="border-radius: 5px; background-color: Gainsboro; border-style: double;width:75%; margin: auto; margin-bottom: 20px"
					class="row w-75">
					<div class="trai">
						<i class="fas fa-couch"> N/A</i>
					</div>
					<div class="phai">
						<i style="color: brown;" class="fas fa-couch"></i> <span>Selected</span>
					</div>
				</div>
				<!-- ---------------------------------------------------------------Frontrow------------------------------------------------------------------ -->
                    <div class="Frontrow">
                    	<div style="width: 100%; text-align: center;">
                	        <h5>Front row</h5>
                        </div>
                        <div class="trai">
                            <div class="ghele">
                                <%
											int f;
										for(int i =1; i<= 4; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													F0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									F0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                        </div>
                        <div class="giua">
                        	<%
										for(int i =2; i<= 5; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													F0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									F0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                        </div>
                        <div class="phai">
                            <div class="ghele">
                                <%
										for(int i =3; i<= 6; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													F0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									F0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                        </div>
                    </div>
                    <hr>
                <!-- ---------------------------------------------------------------Frontrow------------------------------------------------------------------ -->
                
                <!-- ---------------------------------------------------------------Centerrow----------------------------------------------------------------- -->
                    <div class="Centerrow">
                    	<div style="width: 100%; text-align: center;">
                	        <h5>Center row</h5>
                        </div>
                        <div class="trai">
                            <div class="ghele">
                                <%
										for(int i =1; i<= 4; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													C0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									C0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                        </div>
                        <div class="giua">
                        	<%
										for(int i =2; i<= 5; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													C0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									C0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                        </div>
                        <div class="phai">
                            <div class="ghele">
                                <%
										for(int i =3; i<= 6; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													C0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									C0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                        </div>
                    </div>
                    <hr>
                <!-- ---------------------------------------------------------------Centerrow----------------------------------------------------------------- -->
                
                <!-- ---------------------------------------------------------------Lastrow------------------------------------------------------------------- -->
                    <div class="Lastrow">
                    	<div style="width: 100%; text-align: center;">
                	        <h5>Last row</h5>
                        </div>
                       	<div class="trai">
                            <div class="ghele">
                                <%
										for(int i =1; i<= 4; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													L0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									L0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                        </div>
                        <div class="giua">
                        	<%
										for(int i =2; i<= 5; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													L0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									L0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                        </div>
                        <div class="phai">
                            <div class="ghele">
                                <%
										for(int i =3; i<= 6; i += 3){f=0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: larger; color: brown;">
													L0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
									L0<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                        </div>
                    </div>
                <!-- ---------------------------------------------------------------Lastrow------------------------------------------------------------------- -->
                
                </div>
            </div>
        </div>
    </div>
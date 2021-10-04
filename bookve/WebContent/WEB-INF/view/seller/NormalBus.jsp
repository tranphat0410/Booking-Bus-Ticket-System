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
                        <div class="trai">
                            <div class="ghele">
                                <%
									for (int i = 1; i <= 9; i += 4) {
										int f1=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													f1 = 1;
												%>
												<i class="fas fa-couch" style="color: red;"></i>
												<p style="font-size: small; color: red;">
													F0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f1 == 0) {
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
                            <div class="ghechan">
                                 <%
                                 int f;
										for (int i = 2; i <= 6; i += 4) {
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
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
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
									<%
										for (int i = 10; i <= 10; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													F<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											F<%=String.valueOf(i)%></p>
									<%
											}
										%>
									<%
											}
										%>
                            </div>
                        </div>
                        <div class="giua">Front Row </div>
                        <div class="phai">
                            <div class="ghele">
                                <%
									for (int i = 3; i <= 7; i += 4) {
										int f1=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													f1 = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													F0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f1 == 0) {
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
										<%
										for (int i = 11; i <= 11; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													F<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											F<%=String.valueOf(i)%></p>
									<%
											}
										%>
									<%
											}
										%>
                            </div>
                            <div class="ghechan">
                                 <%
										for (int i = 4; i <= 8; i += 4) {
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
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
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
									<%
										for (int i = 12; i <= 12; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="F" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													F<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											F<%=String.valueOf(i)%></p>
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
                        <div class="trai">
                            <div class="ghele">
                                <%
									for (int i = 1; i <= 9; i += 4) {
										int f1=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													f1 = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													C0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f1 == 0) {
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
										<%
										for (int i = 13; i <= 13; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													C<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											C<%=String.valueOf(i)%></p>
									<%
											}
										%>
									<%
											}
										%>
                            </div>
                            <div class="ghechan">
                                 <%
										for (int i = 2; i <= 6; i += 4) {
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
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
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
									<%
										for (int i = 10; i <= 14; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													C<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											C<%=String.valueOf(i)%></p>
									<%
											}
										%>
									<%
											}
										%>
                            </div>
                        </div>
                        <div class="giua">Center Row </div>
                        <div class="phai">
                            <div class="ghele">
                                <%
									for (int i = 3; i <= 7; i += 4) {
										int f1=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													f1 = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													C0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f1 == 0) {
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
										<%
										for (int i = 11; i <= 15; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													C<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											C<%=String.valueOf(i)%></p>
									<%
											}
										%>
									<%
											}
										%>
                            </div>
                            <div class="ghechan">
                                 <%
										for (int i = 4; i <= 8; i += 4) {
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
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
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
									<%
										for (int i = 12; i <= 16; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="C" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													C<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											C<%=String.valueOf(i)%></p>
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
                        <div class="trai">
                            <div class="ghele">
                                <%
									for (int i = 1; i <= 9; i += 4) {
										int f1=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													f1 = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f1 == 0) {
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
                            <div class="ghechan">
                                 <%
										for (int i = 2; i <= 6; i += 4) {
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
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
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
									<%
										for (int i = 10; i <= 10; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											L<%=String.valueOf(i)%></p>
									<%
											}
										%>
									<%
											}
										%>
                            </div>
                        </div>
                        <div class="giua">Front Row </div>
                        <div class="phai">
                            <div class="ghele">
                                <%
									for (int i = 3; i <= 7; i += 4) {
										int f1=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L0" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													f1 = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L0<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (f1 == 0) {
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
										<%
										for (int i = 11; i <= 11; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											L<%=String.valueOf(i)%></p>
									<%
											}
										%>
									<%
											}
										%>
                            </div>
                            <div class="ghechan">
                                 <%
										for (int i = 4; i <= 8; i += 4) {
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
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
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
									<%
										for (int i = 12; i <= 12; i += 4) {
											f = 0;
										%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
														f = 1;
													%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
											if (f == 0) {
										%>
									<i class="fas fa-couch"></i>
										<p style="font-size: small;">
											L<%=String.valueOf(i)%></p>
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
                
                <!-- ---------------------------------------------------------------LSP----------------------------------------------------------------------- -->
                    <div class="LSP">
                        <div class="trai">
                            <div class="ghele">
                                <%
									for (int i = 13; i <= 13; i += 4) {
										int l=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													l = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (l == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
										L<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                            <div class="ghechan">
                                <%
									for (int i = 14; i <= 14; i += 4) {
										int l=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													l = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (l == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
										L<%=String.valueOf(i)%></p>
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
									for (int i = 17; i <= 17; i += 4) {
										int l=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													l = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (l == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
										L<%=String.valueOf(i)%></p>
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
									for (int i = 15; i <= 15; i += 4) {
										int l=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													l = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (l == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
										L<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                            <div class="ghechan">
                            	<%
									for (int i = 16; i <= 16; i += 4) {
										int l=0;
									%>
									<c:forEach items="${ticket}" var="tickets">
										<c:set var="check" value="${tickets.getNumberseat() }"></c:set>
										<c:set var="checked" value='<%="L" + String.valueOf(i)%>'></c:set>
										<c:choose>
											<c:when test="${checked == check}">
												<%
													l = 1;
												%>
												<i class="fas fa-couch" style="color: brown;font-size: larger;"></i>
												<p style="font-size: small; color: brown;">
													L<%=String.valueOf(i)%></p>
											</c:when>
										</c:choose>
									</c:forEach>
									<%
										if (l == 0) {
									%>
									<i class="fas fa-couch"></i>
									<p style="font-size: small;">
										L<%=String.valueOf(i)%></p>
										<%
											}
										%>
										<%
											}
										%>
                            </div>
                        </div>
                    </div>
                <!-- ---------------------------------------------------------------LSP----------------------------------------------------------------------- -->
                </div>
            </div>
        </div>
    </div>
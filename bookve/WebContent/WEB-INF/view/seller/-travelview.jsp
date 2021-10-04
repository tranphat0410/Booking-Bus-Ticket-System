<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${MyTravel != null}">
		<c:forEach items="${MyTravel}" var="mytravel">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Type Bus:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getTypeBus()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Total seats:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getTotalSeats()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Residual seats:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getResidualSeats()}</div>
						</div>
						<hr>
						<div class="row">
							<div style="text-align: center; ">
							<b>----Price----</b>
						</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Front row:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getPriceFront()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Middle row:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getPriceMiddle()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Last row:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getPriceLast()}</div>
						</div>
						<hr>
					</div>

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Number Bus:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getNumberBus()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Place start:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getPlaceStart()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Place finish:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getPlaceFinish()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Time:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getTime()}</div>
						</div>
						<hr>
						<c:choose>
							<c:when test="${mytravel.getTypeTravel() == 'Round-trip'}">
								<div class="row">
									<div
										style="width: 40%; float: left; text-align: left; margin-left: 20px;">
										<b> Time Out:</b>
									</div>
									<div style="width: 50%; float: right; text-align: left;">
										${mytravel.getTimeout()}</div>
								</div>
								<hr>
							</c:when>
						</c:choose>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>TypeTravel:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getTypeTravel()}</div>
						</div>
						<hr>
						<div class="row">
							<div
								style="width: 40%; float: left; text-align: left; margin-left: 20px;">
								<b>Status:</b>
							</div>
							<div style="width: 50%; float: right; text-align: left;">
								${mytravel.getStatus()}</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Type Bus:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Total seats:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Residual seats:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="text-align: center; ">
							<b>----Price----</b>
						</div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Front row:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Middle row:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Last row:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
				</div>

			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Number Bus:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Place start:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Place finish:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Time:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>

					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b> Time Out:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>TypeTravel:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
					<div class="row">
						<div
							style="width: 40%; float: left; text-align: left; margin-left: 20px;">
							<b>Status:</b>
						</div>
						<div style="width: 50%; float: right; text-align: left;"></div>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
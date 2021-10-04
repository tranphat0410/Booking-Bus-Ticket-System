package model;

import java.util.Date;

public class travelinfo {
	private int idTravel;
	private String typeBus;
	private String numberBus;
	private int totalSeats;
	private int residualSeats;
	private int priceFront;
	private int priceMiddle;
	private int priceLast;
	private String placeStart;
	private String placeFinish;
	private String StationStart;
	private String StationFinish;
	private Date time;
	private Date timeout;
	private String status;
	private String typeTravel;
	
	public int getIdTravel() {
		return idTravel;
	}
	public void setIdTravel(int idTravel) {
		this.idTravel = idTravel;
	}
	public String getTypeBus() {
		return typeBus;
	}
	public void setTypeBus(String typeBus) {
		this.typeBus = typeBus;
	}
	public String getNumberBus() {
		return numberBus;
	}
	public void setNumberBus(String numberBus) {
		this.numberBus = numberBus;
	}
	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}
	public int getResidualSeats() {
		return residualSeats;
	}
	public void setResidualSeats(int residualSeats) {
		this.residualSeats = residualSeats;
	}
	public int getPriceFront() {
		return priceFront;
	}
	public void setPriceFront(int priceFront) {
		this.priceFront = priceFront;
	}
	public int getPriceMiddle() {
		return priceMiddle;
	}
	public void setPriceMiddle(int priceMiddle) {
		this.priceMiddle = priceMiddle;
	}
	public int getPriceLast() {
		return priceLast;
	}
	public void setPriceLast(int priceLast) {
		this.priceLast = priceLast;
	}
	public String getPlaceStart() {
		return placeStart;
	}
	public void setPlaceStart(String placeStart) {
		this.placeStart = placeStart;
	}
	public String getPlaceFinish() {
		return placeFinish;
	}
	public void setPlaceFinish(String placeFinish) {
		this.placeFinish = placeFinish;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	public Date getTimeout() {
		return timeout;
	}
	public void setTimeout(Date timeout) {
		this.timeout = timeout;
	}
	public String getTypeTravel() {
		return typeTravel;
	}
	public void setTypeTravel(String typeTravel) {
		this.typeTravel = typeTravel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStationStart() {
		return StationStart;
	}
	public void setStationStart(String stationStart) {
		StationStart = stationStart;
	}
	public String getStationFinish() {
		return StationFinish;
	}
	public void setStationFinish(String stationFinish) {
		StationFinish = stationFinish;
	}
	public travelinfo() {
		super();
	}
	public travelinfo(int idTravel, String typeBus, String numberBus, int totalSeats, int residualSeats, int priceFront,
			int priceMiddle, int priceLast, String placeStart, String placeFinish, String stationStart,
			String stationFinish, Date time, Date timeout, String status, String typeTravel) {
		super();
		this.idTravel = idTravel;
		this.typeBus = typeBus;
		this.numberBus = numberBus;
		this.totalSeats = totalSeats;
		this.residualSeats = residualSeats;
		this.priceFront = priceFront;
		this.priceMiddle = priceMiddle;
		this.priceLast = priceLast;
		this.placeStart = placeStart;
		this.placeFinish = placeFinish;
		StationStart = stationStart;
		StationFinish = stationFinish;
		this.time = time;
		this.timeout = timeout;
		this.status = status;
		this.typeTravel = typeTravel;
	}
	
	
	
}

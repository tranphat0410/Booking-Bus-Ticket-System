package model;

public class travelsearch {
	private String typeBus;
	private String numberBus;
	private String placeStart;
	private String placeFinish;
    private String typeTravel;
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
	public String getTypeTravel() {
		return typeTravel;
	}
	public void setTypeTravel(String typeTravel) {
		this.typeTravel = typeTravel;
	}
	public travelsearch() {
		super();
	}
	public travelsearch(String typeBus, String numberBus, String placeStart, String placeFinish, String typeTravel) {
		super();
		this.typeBus = typeBus;
		this.numberBus = numberBus;
		this.placeStart = placeStart;
		this.placeFinish = placeFinish;
		this.typeTravel = typeTravel;
	}

	
}

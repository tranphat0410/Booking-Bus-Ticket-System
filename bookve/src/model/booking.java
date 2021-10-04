package model;

import java.util.Date;

public class booking {
	private int idbook;
	private int idtravel;
	private String lastname;
	private String name;
	private String phone;
	private String email;
	private String typebus;
	private String numberbus;
	private String numberseat;
	private int price;
	private String placestart;
	private String placefinish;
	private Date datebooking;
	private String typetravel;
	public int getIdbook() {
		return idbook;
	}
	public void setIdbook(int idbook) {
		this.idbook = idbook;
	}
	public int getIdtravel() {
		return idtravel;
	}
	public void setIdtravel(int idtravel) {
		this.idtravel = idtravel;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTypebus() {
		return typebus;
	}
	public void setTypebus(String typebus) {
		this.typebus = typebus;
	}
	public String getNumberbus() {
		return numberbus;
	}
	public void setNumberbus(String numberbus) {
		this.numberbus = numberbus;
	}
	public String getNumberseat() {
		return numberseat;
	}
	public void setNumberseat(String numberseat) {
		this.numberseat = numberseat;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPlacestart() {
		return placestart;
	}
	public void setPlacestart(String placestart) {
		this.placestart = placestart;
	}
	public String getPlacefinish() {
		return placefinish;
	}
	public void setPlacefinish(String placefinish) {
		this.placefinish = placefinish;
	}
	public Date getDatebooking() {
		return datebooking;
	}
	public void setDatebooking(Date datebooking) {
		this.datebooking = datebooking;
	}
	public String getTypetravel() {
		return typetravel;
	}
	public void setTypetravel(String typetravel) {
		this.typetravel = typetravel;
	}
	public booking(int idbook, int idtravel, String lastname, String name, String phone, String email, String typebus,
			String numberbus, String numberseat, int price, String placestart, String placefinish, Date datebooking,
			String typetravel) {
		super();
		this.idbook = idbook;
		this.idtravel = idtravel;
		this.lastname = lastname;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.typebus = typebus;
		this.numberbus = numberbus;
		this.numberseat = numberseat;
		this.price = price;
		this.placestart = placestart;
		this.placefinish = placefinish;
		this.datebooking = datebooking;
		this.typetravel = typetravel;
	}
	public booking() {
		super();
	}
	
	
	
}

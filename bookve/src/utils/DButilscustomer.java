package utils;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import connection.SQLbookve;
import model.booking;
import model.travelinfo;

public class DButilscustomer {
	private  SQLbookve con = new SQLbookve();
	public List<travelinfo> listtravelCus(String TT, String PS, String PF, String DG, String DH, String Status){
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<travelinfo> listtravel = new ArrayList<>();
		
		try {
			conn=con.getConnection();
			st = conn.prepareStatement("select * from infotravel where Time= ? and TimeOut = ? and PlaceStart = ? and  PlaceFinish = ? and  TypeTravel = ? and Status = ?");
			st.setString(1, DG);
			st.setString(2, DH);
			st.setString(3, PS);
			st.setString(4, PF);
			st.setString(5, TT);
			st.setString(6, Status);
			rs = st.executeQuery();
				while(rs.next()) {
				travelinfo travel = new travelinfo();
				travel.setIdTravel(rs.getInt("idInfo"));
				travel.setTypeBus(rs.getString("TypeBus"));
				travel.setNumberBus(rs.getString("NumberBus"));
				travel.setTotalSeats(rs.getInt("TotalSeats"));
				travel.setResidualSeats(rs.getInt("ResidualSeats"));
				travel.setPriceFront(rs.getInt("PriceFront"));
				travel.setPriceMiddle(rs.getInt("PriceMiddle"));
				travel.setPriceLast(rs.getInt("PriceLast"));
				travel.setPlaceStart(rs.getString("PlaceStart"));
				travel.setPlaceFinish(rs.getString("PlaceFinish"));
				travel.setStationStart(rs.getString("StationStart"));
				travel.setStationFinish(rs.getString("StationFinish"));;
				travel.setTime(rs.getDate("Time"));
				travel.setTimeout(rs.getDate("TimeOut"));
				travel.setTypeTravel(rs.getString("TypeTravel"));
				travel.setStatus(rs.getString("Status"));
				listtravel.add(travel);}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravel;
	}
	public List<travelinfo> listtravelCusONE(String TT, String PS, String PF, String DG, String Status){
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<travelinfo> listtravel = new ArrayList<>();
		
		try {
			conn=con.getConnection();
			st = conn.prepareStatement("select * from infotravel where Time= ? and PlaceStart = ? and  PlaceFinish = ? and  TypeTravel = ? and Status = ?");
			st.setString(1, DG);
			st.setString(2, PS);
			st.setString(3, PF);
			st.setString(4, TT);
			st.setString(5, Status);
			rs = st.executeQuery();
				while(rs.next()) {
					travelinfo travel = new travelinfo();
					travel.setIdTravel(rs.getInt("idInfo"));
					travel.setTypeBus(rs.getString("TypeBus"));
					travel.setNumberBus(rs.getString("NumberBus"));
					travel.setTotalSeats(rs.getInt("TotalSeats"));
					travel.setResidualSeats(rs.getInt("ResidualSeats"));
					travel.setPriceFront(rs.getInt("PriceFront"));
					travel.setPriceMiddle(rs.getInt("PriceMiddle"));
					travel.setPriceLast(rs.getInt("PriceLast"));
					travel.setPlaceStart(rs.getString("PlaceStart"));
					travel.setPlaceFinish(rs.getString("PlaceFinish"));
					travel.setStationStart(rs.getString("StationStart"));
					travel.setStationFinish(rs.getString("StationFinish"));;
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravel.add(travel);}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravel;
	}
	public List<travelinfo> listfamoustravelCus(String PS, String PF, String Status){
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<travelinfo> listtravel = new ArrayList<>();
		
		try {
			conn=con.getConnection();
			st = conn.prepareStatement("select * from infotravel where PlaceStart = ? and  PlaceFinish = ? and Status = ?");
			st.setString(1, PS);
			st.setString(2, PF);
			st.setString(3, Status);
			rs = st.executeQuery();
				while(rs.next()) {
					travelinfo travel = new travelinfo();
					travel.setIdTravel(rs.getInt("idInfo"));
					travel.setTypeBus(rs.getString("TypeBus"));
					travel.setNumberBus(rs.getString("NumberBus"));
					travel.setTotalSeats(rs.getInt("TotalSeats"));
					travel.setResidualSeats(rs.getInt("ResidualSeats"));
					travel.setPriceFront(rs.getInt("PriceFront"));
					travel.setPriceMiddle(rs.getInt("PriceMiddle"));
					travel.setPriceLast(rs.getInt("PriceLast"));
					travel.setPlaceStart(rs.getString("PlaceStart"));
					travel.setPlaceFinish(rs.getString("PlaceFinish"));
					travel.setStationStart(rs.getString("StationStart"));
					travel.setStationFinish(rs.getString("StationFinish"));;
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravel.add(travel);}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravel;
	}
	public boolean bookTicket(int id,String lastname, String name, String phone, String mail, String TBus, String NBus, int price, String SeatBook, String PS, String PF, String TT, LocalDate DateNow){

		Connection conn = null;
		PreparedStatement st = null;
		int rs = 0;
		try{
			conn = con.getConnection();
			st = conn.prepareStatement("insert into booking(idTravel, LastName, nameUser, Phone, Email, TypeBus, NumberBus, NumberSeat, Price, PlaceStart, PlaceFinish, DateBooking, TypeTravel) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '"+DateNow+"', ?) ");
			st.setInt(1, id);
			st.setNString(2, lastname);
			st.setNString(3, name);
			st.setString(4, phone);
			st.setString(5, mail);
			st.setString(6, TBus);
			st.setString(7, NBus);
			st.setString(8, SeatBook);
			st.setInt(9, price);
			st.setString(10, PS);
			st.setString(11, PF);
//			st.setDate(9, DateNow);
			st.setString(12, TT);
			rs = st.executeUpdate();

			if(rs != 0) {
				return true;
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return false;

	}
	public boolean cseat(int id, String seat)
    {
		Connection addmodd =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	try {
     		addmodd = con.getConnection();
            st= addmodd.prepareStatement("select * from booking where idTravel =? and NumberSeat =? ");
            st.setInt(1, id);
            st.setNString(2, seat);
            rs = st.executeQuery();
            
            if(rs.next()) {
        	   return true;
           }
     	}catch(Exception e) {
     		e.printStackTrace();
     	}
     	finally {
     		try {
     			addmodd.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
        return  false;
    }
	public List<booking> showSeat(String mail){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	PreparedStatement st2 = null;
		ResultSet rs2 = null;
		int id = 0;
		String status = "wait";
		try {
			listt=con.getConnection();
			st2 = listt.prepareStatement("select * from infotravel where Status = ?");
			st2.setNString(1, status);
			rs2 = st2.executeQuery();
			while(rs2.next()) {
				id =rs2.getInt("idInfo");
				st = listt.prepareStatement("select * from booking where Email = ? and 	idTravel = ?");
				st.setNString(1, mail);
				st.setInt(2, id);
				rs = st.executeQuery();
				while(rs.next())
				{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setPrice(rs.getInt("Price"));
					ticktravel.add(booking);		
				}
			}		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
}

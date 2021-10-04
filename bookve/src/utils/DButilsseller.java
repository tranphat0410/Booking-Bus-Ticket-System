package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SQLbookve;
import model.booking;
import model.travelinfo;
import model.travelsearch;


public class DButilsseller {
	private  SQLbookve con = new SQLbookve();
	public List<travelinfo> listtravel(String TBus, String time, String PS, String PF,String TT){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where TypeBus= ? and Time = ? and PlaceStart = ? and  PlaceFinish = ? and TypeTravel = ?");
			st.setString(1, TBus);
			st.setString(2, time);
			st.setString(3, PS);
			st.setString(4, PF);
			st.setString(5, TT);
			rs = st.executeQuery();
			if(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
			else
			{
				travelinfo travel = new travelinfo();
				travel.setIdTravel(0);
				travel.setTypeBus("<span style='color:red'>Null</span>");
				travel.setNumberBus("<span style='color:red'>Null</span>");
				travel.setTotalSeats(0);
				travel.setResidualSeats(0);
				travel.setPriceFront(0);
				travel.setPriceMiddle(0);
				travel.setPriceLast(0);
				travel.setPlaceStart("<span style='color:red'>Null</span>");
				travel.setPlaceFinish("<span style='color:red'>Null</span>");
				travel.setTypeTravel("<span style='color:red'>Null</span>");
				travel.setStatus("0");
				listtravell.add(travel);
			}
									
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	
	public ResultSet listtravel3(int id){
		Connection listt =null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		
		try {
			listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where idInfo=?");
			st.setInt(1, id);
			rs = st.executeQuery();
			return rs;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet listtravel2(String TBus, String time, String PS, String PF, String TT){
		Connection listt =null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		
		try {
			listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where TypeBus= ? and Time = ? and PlaceStart = ? and  PlaceFinish = ? and  TypeTravel = ?");
			st.setString(1, TBus);
			st.setString(2, time);
			st.setString(3, PS);
			st.setString(4, PF);
			st.setString(5, TT);
			rs = st.executeQuery();
			return rs;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rs;
	}
	public List<travelsearch> searchtravel(){
		Connection lists = null;
		PreparedStatement st = null;

		ResultSet rs = null;

		List<travelsearch> searchtravell = new ArrayList<>();
		
		try {
			lists = con.getConnection();
			st = lists.prepareStatement("select * from places");
			rs = st.executeQuery();

			while(rs.next()) {
				travelsearch travel = new travelsearch();
				travel.setPlaceStart(rs.getString("PlaceName"));
				travel.setPlaceFinish(rs.getString("PlaceName"));
				
				searchtravell.add(travel);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return searchtravell;
	}
	
	
	public List<travelinfo> viewupinfo(int idinfor){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where idInfo=?");
			st.setInt(1, idinfor);
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setStationFinish(rs.getString("StationFinish"));
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	
	public boolean upinfo(int id, String time, String timeout, String status){
		Connection listt =null;
     	PreparedStatement st = null;
     	int rs = 0;
     	
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("UPDATE  infotravel set Time=?, TimeOut=?, Status=? where idInfo=?");
			st.setNString(1, time);
			st.setNString(2, timeout);
			st.setNString(3, status);
			st.setInt(4, id);
			rs = st.executeUpdate();
			if(rs!=0)
			{
				return true;
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public List<booking> ticktravel(int idtravel){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where idTravel=?");
			st.setInt(1, idtravel);
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<travelinfo> alltravel(){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel");
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	public List<booking> alltravels(){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<booking> allticket(){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<booking> ticket(int id){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where idBook=?");
			st.setInt(1, id);
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	
	public boolean deletetick(int idbook)
    {
     	
     	Connection addmodd =null;
     	PreparedStatement st = null;
     	int rs = 0;
     	try {
           addmodd = con.getConnection();
           st = addmodd.prepareStatement("DELETE FROM booking where idBook=?");
           st.setInt(1, idbook);
          
            rs = st.executeUpdate();   
            if(rs!=0) {
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
        return false;
    }
	
	public boolean updateticket(int id, int RS)
    {
     	
     	Connection addmodd =null;
     	PreparedStatement st = null;
     	int rs = 0;
     	try {
           addmodd = con.getConnection();
           st = addmodd.prepareStatement("UPDATE  infotravel set ResidualSeats = ? where idInfo=?");
           st.setInt(1, RS);
           st.setInt(2, id);
            rs = st.executeUpdate();   
            if(rs!=0) {
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
        return false;
    }
	public boolean upuserticket(int id, String lastname, String name, String phone)
    {
     	
     	Connection addmodd =null;
     	PreparedStatement st = null;
     	int rs = 0;
     	try {
           addmodd = con.getConnection();
           st = addmodd.prepareStatement("UPDATE  booking set LastName=?, nameUser=?, Phone=? where idBook=?");
           
           st.setNString(1, lastname);
           st.setNString(2, name);
           st.setNString(3, phone);
           st.setInt(4, id);
            rs = st.executeUpdate();   
            if(rs!=0) {
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
        return false;
    }
	// -----------------------------------------------------------------------------------------------
	// -----------------------------------------------------------------------------------------------
	// ---------------------------------------SEARCH TRAVEL-------------------------------------------
	// -----------------------------------------------------------------------------------------------
	// -----------------------------------------------------------------------------------------------
	public List<travelinfo> searchTypeBus(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where TypeBus like '"+word+"%' ");
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	public List<travelinfo> searchNumberBus(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where NumberBus like '"+word+"%' ");
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	public List<travelinfo> searchPlaceStart(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where PlaceStart like '"+word+"%' ");
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	public List<travelinfo> searchPlaceFinish(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where PlaceFinish like '"+word+"%' ");
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	public List<travelinfo> searchTypeTravel(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where TypeTravel like '"+word+"%' ");
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	public List<travelinfo> searchStatus(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<travelinfo> listtravell = new ArrayList<travelinfo>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from infotravel where Status like '"+word+"%' ");
			rs = st.executeQuery();
			while(rs.next())
			{
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
					travel.setTime(rs.getDate("Time"));
					travel.setTimeout(rs.getDate("TimeOut"));
					travel.setTypeTravel(rs.getString("TypeTravel"));
					travel.setStatus(rs.getString("Status"));
					listtravell.add(travel);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listtravell;
	}
	// -----------------------------------------------------------------------------------------------
	// -----------------------------------------------------------------------------------------------
	// ---------------------------------------SEARCH TICKET-------------------------------------------
	// -----------------------------------------------------------------------------------------------
	// -----------------------------------------------------------------------------------------------
	public List<booking> searchTicketName(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where nameUser like '"+word+"%' ");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<booking> searchTicketLastName(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where LastName like '"+word+"%' ");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<booking> searchTicketPhone(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where Phone like '"+word+"%' ");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<booking> searchTicketEmail(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where Email like '"+word+"%' ");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<booking> searchTicketNumberSeat(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where NumberSeat like '"+word+"%' ");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
	public List<booking> searchTicketTypeTravel(String word){
		Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	List<booking> ticktravel = new ArrayList<booking>();
     	try {
     		listt=con.getConnection();
			st = listt.prepareStatement("select * from booking where TypeTravel like '"+word+"%' ");
			
			rs = st.executeQuery();
			while(rs.next())
			{
					booking booking = new booking();
					booking.setIdbook(rs.getInt("idBook"));
					booking.setIdtravel(rs.getInt("idTravel"));
					booking.setLastname(rs.getString("LastName"));
					booking.setName(rs.getString("nameUser"));
					booking.setPhone(rs.getString("Phone"));
					booking.setEmail(rs.getString("Email"));
					booking.setTypebus(rs.getString("TypeBus"));
					booking.setNumberbus(rs.getString("NumberBus"));
					booking.setNumberseat(rs.getString("NumberSeat"));
					booking.setPrice(rs.getInt("Price"));
					booking.setPlacestart(rs.getString("PlaceStart"));
					booking.setPlacefinish(rs.getString("PlaceFinish"));
					booking.setDatebooking(rs.getDate("DateBooking"));
					booking.setTypetravel(rs.getString("TypeTravel"));
					ticktravel.add(booking);		
			}
							
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticktravel;
	}
}

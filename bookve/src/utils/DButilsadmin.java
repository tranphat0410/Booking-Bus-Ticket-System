package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SQLbookve;
import model.userModel;



public class DButilsadmin {
	private  SQLbookve con = new SQLbookve();
	public boolean adduser(String name, String lastname, String phone, String email, String password,  String area, String role)
    {
     	
     	Connection addmodd =null;
     	PreparedStatement st = null;
     	
     	int rs = 0;
     	try {
           addmodd = con.getConnection();
           st = addmodd.prepareStatement("INSERT INTO users(Name,LastName,Phone,Email,Password,Area,Role) VALUES (?, ?, ?, ?, ?, ?, ?) ");
        
           st.setNString(1, name);
           st.setNString(2, lastname);
           st.setNString(3, phone);
           st.setNString(4, email);
           st.setNString(5, password);
           st.setNString(6, area);
           st.setNString(7, role);
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
	public boolean cemail(String email)
    {
		Connection addmodd =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	try {
     		addmodd = con.getConnection();
            st= addmodd.prepareStatement("select * from users where Email =? ");
            st.setNString(1, email);
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
	
	public List<userModel> listuser()
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users");
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	
     	return list;
	}
	public List<userModel> updateuser(int iduser)
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users where idUser=?");
			st.setInt(1, iduser);
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	return list;
	}
	public boolean update(int id, String name, String lastname, String phone, String password,  String area, String role)
    {
     	
     	Connection addmodd =null;
     	PreparedStatement st = null;
     	int rs = 0;
     	try {
           addmodd = con.getConnection();
           st = addmodd.prepareStatement("UPDATE  users set Name=?,LastName=?,Phone=?,Password=?,Area=?,Role=? where idUser=?");
           st.setNString(1, name);
           st.setNString(2, lastname);
           st.setNString(3, phone);
           st.setNString(4, password);
           st.setNString(5, area);
           st.setNString(6, role);
           st.setInt(7, id);
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
	
	
	public boolean deleteadmin(int iduser)
    {
     	
     	Connection addmodd =null;
     	PreparedStatement st = null;
     	int rs = 0;
     	try {
           addmodd = con.getConnection();
           st = addmodd.prepareStatement("DELETE FROM users where idUser=?");
           st.setInt(1, iduser);
          
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
	public boolean cseat(String email)
    {
		Connection addmodd =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	try {
     		addmodd = con.getConnection();
            st= addmodd.prepareStatement("select * from booking where Email =? ");
            st.setNString(1, email);
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
	// -----------------------------------------------------------------------------------------------
	// -----------------------------------------------------------------------------------------------
	// ---------------------------------------SEARCH TICKET-------------------------------------------
	// -----------------------------------------------------------------------------------------------
	// -----------------------------------------------------------------------------------------------
	public List<userModel> searchName(String word)
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users where Name like '"+word+"%'");
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	
     	return list;
	}
	public List<userModel> searchLastName(String word)
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users where LastName like '"+word+"%'");
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	
     	return list;
	}
	public List<userModel> searchPhone(String word)
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users where Phone like '"+word+"%'");
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	
     	return list;
	}
	public List<userModel> searchEmail(String word)
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users where Email like '"+word+"%'");
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	
     	return list;
	}
	public List<userModel> searchArea(String word)
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users where Area like '"+word+"%'");
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	
     	return list;
	}
	public List<userModel> searchRole(String word)
	{
		
     	Connection listt =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	
     	List<userModel> list = new ArrayList<userModel>();
     	
     	try {
			listt = con.getConnection();
			st = listt.prepareStatement("select * from users where Role like '"+word+"%'");
			rs = st.executeQuery();
			
			while (rs.next()) {
				userModel list_mo = new userModel();
				list_mo.setIduser(rs.getInt("idUser"));
				list_mo.setLastname(rs.getString("LastName"));
				list_mo.setName(rs.getString("Name"));
				list_mo.setPhone(rs.getString("Phone"));
				list_mo.setEmail(rs.getString("Email"));
				list_mo.setPassword(rs.getString("Password"));
				list_mo.setArea(rs.getString("Area"));
				list_mo.setRole(rs.getString("Role"));
				list.add(list_mo);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     	finally {
     		try {
     			listt.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
     	}
     	
     	return list;
	}
}

package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SQLbookve;
import model.userModel;

public class DBUtils {
	private  SQLbookve con = new SQLbookve();
	public ResultSet loginUser(String mail){

		Connection login = null;
		PreparedStatement st = null;
		try{
			login= con.getConnection();
			st = login.prepareStatement("select * from users where	Email = ? ");
			st.setString(1, mail);
			
			
			ResultSet rs = st.executeQuery();

			return rs;
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;

	}
	public List<userModel> sessionUser(String mail){ 
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<userModel> listuser = new ArrayList<>();
		
		try {
			conn=con.getConnection();
			st = conn.prepareStatement("select * from users where Email = ?  ");
			st.setString(1, mail);
			
			rs = st.executeQuery();
			while(rs.next()) {
				userModel user = new userModel();
				user.setIduser(rs.getInt("idUser"));
				user.setLastname(rs.getString("LastName"));
				user.setName(rs.getString("Name"));
				user.setPhone(rs.getString("Phone"));
				user.setEmail(rs.getString("Email"));
				user.setPassword(rs.getString("Password"));
				user.setRole(rs.getString("Role"));
				user.setArea(rs.getString("Area"));
				listuser.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return listuser;
	}
	public boolean checkpass(String pass)
    {
     	
		Connection addmodd =null;
     	PreparedStatement st = null;
     	ResultSet rs = null;
     	try {
           addmodd = con.getConnection();
           st = addmodd.prepareStatement("select * from users where Password =? ");
        
           st.setNString(1, pass);
         
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
     	  
        return false;
    }
}

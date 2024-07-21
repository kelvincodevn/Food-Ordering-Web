/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.registration;

import group3.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RegistrationDAO {
    
    public RegistrationDTO checkLogin (String userName, String password) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RegistrationDTO userInfo = new RegistrationDTO();
        try {
            con=DBUtil.getConnection();
            if(con!=null){
                String query="SELECT * FROM registration WHERE username = ? AND password = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, userName);
                stm.setString(2, password);
                rs=stm.executeQuery();
                if(rs.next()){
                    String userID = rs.getString("userid");
                    String fullName = rs.getString("fullname");  
                    String email = rs.getString("email");
                    String phoneNumber= rs.getString("phonenumber");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    userInfo = new RegistrationDTO(userID, userName, password, fullName, email, phoneNumber, isAdmin);
                    return userInfo;
                }
                return null;
            }
            
        } finally {
            if (rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(con!=null) con.close();
         }
        return null;
    }
    
    public String createUserID () throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count=0;
        String userID = null;
        try {
            con=DBUtil.getConnection();
            if(con!=null){
                String query="SELECT * FROM registration";
                stm = con.prepareStatement(query);
                rs=stm.executeQuery();
                while(rs.next()){
                    userID=rs.getString("userid");
                }
                userID=userID.substring(2);
                count=Integer.parseInt(userID)+1;
                if(count<10){
                    userID="US00"+count;
                } else if (count>=10 && count <100){
                    userID="US0"+count;
                } else {
                    userID="US"+count;
                }
            }
            
        } finally {
            if (rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(con!=null) con.close();
         }
        return userID;
    }
    
    public boolean checkAccountExisted (String userName) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con=DBUtil.getConnection();
            if(con!=null){
                String query="SELECT * FROM registration WHERE username = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, userName);
                rs=stm.executeQuery();
                if(rs.next()){                    
                    return true;
                }
            }
            
        } finally {
            if (rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(con!=null) con.close();
         }
        return false;
    }
    
    public boolean signUpUser (String userID, String userName, String password, String fullName, String email, String phoneNumber, boolean isAdmin) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con=DBUtil.getConnection();
            if(con!=null){
                String query = "INSERT INTO Registration VALUES (?,?,?,?,?,?,0)";
                stm = con.prepareStatement(query);
                stm.setString(1, userID);
                stm.setString(2, userName);
                stm.setString(3, password);
                stm.setString(4, fullName);
                stm.setString(5, email);
                stm.setString(6, phoneNumber);
                int affectedRow = stm.executeUpdate();
                return affectedRow == 1;
            }
                    
        } finally {
            if(stm!=null) stm.close();
            if(con!=null) con.close();
        }
        return false;
    }
    
    public List<RegistrationDTO> printAllRegistration () throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<RegistrationDTO> userList = new ArrayList<>();
        try {
            con=DBUtil.getConnection();
            if(con!=null){
                String query="SELECT * FROM registration";
                stm = con.prepareStatement(query);               
                rs=stm.executeQuery();
                while(rs.next()){
                     String userID = rs.getString("userid");
                    String userName = rs.getString("username");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullname");  
                    String email = rs.getString("email");
                    String phoneNumber= rs.getString("phonenumber");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    userList.add(new RegistrationDTO(userID, userName, password, fullName, email, phoneNumber, isAdmin));
                    
                }

            }
            
        } finally {
            if (rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(con!=null) con.close();
         }
        return userList;
    }
    
    public boolean updateInfoUser (String userID, String password, String fullName, String email, String phoneNumber) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con=DBUtil.getConnection();
            if(con!=null){
                String query = "UPDATE registration SET password=?, fullname=?, email=?, phonenumber=? where userID=?";
                stm = con.prepareStatement(query);
                stm.setString(1, password);
                stm.setString(2, fullName);
                stm.setString(3, email);
                stm.setString(4, phoneNumber);
                stm.setString(5, userID);
                int affectedRow = stm.executeUpdate();
                return affectedRow == 1;
            }
                    
        } finally {
            if(stm!=null) stm.close();
            if(con!=null) con.close();
        }
        return false;
    }
    
    public RegistrationDTO getUserByUserID (String userID) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RegistrationDTO userInfo = new RegistrationDTO();
        try {
            con=DBUtil.getConnection();
            if(con!=null){
                String query="SELECT * FROM registration WHERE userid = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, userID);
                rs=stm.executeQuery();
                if(rs.next()){
                    String userName = rs.getString("username");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullname");  
                    String email = rs.getString("email");
                    String phoneNumber= rs.getString("phonenumber");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    userInfo = new RegistrationDTO(userID, userName, password, fullName, email, phoneNumber, isAdmin);
                    return userInfo;
                }
                return null;
            }
            
        } finally {
            if (rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(con!=null) con.close();
         }
        return null;
    }
    
    public List<RegistrationDTO> getAllUser() 
        throws SQLException, ClassNotFoundException{
         Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            List<RegistrationDTO> listUser = new ArrayList();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "Select * from registration";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while(rs.next()) {
                    String userid = rs.getString("userid");
                    String name = rs.getString("username");
                    String pass = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    String email = rs.getString("email");
                    String phonenumber = rs.getString("phonenumer");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    listUser.add(new RegistrationDTO(userid, name, pass, fullname, email, phonenumber, isAdmin));
                }
                return listUser;
            }
        }finally {
                if(rs != null) rs.close();
                if(stm != null) stm.close();
                if(con != null) con.close();
            }
            return null;
    }
    
}

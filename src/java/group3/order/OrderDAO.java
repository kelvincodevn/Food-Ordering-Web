/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.order;

import group3.items.ItemDTO;
import group3.registration.RegistrationDTO;
import group3.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class OrderDAO {
     public List<OrderDTO> getAllOrder() 
        throws SQLException, ClassNotFoundException{
         Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            List<OrderDTO> listOrder = new ArrayList();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "Select * from Item_Order";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while(rs.next()) {
                    String orderID = rs.getString("orderID");
                    
                    String userID = rs.getString("userID");
                    String itemID = rs.getString("itemID");
                    
//                    RegistrationDTO user = getUserFromOrder(userID);
//                    String fullname = user.getLastName();
//                    String email = user.getEmail();
//                    String phonenumber = user.getPhonenumber();
                    
//                    ItemDTO item = getItemFromOrder(itemID);
//                    String image = item.getImage();
//                    String itemName = item.getItemName();
                    
                    int totalPrice = rs.getInt("totalPrice");
                    String orderDate = rs.getString("orderDate");
                    String deliveryDate = rs.getString("deliveryDate");
                    String status = rs.getString("deliveryStatus");
                    listOrder.add(new OrderDTO(orderID, itemID, userID, totalPrice, orderDate, deliveryDate, status));
                }
                return listOrder;
            }
        }finally {
                if(rs != null) rs.close();
                if(stm != null) stm.close();
                if(con != null) con.close();
            }
            return null;
    }
    
    public RegistrationDTO getUserFromOrder(String userID) 
        throws SQLException, ClassNotFoundException{
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            RegistrationDTO acc = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "Select * from registration where userID=?";
                stm = con.prepareStatement(query);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userid = rs.getString("userid");
                    String name = rs.getString("username");
                    String pass = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    String email = rs.getString("email");
                    String phonenumer = rs.getString("phonenumer"); 
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    acc = new RegistrationDTO(userid, name, pass, fullname, email, phonenumer, isAdmin);
                }
                return acc;
            }
        }finally {
                if(rs != null) rs.close();
                if(stm != null) stm.close();
                if(con != null) con.close();
            }
            return null;
        }
    
    public ItemDTO getItemFromOrder(String itemID) 
        throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            if(con != null) {
                String query = "select * from item where itemID LIKE ?";
                stm = con.prepareStatement(query);
                stm.setString(1, itemID);
                rs = stm.executeQuery();
                if(rs.next()) {
                    String itemid = rs.getString("itemID");
                    String itemname = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    int price = rs.getInt("price");
                    String categoryID = rs.getString("categoryID");
                    String image = rs.getString("Image");
                    ItemDTO item = new ItemDTO(itemid, itemname, itemDescription, price, categoryID, image);
                    return item;
                }
            }
        }finally {
            if(rs!=null) rs.close();
            if(stm!=null)stm.close();
            if(con!=null)con.close();
        }
        return null;
    }  
    
    
      public boolean updateOrder(String orderID, String deliveryDate, String deliveryStatus) 
        throws SQLException, ClassNotFoundException{
            Connection con = null;
            PreparedStatement stm = null;
            RegistrationDTO acc = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "update Item_Order set deliveryDate = ?, deliveryStatus = ? where orderID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, deliveryDate);
                stm.setString(2, deliveryStatus);
                stm.setString(3, orderID);              
                int affectedRows = stm.executeUpdate();
                return affectedRows>0;
            }
        }finally {
                if(stm != null) stm.close();
                if(con != null) con.close();
            }
            return false;
        }
}

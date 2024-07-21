/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.items;

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
 * @author Admin
 */
public class ItemDAO {

    public List<ItemDTO> getAllItem()
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ItemDTO> listItem = new ArrayList();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "select * from item";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String itemID = rs.getString("itemID");
                    String itemName = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    int price = rs.getInt("price");
                    String categoryID = rs.getString("categoryID");
                    String image = rs.getString("Image");
                    listItem.add(new ItemDTO(itemID, itemName, itemDescription, price, categoryID, image));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listItem;
    }

    public List<ItemDTO> getAllItems() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ItemDTO> itemList = new ArrayList<>();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM item";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String itemID = rs.getString("itemID");
                    String itemName = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    int price = rs.getInt("price");
                    String categoryID = rs.getString("categoryID");
                    String image = rs.getString("Image");
                    itemList.add(new ItemDTO(itemID, itemName, itemDescription, price, categoryID, image));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return itemList;
    }

    public List<ItemDTO> getItemByCateID(String categoryID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ItemDTO> itemList = new ArrayList<>();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM item WHERE categoryID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String itemID = rs.getString("itemID");
                    String itemName = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    int price = rs.getInt("price");
                    String image = rs.getString("Image");
                    itemList.add(new ItemDTO(itemID, itemName, itemDescription, price, categoryID, image));
                }

            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return itemList;
    }

    public List<ItemDTO> searchItem(String searchItemName) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ItemDTO> itemList = new ArrayList<>();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "SELECT * FROM item WHERE itemName  LIKE ?";
                stm = con.prepareStatement(query);
                stm.setString(1, "%" + searchItemName + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String itemID = rs.getString("itemID");
                    String itemName = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    String categoryID = rs.getString("categoryID");
                    int price = rs.getInt("price");
                    String image = rs.getString("Image");
                    itemList.add(new ItemDTO(itemID, itemName, itemDescription, price, categoryID, image));
                }

            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return itemList;
    }

    public List<ItemDTO> getItemByName(String txtSearchItem)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ItemDTO> listItem = new ArrayList();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "select * from item where itemName LIKE ?";
                stm = con.prepareStatement(query);
                stm.setString(1, "%" + txtSearchItem + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String itemID = rs.getString("itemID");
                    String itemName = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    int price = rs.getInt("price");
                    String categoryID = rs.getString("categoryID");
                    String image = rs.getString("Image");
                    listItem.add(new ItemDTO(itemID, itemName, itemDescription, price, categoryID, image));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listItem;
    }

    public ItemDTO getItemByID(String itemID)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "select * from item where itemID LIKE ?";
                stm = con.prepareStatement(query);
                stm.setString(1, itemID);
                rs = stm.executeQuery();
                if (rs.next()) {
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
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public boolean deleteItem(String itemID)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        //khi nào mà cần get dữ liệu về thì xài ResultSet
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "Delete from item where itemID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, itemID);
                int affectedRow = stm.executeUpdate();
                return affectedRow > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean insert(String itemName, String image, int price, String description, String category)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ItemDTO itemTop = getTopItem();
        String itemIDTop = itemTop.getItemID();
        String pattern = itemIDTop.substring(0, 3);
        String num = itemIDTop.substring(3, 6);
        int numConvert = Integer.parseInt(num);
        numConvert++;
        String newItemID = "";
        if (numConvert < 100) {
            newItemID = pattern + "0" + numConvert;
        } else {
            newItemID = pattern + numConvert;
        }
        String imagePath = "images/" + image;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                //1. Viet query
                String query = "Insert into item values(?,?,?,?,?,?)";
                stm = con.prepareStatement(query);
                stm.setString(1, newItemID);
                stm.setString(2, itemName);
                stm.setString(3, description);
                stm.setInt(4, price);
                stm.setString(5, category);
                stm.setString(6, imagePath); //mac dinh sign up moi la member not admin
                int affectedRows = stm.executeUpdate(); //tra ve so hang bi anh huong
                return affectedRows == 1; //kiem tra coi so hang bi anh huong co phai la 1 hay khong
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public ItemDTO getTopItem()
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ItemDTO item = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "select top 1  * from item\n"
                        + "order by itemID DESC ";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String itemid = rs.getString("itemID");
                    String itemName = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    int price = rs.getInt("price");
                    String categoryID = rs.getString("categoryID");
                    String image = rs.getString("Image");
                    item = new ItemDTO(itemid, itemName, itemDescription, price, categoryID, image);
                }
                return item;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public boolean updateItem(String itemID, String itemname, String itemDescription, int itemPrice, String categoryID, String image)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        RegistrationDTO acc = null;
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "update item set itemName = ?, itemDescription = ?, price= ?, categoryID=?, Image = ? where itemID = ?";
                stm = con.prepareStatement(query);
                stm.setString(1, itemname);
                stm.setString(2, itemDescription);
                stm.setInt(3, itemPrice);
                stm.setString(4, categoryID);
                stm.setString(5, image);
                stm.setString(6, itemID);
                int affectedRows = stm.executeUpdate();
                return affectedRows > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<ItemDTO> getTop3()
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ItemDTO> listItem = new ArrayList();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query = "select top 3 * from item";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String itemID = rs.getString("itemID");
                    String itemName = rs.getString("itemName");
                    String itemDescription = rs.getString("itemDescription");
                    int price = rs.getInt("price");
                    String categoryID = rs.getString("categoryID");
                    String image = rs.getString("Image");
                    listItem.add(new ItemDTO(itemID, itemName, itemDescription, price, categoryID, image));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listItem;
    }
}

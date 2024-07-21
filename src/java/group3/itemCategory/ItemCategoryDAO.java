/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.itemCategory;

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
public class ItemCategoryDAO {

    public List<ItemCategoryDTO> getAllItemCategory() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ItemCategoryDTO> itemCateList = new ArrayList<>();
        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String query="SELECT * FROM Item_Category";
                stm = con.prepareStatement(query);
                rs = stm.executeQuery();
                while(rs.next()){
                    String categoryID=rs.getString("categoryID");
                    String categoryName=rs.getString("categoryName");
                    String categoryDescription=rs.getString("categoryDescription");
                    itemCateList.add(new ItemCategoryDTO(categoryID, categoryName, categoryDescription));
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
        return itemCateList;
    }

}

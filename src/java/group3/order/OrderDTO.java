/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.order;

/**
 *
 * @author DELL
 */
public class OrderDTO {

    private String orderID;
    private String itemID;
    private String userID;
    private int totalPrice;
    private String orderDate;
    private String deliveryDate;
    private String deliveryStatus;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String itemID, String userID, int totalPrice, String orderDate, String deliveryDate, String deliveryStatus) {
        this.orderID = orderID;
        this.itemID = itemID;
        this.userID = userID;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.deliveryStatus = deliveryStatus;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }
}

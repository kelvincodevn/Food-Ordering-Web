/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private String MENU_PAGE = "menu.jsp";
    private String HOME_PAGE = "homePage.jsp";
    private String COOKIE_SERVLET = "CookieServlet";
    private String LOGIN_SERVLET = "LoginServlet";
    private String SIGNUP_SERVLET = "SignUpServlet";
    private String SEARCH_ITEM_SERVLET = "SearchItemServlet";
    private String UPDATE_INFO_SERVLET = "UpdateInfoServlet";
    private String LOG_OUT_SERVLET = "LogOutServlet";

    //crud for maincontroller
    private String ADD_ITEM_PAGE = "addItem.jsp";
    private String ADD_ITEM_SERVLET = "addItem.jsp";
    private String UPDATE_USER_SERVLET = "UpdateUserServlet";
    private String DELETE_USER_SERVLET = "DeleteUserServlet";
    private String INSERT_USER_SERVLET = "AddUserServlet";
    private String VIEW_ITEM_SERVLET = "ViewItemServlet";
    private String DELETE_ITEM_SERVLET = "DeleteItemServlet";
    private String INSERT_ITEM_SERVLET = "InsertItemServlet";
    private String LOAD_ITEM_SERVLET = "LoadItemServlet";
    private String EDIT_ITEM_SERVLET = "EditItemServlet";
    private String LOAD_MORE_SERVLET = "LoadMoreServlet";
    private String EDIT_ORDER_SERVLET = "EditOrderServlet";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = HOME_PAGE;
        try {
            String btAction = request.getParameter("btAction");
            if (btAction == null) {
                url = COOKIE_SERVLET;
            } else if (btAction.equals("Login")) {
                url = LOGIN_SERVLET;
            } else if (btAction.equals("Sign Up")) {
                url = SIGNUP_SERVLET;
            } else if (btAction.equals("Search Food")) {
                url = SEARCH_ITEM_SERVLET;
            } else if (btAction.equals("Update information")) {
                url = UPDATE_INFO_SERVLET;
            } else if (btAction.equals("LogOut")) {
                url = LOG_OUT_SERVLET;
            } else if (btAction.equals("Back to homepage")) {
                url = HOME_PAGE;
                
            } else if (btAction.equals("Add Item")) {
                url = ADD_ITEM_SERVLET;           
            } else if (btAction.equals("Search")) {
                url = SEARCH_ITEM_SERVLET;
            } else if (btAction.equals("Update")) {
                url = UPDATE_USER_SERVLET;
            } else if (btAction.equals("Delete")) {
                url = DELETE_USER_SERVLET;
            } else if (btAction.equals("Insert")) {
                url = INSERT_USER_SERVLET;
            } else if (btAction.equals("ManageItem")) {
                url = VIEW_ITEM_SERVLET; //da xong
            } else if (btAction.equals("DeleteItem")) { 
                url = DELETE_ITEM_SERVLET;  //da xong
            } else if (btAction.equals("Add")) {
                url = INSERT_ITEM_SERVLET; //da xong
            } else if (btAction.equals("LoadItem")) {
                url = LOAD_ITEM_SERVLET; // da xong
            } else if (btAction.equals("Edit")) {
                url = EDIT_ITEM_SERVLET;  //da xong
            } else if (btAction.equals("LoadMore")) {
                url = LOAD_MORE_SERVLET; 
            } else if (btAction.equals("EditOrder")) {
                url = EDIT_ORDER_SERVLET;  // da xong
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

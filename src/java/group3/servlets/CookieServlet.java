/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.servlets;

import group3.registration.RegistrationDAO;
import group3.registration.RegistrationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class CookieServlet extends HttpServlet {
    
    private String LOGIN_PAGE="login.jsp";
    private String HOME_PAGE="homePage.jsp";
    private String MENU_ADMIN_PAGE="adminHome.jsp";
    private String MENU_CUS_PAGE = "menu.jsp";
    private String HOME_CUS_PAGE="homeCus.jsp";
    
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
            Cookie[] cookies = request.getCookies();
            String userName = null;
            String password = null;
            boolean isAdmin = false;
            if(cookies!=null){
                for (Cookie cookie : cookies) {
                    String k = cookie.getName();
                    String v = cookie.getValue();
                    if(k.equals("USERNAME")){
                        userName=v;
                    }
                    if(k.equals("PASSWORD")){
                        password=v;
                    }
                    if(k.equals("ISADMIN")){
                        isAdmin= Boolean.parseBoolean(v);
                    }
                    if(userName != null && password !=null){
                        RegistrationDAO dao = new RegistrationDAO();
                        RegistrationDTO userInfo = dao.checkLogin(userName, password);
                        if(userInfo!=null){
                            if(userInfo.getIsAdmin()){
                                url=MENU_ADMIN_PAGE;
                            } else{
                                url=HOME_PAGE;
                            }
                        }
                    }
                }
            }
        } catch(SQLException |ClassNotFoundException ex){
            ex.printStackTrace();
        }finally {
            response.sendRedirect(url);
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

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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

   
    private String LOGIN_PAGE="login.jsp";
    private String HOME_PAGE="homePage.jsp";
    private String MENU_CUS_PAGE = "menu.jsp";
    private String MENU_ADMIN_PAGE = "adminHome.jsp";

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
        RegistrationDTO userInfo = new RegistrationDTO();
        RegistrationDAO dao = new RegistrationDAO();
        String invalid = "";
        String url = MENU_CUS_PAGE;
        String value = null;
        try {
            String userName = request.getParameter("txtUserName");
            String password = request.getParameter("txtPassword");

            userInfo = dao.checkLogin(userName, password);
            if (userInfo != null) {
                Cookie userNameIDCookie = new Cookie("USERNAMEID", userInfo.getUserID());
                Cookie userNameCookie = new Cookie("USERNAME", userInfo.getUserName());
                Cookie passwordCookie = new Cookie("PASSWORD", userInfo.getPassword());
                Cookie fullNameCookie = new Cookie("FULLNAME", userInfo.getFullName());
                Cookie emailCookie = new Cookie("EMAIL", userInfo.getEmail());
                Cookie phoneNumCookie = new Cookie("PHONENUMBER", userInfo.getPhoneNumber());
                 Cookie isAdminCookie = new Cookie("ISADMIN", value);
                if (userInfo.getIsAdmin()) {
                    url = MENU_ADMIN_PAGE; //thay banng trang admin
                    value = "true";
                } else {
                    
                    value = "false"; 
                    url = HOME_PAGE;
                }
               
                
                response.addCookie(userNameIDCookie);
                response.addCookie(userNameCookie);
                response.addCookie(passwordCookie);
                response.addCookie(fullNameCookie);
                response.addCookie(emailCookie);
                response.addCookie(phoneNumCookie);
                response.addCookie(isAdminCookie);
                
                    request.setAttribute("USERNAMEID", userInfo.getUserID());
            } else {
                invalid ="Invalid userName or password. Please try again";
                request.setAttribute("INVALID",invalid);
                url=LOGIN_PAGE;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.servlets;

import group3.registration.ErrorRegistration;
import group3.registration.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class UpdateInfoServlet extends HttpServlet {

    private String USERINFO_PAGE = "userInfo.jsp";

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
        String url = USERINFO_PAGE;
        String successful = null;
        ErrorRegistration errors = new ErrorRegistration();
        RegistrationDAO regisDAO = new RegistrationDAO();
        boolean checkErrors = false;
        try {
            String userID = request.getParameter("UpdateUserID");
            String userName = request.getParameter("UpdateUserName");
            String password = request.getParameter("UpdatePassword");
            String fullName = request.getParameter("UpdateFullName");
            String email = request.getParameter("UpdateEmail");
            String phoneNumber = request.getParameter("UpdatePhoneNumber");

            checkErrors = errors.checkPasswordLen(password, 6, 30)
                    & errors.checkFullNameLen(fullName, 4, 30)
                    & errors.checkEmailValidation(email)
                    & errors.checkPhoneNumberValidation(phoneNumber);

            if (!checkErrors) {
                request.setAttribute("ERRORS", errors);
            } else {
                checkErrors = regisDAO.updateInfoUser(userID, password, fullName, email, phoneNumber);
                if(checkErrors){
                Cookie[] cookies = request.getCookies();
                if(cookies!=null){
                    for (Cookie cookie : cookies) {
                         
                        if(cookie.getName().equals("FULLNAME")){
                            Cookie updateCookie = new Cookie(cookie.getName(),fullName);
                            response.addCookie(updateCookie);
                        }
                        if(cookie.getName().equals("EMAIL")){
                            Cookie updateCookie = new Cookie(cookie.getName(),email);
                            response.addCookie(updateCookie);
                        }
                        if(cookie.getName().equals("PHONENUMBER")){
                            Cookie updateCookie = new Cookie(cookie.getName(),phoneNumber);
                            response.addCookie(updateCookie);
                        }
                        if(cookie.getName().equals("PASSWORD")){
                            Cookie updateCookie = new Cookie(cookie.getName(),password);
                            response.addCookie(updateCookie);
                        }
                    }
                }
                successful = "Update successfully!";
                request.setAttribute("SUCCESSFUL",successful);
                }
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

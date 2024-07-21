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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class SignUpServlet extends HttpServlet {
    private String ERROR_PAGE="login.jsp";
    private String MENU_PAGE="menu.jsp";
    
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
        RegistrationDAO dao = new RegistrationDAO();
        boolean checkErrors = false;
        ErrorRegistration errors = new ErrorRegistration();
        String url = MENU_PAGE;
        try {
            String userID = dao.createUserID();
            String userName = request.getParameter("signUpUserName");
            String password = request.getParameter("signUpPassword");
            String confirm = request.getParameter("signUpConfirm");
            String fullName= request.getParameter("signUpFullName");
            String email=request.getParameter("signUpEmail");
            String phoneNumber = request.getParameter("signUpPhoneNumber");
            
            checkErrors = errors.checkUserNameLen(userName, 4, 20) & 
                    errors.checkPasswordLen(password, 6, 30) & 
                    errors.checkConfirmNotMatch(password, confirm) & 
                    errors.checkFullNameLen(fullName, 4, 30)  & 
                    errors.checkEmailValidation(email) & 
                    errors.checkPhoneNumberValidation(phoneNumber);
            
            if(checkErrors){
                checkErrors = errors.checkAccountExisted(userName);
            }
             if(checkErrors){
                 checkErrors = dao.signUpUser(userID, userName, password, fullName, email, phoneNumber, checkErrors);
             }
             if(!checkErrors){
                 request.setAttribute("ERRORS", errors);
                 url = ERROR_PAGE;
             }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }finally{
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

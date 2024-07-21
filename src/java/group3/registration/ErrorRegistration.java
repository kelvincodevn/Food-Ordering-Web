/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.registration;

import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class ErrorRegistration {
    private String userNameLenError="";
    private String passwordLenError="";
    private String confirmNotMatch="";
    private String fullNameLenError="";
    private String emailValidationError="";
    private String phoneValidationError="";   
    private String accountExisted="";
    
    public ErrorRegistration() {
    }
    
    public boolean checkUserNameLen(String userName, int min, int max){
        userName= userName.trim();
        if(userName.length()<min ||userName.length()>max){
            userNameLenError="User Name len must be in range" + min +","+max;
            return false;
        }
        return true;
    }
    
    public boolean checkPasswordLen(String password, int min, int max){
        password= password.trim();
        if(password.length()<min ||password.length()>max){
            passwordLenError="Password len must be in range" + min +","+max;
            return false;
        }
        return true;
    }
    
   public boolean checkConfirmNotMatch(String password, String confirm){
       password=password.trim();
       confirm=confirm.trim();
       if(!password.equals(confirm)){
           confirmNotMatch="password and confirm must match";
           return false;
       }
       return true;
   }
   
   public boolean checkFullNameLen(String fullName, int min, int max){
       fullName=fullName.trim();
       if(fullName.length()<min || fullName.length()>max){
           fullNameLenError="Full Name len must be in range"+min+","+max;
           return false;    
       }
       return true;
   }
         
  public boolean checkAccountExisted(String userName) throws SQLException,ClassNotFoundException{
      userName=userName.trim();
      RegistrationDAO dao= new RegistrationDAO();
      boolean result= dao.checkAccountExisted(userName);
      if(result){
          accountExisted = userName+" is already existed";
          return false;
      }
      return true;
  }
  
    public boolean checkEmailValidation(String email) throws SQLException, ClassNotFoundException {
        email = email.trim();
        if (!email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            emailValidationError="Please enter a valid email address (include an @ symbol)";
            return false;
        }
        return true;
    }
    
    public boolean checkPhoneNumberValidation(String phoneNumber) throws SQLException, ClassNotFoundException {
        int i=0;
        phoneNumber = phoneNumber.trim();
        for (i=0; i < phoneNumber.length(); i++) {
            if (!Character.isDigit(phoneNumber.charAt(i))) {
                phoneValidationError="Please enter a valid phone number.";
                return false;
            }            
        }
        if(i!=10){
                phoneValidationError="A valid phone number must have 10 numbers";
                return false;
            }
        return true;
    }

    public String getUserNameLenError() {
        return userNameLenError;
    }

    public String getPasswordLenError() {
        return passwordLenError;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public String getFullNameLenError() {
        return fullNameLenError;
    }

    public String getAccountExisted() {
        return accountExisted;
    }

    public String getEmailValidationError() {
        return emailValidationError;
    }

    public String getPhoneValidationError() {
        return phoneValidationError;
    }
  
    
  
}

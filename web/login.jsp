<%@page import="group3.registration.ErrorRegistration"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== Iconscout CSS ===== -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/mystyle.css">

        <title>Login & Registration Form</title> 
    </head>
    <body>

        <div class="container">
            <div class="forms">
                <div class="form login">
                    <span class="title">Login</span>
                    <%
                        String invalid = (String) request.getAttribute("INVALID"); //check loi userID va password co hop le hay ko
                    %>
                    <form action="MainController" method="POST">
                        <div class="input-field">
                            <input type="text" placeholder="Enter your username" name="txtUserName" value="" required>
                            <i class="uil uil-user icon"></i>
                        </div>
                        <div class="input-field">
                            <input type="password" class="password" placeholder="Enter your password" name="txtPassword" required>
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePw"></i>
                        </div>

                        <div class="checkbox-text">
                            <!--                            <div class="checkbox-content">
                                                            <input type="checkbox" id="logCheck">
                                                            <label for="logCheck" class="text">Remember me</label>
                                                        </div>
                            
                                                        <a href="#" class="text">Forgot password?</a>-->
                            <%
                                if (invalid != null) {
                            %>
                            <label for="logCheck" class="text" style="color: red;"><%=invalid%></label>
                            <%}%>
                        </div>

                        <div class="input-field button">
                            <input type="submit" name="btAction" value="Login">
                        </div>
                    </form>

                    <div class="login-signup">
                        <span class="text">Not a member?
                            <a href="#" class="text signup-link"> Signup Now</a>
                        </span>                        
                    </div>

                    <form action="MainController" method="post">
                        <div class="input-field button">
                            <input type="submit" name="btAction" value="Back to homepage">
                        </div>

                    </form>



                </div>

                <!-- Registration Form -->
                <%
                    String userNameLenError = "";
                    String passwordLenError = "";
                    String confirmNotMatch = "";
                    String fullNameLenError = "";
                    String accountExisted = "";
                    String emailValidationError = "";
                    String phoneValidationError = "";

                    ErrorRegistration errors = (ErrorRegistration) request.getAttribute("ERRORS");
                    if (errors != null) {
                        userNameLenError = errors.getUserNameLenError();
                        passwordLenError = errors.getPasswordLenError();
                        confirmNotMatch = errors.getConfirmNotMatch();
                        fullNameLenError = errors.getFullNameLenError();
                        accountExisted = errors.getAccountExisted();
                        emailValidationError = errors.getEmailValidationError();
                        phoneValidationError = errors.getPhoneValidationError();
                    }
                %>

                <div class="form signup" id="signupForm" >
                    <span class="title">Registration</span>

                    <form action="MainController" method="POST">
                        <div class="container">                          
                            <font color="red">${requestScope.ERRORS.fullNameLenError}  </font>
                        </div>

                        <div class="input-field">
                            <input type="text" placeholder="Enter your full name" name="signUpFullName" value="${param.signUpFullName}" required>

                            <i class="uil uil-user"></i>
                        </div>
                        <div class="container">                          
                            <font color="red">${requestScope.ERRORS.emailValidationError}</font> 
                        </div>

                        <div class="input-field">
                            <input type="text" placeholder="Enter your email" name="signUpEmail" value="${param.signUpEmail}" required>

                            <i class="uil uil-envelope icon"></i>
                        </div>
                        <div class="container">                          
                            <font color="red">${requestScope.ERRORS.phoneValidationError}</font>
                        </div>

                        <div class="input-field">
                            <input type="text" placeholder="Enter your phonenumber" name="signUpPhoneNumber" value="${param.signUpEmail}" required>

                            <i class="uil uil-phone icon"></i>
                        </div>
                        <div class="container">                          
                            <font color="red">${requestScope.ERRORS.userNameLenError}  </font><br/> 
                            <font color="red">${requestScope.ERRORS.accountExisted}  </font>
                        </div>

                        <div class="input-field">
                            <input type="text" placeholder="Enter your username" name="signUpUserName" value="${param.signUpUserName}" required>

                            <i class="uil uil-user icon"></i>
                        </div>
                        <div class="container">                          
                            <font color="red">${requestScope.ERRORS.passwordLenError}</font>
                        </div>

                        <div class="input-field">
                            <input type="password" class="password" placeholder="Create a password" name="signUpPassword" value="${param.signUpPassword}" required>

                            <i class="uil uil-lock icon"></i>
                        </div>
                        <div class="container">                          
                            <font color="red">${requestScope.ERRORS.confirmNotMatch}  </font>
                        </div>

                        <div class="input-field">
                            <input type="password" class="password" placeholder="Confirm a password" name="signUpConfirm" value="${param.signUpConfirm}" required>

                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePw"></i>
                        </div>



                        <div class="input-field button">
                            <input type="submit" name="btAction" value="Sign Up"/>
                        </div>
                    </form>

                    <div class="login-signup">
                        <span class="text">Already a member?
                            <a href="#" class="text login-link">Login Now</a>
                        </span>
                    </div>

                </div>
            </div>
        </div>

        <script src="js/script.js"></script> 
    </body>
</html>
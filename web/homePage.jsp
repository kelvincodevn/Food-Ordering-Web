<%@page import="group3.registration.RegistrationDTO"%>
<%@page import="group3.registration.RegistrationDAO"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">

        <title> AsianGastro </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

    </head>

    <body>

        <div class="hero_area">
            <div class="bg-box">
                <img src="images/home_page.png" alt="">
            </div>
            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="index.html">
                            <span>
                                AsianGastroWeb
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">                                
                                <li class="nav-item active">
                                    <a class="nav-link" href="homePage.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="adminHome.jsp">Admin Page</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="menu.jsp">Menu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="about.jsp">About</a>
                                </li>

                            </ul>
                            <div class="user_option">
                                <%
                                    String logOut = (String) request.getAttribute("LOGOUT");
                                    String userNameID = (String) request.getAttribute("USERNAMEID");
                                    Cookie[] checkCookies = request.getCookies();
                                    String checkUserNameID = null;
                                    if (checkCookies != null && logOut == null && userNameID == null) {
                                        for (Cookie cookie : checkCookies) {
                                            String k = cookie.getName();
                                            String v = cookie.getValue();
                                            if (k.equals("USERNAMEID")) {
                                                checkUserNameID = v;
                                            }

                                        }
                                        if(checkUserNameID!=null){
                                %>
                                <a href="userInfo.jsp" class="user_link">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                                <%} else {%>
                                <a href="login.jsp" class="user_link">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                                <%}} else if (checkCookies == null && userNameID == null && logOut == null) {%>
                                <a href="login.jsp" class="user_link">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                                <%} else if (userNameID != null && logOut ==null) {%>
                                <a href="userInfo.jsp" class="user_link">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                                <%} else if (userNameID == null && logOut!=null) {%>
                                <a href="login.jsp" class="user_link">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                                <%} %>    
                                <a class="cart_link" href="#">
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                    <g>
                                    <g>
                                    <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                          c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                    </g>
                                    <g>
                                    <g>
                                    <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                          C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                          c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                          C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                    </g>
                                    <g>
                                    <g>
                                    <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                          c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    <g>
                                    </g>
                                    </svg>
                                </a>

                                <form class="form-inline">
                                    <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </form>
                                <%

                                    RegistrationDAO regisDAO = new RegistrationDAO();
                                    RegistrationDTO userInfo = new RegistrationDTO();
                                    String fullName = null;

                                    if (userNameID == null && logOut == null) {
                                        Cookie[] cookies = request.getCookies();
                                        String userName = null;
                                        String email = null;
                                        String phoneNumber = null;
                                        String password = null;
                                        if (cookies != null) {
                                            for (Cookie cookie : cookies) {
                                                String k = cookie.getName();
                                                String v = cookie.getValue();
                                                if (k.equals("USERNAMEID")) {
                                                    userNameID = v;
                                                }
                                                if (k.equals("USERNAME")) {
                                                    userName = v;
                                                }

                                            }
                                            userInfo = regisDAO.getUserByUserID(userNameID);
                                            if (userInfo != null) {
                                                fullName = userInfo.getFullName();
                                                email = userInfo.getEmail();
                                                phoneNumber = userInfo.getPhoneNumber();
                                                password = userInfo.getPassword();

                                %>
                                <div class="nav-item">
                                    <span class="nav-link" style="color: white" >Welcome, <%=fullName%></span>
                                </div>

                                <a href="MainController?btAction=LogOut" class="order_online">
                                    <span class="nav-link" style="color: white" >LogOut</span>
                                </a>
                                <%} else {%>
                                <a href="login.jsp" class="order_online">
                                    <span class="nav-link" style="color: white" >LogIn</span>
                                </a>  
                                <%}
                                    }
                                } else if (userNameID != null) {
                                    userInfo = regisDAO.getUserByUserID(userNameID);
                                    fullName = userInfo.getFullName();
                                %>
                                <div class="nav-item">
                                    <span class="nav-link" style="color: white" >Welcome, <%=fullName%></span>
                                </div>
                                <a href="MainController?btAction=LogOut" class="order_online">
                                    <span class="nav-link" style="color: white" >LogOut</span>
                                </a>
                                <%} else if (logOut != null) {%>
                                <a href="login.jsp" class="order_online">
                                    <span class="nav-link" style="color: white" >LogIn</span>
                                </a>                                  
                                <%}%>


                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            <section class="slider_section ">
                <div id="customCarousel1" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-7 col-lg-6 ">
                                        <div class="detail-box">
                                            <h1>
                                                AsianGastro Food
                                            </h1>
                                            <p>
                                              We tend to enjoy classic dishes that are familiar and comforting. Occasionally, we may be open to trying new foods but typically stick to what we know and love. 
                                            </p>
                                            <div class="btn-box">
                                                <a href="menu.jsp" class="btn1">
                                                    Order Now
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-7 col-lg-6 ">
                                        <div class="detail-box">
                                            <h1>
                                                AsianGastro Food
                                            </h1>
                                            <p>
                                                 Our food noodle preferences are quite diverse. Some of us prefer the simplicity of plain noodles, while others enjoy experimenting with different sauces and toppings. 
                                            </p>
                                            <div class="btn-box">
                                                <a href="menu.jsp" class="btn1">
                                                    Order Now
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-7 col-lg-6 ">
                                        <div class="detail-box">
                                            <h1>
                                                AsianGastro Food
                                            </h1>
                                            <p>
                                              We enjoy a wide variety of cuisines and are always open to trying new dishes. Our adventurous taste buds make dining experiences exciting and enjoyable. 
                                            </p>
                                            <div class="btn-box">
                                                <a href="menu.jsp" class="btn1">
                                                    Order Now
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <ol class="carousel-indicators">
                            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
                            <li data-target="#customCarousel1" data-slide-to="1"></li>
                            <li data-target="#customCarousel1" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>

            </section>
            <!-- end slider section -->
        </div>

       <script src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>

        </script>
    </body>

</html>
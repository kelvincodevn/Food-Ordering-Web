<%-- 
    Document   : menu
    Created on : Apr 22, 2024, 1:24:41 AM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="group3.items.ItemDTO"%>
<%@page import="group3.items.ItemDAO"%>
<%@page import="group3.itemCategory.ItemCategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="group3.itemCategory.ItemCategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        <title> AsianGastroWeb </title>

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

    <body class="sub_page">

        <div class="hero_area">
            <div class="bg-box">
                <img src="images/hero-bg.jpg" alt="">
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
                                <li class="nav-item">
                                    <a class="nav-link" href="homePage.jsp">Home </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="menu.jsp">Menu <span class="sr-only">(current)</span> </a>
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
                                
                                <form action="MainController" method="get" class="form-inline">
                                    
                                    <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit" name="btAction" value="Search Food">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>                                   
                                    <input type="text" name="txtSearchItem" value="${param.txtSearchItem}"/>
                                    
                                </form>

                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
        </div>

        <!-- food section -->

        <section class="food_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                        Our Menu
                    </h2>
                </div>
<%
        List<ItemDTO> searchList =(List<ItemDTO>) request.getAttribute("SEARCHLIST");
        if(searchList!= null && searchList.size()>0){            
     %>
     <ul class="filters_menu">
                    
                    <li class="active" data-filter="*">All</li>
                    <%
            ItemCategoryDAO itemCateDAO = new ItemCategoryDAO();
            List<ItemCategoryDTO> itemCateList = itemCateDAO.getAllItemCategory();
            for (ItemCategoryDTO itemCate : itemCateList) {
        %>
                    <li data-filter=".<%=itemCate.getCategoryID().trim()%>"><%=itemCate.getCategoryName()%></li>
                    <%}%>
                </ul>
                <div class="filters-content">
                    <div class="row grid">
<%

            for (ItemDTO item : searchList) {
%>
                        <div class="col-sm-6 col-lg-4 all <%=item.getCategoryID().trim()%>">
                            <div class="box">
                                <div>
                                    <div class="img-box">
                                        <img src="<%=item.getImage()%>" alt="">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            <%=item.getItemName() %>
                                        </h5>
                                        <p>
                                            <%=item.getItemDescription()%>
                                        </p>
                                        <div class="options">
                                            <h6>
                                                <%=item.getPrice()%>
                                            </h6>
                                            <a href="">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                
                <%       
        }} else {
            
%>
                <ul class="filters_menu">
                    
                    <li class="active" data-filter="*">All</li>
                    <%
            ItemCategoryDAO itemCateDAO = new ItemCategoryDAO();
            List<ItemCategoryDTO> itemCateList = itemCateDAO.getAllItemCategory();
            for (ItemCategoryDTO itemCate : itemCateList) {
        %>
                    <li data-filter=".<%=itemCate.getCategoryID().trim()%>"><%=itemCate.getCategoryName()%></li>
                    <%}%>
                </ul>

                <div class="filters-content">
                    <div class="row grid">
<%
            ItemDAO itemDAO = new ItemDAO();
            List<ItemDTO> itemList = new ArrayList<ItemDTO>();
            itemList = itemDAO.getAllItems();
            for (ItemDTO item : itemList) {
%>
                        <div class="col-sm-6 col-lg-4 all <%=item.getCategoryID().trim()%>">
                            <div class="box">
                                <div>
                                    <div class="img-box">
                                        <img src="<%=item.getImage()%>" alt="">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            <%=item.getItemName() %>
                                        </h5>
                                        <p>
                                            <%=item.getItemDescription()%>
                                        </p>
                                        <div class="options">
                                            <h6>
                                                <%=item.getPrice()%>
                                            </h6>
                                            <a href="">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<%
            }

%>
                        
                    </div>
                </div>
<%}%>
                
            </div>
        </section>

        <!-- end food section -->

        <!-- footer section -->
         <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>
              Contact Us
            </h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  FPT University
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call 01 23456789
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  group3prj301@pft.edu.vn
                </span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">
              AsianGastroWeb
            </a>
            <p>
              Our food makes you feel like you're eating a home-cooked meal made with love. Our chefs use only the freshest ingredients to create delicious dishes that will leave you feeling satisfied and happy.  
            </p>
            <div class="footer_social">
              <a href="https://fap.fpt.edu.vn/Default.aspx">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="https://fap.fpt.edu.vn/Default.aspx">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="https://fap.fpt.edu.vn/Default.aspx">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
              <a href="https://fap.fpt.edu.vn/Default.aspx">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="https://fap.fpt.edu.vn/Default.aspx">
                <i class="fa fa-pinterest" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>
            Opening Hours
          </h4>
          <p>
            Everyday
          </p>
          <p>
            10.00 Am -10.00 Pm
          </p>
        </div>
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved By
          <a href="https://html.design/">Free Html Templates</a>
        </p>
      </div>
    </div>
  </footer>
        <!-- footer section -->

        <!-- jQery -->
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
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
        </script>
        <!-- End Google Map -->

        <script>

            let loadMoreBtn = document.querySelector('#view-more');
            let currentItem = 3;

            loadMoreBtn.onclick = () => {
                let boxes = [...document.querySelectorAll('.container .box-container .box')];
                for (var i = currentItem; i < currentItem + 3; i++) {
                    boxes[i].style.display = 'inline-block';
                }
                currentItem += 3;

                if (currentItem >= boxes.length) {
                    loadMoreBtn.style.display = 'none';
                }
            }

        </script>
    </body>

</html>

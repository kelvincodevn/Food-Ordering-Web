<%@page import="group3.itemCategory.ItemCategoryDTO"%>
<%@page import="group3.itemCategory.ItemCategoryDAO"%>
<%@page import="group3.items.ItemDTO"%>
<%@page import="java.util.List"%>
<%@page import="group3.items.ItemDAO"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>crud dashboard</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="mycss/bootstrap.min.css">
        <!----css3---->
        <link rel="stylesheet" href="mycss/custom.css">


        <!--google fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">


        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

    </head>
    <style>
        .custom-img {
            width: 200px;
            height: 120px;
        }
    </style>
    <body>



        <div class="wrapper">

            <div class="body-overlay"></div>

            <!-------sidebar--design------------>

            <div id="sidebar">
                <div class="sidebar-header">
                    <h3><img src="images/admin.png" class="img-fluid"/><span>Admin Page</span></h3>
                </div>
                <ul class="list-unstyled component m-0">
                    <li class="active">
                        <a href="adminHome.jsp" class="dashboard"><i class="material-icons">dashboard</i>Dashboard </a>
                    </li>


                    <li class="dropdown">
                        <a href="#homeSubmenu1" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">aspect_ratio</i>Manage Item
                        </a>
                        <ul class="collapse list-unstyled menu" id="homeSubmenu1">
                            <li><a href="ProductManagement.jsp">Manage Product</a></li>                           
                        </ul>
                    </li>
                    <!--<i class="material-icons">aspect_ratio</i>Manage Item -->




                    <li class="dropdown">
                        <a href="#homeSubmenu2" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">apps</i>Manage Customer
                        </a>
                        <ul class="collapse list-unstyled menu" id="homeSubmenu2">
                            <li><a href="CustomerManagement.jsp">Manager Customer</a></li>                          
                        </ul>
                    </li>


                    <li class="dropdown">
                        <a href="#homeSubmenu3" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">equalizer</i>Manage Order
                        </a>
                        <ul class="collapse list-unstyled menu" id="homeSubmenu3">
                            <li><a href="OrderManagement.jsp">Manage Order</a></li>                           
                        </ul>
                    </li>


                    <li class="dropdown">
                        <a href="#homeSubmenu4" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">extension</i>Manage Category
                        </a>
                        <ul class="collapse list-unstyled menu" id="homeSubmenu4">
                            <li><a href="CategoryManagement.jsp">Manage Category</a></li>                           
                        </ul>
                    </li>
                    <!--
                                        <li class="dropdown">
                                            <a href="#homeSubmenu5" data-toggle="collapse" aria-expanded="false" 
                                               class="dropdown-toggle">
                                                <i class="material-icons">border_color</i>forms
                                            </a>
                                            <ul class="collapse list-unstyled menu" id="homeSubmenu5">
                                                <li><a href="#">Pages 1</a></li>
                                                <li><a href="#">Pages 2</a></li>
                                                <li><a href="#">Pages 3</a></li>
                                            </ul>
                                        </li>
                    
                                        <li class="dropdown">
                                            <a href="#homeSubmenu6" data-toggle="collapse" aria-expanded="false" 
                                               class="dropdown-toggle">
                                                <i class="material-icons">grid_on</i>tables
                                            </a>
                                            <ul class="collapse list-unstyled menu" id="homeSubmenu6">
                                                <li><a href="#">table 1</a></li>
                                                <li><a href="#">table 2</a></li>
                                                <li><a href="#">table 3</a></li>
                                            </ul>
                                        </li>
                    
                    
                                        <li class="dropdown">
                                            <a href="#homeSubmenu7" data-toggle="collapse" aria-expanded="false" 
                                               class="dropdown-toggle">
                                                <i class="material-icons">content_copy</i>Pages
                                            </a>
                                            <ul class="collapse list-unstyled menu" id="homeSubmenu7">
                                                <li><a href="#">Pages 1</a></li>
                                                <li><a href="#">Pages 2</a></li>
                                                <li><a href="#">Pages 3</a></li>
                                            </ul>
                                        </li>
                    
                    
                                        <li class="">
                                            <a href="#" class=""><i class="material-icons">date_range</i>copy </a>
                                        </li>
                                        <li class="">
                                            <a href="#" class=""><i class="material-icons">library_books</i>calender </a>
                                        </li>
                    -->
                </ul>
            </div>

            <!-------sidebar--design- close----------->



            <!-------page-content start----------->

            <div id="content">

                <!------top-navbar-start-----------> 

                <div class="top-navbar">
                    <div class="xd-topbar">
                        <div class="row">
                            <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                                <div class="xp-menubar">
                                    <span class="material-icons text-white">signal_cellular_alt</span>
                                </div>
                            </div>

                            <div class="col-md-5 col-lg-3 order-3 order-md-2">
                                <div class="xp-searchbar">
                                    <form>
                                        <div class="input-group">
                                            <input type="search" class="form-control"
                                                   placeholder="Search">
                                            <div class="input-group-append">
                                                <button class="btn" type="submit" id="button-addon2">Go
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>


                            <div class="col-10 col-md-6 col-lg-8 order-1 order-md-3">
                                <div class="xp-profilebar text-right">
                                    <nav class="navbar p-0">
                                        <ul class="nav navbar-nav flex-row ml-auto">
                                            <li class="dropdown nav-item active">
                                                <a class="nav-link" href="#" data-toggle="dropdown">
                                                    <span class="material-icons">notifications</span>
                                                    <span class="notification">4</span>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">You Have 4 New Messages</a></li>
                                                    <li><a href="#">You Have 4 New Messages</a></li>
                                                    <li><a href="#">You Have 4 New Messages</a></li>
                                                    <li><a href="#">You Have 4 New Messages</a></li>
                                                </ul>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <span class="material-icons">question_answer</span>
                                                </a>
                                            </li>

                                            <li class="dropdown nav-item">
                                                <a class="nav-link" href="#" data-toggle="dropdown">
                                                    <img src="myimg/user.jpg" style="width:40px; border-radius:50%;"/>
                                                    <span class="xp-user-live"></span>
                                                </a>
                                                <ul class="dropdown-menu small-menu">
                                                    <li><a href="#">
                                                            <span class="material-icons">person_outline</span>
                                                            Profile
                                                        </a></li>
                                                    <li><a href="#">
                                                            <span class="material-icons">settings</span>
                                                            Settings
                                                        </a></li>
                                                    <li><a href="#">
                                                            <span class="material-icons">logout</span>
                                                            Logout
                                                        </a></li>

                                                </ul>
                                            </li>


                                        </ul>
                                    </nav>
                                </div>
                            </div>

                        </div>

                        <div class="xp-breadcrumbbar text-center">
                            <h4 class="page-title">Dashboard</h4>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Vishweb</a></li>
                                <li class="breadcrumb-item active" aria-curent="page">Dashboard</li>
                            </ol>
                        </div>


                    </div>
                </div>
                <!------top-navbar-end-----------> 


                <!------main-content-start-----------> 

                <div class="main-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-wrapper">

                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">Manage  Product</h2>
                                        </div>
                                        <div class="col-sm-6 p-0 flex justify-content-lg-end justify-content-center">
                                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                                <i class="material-icons">&#xE147;</i>
                                                <span>Add New Product</span>
                                            </a>
                                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal">
                                                <i class="material-icons">&#xE15C;</i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <%
                                    ItemDAO dao = new ItemDAO();
                                    List<ItemDTO> listItem = dao.getAllItem();
                                    if (listItem != null && listItem.size() > 0) {
                                %>   
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="selectAll">
                                                    <label for="selectAll"></label>
                                                </span>
                                            </th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Price</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (ItemDTO item : listItem) {
                                        %>   
                                        <tr>
                                            <td>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                                    <label for="checkbox1"></label>
                                                </span>
                                            </td>
                                            <td><%=item.getItemID()%></td>
                                            <td><%=item.getItemName()%></td>
                                            <td>
                                                <img src="<%=item.getImage()%>">
                                            </td>
                                            <td><%=item.getPrice() + "d"%></td>
                                            <td>
                                                <a href="<%="MainController?btAction=LoadItem&pk=" + item.getItemID()%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                <a href="<%="MainController?btAction=DeleteItem&pk=" + item.getItemID()%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                                <% } %>  
                                <div class="clearfix">
                                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                            <a href="#"><button type="button" class="btn btn-primary">Back to home</button>

                        </div>
                        <!-- Edit Modal HTML -->
                        <div id="addEmployeeModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="MainController" method="post">
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Add Product</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>

                                        <%-- Display success message if set --%>
                                        <%
                                            if (request.getAttribute("successMessage") != null) {
                                        %>   
                                        <div class="alert alert-success">${errorMessage}</div>
                                        <% } %>
                                        <%-- Display error message if set --%>
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger">${errorMessage}</div>
                                        </c:if>

                                        <div class="modal-body">					
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input name="name" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Image</label>
                                                <input name="txtImage" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input name="price" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" class="form-control" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select name="category" class="form-select" aria-label="Default select example">
                                                    <%
                                                        ItemCategoryDAO c_dao = new ItemCategoryDAO();
                                                        List<ItemCategoryDTO> listCateogry = c_dao.getAllItemCategory();
                                                        if (listCateogry != null && listCateogry.size() > 0) {
                                                            for (ItemCategoryDTO category : listCateogry) {
                                                    %>  
                                                    <option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
                                                    <% }
                                        }%>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" name="btAction" class="btn btn-success" value="Add">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Edit Modal HTML -->
                        <div id="editEmployeeModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Edit Employee</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="email" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Address</label>
                                                <textarea class="form-control" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Phone</label>
                                                <input type="text" class="form-control" required>
                                            </div>					
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-info" value="Save">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Delete Modal HTML -->
                        <div id="deleteEmployeeModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Delete Product</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <p>Are you sure you want to delete these Records?</p>
                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-danger" value="Delete">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!----edit-modal end--------->   




                    </div>
                </div>

                <!------main-content-end-----------> 



                <!----footer-design------------->

                <footer class="footer">
                    <div class="container-fluid">
                        <div class="footer-in">
                            <p class="mb-0">&copy 2021 Vishweb Design . All Rights Reserved.</p>
                        </div>
                    </div>
                </footer>




            </div>

        </div>



        <!-------complete html----------->






        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="myjs/jquery-3.3.1.slim.min.js"></script>
        <script src="myjs/popper.min.js"></script>
        <script src="myjs/bootstrap.min.js"></script>
        <script src="myjs/jquery-3.3.1.min.js"></script>


        <script type="text/javascript">
            $(document).ready(function () {
                $(".xp-menubar").on('click', function () {
                    $("#sidebar").toggleClass('active');
                    $("#content").toggleClass('active');
                });

                $('.xp-menubar,.body-overlay').on('click', function () {
                    $("#sidebar,.body-overlay").toggleClass('show-nav');
                });

            });
        </script>
    </body>

</html>



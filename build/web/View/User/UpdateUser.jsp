<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Model.Role"%>
<%@page import="BIT.Project.VTAFMS.Controller.UserController"%>
<%@page import="BIT.Project.VTAFMS.Model.User"%>
<%@page import="java.util.List"%>
<%@page import="BIT.Project.VTAFMS.Controller.RoleController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vikum Turf Account | Dashboard</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="../../dist/css/_all-skins.min.css">

        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../../dist/js/UserValidate.js"></script>

        <style>
            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <%

            String user_ids = request.getParameter("user_id");
            List<Role> listRole = (List<Role>) RoleController.getAllRoles();
            User user = (User) UserController.searchUserById(Integer.parseInt(user_ids));

        %>
        <!--<c:forEach var="number" begin="5" end="10">  
            <c:out value="${number}"></c:out>  
        </c:forEach>  --> 

        <div class="wrapper">
            <div style="height: 50px" >
                <header class="main-header effect" >
                    <a href="../../index2.html" class="logo" > 
                        <span class="logo-mini"><b>A</b>LT</span>
                        <span class="logo-lg"><b>Vikum</b> TURF </span>
                    </a>
                    <nav class="navbar navbar-static-top " role="navigation"  >
                        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button" >
                            <span class="glyphicon glyphicon-menu-hamburger"></span>
                        </a>

                        <%@include file="../../includes/signOut.jspf" %>  
                    </nav>
                </header>
            </div>
            <%@include file="../../includes/navbar.jspf" %>  
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        User registration
                        <small>Update user</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Forms</a></li>
                        <li class="active">Advanced Elements</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">

                    <div class="row">
                        <form  role="form"  action="../../AddUser" method="POST" ENCTYPE="multipart/form-data">
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Basic informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>First name:</label>
                                                <input type="hidden" id="id" name="id" value="<%=user.getUser_id()%>">
                                                <input type="text" class="form-control my-colorpicker1" id="fname" name="fname" value="<%=user.getUser_firstName()%>" placeholder="Enter first name">
                                                <span id="msgfname"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Last name:</label>
                                                <input type="text" class="form-control my-colorpicker1" id="lname" name="lname" value="<%=user.getUser_lastName()%>" placeholder="Enter last name">
                                                <span id="msglname"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Date of birth:</label>
                                                <input type="date" class="form-control my-colorpicker1" value="<%=user.getUser_dob()%>" id="dob" name="dob">
                                                <span id="msgdob"  style="color: #ff0000"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>NIC number:</label>
                                                <input type="text" class="form-control my-colorpicker1" id="nic" name="nic" value="<%=user.getUser_nic()%>" placeholder="Enter NIC number">
                                                <span id="msgnic"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label >Gender</label>
                                                <div class="form-control" style="border: #ffffff;padding-left: 0px" id="gender" name="gender">


                                                    <label class="radio-inline" ><input <%if (user.getUser_gender().equals("male")) { %>checked="checked" <%}  %>  type="radio" name="gender" id="male"  value="male">Male</label>
                                                    <label class="radio-inline"><input <%if (user.getUser_gender().equals("female")) { %>checked="checked" <%}%>   type="radio" name="gender" id="female" value="female">Female</label>
                                                    <span id="msggender"  style="color: #ff0000"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title">Login information</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <soan style="float: right" id="txtHint"></soan>
                                                <label>User name:</label>
                                                <input type="text" class="form-control my-colorpicker1" id="uname" name="uname" value="<%=user.getUser_uname()%>" placeholder="Enter username">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-info" value="Update User" name="Update"/>
                                    <!-- <button type="submit" name="submit" class="btn btn-info">
                                         <i class="glyphicon glyphicon-save"></i>
                                         Submit</button>-->
                                    <button type="reset" name="reset" class="btn btn-primary">
                                        <i class="glyphicon glyphicon-trash"></i>
                                        Clear</button>
                                </div>
                            </div>
                            <!-- /.col (left) -->
                            <div class="col-md-6">
                                <div class="box box-warning">
                                    <div class="box-header">
                                        <h3 class="box-title">Contact informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Phone number:</label>
                                                <input type="text" class="form-control my-colorpicker1" id="pnumber" name="pnumber" value="<%=user.getUser_phoneNumber()%>" placeholder="Enter phone number">
                                                <span id="msgpnumber"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>E mail:</label>
                                                <input type="email" class="form-control my-colorpicker1" id="email" name="email" value="<%=user.getUser_email()%>" placeholder="Enter email">
                                                <span id="msgemail"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Address:</label>
                                                <textarea class="form-control" rows="4" id="address" name="address" value="<%=user.getUser_address()%>" placeholder="Enter Address"><%=user.getUser_address()%></textarea>
                                                <span id="msgaddress"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Other informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>User role</label>
                                            <select class="form-control select2" style="width: 100%;" id="role" name="role">
                                                <option selected value="default"> --------Please select State---------   </option>
                                                <%
                                                    for (Role model : listRole) {
                                                        if (model.getRole_id() == user.getRole_id()) {
                                                %>
                                                <option selected="selected" value="<%=model.getRole_id()%>" ><%=model.getRole_name()%></option>
                                                <%}

                                                    }%>
                                            </select>
                                            <span id="msgrole"  style="color: #ff0000"></span>
                                        </div>

                                        <div class="form-group">
                                            <label>Upload image</label>
                                            <input  type="file" id="img" name="img" class="form-control"  style="border: #ffffff;padding-left: 0px" value="<%=user.getUser_image()%>">
                                            <img style="width: 130px"src="../../uploads/<%=user.getUser_image()%>">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </section>

            </div>
            <%@include file="../../includes/footer.jspf" %>  
        </div>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

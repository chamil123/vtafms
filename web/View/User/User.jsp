<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BIT.Project.VTAFMS.Model.Role"%>
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

        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../../dist/js/UserValidate.js"></script>

        <script>
            $(function () {
                $("#dob").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd',
                    yearRange: "-55:-18"
                });
            });
        </script>
        <style>
            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load()" >

        <%
            String user = request.getParameter("res_person");
            int res_person = 0;
            if (user != null) {
                res_person = Integer.parseInt(user.toString());
            }

            List<Role> listRole = (List<Role>) RoleController.getAllRoles();

            Date dNow = new Date();
            SimpleDateFormat ft
                    = new SimpleDateFormat("yyyy-MM-dd");
            //System.out.print("sdasdasd : "+ft.format(dNow));
            String maxdate = ft.format(dNow);

        %>

        <script type="text/javascript">
            function load() {
                var result =<%=res_person%>
                if (result > 0) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                }

            }
            function showUserName(str)
            {
                var xmlhttp;
                if (str == "")
                {
                    document.getElementById("txtHint").innerHTML = "";
                    return;
                }
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else
                {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET", "../../CheckUserNames?uname=" + str, true);
                xmlhttp.send();
            }
        </script>
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
                        <small>Add user</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewUser.jsp">View Users</a></li>
                        <li class="active">Add User</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">

                    <div class="row">
                        <form  role="form"  action="../../AddUser" method="POST" ENCTYPE="multipart/form-data">
                            <div id="ss" class="alert-boxs  response-content " style="margin: 0px 15px 10px 15px"></div> 
                            <div class="alert alert-box success " style="margin: 0px 15px 10px 15px">Successfully added record</div>
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Basic informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>First name:</label>

                                                <input type="text" class="form-control my-colorpicker1 required" id="fname" name="fname" placeholder="Enter first name">
                                                <span id="msgfname"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Last name:</label>
                                                <input type="text" class="form-control my-colorpicker1 required" id="lname" name="lname" placeholder="Enter last name">
                                                <span id="msglname"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Date of birth:</label>
                                                <input type="text" class="form-control required" max="<%=maxdate%>" id="dob" name="dob">
                                                <span id="msgdob"  style="color: #ff0000"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>NIC number:</label>
                                                <input type="text" class="form-control my-colorpicker1 required" id="nic" name="nic" placeholder="Enter NIC number">
                                                <span id="msgnic"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label >Gender</label>
                                                <div class="form-control " style="border: #ffffff;padding-left: 0px" id="gender" name="gender" value="">
                                                    <label class="radio-inline" ><input type="radio" id="male" name="gender"  value="male">Male</label>
                                                    <label class="radio-inline"><input type="radio" id="female" name="gender"  value="female">Female</label>
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
                                                <label>User name:</label>
                                                <soan style="float: right" id="txtHint"></soan>
                                                <input type="text" class="form-control my-colorpicker1 required" id="uname" name="uname" onkeyup="showUserName(this.value)" placeholder="Enter username">
                                                <span id="msguname"  style="color: #ff0000"></span>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary required" value="AddUser" name="Add"/>
                                    <!--  <button type="submit" name="submit" class="btn btn-info">
                                          <i class="glyphicon glyphicon-save"></i>
                                          Submit</button>-->
                                    <button type="reset" name="reset" class="btn btn-danger">
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
                                                <input type="text" class="form-control my-colorpicker1 required" id="pnumber" name="pnumber" placeholder="Enter phone number">
                                                <span id="msgpnumber"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>E mail:</label>
                                                <input type="email" class="form-control my-colorpicker1 required" id="email" name="email" placeholder="Enter email">
                                                <span id="msgemail"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Address:</label>
                                                <textarea class="form-control required" rows="4" id="address" name="address" placeholder="Enter Address"></textarea>
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
                                            <select class="form-control select2 required" style="width: 100%;" id="role" name="role">
                                                <option  value=""> --------Please select State---------   </option>
                                                <%
                                                    for (Role model : listRole) {
                                                %>
                                                <option value="<%=model.getRole_id()%>" ><%=model.getRole_name()%></option>
                                                <%}%>
                                            </select>
                                            <span id="msgrole"  style="color: #ff0000"></span>
                                        </div>
                                        <!--  <div class="form-group">
                                              <label>Status</label>
                                              <select class="form-control select2 required" style="width: 100%;" id="status" name="status">
                                                  <option value="">----Please select a status-----</option>
                                                  <option>Activate</option>
                                                  <option>Diactivate</option>
                                              </select>
                                              <span id="msgstatus"  style="color: #ff0000"></span>
                                          </div>-->
                                        <div class="form-group">
                                            <label>Upload image</label>
                                            <input  type="file" id="img" name="img" class="form-control " style="border: #ffffff;padding-left: 0px">
                                            <span id="msgimg"  style="color: #ff0000"></span>
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

        <!-- <link href="../../plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css"/>
         <script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>-->


        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
        <!--for date picker-->



        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>

        <!--for date picker-->
    </body>

</html>

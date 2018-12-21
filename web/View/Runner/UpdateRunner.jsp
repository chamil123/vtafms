<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>


<%@page import="BIT.Project.VTAFMS.Controller.RunnerController"%>
<%@page import="BIT.Project.VTAFMS.Model.Runner"%>
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

        <script src="../../dist/js/jquery-1.8.3.min.js"></script>
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/RunnerValidate.js" type="text/javascript"></script>
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
            String user_ids = request.getParameter("runner_id");
            Runner runner = (Runner) RunnerController.searchRunnerById(Integer.parseInt(user_ids));

            //   String runnerRes = request.getParameter("runnerResult");
            // Object runners=request.getAttribute("runnerResult");

        %>

        <div class="wrapper">
                  <div style="height: 50px" >
                <header class="main-header effect" >
                    <a href="../../index2.html" class="logo" > 
                        <span class="logo-mini"><b>A</b>LT</span>
                        <span class="logo-lg"><b>Vikum</b> TURF </span>
                    </a>
                    <nav class="navbar navbar-static-top " role="navigation"  >
                        <a href="#" class="sidebar-toggle " data-toggle="offcanvas" role="button" >
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
                        Runner registration
                        <small>Update Runner</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="ViewRunners.jsp">View Runner</a></li>
                        <li class="active">Update Runner</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">

                    <div class="row">
                        <form  role="form"  action="../../AddRunner" method="POST" >
                            <div id="ss" class="alert-boxs  response-content " style="margin: 0px 15px 10px 15px"></div> 
                            <div class="alert alert-box success " style="margin: 0px 15px 10px 15px">Runner <%=runner.getRunner_firstName()%>record is successfully updated </div>
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Basic informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>First name</label>
                                            <input type="hidden" id="id" name="id" value="<%=runner.getRunner_id()%>">
                                            <input type="text" class="form-control my-colorpicker1 required" id="fname" name="fname" value="<%=runner.getRunner_firstName()%>" placeholder="Enter first name">
                                            <span id="msgfname" style="color: #ff0000"></span>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Last Number</label>

                                                <input type="text" class="form-control my-colorpicker1 required" id="lname" name="lname" value="<%=runner.getRunner_lastName()%>"  placeholder="Enter last name">
                                                <span id="msglname" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Nic number:</label>

                                                <input type="text" class="form-control my-colorpicker1 required" id="nic" name="nic" value="<%=runner.getRunner_NIC()%>" placeholder="Enter NIC number">
                                                <span id="msgnic" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Update Runner" name="Update"/>
                                    <!-- <button type="submit" name="submit" class="btn btn-info">
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
                                                <label>Mobile number:</label>
                                                <input type="tel" class="form-control my-colorpicker1 required" id="pnumber" name="pnumber" value="<%=runner.getRunner_mobileNumber()%>"  placeholder="Enter mobile number">
                                                <span id="msgpnumber" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Home number:</label>
                                                <input type="tel" class="form-control my-colorpicker1 required" id="hnumber" name="hnumber" value="<%=runner.getRunner_homeNumber()%>" placeholder="Enter home  number">
                                                <span id="msghnumber" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Email address :</label>
                                                <input type="text" class="form-control my-colorpicker1 required" id="email" name="email" value="<%=runner.getRunner_email()%>" placeholder="Enter email address">
                                                <span id="msgemail" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Address:</label>
                                                <textarea class="form-control required" rows="4" id="address" name="address" placeholder="Enter Address"><%=runner.getRunner_address()%></textarea>
                                                <span id="msgaddress" style="color: #ff0000"></span>
                                            </div>
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

        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

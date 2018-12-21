<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="BIT.Project.VTAFMS.Controller.RunnerController"%>
<%@page import="BIT.Project.VTAFMS.Model.Runner"%>
<%@page import="BIT.Project.VTAFMS.Model.User"%>
<%@page import="BIT.Project.VTAFMS.Controller.UserController"%>
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

                <script src="../../plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <style>
            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>
        <script>
            function getUserIdForDelete(user_id) {

                document.getElementById('iddelete').value = user_id;

            }
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load();">

        <%
            String name = request.getParameter("name");
            String pagenum = request.getParameter("page1");
            int page1 = 0;
            if (request.getParameter("page") != null) {
                int pages = Integer.parseInt(request.getParameter("page"));
                page1 = 0;
                if (pages == 0 || pages == 1) {
                    page1 = 0;
                } else {
                    page1 = (pages * 10) - 10;
                }
            }
            double rowCount = RunnerController.getRowCount();
            int row = (int) rowCount;
            double nopage = rowCount / 10;
            DecimalFormat f = new DecimalFormat("##.0");
            String formatval = f.format(nopage).toString();

            int before = formatval.indexOf(".");
            int after = formatval.length();
            String sub = formatval.substring(before, after);

            if (!sub.equals("null")) {
                double subst = Double.parseDouble(sub);
                if (subst > 0) {
                    nopage++;
                }
            }

            List<Runner> listRunner = (List<Runner>) RunnerController.limitresult("" + page1);
            String runnerRes = request.getParameter("runnerResult");
            int res_runner = 0;
            if (runnerRes != null) {
                res_runner = Integer.parseInt(runnerRes.toString());
            }
        %>
        <script>
            function load() {
                var result =<%=res_runner%>
                if (result == 1) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                } else if (result == 2) {
                    $('.failure').fadeIn(1500).delay(1500).fadeOut(400);
                }
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
                        Runner/Distributer
                        <small>View runner</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">ViewRunner</li>

                    </ol>
                </section>
                <!-- Main content -->

                <section class="content">
                    <div class="alert alert-box success " >record is successfully updated </div>
                    <div class="alert alert-box failure " >record is successfully Deleted </div>
                    <div class="box box-default">
                        <div class="col-md-12" style="height: 45px;padding-top: 8px">

                            <form  class="form-inline" role="form"  action="" method="POST" >

                                <div class="form-group">
                                    <a href="Runner.jsp" style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px;margin-left: -5px" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; New Runner</a>


                                </div>
                                <div class="form-group">


                                </div>

                                <div class="form-group" style="float: right">
                                    <input style="height: 25px" type="hidden" class="form-control" name="page" id="page" value="" >
                                    <input style="height: 25px" type="text" class="form-control" name="search" id="search"  placeholder="Enter Center name">
                                    <button type="submit" class="btn btn-github"  style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px" value="search Expenses" name="Add"><i class="glyphicon glyphicon-search" ></i>&nbsp;Search summery</button>

                                </div>

                            </form>
                        </div>
                        <table class="table table-striped" width="70%">

                            <tr>
                                <th>&nbsp;id&nbsp;</th>
                                <th>First name&nbsp;</th>
                                <th>Last name&nbsp;</th>
                                <th>NIC number&nbsp;</th>
                                <th>Phone Number&nbsp;</th>
                                <th>Home Number&nbsp;</th>
                                <th>Email&nbsp;</th>
                                <th>Address&nbsp;</th>

                                <th>Actions&nbsp;</th>
                            </tr>
                            <%
                                for (Runner model : listRunner) {
                            %>
                            <tr>
                                <td>&nbsp;<%=model.getRunner_id()%></td>
                                <td>&nbsp;<%=model.getRunner_firstName()%></td>
                                <td><%=model.getRunner_lastName()%></td>
                                <td><%=model.getRunner_NIC()%></td>
                                <td><%=model.getRunner_mobileNumber()%></td>
                                <td><%=model.getRunner_homeNumber()%></td>
                                <td><%=model.getRunner_email()%></td>
                                <td><%=model.getRunner_address()%></td>

                                <td> 


                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="UpdateRunner.jsp?runner_id=<%=model.getRunner_id()%>"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=model.getRunner_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </button>


                                </td>
                            </tr>


                            <%}%>
                        </table>  
                        <div class="pagination " style="width: 100%">
                            <% int i = 0;%>
                            <a href="ViewRunners.jsp?page=<%=i%>" class="page active">first</a>
                            <% for (i = 1; i <= nopage; i++) {%>

                            <a href="ViewRunners.jsp?page=<%=i%>" class="page">
                                <%=i%>
                            </a>
                            <% }%>
                            <a href="ViewRunners.jsp?page=<%=i - 1%>" class="page active">last</a>
                            <div style="float: right;font-size: 12px;color: #666666;padding-right: 15px">Showing 1 to 8 of <spam ><%=row%></spam> entries</div>
                        </div>
                    </div>
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  


            <!-- Modal -->
            <div class="modal fade" id="deleteModal" role="dialog" >
                <div class="modal-dialog" style="width: 500px">

                    <!-- Modal content-->

                    <div class="modal-content">

                        <div class="modal-header" style="height: 35px;padding: 7px 7px 7px 17px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <i class="glyphicon glyphicon-trash" style="float: left;padding-top: 5px;padding-right: 10px"></i>
                            <h4 class="modal-title">Confirm a user deletion</h4>
                        </div>
                        <form action="../../AddRunner" method="POST">


                            <div class="modal-body">
                                <spam >This will delete this user <b>permanently</b></spam><br/>
                                <spam>Are you sure want to permanently delete the selected item ?</spam>
                                <!-- <spam>Please click the <b>Delete button</b> only ones, it will takes few moments for the <br/>deletion process to complete</spam>-->
                            </div>
                            <div class="modal-footer" style="height: 48px;padding: 7px 7px 7px 17px;">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                <input type="hidden" class="form-control" id="iddelete"  name="user_id" >
                                <input  type="submit" class="btn btn-danger" value="Delete Runner" name="delete" />


                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

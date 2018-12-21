<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Model.Center"%>
<%@page import="BIT.Project.VTAFMS.Controller.CenterController"%>
<%@page import="BIT.Project.VTAFMS.Controller.ExcessLineController"%>
<%@page import="BIT.Project.VTAFMS.Model.ExcessLine"%>
<%@page import="BIT.Project.VTAFMS.Controller.ExcessController"%>
<%@page import="BIT.Project.VTAFMS.Model.Excess"%>
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

        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <style>
            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>
        <script>
            function alertFunction(excess_id) {
                var date, cname, cid, lcamount, ncamount, lcnc, papercash, slippaytot, compay, expenses, fc, pd, cash, exetot, chtNum, investment, payment;
                $.ajax({
                    type: 'POST',
                    url: "../../updateExcessLineAjax?dayVal=" + excess_id + "&type=excess"
                }).done(function (data) {

                    var rowTokens = data.split("!");
                    var x;

                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        date = columnTokens[0];
                        cname = columnTokens[1];
                        cid = columnTokens[2];
                    }
                    document.getElementById('date').value = date;
                    document.getElementById('cname').value = cname;
                    document.getElementById('cnumber').value = cid;

                });
                $.ajax({
                    type: 'POST',
                    url: "../../updateExcessLineAjax?dayVal=" + excess_id + "&type=excessLine"
                }).done(function (data) {

                    var rowTokens = data.split("!");
                    var x;

                    var outputData;
                    outputData = "<table id=addressesTable class=table table-striped width=100%>";
                    outputData += "<th>" + "id" + "</th>";
                    outputData += "<th>" + "Chit number" + "</th>";
                    outputData += "<th>" + "Repeat count" + "</th>";
                    outputData += "<th>" + "Total Payment" + "</th>";
                    outputData += "<th>" + "Due payment" + "</th>";
                    outputData += "<th>" + "Reson" + "</th>";


                    for (x = 0; x < rowTokens.length - 1; x++) {

                        var columnTokens = rowTokens[x].split(":");
                        id = columnTokens[0];
                        number = columnTokens[1];
                        Date = columnTokens[2];
                        due = columnTokens[3];
                        payment = columnTokens[4];
                        reson = columnTokens[5];

                        outputData += "<tr>";
                        outputData += "<td>" + id + "</td>";
                        outputData += "<td>" + number + "</td>";
                        outputData += "<td>" + Date + "</td>";
                        outputData += "<td>" + due + "</td>";
                        outputData += "<td>" + payment + "</td>";
                        outputData += "<td>" + reson + "</td>";
                    }
                    outputData += "</tr>";
                    outputData += "</table>";
                    document.getElementById('tableDiv').innerHTML = outputData;
                });
            }
            function getUserIdForDelete(user_id) {

                document.getElementById('iddelete').value = user_id;

            }
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load();">

        <%

            //List<Role> listRole = (List<Role>) RoleController.getAllRoles();
            List<Excess> listexcess = (List<Excess>) ExcessController.getAllExcess();
            // List<ExcessLine>listexcessline = (List<ExcessLine>) ExcessController.getAllExcess();
            String exxcessRes = request.getParameter("ExcessResult");
            int res_excess = 0;
            if (exxcessRes != null) {
                res_excess = Integer.parseInt(exxcessRes.toString());
            }
        %>
        <script>
            function load() {
                var result =<%=res_excess%>
                if (result == 1) {
                    $('.success').fadeIn(1000).delay(1000).fadeOut(300);

                } else if (result == 2) {
                    $('.failure').fadeIn(1000).delay(1000).fadeOut(300);
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
                        Excess
                        <small>View excess</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">View excess</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="alert alert-box success " >record is successfully updated </div>
                    <div class="alert alert-box failure " >record is successfully Deleted </div>
                    <div class="box box-default">
                        <table class="table table-striped" width="70%">

                            <tr>
                                <th>&nbsp;id&nbsp;</th>
                                <th>Center number&nbsp;</th>
                                <th>Center name&nbsp;</th>
                                <th>Date &nbsp;</th>
                                <th>Total due&nbsp;</th>
                                <th>Total Payment&nbsp;</th>
                                <th>Excess count&nbsp;</th>

                                <th>Actions&nbsp;</th>
                            </tr>
                            <%
                                Center center;
                                double duePayment = 0;
                                double totalPayment = 0;
                                int count = 0;
                                for (Excess model : listexcess) {
                                    center = CenterController.getAllCenterByID2(model.getCenter_id());
                                    duePayment = ExcessLineController.getduepaymentByID(model.getExcess_id());
                                    totalPayment = ExcessLineController.gettotalpaymentByID(model.getExcess_id());
                                    count = ExcessLineController.getcountByID(model.getExcess_id());
                            %>
                            <tr>
                                <td>&nbsp;<%=model.getExcess_id()%></td>
                                <td>&nbsp;<%=model.getCenter_id()%></td>
                                <td>&nbsp;<%=center.getCenter_Name()%></td>
                                <td>&nbsp;<%=model.getExcess_date()%></td>
                                <td>&nbsp;<%=duePayment%></td>
                                <td>&nbsp;<%=totalPayment%></td>
                                <td>&nbsp;<%=count%></td>
                                <td> 

                                    <button type="submit" class="btn btn-default btn-sm "  >
                                        <a href="" onclick="alertFunction(<%=model.getExcess_id()%>);" style="color: black"  data-toggle="modal" data-target="#myModal">
                                            <i class="glyphicon glyphicon-file"></i>
                                        </a>

                                    </button>
                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="UpdateExces.jsp?excess_id=<%=model.getExcess_id()%>"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=model.getExcess_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </button>


                                </td>
                            </tr>


                            <%}%>
                        </table>  
                    </div>
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog" >
                <div class=" modal-dialog " style="width:70%;margin-top: 100px;background-color: #cccccc;border-radius: 5px">

                    <!-- Modal content-->

                    <div class="modal-content" style="background-color: #ECF0F5;border-radius: 5px" >

                        <div class="modal-header" style="padding: 8px 8px 8px 20px">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Excess information  <span style="font-size: 15px;color: #0000cc">&nbsp;&nbsp;&nbsp;&nbsp;  </span><spam style="font-size: 13px;color: #0000cc" id="fname1" ></spam></h4>
                        </div>
                        <div class="modal-body" style="margin: 0px 0px 0px 0px;">

                            <!-- /.col (left) -->

                            <div>
                                <form class="form-horizontal">
                                    <div class="form-group" >
                                        <label class="control-label col-sm-2" for="date">Date :</label>
                                        <div class="col-sm-10"> 
                                            <input type="text" style="background-color: #ECF0F5;border: hidden" class="form-control" name="date" id="date">

                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-top: -20px">
                                        <label class="control-label col-sm-2" for="cname">Center name:</label>
                                        <div class="col-sm-10">
                                            <input type="text"  style="background-color: #ECF0F5;border: hidden" class="form-control" name="cname" id="cname">

                                        </div>
                                    </div >
                                    <div class="form-group" style="margin-top: -20px">
                                        <label class="control-label col-sm-2" >Center number:</label>
                                        <div class="col-sm-10"> 
                                            <input type="text"  style="background-color: #ECF0F5;border: hidden" class="form-control" id="cnumber" name="cnumber">

                                        </div>
                                    </div>

                                </form>
                            </div>
                            <div class="box box-default">
                                <div id="tableDiv" style="border-radius: 0px;margin-left: 0px"></div> 
                            </div>


                        </div>

                    </div>
                </div>
            </div>

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
                        <form action="../../AddExcess" method="POST">


                            <div class="modal-body">
                                <spam >This will delete this user <b>permanently</b></spam><br/>
                                <spam>Are you sure want to permanently delete the selected item ?</spam>
                                <!-- <spam>Please click the <b>Delete button</b> only ones, it will takes few moments for the <br/>deletion process to complete</spam>-->
                            </div>
                            <div class="modal-footer" style="height: 48px;padding: 7px 7px 7px 17px;">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                <input type="hidden" class="form-control" id="iddelete"  name="excess_id" >
                                <input  type="submit" class="btn btn-danger" value="Delete Excess" name="delete" />


                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

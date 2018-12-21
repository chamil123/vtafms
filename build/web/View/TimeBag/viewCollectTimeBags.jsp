<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.CollectTimeBagLineController"%>
<%@page import="BIT.Project.VTAFMS.Controller.AgentController"%>
<%@page import="BIT.Project.VTAFMS.Model.Agent"%>
<%@page import="BIT.Project.VTAFMS.Model.Runner"%>
<%@page import="BIT.Project.VTAFMS.Controller.RunnerController"%>
<%@page import="BIT.Project.VTAFMS.Controller.CollectTimeBagController"%>
<%@page import="BIT.Project.VTAFMS.Model.CollectTimeBag"%>
<%@page import="BIT.Project.VTAFMS.Controller.CenterController"%>
<%@page import="BIT.Project.VTAFMS.Model.Center"%>
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

        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>

        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>


        <script>
            function alertFunction(timebag_id) {
                var date, cname, cid, lcamount, ncamount, lcnc, papercash, slippaytot, compay, expenses, fc, pd, cash, exetot, chtNum, investment, payment;
                $.ajax({
                    type: 'POST',
                    url: "../../CollectTimeBags?timebag_id=" + timebag_id + "&action=timebag"
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
                    url: "../../CollectTimeBags?timebag_id=" + timebag_id + "&action=timebagLine"
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;

                    var outputData;
                    outputData = "<table id=addressesTable class=table table-striped width=100%>";
                    outputData += "<th>" + "Timebag id" + "</th>";
                    outputData += "<th>" + "Timebag code" + "</th>";
                    outputData += "<th>" + "Time Value" + "</th>";
                    outputData += "<th>" + "Open time" + "</th>";
                    outputData += "<th>" + "Closing time" + "</th>";

                    for (x = 0; x < rowTokens.length - 1; x++) {

                        var columnTokens = rowTokens[x].split("#");
                        id = columnTokens[0];
                        // number = columnTokens[1];
                        Date = columnTokens[2];
                        due = columnTokens[3];
                        payment = columnTokens[4];
                        reson = columnTokens[5];

                        outputData += "<tr>";
                        outputData += "<td>" + id + "</td>";
                        //  outputData += "<td>" + number + "</td>";
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
    <body class="hold-transition skin-blue sidebar-mini">

        <%
            //List<Role> listRole = (List<Role>) RoleController.getAllRoles();

            List<CollectTimeBag> listtimebagcol = (List<CollectTimeBag>) CollectTimeBagController.getAllCollectTimeBags();
        %>

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
                        Timebag 
                        <small>View timebag</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">view collection timebag</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="box box-default">
                        <table class="table table-striped" width="70%">

                            <tr >
                                <th>&nbsp;id&nbsp;</th>
                                <th>Date&nbsp;</th>
                                <th>Runer name&nbsp;</th>
                                <th>Agent name&nbsp;</th>
                                <th>User &nbsp;</th>
                                <th>Available timebag &nbsp;</th>


                                <th>Actions&nbsp;</th>
                            </tr>
                            <%
                                Runner runner;
                                Agent agent;
                                User user;
                                int count;
                                for (CollectTimeBag modeltimebagcol : listtimebagcol) {
                                    runner = RunnerController.searchRunnerById(modeltimebagcol.getRunner_id());
                                    agent = AgentController.searchAgentById(modeltimebagcol.getAgent_id());
                                    user = UserController.searchUserById(modeltimebagcol.getUser_id());
                                    count = CollectTimeBagLineController.getcountByID(modeltimebagcol.getCollection_timeBag_id());
                            %>
                            <tr>
                                <td>&nbsp;<%=modeltimebagcol.getCollection_timeBag_id()%></td>
                                <td>&nbsp;<%=modeltimebagcol.getCollection_timeBag_date()%></td>
                                <td><%=runner.getRunner_firstName() + " " + runner.getRunner_lastName()%></td>
                                <td><%=agent.getAgent_name()%></td>
                                <td><%=user.getUser_firstName()%></td>

                                <td><%=count%></td>

                                <td> 

                                    <button type="submit" class="btn btn-default btn-sm "  >

                                        <a href="" onclick="alertFunction(<%=modeltimebagcol.getCollection_timeBag_id()%>);" style="color: black"  data-toggle="modal" data-target="#myModal">
                                            <i class="glyphicon glyphicon-file"></i>
                                        </a>

                                    </button>
                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="UpdateCollectionTimebag.jsp?timebag_id=<%=modeltimebagcol.getCollection_timeBag_id()%>&action=update"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=modeltimebagcol.getCollection_timeBag_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
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
                            <h4 class="modal-title">Time Bag information  <span style="font-size: 15px;color: #0000cc">&nbsp;&nbsp;&nbsp;&nbsp;  </span><spam style="font-size: 13px;color: #0000cc" id="fname1" ></spam></h4>
                        </div>
                        <div class="modal-body" style="margin: 0px 0px 0px 0px;">

                            <!-- /.col (left) -->

                            <div>
                                <form class="form-horizontal">
                                    <div class="form-group" >
                                        <label class="control-label col-sm-3" for="date">Date :</label>
                                        <div class="col-sm-9"> 
                                            <input type="text" style="background-color: #ECF0F5;border: hidden" class="form-control" name="date" id="date">

                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-top: -20px">
                                        <label class="control-label col-sm-3" for="cname">Runner name:</label>
                                        <div class="col-sm-9">
                                            <input type="text"  style="background-color: #ECF0F5;border: hidden" class="form-control" name="cname" id="cname">

                                        </div>
                                    </div >
                                    <div class="form-group" style="margin-top: -20px">
                                        <label class="control-label col-sm-3" >Agent name :</label>
                                        <div class="col-sm-9"> 
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
                        <form action="../../CollectTimeBags?action=delete" method="POST">


                            <div class="modal-body">
                                <spam >This will delete this user <b>permanently</b></spam><br/>
                                <spam>Are you sure want to permanently delete the selected item ?</spam>
                                <!-- <spam>Please click the <b>Delete button</b> only ones, it will takes few moments for the <br/>deletion process to complete</spam>-->
                            </div>
                            <div class="modal-footer" style="height: 48px;padding: 7px 7px 7px 17px;">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                <input type="text" class="form-control" id="iddelete"  name="timebag_id" >
                                <input  type="submit" class="btn btn-danger" value="Delete timebag" name="delete" />


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

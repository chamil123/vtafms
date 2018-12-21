<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Model.CollectTimeBagLine"%>
<%@page import="BIT.Project.VTAFMS.Controller.CollectTimeBagController"%>
<%@page import="BIT.Project.VTAFMS.Model.CollectTimeBag"%>
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

        <script src="../../plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="../../plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
        <script src="../../plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>

        <script src="../../dist/js/jquery-1.8.3.min.js"></script>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>

        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
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
    <body class="hold-transition skin-blue sidebar-mini" ">
        <%
            String name = request.getParameter("name");

            List<CollectTimeBagLine> collectTimeBagList = (List<CollectTimeBagLine>) CollectTimeBagController.getAllTimebagLineByRunner(name);

        %>

        <script>
            var Runner = [
            ];
            var TimeBag = [
            ];

            $(document).on("ready", function () {
                loadData();
            });
            var loadData = function () {
                $.ajax({
                    type: 'POST',
                    url: "../../GetAllRunnersinAjax"
                }).done(function (data) {
                 //  alert(data);
                    var rowTokens = data.split("!");
                    var x;
                    var seantorCity;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        var y;
                        for (y = 0; y < columnTokens.length; y++) {
                        }

                        Runner.push({"label": columnTokens[1], "number": columnTokens[0]});

                    }
                });

             
            }

            $(document).ready(function () {
                $("#aname").autocomplete({source: Runner, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);
                        $("#rnum").val(ui.item.number);
                    }});
            });
        </script>
        <!--<script>
            function load() {
                var result =<//%=res_runner%>
                if (result == 1) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                } else if (result == 2) {
                    $('.failure').fadeIn(1500).delay(1500).fadeOut(400);
                }
            }
        </script>-->
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

                            <form  class="form-inline" role="form"  action="../../RateRunnerAmounts" method="POST" >

                                <input style="height: 25px" type="text" class="form-control" name="aname" id="aname" value="" >

                                <input style="height: 25px" type="hidden" class="form-control" name="id" id="id" value="<%=name%>" >
                                <input style="height: 25px" type="hidden" class="form-control" name="rnum" id="rnum"  >


                                <div class="form-group" style="float: right">

                                    <button type="submit" class="btn btn-github"  style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px" value="search Expenses" name="Add"><i class="glyphicon glyphicon-search" ></i>&nbsp;Search summery</button>

                                </div>




                            </form>
                        </div>

                        <table class="table table-striped" width="70%">

                            <tr>
                                <th>&nbsp;id&nbsp;</th>
                                <th>First name&nbsp;</th>



                                <th>Actions&nbsp;</th>
                            </tr>
                            <%
                                for (CollectTimeBagLine model : collectTimeBagList) {
                            %>
                            <tr>
                                <td>&nbsp;<%=model.getCollection_timeBag_id()%></td>
                                <td>&nbsp;<%=model.getTime_bag_Code()%></td>
                                <td>&nbsp;<%=model.getCollection_timeBag_line_rateAmount()%></td>



                                <td> 





                                </td>
                            </tr>


                            <%}%>
                        </table>  
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

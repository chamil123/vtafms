<%-- 
    Document   : viewCenterCash
    Created on : Oct 24, 2016, 7:22:22 PM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Model.AccountCategory"%>
<%@page import="BIT.Project.VTAFMS.Controller.AccountCategoryController"%>
<%@page import="BIT.Project.VTAFMS.Model.Center"%>
<%@page import="BIT.Project.VTAFMS.Model.CenterCash"%>
<%@page import="BIT.Project.VTAFMS.Controller.CenterCashController"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="BIT.Project.VTAFMS.Controller.ExpensesController"%>
<%@page import="BIT.Project.VTAFMS.Controller.AccountController"%>
<%@page import="BIT.Project.VTAFMS.Controller.CenterController"%>
<%@page import="BIT.Project.VTAFMS.Model.Account"%>
<%@page import="BIT.Project.VTAFMS.Controller.TransactionController"%>
<%@page import="BIT.Project.VTAFMS.Model.Transaction"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="BIT.Project.VTAFMS.Controller.SummeryController"%>
<%@page import="BIT.Project.VTAFMS.Model.Summery"%>
<%@page import="java.util.List"%>

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
        <script src="../../dist/js/jquery-1.8.3.min.js" type="text/javascript"></script>
        <script src="../../plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
        <script src="../../plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load();">

        <%
            double paymentTotal = 0;
            double papercash = 0;
            double lcnc = 0;
            double commisionPayment = 0;
            String fromdate = request.getParameter("fromdate");
            String todates = request.getParameter("todates");

            List<Object> summerylist = (List<Object>) SummeryController.getPaymentOrderBydate(fromdate, todates);
            for (int i = 0; i < summerylist.size(); i++) {
                paymentTotal = Double.parseDouble(summerylist.get(0).toString());
                lcnc = Double.parseDouble(summerylist.get(1).toString());
                papercash = Double.parseDouble(summerylist.get(2).toString());
                commisionPayment = Double.parseDouble(summerylist.get(3).toString());

            }
            List<Account> account = (List<Account>) AccountController.getAllAccounts();

            String accountRes = request.getParameter("accountResult");
            int res_acc = 0;
            if (accountRes != null) {
                res_acc = Integer.parseInt(accountRes.toString());
            }
        %>
        <script type="text/javascript">
            function load() {
                var result =<%=res_acc%>
                if (result == 1) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                } else if (result == 2) {
                    $('.failure').fadeIn(1500).delay(1500).fadeOut(400);
                }
            }

            function createXMLHttpRequest() {
                var xmlhttp;
                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                } else {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }
        </script>
        <script>

            var AccountCategory = [
            ];
            var Account = [
            ];
            $.ajax({
                type: 'POST',
                url: "../../GetAccountCategoryAmountTotal?val=piechart"
            }).done(function (data) {
                var rowTokens = data.split("!");
                var x;

                for (x = 0; x < rowTokens.length - 1; x++) {

                    var columnTokens = rowTokens[x].split(":");
                    var chtNum = columnTokens[0];
                    AccountCategory.push({"country": columnTokens[0], "visits": columnTokens[1]});
                }
            });
            $.ajax({
                type: 'POST',
                url: "../../GetAccountCategoryAmountTotal?val=barchart"
            }).done(function (data) {

                var rowTokens = data.split("!");
                var x;

                for (x = 0; x < rowTokens.length - 1; x++) {

                    var columnTokens = rowTokens[x].split(":");
                    var chtNum = columnTokens[0];
                    Account.push({"country": columnTokens[0], "visits": columnTokens[1]});
                }
            });
            var chart;
            var chart2;
            AmCharts.ready(function () {
                // PIE CHART
                chart = new AmCharts.AmPieChart();
                chart.dataProvider = AccountCategory;
                chart.titleField = "country";
                chart.valueField = "visits";
                chart.sequencedAnimation = true;
                chart.startEffect = "elastic";
                chart.innerRadius = "50%";
                chart.startDuration = 2;
                chart.labelRadius = 15;
                chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // the following two lines makes the chart 3D
                chart.depth3D = 3;
                chart.angle = 10;
                // WRITE
                chart.write("chartdiv");
                chart2 = new AmCharts.AmSerialChart();
                chart2.dataProvider = Account;
                chart2.categoryField = "country";
                chart2.startDuration = 1;
                // AXES
                // category
                var categoryAxis = chart2.categoryAxis;
                categoryAxis.labelRotation = 30;
                categoryAxis.gridPosition = "start";
                // value
                // in case you don't want to change default settings of value axis,
                // you don't need to create it, as one value axis is created automatically.

                // GRAPH
                var graph = new AmCharts.AmGraph();
                graph.valueField = "visits";
                graph.balloonText = "[[category]]: <b>[[value]]</b>";
                graph.type = "column";
                graph.lineAlpha = 0;
                graph.fillAlphas = 0.8;
                chart2.addGraph(graph);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorAlpha = 0;
                chartCursor.zoomable = false;
                chartCursor.categoryBalloonEnabled = false;
                chart2.addChartCursor(chartCursor);

                chart2.creditsPosition = "top-right";

                chart2.write("chartdiv2");
            });
            function getUserIdForDelete(exp_id) {

                document.getElementById('iddelete').value = exp_id;
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
                        Accounts
                        <small>View Accounts</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>

                        <li class="active">view accounts</li>
                    </ol>
                </section>
                <div style="margin: 15px 15px 15px 15px" >
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->

                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 240px">

                                <div class="col-md-7">
                                    <!-- HTML -->
                                    <div id="chartdiv2" style="width: 90%; height:250px; margin: 0px 0px 0px -30px"></div>	

                                </div>
                                <div class="col-md-7" style="margin-left: -200px;padding-left:0px">
                                    <!-- HTML -->
                                    <div id="chartdiv" style="width: 100%; height:370px; margin: -50px 0px 0px 50px"></div>	
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <section class="content" >
                    <div class="alert alert-box success " >record is successfully updated </div>
                    <div class="alert alert-box failure " >record is successfully Deleted </div>
                    <div class="box box-default">
                        <div class="col-md-12" style="height: 45px;padding-top: 8px">

                            <form  class="form-inline" role="form"  action="../../GetAccountTotalByDate" method="POST" >

                                <div class="form-group">
                                    <a href="Account.jsp" style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px;margin-left: -5px" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add center cash</a>

                                </div>
                                <div class="form-group">

                                    <input type="date" class="form-group" name="fromdate" id="fromdate">
                                </div>
                                <div class="form-group">

                                    <input type="date" class="form-group" name="todate" id="todate">
                                </div>
                                <div class="form-group">

                                    <input type="submit" class="btn btn-info">
                                </div>

                            </form>
                        </div>
                        <table class="table table-striped" width="70%" style="margin-bottom: 0px">

                            <tr style="background-color: #F2F2F3">
                                <th>&nbsp;id&nbsp;&nbsp;</th>
                                <th>&nbsp;&nbsp;Account name&nbsp;</th>
                                <th>&nbsp;&nbsp;Account Category name&nbsp;</th>

                                <th>&nbsp;&nbsp;Description&nbsp;</th>
                                <th>&nbsp;&nbsp;Balance&nbsp;</th>
                                <th style="text-align: right">Actions&nbsp;</th>
                            </tr>
                            <%      
                                Transaction transaction;
                                AccountCategory acCategory;
                                for (Account model : account) {
                                    transaction = TransactionController.getTotalTransactionAmountByAccount(model.getAccount_id(), fromdate, todates);
                                    acCategory = AccountCategoryController.searchAccountCategoryById(model.getAccount_category_id());
                            %>
                            <tr>
                                <td>&nbsp;<%=model.getAccount_id()%></td>
                                <td>&nbsp;<%=model.getAccount_name()%></td>
                                <td>&nbsp;<%=acCategory.getAccount_category_name()%></td>
                                <td class="col-md-4">&nbsp;&nbsp;<%=model.getAccount_description()%></td>

                                <%
                                    if (model.getAccount_id() == transaction.getAccount_id()) {%>
                                <td style="font-weight: bold">&nbsp;&nbsp;  <%=transaction.getTransaction_amount()%>  </td>


                                <%} else{%>

                                <% if (model.getAccount_name().equals("Betting Slip Payment")) {%>
                                <td style="font-weight: bold">&nbsp;&nbsp;  <%=paymentTotal%>  </td>
                                <%} else if (model.getAccount_name().equals("Paper Cash")) {%>
                                <td style="font-weight: bold">&nbsp;&nbsp;  <%=papercash%>  </td>
                                <%} else if (model.getAccount_name().equals("Commision Given")) {%>
                                <td style="font-weight: bold">&nbsp;&nbsp;  <%=lcnc%>  </td>
                                <%} else if (model.getAccount_name().equals("Commissions and fees")) {%>
                                <td style="font-weight: bold">&nbsp;&nbsp;  <%=commisionPayment%>  </td>
                                <%} else {%>
                                <td style="font-weight: bold">&nbsp;&nbsp;  <%=0.0%>  </td>
                                <%}%>
                                <%}%>
                                <td align="right" style="padding-right: 15px"> 

                                    <button type="submit" class="btn btn-default btn-sm "  >
                                        <a href="" onclick="alertFunction(<%=model.getAccount_id()%>);" style="color: black"  data-toggle="modal" data-target="#myModal">
                                            <i class="glyphicon glyphicon-file"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="UpdateAccount.jsp?account_id=<%=model.getAccount_id()%>&action=update"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=model.getAccount_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </button>
                                </td>

                            </tr>
                            <%
                                }
                            %>
                        </table>  

                    </div>
                </section>

            </div>
            <!-- Modal -->
            <div class="modal fade" id="deleteModal" role="dialog" >
                <div class="modal-dialog" style="width: 500px">
                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-header" style="height: 35px;padding: 7px 7px 7px 17px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <i class="glyphicon glyphicon-trash" style="float: left;padding-top: 5px;padding-right: 10px"></i>
                            <h4 class="modal-title">Confirm a Expenses deletion</h4>
                        </div>
                        <form action="../../AddAccount" method="POST">
                            <div class="modal-body">
                                <spam >This will delete this user <b>permanently</b></spam><br/>
                                <spam>Are you sure want to permanently delete the selected item ?</spam>
                                <!-- <spam>Please click the <b>Delete button</b> only ones, it will takes few moments for the <br/>deletion process to complete</spam>-->
                            </div>
                            <div class="modal-footer" style="height: 48px;padding: 7px 7px 7px 17px;">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                <input type="text" class="form-control" id="iddelete"  name="account_id" >
                                <input  type="submit" class="btn btn-danger" value="Delete Account" name="delete" />
                            </div>
                        </form>
                    </div>

                </div>
            </div>
            <%@include file="../../includes/footer.jspf" %>  

        </div>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>


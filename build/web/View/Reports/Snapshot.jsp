<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.AccountCategoryController"%>
<%@page import="BIT.Project.VTAFMS.Controller.TransactionController"%>
<%@page import="BIT.Project.VTAFMS.Model.AccountCategory"%>
<%@page import="BIT.Project.VTAFMS.Model.Transaction"%>
<%@page import="BIT.Project.VTAFMS.Controller.AccountController"%>
<%@page import="BIT.Project.VTAFMS.Model.Account"%>
<%@page import="BIT.Project.VTAFMS.Controller.SummeryController"%>
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
        <script src="../../dist/js/jquery-1.8.3.min.js" type="text/javascript"></script>

        <style>

            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>
        <script>

            var IncomeExpense = [
            ];
            var chartDatas = [
            ];
            $(document).on("ready", function () {
                loadData();
            });
            var loadData = function () {
                $.ajax({
                    type: 'POST',
                    url: "../../snapshot"
                }).done(function (data) {

                    var rowTokens = data.split("!");
                    var x;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        IncomeExpense.push({"year": columnTokens[0], "income": columnTokens[1], "expenses": columnTokens[2], "cash": columnTokens[3], "pd": columnTokens[4]});
                    }
                });
                $.ajax({
                    type: 'POST',
                    url: "../../GetExpensesAccountTotal"
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        var chtNum = columnTokens[0];
                        chartDatas.push({"country": columnTokens[0], "visits": columnTokens[1]});
                    }
                });
            }
        </script>

        <script>

            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = IncomeExpense;
                chart.categoryField = "year";
                chart.startDuration = 1;
                chart.plotAreaBorderColor = "#DADADA";
                chart.plotAreaBorderAlpha = 1;
                // this single line makes the chart a bar chart
                chart.rotate = false;

                // AXES
                // Category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridPosition = "start";
                categoryAxis.gridAlpha = 0.1;
                categoryAxis.axisAlpha = 0;

                // Value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 0;
                valueAxis.gridAlpha = 0.1;
                valueAxis.position = "left";
                chart.addValueAxis(valueAxis);

                // GRAPHS
                // first graph
                var graph1 = new AmCharts.AmGraph();
                graph1.type = "column";
                graph1.title = "Income";
                graph1.valueField = "income";
                graph1.balloonText = "Income:[[value]]";
                graph1.lineAlpha = 0;
                graph1.fillColors = "#ADD981";
                graph1.fillAlphas = 1;
                chart.addGraph(graph1);

                // second graph
                var graph2 = new AmCharts.AmGraph();
                graph2.type = "column";
                graph2.title = "Expenses";
                graph2.valueField = "expenses";
                graph2.balloonText = "Expenses:[[value]]";
                graph2.lineAlpha = 0;
                graph2.fillColors = "#81acd9";
                graph2.fillAlphas = 1;
                chart.addGraph(graph2);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                chart.addLegend(legend);

                chart.creditsPosition = "top-right";

                // WRITE
                chart.write("chartdiv");
            });


        </script>
        <script>
            AmCharts.ready(function () {
            // SERIAL CHART
            chart = new AmCharts.AmSerialChart();
            chart.dataProvider = IncomeExpense;
            chart.categoryField = "year";
            chart.startDuration = 1;
            chart.plotAreaBorderColor = "#DADADA";
            chart.plotAreaBorderAlpha = 1;
            // this single line makes the chart a bar chart
            chart.rotate = false;

            // AXES
            // Category
            var categoryAxis = chart.categoryAxis;
            categoryAxis.gridPosition = "start";
            categoryAxis.gridAlpha = 0.1;
            categoryAxis.axisAlpha = 0;

            // Value
            var valueAxis = new AmCharts.ValueAxis();
            valueAxis.axisAlpha = 0;
            valueAxis.gridAlpha = 0.1;
            valueAxis.position = "left";
            chart.addValueAxis(valueAxis);

            // GRAPHS
            // first graph
            var graph1 = new AmCharts.AmGraph();
            graph1.type = "column";
            graph1.title = "Center cash";
            graph1.valueField = "cash";
            graph1.balloonText = "cash[[value]]";
            graph1.lineAlpha = 0;
            graph1.fillColors = "#FCC804";
            graph1.fillAlphas = 1;
            chart.addGraph(graph1);

            // second graph
            var graph2 = new AmCharts.AmGraph();
            graph2.type = "column";
            graph2.title = "past due";
            graph2.valueField = "pd";
            graph2.balloonText = "pd[[value]]";
            graph2.lineAlpha = 0;
            graph2.fillColors = "#FF751A";
            graph2.fillAlphas = 1;
            chart.addGraph(graph2);
            // LEGEND
            var legend = new AmCharts.AmLegend();
            chart.addLegend(legend);

            chart.creditsPosition = "top-right";

            // WRITE
            chart.write("chartdiv3");
        });




        </script>
        <script>
            var chart2;




            var chart2;
            AmCharts.ready(function () {
                // PIE CHART
                chart2 = new AmCharts.AmPieChart();
                chart2.dataProvider = chartDatas;
                chart2.titleField = "country";
                chart2.valueField = "visits";
                chart2.sequencedAnimation = true;
                chart2.startEffect = "elastic";
                chart2.innerRadius = "50%";
                chart2.startDuration = 2;
                chart2.labelRadius = 15;
                chart2.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // the following two lines makes the chart 3D
                chart2.depth3D = 3;
                chart2.angle = 10;


                // WRITE
                chart2.write("chartdiv2");
            });
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

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

        <div class="wrapper">
            <div style="height: 50px" >
                <header class="main-header effect" >
                    <a href="../../index2.html" class="logo" > 
                        <span class="logo-mini"><b>A</b>LT</span>
                        <span class="logo-lg"><b>Vikum</b> TURF </span>
                    </a>
                    <nav class="navbar navbar-static-top " role="navigation"  >
                        <a href="#" class="sidebar-toggle " data-toggle="offcanvas" role="button" >
                            <i class="glyphicon glyphicon-menu-hamburger"></i>
                        </a>

                        <%@include file="../../includes/signOut.jspf" %>  
                    </nav>
                </header>
            </div>
            <%@include file="../../includes/navbar.jspf" %>  
            <div class="content-wrapper" style="height: 1000px">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Company Snapshot
                        <small></small>
                    </h1>
                    &nbsp;
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>

                    </ol>
                </section>



                <section class="col-lg-6 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>

                            <li class="pull-left header"><i class="fa fa-inbox"></i>Income and Expenses per month</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 340px">
                                <div id="chartdiv" style="width:100%; height:345px;;margin-bottom:  20px"></div>
                            </div>

                        </div>
                    </div>
                </section>
                <section class="col-lg-6 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>

                            <li class="pull-left header" style="font-size: 18px"><i class="fa fa-inbox"></i>Total expenses</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 340px">
                                <div id="chartdiv2"  style="width:700px; height:340px;margin: -20px -80px 0px -60px"></div>
                            </div>

                        </div>
                    </div>
                </section>
                <section class="col-lg-6 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>

                            <li class="pull-left header"><i class="fa fa-inbox"></i> Account balance</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 440px">
                                <div id="chartdiv" style="width:100%; height:445px;;margin-bottom:  20px;padding: 10px 10px 10px 10px" >

                                    <table class="table table-striped" width="70%" style="margin-bottom: 0px">

                                        <tr style="background-color: #F2F2F3">
                                            <th>&nbsp;id&nbsp;&nbsp;</th>
                                            <th>&nbsp;&nbsp;Account name&nbsp;</th>



                                            <th>&nbsp;&nbsp;Balance&nbsp;</th>

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


                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>  

                                </div>
                            </div>

                        </div>
                    </div>
                </section>
                <section class="col-lg-6 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>

                            <li class="pull-left header" style="font-size: 18px"><i class="fa fa-inbox"></i>Center Cash and past due</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 440px">
                                <div id="chartdiv3"  style="width:520px; height:445px;margin: 0px 0px 0px 0px"></div>
                            </div>

                        </div>
                    </div>
                </section>


                <!-- Main content -->
                <section class="content" style="height: 500px">
                    <!--    <div class="col-md-8" style="margin-left: -15px">
                           <div class="box box-primary" style="margin-top: -15px;">
   
                               <div id="chartdiv" style="width:70%; height:400px;"></div>
                           </div>
                       </div>-->
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  

        </div>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

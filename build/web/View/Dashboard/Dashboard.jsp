<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

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
        <script src="../../dist/js/jquery-1.8.3.min.js" type="text/javascript"></script>

        <style>

            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>

        <script>

            var chartData = [
            ];
            
             var AgentInfo = [
            ];
            var IncomeExpense = [
            ];

            $(document).on("ready", function () {
                loadData();
            });
            var loadData = function () {
                var today = new Date();
                var d = today.getDate();
                var m = today.getMonth() + 1;
                var y = today.getFullYear();

                if (d <= 9)
                    d = '0' + d;

                if (m <= 9)
                    m = '0' + m;
                document.getElementById('dates').value = y + "-" + m + "-" + d;
                $.ajax({
                    type: 'POST',
                    url: "../../GetCentercashDetailsinAjax"
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;
                    var seantorCity;

                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        chartData.push({"year": columnTokens[2], "cars": columnTokens[0], "motorcycles": columnTokens[1]});
                    }
                });
                var dates = document.getElementById("dates").value;

                $.ajax({
                    type: 'POST',
                    url: "../../AddReport?value=dashboard&dates=" + dates
                }).done(function (data) {

                    var rowTokens = data.split("!");
                    var x;
                    var totFC, totCash, totPay, totPD, total;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");

                        totFC = columnTokens[0];
                        totCash = columnTokens[1];
                        totPay = columnTokens[2];
                        totPD = columnTokens[3];
                        // IncomeExpense.push({"year": columnTokens[0], "income": columnTokens[1], "expenses": columnTokens[2], "compay": columnTokens[3], "cash": columnTokens[4]});
                        // alert(columnTokens[3]);

                    }
                    total = parseFloat(totFC) + parseFloat(totCash) + parseFloat(totPay) + parseFloat(totPD);
                    // var totFCration = total / totFC;
                    var totalfloat = parseFloat(total);
                    var totFCfloat = parseFloat(totFC);
                    var totCashfloat = parseFloat(totCash);
                    var totPayfloat = parseFloat(totPay);
                    var totPDfloat = parseFloat(totPD);

                    var totFCration = totFCfloat / totalfloat * 100;
                    var totCashration = totCashfloat / totalfloat * 100;
                    var totPayration = totPayfloat / totalfloat * 100;
                    var totPDration = totPDfloat / totalfloat * 100;


                    document.getElementById("FC").style.width = totFCration.toFixed(1) + "px";
                    document.getElementById("spfc").innerHTML = totFCration.toFixed(1);

                    document.getElementById("CASH").style.width = totCashration.toFixed(1) + "px";
                    document.getElementById("spcash").innerHTML = totCashration.toFixed(1);

                    document.getElementById("PAY").style.width = totPayration.toFixed(1) + "px";
                    document.getElementById("sppay").innerHTML = totPayration.toFixed(1);

                    document.getElementById("PD").style.width = totPDration.toFixed(1) + "px";
                    document.getElementById("sppd").innerHTML = totPDration.toFixed(1);

                    document.getElementById("totFC").innerHTML = totFC;
                    document.getElementById("totCash").innerHTML = totCash;
                    document.getElementById("totPay").innerHTML = totPay;
                    document.getElementById("totPD").innerHTML = totPD;


                });
                $.ajax({
                    type: 'POST',
                    url: "../../CheckDailySummery?Type=GeneralTotalIncExp"
                }).done(function (data) {

                    var rowTokens = data.split("!");
                    var x;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        AgentInfo.push({"year": columnTokens[0], "income": columnTokens[1], "expenses": columnTokens[2]});
                    }
                });
            }

        </script>

        <script>
            var chart;
            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();

                chart.dataProvider = chartData;
                chart.categoryField = "year";

                //chart.addTitle("Cash and past due per month", 15);

                // AXES
                // Category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridAlpha = 0.07;
                categoryAxis.axisColor = "#DADADA";
                categoryAxis.startOnAxis = true;

                // Value
                var valueAxis = new AmCharts.ValueAxis();
                // valueAxis.title = "percent"; // this line makes the chart "stacked"
                //   valueAxis.stackType = "100%";
                valueAxis.gridAlpha = 0.07;
                chart.addValueAxis(valueAxis);

                // GRAPHS
                // first graph
                var graph = new AmCharts.AmGraph();
                graph.type = "line"; // it's simple line graph
                graph.title = "Cash";
                graph.valueField = "cars";
                graph.lineAlpha = 0;
                graph.fillAlphas = 0.6; // setting fillAlphas to > 0 value makes it area graph
                //  graph.balloonText = "<img src='images/car.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>[[value]]</b></span>";
                chart.addGraph(graph);

                // second graph
                graph = new AmCharts.AmGraph();
                graph.type = "line";
                graph.title = "Past due";
                graph.valueField = "motorcycles";
                graph.lineAlpha = 0;
                graph.fillAlphas = 0.6;
                //graph.balloonText = "<img src='images/motorcycle.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>[[value]]</b></span>";
                chart.addGraph(graph);

                // third graph
                graph = new AmCharts.AmGraph();
                graph.type = "line";
                graph.title = "";
                graph.valueField = "bicycles";
                graph.lineAlpha = 0;
                graph.fillAlphas = 0.6;
                // graph.balloonText = "<img src='images/bicycle.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>[[value]]</b></span>";
                //chart.addGraph(graph);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                legend.align = "center";
                legend.valueText = "[[value]] ([[percents]]%)";
                legend.valueWidth = 100;
                legend.valueAlign = "left";
                legend.equalWidths = false;
                legend.periodValueText = "total: [[value.sum]]"; // this is displayed when mouse is not over the chart.
                chart.addLegend(legend);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.zoomable = false; // as the chart displayes not too many values, we disabled zooming
                chartCursor.cursorAlpha = 0;
                chartCursor.valueZoomable = true;
                chartCursor.pan = true;
                chart.addChartCursor(chartCursor);

                //  VALUE SCROLLBAR
                chart.valueScrollbar = new AmCharts.ChartScrollbar();

                // WRITE
                chart.write("chartdiv");
            });
        </script>
        <script>
          



            AmCharts.ready(function () {
                // SERIAL CHART
                charts = new AmCharts.AmSerialChart();
                charts.dataProvider = AgentInfo;
                charts.categoryField = "year";
                charts.startDuration = 1;
                charts.plotAreaBorderColor = "#DADADA";
                charts.plotAreaBorderAlpha = 1;
                // this single line makes the chart a bar chart
                charts.rotate = true;

                // AXES
                // Category
                var categoryAxis = charts.categoryAxis;
                categoryAxis.gridPosition = "start";
                categoryAxis.gridAlpha = 0.1;
                categoryAxis.axisAlpha = 0;

                // Value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 0;
                valueAxis.gridAlpha = 0.1;
                valueAxis.position = "top";
                charts.addValueAxis(valueAxis);

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
                charts.addGraph(graph1);

                // second graph
                var graph2 = new AmCharts.AmGraph();
                graph2.type = "column";
                graph2.title = "Expenses";
                graph2.valueField = "expenses";
                graph2.balloonText = "Expenses:[[value]]";
                graph2.lineAlpha = 0;
                graph2.fillColors = "#81acd9";
                graph2.fillAlphas = 1;
                charts.addGraph(graph2);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                charts.addLegend(legend);

                charts.creditsPosition = "top-right";

                // WRITE
                charts.write("chartdivs");
            });
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="selectedItem();">
        <%

            if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {

                response.sendRedirect("../../login.jsp");

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
                        Dashboard
                        <small></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>

                    </ol>
                </section>
                <input type="hidden"  id="dates" name="dates">
                <div class="row" style="padding: 16px 16px 0px 16px">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-green" style="border-radius: 3px">
                            <span class="info-box-icon"><i class="glyphicon glyphicon-usd"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Daily Collection</span>
                                <span class="info-box-number" id="totFC"></span>

                                <div class="progress">
                                    <div id="FC" class="progress-bar" style="width: 100%"></div>
                                </div>
                                <span class="progress-description">
                                    <spam  id="spfc" style="font-size: 11px" ></spam>% Increase in month
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-yellow" style="border-radius: 3px">
                            <span class="info-box-icon"><i class="glyphicon glyphicon-paperclip"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Total Past Due</span>
                                <span class="info-box-number" id="totCash"></span>

                                <div class="progress">
                                    <div id="CASH" class="progress-bar" style="width: 100%"></div>
                                </div>
                                <span class="progress-description">
                                    <spam  id="spcash" tyle="font-size: 11px"></spam>% Increase in month
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-red" style="border-radius: 3px">
                            <span class="info-box-icon"><i class="glyphicon glyphicon-pushpin"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Expenses</span>
                                <span class="info-box-number" id="totPay"></span>

                                <div class="progress">
                                    <div id="PAY" class="progress-bar" style="width: 100%"></div>
                                </div>
                                <span class="progress-description">
                                    <spam  id="sppay" tyle="font-size: 11px"></spam>% Increase in month
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-aqua" style="border-radius: 3px">
                            <span class="info-box-icon"><i class="glyphicon glyphicon-repeat"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Excess</span>
                                <span class="info-box-number" id="totPD"></span>

                                <div class="progress">
                                    <div id="PD" class="progress-bar" style="width: 100%"></div>
                                </div>
                                <span class="progress-description">
                                    <spam  id="sppd" tyle="font-size: 11px"></spam>% Increase in month
                                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                </div>
                <section class="col-lg-8 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>

                            <li class="pull-left header"><i class="fa fa-inbox"></i> Cash and past due per month</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 390px">
                                <div id="chartdiv" style="width:100%; height:400px;;margin-bottom:  20px"></div>
                            </div>

                        </div>
                    </div>
                </section>
                <section class="col-lg-4 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>

                            <li class="pull-left header" style="font-size: 18px"><i class="fa fa-inbox"></i>Income and expense by agent</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 390px">
                                <div id="chartdivs" style="width:100%; height:390px;"></div>
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

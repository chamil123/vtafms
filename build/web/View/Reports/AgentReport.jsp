<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.GeneralCashController"%>
<%@page import="BIT.Project.VTAFMS.Model.GeneralCash"%>
<%@page import="BIT.Project.VTAFMS.Controller.GeneralSummeryController"%>
<%@page import="BIT.Project.VTAFMS.Model.GeneralSummery"%>
<%@page import="BIT.Project.VTAFMS.Controller.CenterCashController"%>
<%@page import="BIT.Project.VTAFMS.Model.CenterCash"%>
<%@page import="BIT.Project.VTAFMS.Model.Summery"%>
<%@page import="BIT.Project.VTAFMS.Controller.SummeryController"%>
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

        <script src="../../plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="../../plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
        <script src="../../plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>

        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>

        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>


    </head>
    <script type="text/javascript">

        var Customer = [
        ];

        $(document).on("ready", function () {
            loadDatas();
        });
        var loadDatas = function () {
            $.ajax({
                type: 'POST',
                url: "../../GetCentersinAjax?type=general"
            }).done(function (data) {

                var rowTokens = data.split("!");
                var x;
                var seantorCity;
                for (x = 0; x < rowTokens.length - 1; x++) {
                    var columnTokens = rowTokens[x].split(":");
                    var y;
                    for (y = 0; y < columnTokens.length; y++) {
                    }

                    Customer.push({"label": columnTokens[1], "number": columnTokens[0]});
                }
            });
        }

        $(document).ready(function () {
            $("#cname").autocomplete({source: Customer, select: function (event, ui) {
                    event.preventDefault();
                    $(this).val(ui.item.label);
                    $("#agentNumber").val(ui.item.number);

                }});
        });
    </script> 
    <script>
        $(function () {
            $("#fromdate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                //yearRange: "-55:-18"
            });
            $("#todate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                // yearRange: "-55:-18"
            });
        });



    </script>
    <script>
        var chartData = [
        ];
        var IncomeExpense = [
        ];
        $(document).on("ready", function () {
            loadData();
        });
        var loadData = function () {
            var fromdate = document.getElementById('fdate').value;
            var todate = document.getElementById('tdate').value;
            var agentNumber = document.getElementById('agentNumber').value;
            $.ajax({
                type: 'POST',
                url: "../../GetCenterValuesBetweenDates?fromdate=" + fromdate + "&todate=" + todate + "&agentNumber=" + agentNumber + "&type=agentReport"
            }).done(function (data) {
                var rowTokens = data.split("!");
                var x;
                for (x = 0; x < rowTokens.length - 1; x++) {
                    var columnTokens = rowTokens[x].split(":");
                    chartData.push({"country": columnTokens[0], "litres": columnTokens[1]});
                }
            });

            $.ajax({
                type: 'POST',
                url: "../../GetCenterValuesBetweenDates?fromdate=" + fromdate + "&todate=" + todate + "&agentNumber=" + agentNumber + "&type=agentReportBar"
            }).done(function (data) {

                var rowTokens = data.split("!");
                var x;
                for (x = 0; x < rowTokens.length - 1; x++) {
                    var columnTokens = rowTokens[x].split(":");

                    IncomeExpense.push({"year": columnTokens[0], "income": columnTokens[1], "expenses": columnTokens[2], "compay": columnTokens[3], "cash": columnTokens[4]});
                }

            });


        }

    </script>
    <script>
        var chart;
        AmCharts.ready(function () {
            // PIE CHART
            chart = new AmCharts.AmPieChart();
            chart.dataProvider = chartData;
            chart.titleField = "country";
            chart.valueField = "litres";
            chart.outlineColor = "#FFFFFF";
            chart.outlineAlpha = 0.8;
            chart.outlineThickness = 2;
            chart.marginTop = -120;
            chart.marginBottom = -120;
            chart.marginLeft = -80;
            chart.marginRight = -60;

            // WRITE
            chart.write("chartdiv");
        });
    </script>
    <script>
        var chart1;
        AmCharts.ready(function () {
            // SERIAL CHART
            chart1 = new AmCharts.AmSerialChart();
            chart1.dataProvider = IncomeExpense;
            chart1.categoryField = "year";
            chart1.startDuration = 1;
            chart1.plotAreaBorderColor = "#DADADA";
            chart1.plotAreaBorderAlpha = 1;
            chart1.marginBottom = 0;

            // this single line makes the chart a bar chart
            chart1.rotate = false;

            // AXES
            // Category
            var categoryAxis = chart1.categoryAxis;
            categoryAxis.gridPosition = "start";
            categoryAxis.gridAlpha = 0.1;
            categoryAxis.axisAlpha = 0;

            // Value
            var valueAxis = new AmCharts.ValueAxis();
            valueAxis.axisAlpha = 0;
            valueAxis.gridAlpha = 0.1;
            valueAxis.position = "left";
            chart1.addValueAxis(valueAxis);

            // GRAPHS
            // first graph
            var graph1 = new AmCharts.AmGraph();
            graph1.type = "column";
            graph1.title = "Income";
            graph1.valueField = "income";
            graph1.balloonText = "Income:[[value]]";
            graph1.lineAlpha = 0;
            graph1.fillColors = "#78CFC1";
            graph1.fillAlphas = 1;
            chart1.addGraph(graph1);

            // second graph
            var graph2 = new AmCharts.AmGraph();
            graph2.type = "column";
            graph2.title = "Expenses";
            graph2.valueField = "expenses";
            graph2.balloonText = "Expenses:[[value]]";
            graph2.lineAlpha = 0;
            graph2.fillColors = "#9DBF73";
            graph2.fillAlphas = 1;
            chart1.addGraph(graph2);

            var graph3 = new AmCharts.AmGraph();
            graph3.type = "column";
            graph3.title = "Compay";
            graph3.valueField = "compay";
            graph3.balloonText = "compay[[value]]";
            graph3.lineAlpha = 0;
            graph3.fillColors = "#77B243";
            graph3.fillAlphas = 1;
            chart1.addGraph(graph3);


            // LEGEND
            var legend = new AmCharts.AmLegend();
            chart1.addLegend(legend);

            chart1.creditsPosition = "top-right";

            // WRITE
            chart1.write("chartdiv2");
        });

    </script>

    <style>
        #inputColor{
            border:1px solid white;
        }
    </style>
    <body class="hold-transition skin-blue sidebar-mini">
        <%
            String fromdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String agentNumber = request.getParameter("agentNumber");
            String cname = request.getParameter("cname");
            String totFC = request.getParameter("totFC");
            String totCash = request.getParameter("totCash");
            String totPay = request.getParameter("totPay");
            String totPD = request.getParameter("totPD");

            String agent = "";
            if (cname != null) {
                agent = cname;
            }

            double FC = 0;
            double Cash = 0;
            double Pay = 0;
            double PD = 0;
            if (totFC == null) {
                FC = 0;
            } else {
                FC = Double.parseDouble(totFC.toString());
            }
            if (totCash == null) {
                Cash = 0;
            } else {
                Cash = Double.parseDouble(totCash.toString());
            }
            if (totPay == null) {
                Pay = 0;
            } else {
                Pay = Double.parseDouble(totPay.toString());
            }
            if (totPD == null) {
                PD = 0;
            } else {
                PD = Double.parseDouble(totPD.toString());
            }

            double totalResult = FC + Cash + Pay + PD;
            double rateFc = (FC / totalResult) * 100;
            double rateCash = (Cash / totalResult) * 100;
            double ratePay = (Pay / totalResult) * 100;
            double ratePD = (PD / totalResult) * 100;
            int decimalFC = (int) rateFc;
            int decimalCash = (int) rateCash;
            int decimalPay = (int) ratePay;
            int decimalPD = (int) ratePD;
            List<Summery> summerylist = (List<Summery>) SummeryController.summeryBetweenDatesByAgentId(fromdate, todate, agentNumber);
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
                        Report
                        <small>Agent report</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Forms</a></li>
                        <li class="active">Advanced Elements</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <form  role="form"  action="../../AddReport?value=agentReport" method="POST" >
                        <div class="box box-default">
                            <div class="box-header">
                                <p style="padding-left: 253px;color: #999999">Report period</p>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" id="cname" name="cname" placeholder="Center name" style="z-index: -1;margin-left: -10px" />
                                </div>

                                <div class="col-md-3" style="margin-left: -30px">
                                    <select class="form-control select2 required" style="width: 100%;" id="role" name="role">
                                        <option  value=""> --------Please select period---------   </option>
                                        <option value="" >Today</option>
                                        <option value="" >This month</option>
                                        <option value="" >This Year to date</option>
                                    </select>

                                </div>
                                <div class="col-md-2" style="margin-left: -20px">

                                    <input type="text" id="fromdate" name="fromdate" style=";height: 30px;font-size: 16px;padding-left: 10px"/>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="todate" name="todate" style="height: 30px;font-size: 16px;padding-left: 10px"/>
                                </div>
                                <div class="col-md-1" style="margin-right: 25px">
                                    <button type="submit" name="reset" class="btn btn-info" style="margin-left: 0px" onclick="getdate()">
                                        <i class="glyphicon glyphicon-tag"></i>
                                        Run report</button>
                                </div>





                                <input type="hidden" id="fdate" name="fdate" value="<%=fromdate%>" style=";height: 30px;font-size: 16px;padding-left: 10px"/>
                                <input type="hidden" id="tdate" name="tdate" value="<%=todate%>" style=";height: 30px;font-size: 16px;padding-left: 10px"/>
                            </div>
                            <div class="col-md-12"> 
                                <div class="col-md-2" style="font-size: 18px;margin-left: -14px;color: #999999">Center name : </div>
                                <input type="hidden" id="centername" name="centername" value="<%=cname%>" />
                                <input type="hidden" name="agentNumber" id="agentNumber" value="<%=agentNumber%>"/>
                                <div class="col-md-3" style="font-size: 18px;margin-left: -50px;color: #999999"><label id="centername" id="centername"><%=agent%></label></div>
                            </div>
                            <div class="col-md-12" >
                                <div id="chartdiv" class="col-md-5" style=" height:300px;"></div>
                                <div id="chartdiv2" class="col-md-7" style=" height:300px;;margin-bottom:  20px;margin-left: 0px"></div>
                                <!--<div class="col-md-3" style="padding-top: 20px;width: 310px;margin-right: -50px">
                                    <p style="color: #999999">Total full collection</p>
                                    <div class="progress ">
                                        <div class="progress-bar progress-bar-striped active" role="progressbar"
                                             aria-valuenow="<%=decimalFC%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=decimalFC%>%;background-color: #94A328">
                                <%=decimalFC%>% 
                            </div>

                        </div>
                        <p style="color: #999999;margin-top: -5px">Total Cash</p>
                        <div class="progress ">
                            <div  class="progress-bar progress-bar-striped active"  role="progressbar"
                                  aria-valuenow="<%=decimalCash%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=decimalCash%>%;background-color: #DD4B39">
                                <%=decimalCash%>%
                            </div>

                        </div>
                        <p style="color: #999999;margin-top: -5px">Total Slip Payment</p>
                        <div class="progress ">
                            <div  class="progress-bar progress-bar-striped active"  role="progressbar"
                                  aria-valuenow="<%=decimalPay%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=decimalPay%>%;background-color: #009ABF">
                                <%=decimalPay%>%
                            </div>

                        </div>
                        <p style="color: #999999;margin-top: -5px">Total Past Due</p>
                        <div class="progress ">
                            <div  class="progress-bar progress-bar-striped active"  role="progressbar"
                                  aria-valuenow="<%=decimalPD%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=decimalPD%>%;background-color: #3D7886">
                                <%=decimalPD%>%
                            </div>

                        </div>
                    </div>-->

                            </div>


                            <div class="box-body" >

                                <table class="table table-striped" width="70%" style="background-color: #DBE8E8">

                                    <tr style="background-color: #E0DDE0">
                                        <th>&nbsp;id&nbsp;</th>
                                        <th>Date&nbsp;</th>
                                        <th>Name&nbsp;</th>
                                        <th>Full collection&nbsp;</th>
                                        <th>Cash&nbsp;</th>
                                        <th>Past due&nbsp;</th>
                                        <th>Expenses&nbsp;</th>
                                        <th>Payment total</th>
                                        <th>Excess&nbsp;</th>
                                    <tr>
                                        <%
                                            GeneralCash generalCash;
                                            CenterCash centercash;
                                            for (Summery model : summerylist) {
                                                centercash = CenterCashController.searchCenterCashByDateandId(model.getSummery_date(), model.getCenter_id());
                                                // generalCash = GeneralCashController.searchGeneralCashByDateandId(model.getAccountGeneral_date(), "" + model.getAgent_id());
                                        %>
                                    <tr>
                                        <td>&nbsp;<%=model.getSummery_id()%></td>
                                        <td>&nbsp;<%=model.getSummery_date()%></td>

                                        <td><%=model.getSummery_name()%></td>
                                        <td>&nbsp;<%=centercash.getCenterCash_details_FullCollection()%></td>
                                        <td>&nbsp;<%=centercash.getCenterCash_details_cash()%></td>
                                        <td>&nbsp;<%=centercash.getCenterCash_details_passDue()%></td>
                                        <td><%=model.getSummery_expences()%></td>
                                        <td><%=model.getSummery_slippaytot()%></td>
                                        <td><%=model.getSummery_excess()%></td>

                                    </tr>


                                    <%}%>
                                </table>
                            </div>

                        </div>
                    </form>
                    <form  role="form"  action="../../AddReport?value=agentjasper" method="POST" >
                        <input type="hidden" id="date1" name="date1" value="<%=fromdate%>" /> 
                        <input type="hidden" id="date2" name="date2" value="<%=todate%>" /> 
                        <input type="hidden" id="aname" name="aname" value="<%=cname%>" /> 
                        <input type="hidden" id="aid" name="aid" value="<%=agentNumber%>" /> 
                        <div class="col-md-1" style="margin-left: -15px">
                            <button type="submit" name="reset" class="btn btn-primary" style="margin-left: 0px" onclick="getdate()">
                                <i class="glyphicon glyphicon-print"></i>
                                Print agent report</button>
                        </div>
                    </form>
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  


        </div>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

<%-- 
    Document   : GeneralSummery
    Created on : Oct 19, 2016, 10:15:06 PM
    Author     : Chamil
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="BIT.Project.VTAFMS.Controller.ExpensesController"%>
<%@page import="BIT.Project.VTAFMS.Model.Expenses"%>
<%@page import="BIT.Project.VTAFMS.Controller.AgentController"%>
<%@page import="BIT.Project.VTAFMS.Model.Agent"%>
<%@page import="BIT.Project.VTAFMS.Controller.CenterController"%>
<%@page import="BIT.Project.VTAFMS.Model.Center"%>
<%@page import="BIT.Project.VTAFMS.Model.Role"%>
<%@page import="java.util.List"%>
<%@page import="BIT.Project.VTAFMS.Controller.RoleController"%>

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

    </style>
    <script>
        /*   Date date=new Date();
         SimpleDateFormat df=new SimpleDateFormat("MdYYhms");*/

        function selectedItem() {

            var today = new Date();
            var d = today.getDate();
            var m = today.getMonth() + 1;
            var y = today.getFullYear();
            if (d <= 9)
                d = '0' + d;

            if (m <= 9)
                m = '0' + m;

            document.getElementById('date').innerHTML = y + "/" + m + "/" + d;
            document.getElementById('dates').value = y + "-" + m + "-" + d;

        }
    </script>

</head>
<body class="hold-transition skin-blue sidebar-mini" onload="selectedItem();">

    <%
        List<Agent> listAgent = (List<Agent>) AgentController.getAllAgents();
        List<Expenses> listExpenses = (List<Expenses>) ExpensesController.getAllExpenses();
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
                    General Summery
                    <small>create summery</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Forms</a></li>
                    <li class="active">Advanced Elements</li>
                </ol>
            </section>
            <script type="text/javascript">
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



            <script type="text/javascript">
                var date2;
                var today = new Date();
                var d = today.getDate();
                var m = today.getMonth() + 1;
                var y = today.getFullYear();

                if (d <= 9)
                    d = '0' + d;

                if (m <= 9)
                    m = '0' + m;
                date2 = y + "-" + m + "-" + d;

                var rowTokenstypegen;

                var Agent = [
                ];
                Summery = {item: []};
                Excess = {item: []};
                GeneralCash = {item: []};
                CenterCash = {item: []};
                SummeryInfo = [];
                AgentInfo = [];
                $(document).on("ready", function () {
                    loadData();
                });
                var loadData = function () {
                    $.ajax({
                        type: 'POST',
                        url: "../../GetAlGeneralinAjax"
                    }).done(function (data) {

                        var rowTokens = data.split("!");
                        var x;
                        for (x = 0; x < rowTokens.length - 1; x++) {
                            var columnTokens = rowTokens[x].split(":");

                            Agent.push({"label": columnTokens[0], "com": columnTokens[1], "nocom": columnTokens[2], "lcom": columnTokens[3], "id": columnTokens[4], "pprcash": columnTokens[5]});

                        }
                    });

                    $.ajax({
                        type: 'POST',
                        url: "../../CheckDailySummery?Type=general"
                    }).done(function (data) {
          
                        rowTokenstypegen = data.split("!");
                        var x;
                        for (x = 0; x < rowTokenstypegen.length - 1; x++) {

                            var columnTokens = rowTokenstypegen[x].split(":");
                            Summery.item.push({"cname": columnTokens[0], "sliptot": columnTokens[1], "date": columnTokens[2], "cnum": columnTokens[3], "anum": columnTokens[4]});

                        }
                    });
                    $.ajax({
                        type: 'POST',
                        url: "../../DailyCashDetails?value=gen"
                    }).done(function (data) {

                        var rowTokens = data.split("!");
                        var x;
                        for (x = 0; x < rowTokens.length - 1; x++) {
                            var columnTokens = rowTokens[x].split(":");

                            GeneralCash.item.push({"cash": columnTokens[0], "date2": columnTokens[1], "pd": columnTokens[2], "anumber": columnTokens[3]});
                            //CenterCash.item.push({"fc": columnTokens[0], "cash": columnTokens[1], "date2": columnTokens[2], "pd": columnTokens[3], "cnumber": columnTokens[4]});
                        }
                    });
                    $.ajax({
                        type: 'POST',
                        url: "../../DailyCashDetails?value=normal"
                    }).done(function (data) {

                        var rowTokens = data.split("!");
                        var x;
                        for (x = 0; x < rowTokens.length - 1; x++) {
                            var columnTokens = rowTokens[x].split(":");
                            CenterCash.item.push({"fc": columnTokens[0], "cash": columnTokens[1], "date2": columnTokens[2], "pd": columnTokens[3], "cnumber": columnTokens[4], "anumber": columnTokens[6]});
                        }
                    });
                    $.ajax({
                        type: 'POST',
                        url: "../../DailyExcessDetails"
                    }).done(function (data) {

                        var rowTokens = data.split("!");
                        var x;
                        for (x = 0; x < rowTokens.length - 1; x++) {
                            var columnTokens = rowTokens[x].split(":");
                            Excess.item.push({"ecnumber": columnTokens[0], "edate": columnTokens[1], "excessTot": columnTokens[2]});
                        }
                    });

                    $.ajax({
                        type: 'POST',
                        url: "../../CheckDailySummery?Type=normalTotal&date=" + date2
                    }).done(function (data) {

                        var rowTokens = data.split("!");
                        var x;
                        for (x = 0; x < rowTokens.length - 1; x++) {
                            var columnTokens = rowTokens[x].split(":");
                            SummeryInfo.push({"info": columnTokens[0], "values": columnTokens[1]});
                        }
                    });

                    $.ajax({
                        type: 'POST',
                        url: "../../CheckDailySummery?Type=GeneralTotal&date=" + date2
                    }).done(function (data) {

                        var rowTokens = data.split("!");
                        var x;
                        for (x = 0; x < rowTokens.length - 1; x++) {
                            var columnTokens = rowTokens[x].split(":");
                            AgentInfo.push({"year": columnTokens[0], "income": columnTokens[1], "expenses": columnTokens[2]});
                        }
                    });

                }
                $(document).ready(function () {
                    $("#gname").autocomplete({source: Agent, select: function (event, ui) {
                            event.preventDefault();
                            $(this).val(ui.item.label);
                            /* var value = JSON.stringify(Agent);
                             obj = JSON.parse(value);
                             var list = obj.item;
                             var val = 0;
                             */
                            var dates = document.getElementById("dates").value;

                            var value2 = JSON.stringify(GeneralCash);
                            obj2 = JSON.parse(value2);
                            var list2 = obj2.item;

                            $("#gnumber").val(ui.item.id);
                            $("#papercash").val(ui.item.pprcash);
                            $("#com").val(ui.item.com);

                            var val2 = 0;
                            var gnumber = document.getElementById("gnumber").value;

                            for (index2 in list2) {
                                var obj2 = list2[index2];
                                var date2 = obj2["date2"];
                                var aumber = obj2["anumber"];
                                if (aumber == gnumber && date2 == dates) {
                                    //$("#fc").val(obj2["fc"]);
                                    $("#cash").val(obj2["cash"]);
                                    $("#pd").val(obj2["pd"]);

                                    val2 = 1
                                    document.getElementById("txtHint").innerHTML = "<i class='alert-success'>Availbale Summery Name</i>";
                                }
                            }


                            var value3 = JSON.stringify(CenterCash);
                            obj3 = JSON.parse(value3);
                            var list3 = obj3.item;
                            var outputData;
                            outputData = "<table id=addressesTable class=table-style-three width=100%>";
                            outputData += "<th style=width:210px>" + "Center Name" + "</th>";
                            outputData += "<th style=width:145px>" + "Full Collecton" + "</th>";
                            outputData += "<th>" + "Payment" + "</th>";
                            var total = 0;
                            var totalsliptot = 0;
                            // rowTokenstypegen = data.split("!");


                            for (var x = 0; x < rowTokenstypegen.length - 1; x++) {

                                var columnTokens = rowTokenstypegen[x].split(":");
                                if (columnTokens[2] == dates) {

                                    cname = columnTokens[0];
                                    cnum = columnTokens[3];
                                    anum = columnTokens[4];

                                    //investment = columnTokens[1];
                                    payment = columnTokens[1];

                                    for (index2 in list3) {
                                        var obj = list3[index2];
                                        var date = obj["date2"];
                                        var cnumber = obj["cnumber"];
                                        var anumber = obj["anumber"];
                                        // alert(gnumber+"  "+anumber+" , "+cnumber+" "+cnum+" ,"+date+" "+dates);
                                        if (cnumber == cnum && date == dates & gnumber == anumber) {
                                            //$("#fc").val(obj2["fc"]);
                                            var fc = obj["fc"];
                                            var paytot = parseFloat(payment);

                                            totalsliptot += paytot;

                                            var k = parseFloat(fc);
                                            total = total + k;
                                            outputData += "<tr>";
                                            outputData += "<td>" + cname + "</td>";
                                            outputData += "<td style=text-align:right>" + fc + "</td>";
                                            outputData += "<td style=text-align:right;font-size:15px;font-weight:bold>" + payment + "</td>";

                                        }
                                    }
                                    document.getElementById('fc').value = total;
                                    document.getElementById('paymentTotal').value = totalsliptot;
                                }
                            }
                            outputData += "</tr>";
                            outputData += "</table>";
                            document.getElementById('tableDiv').innerHTML = outputData;

                            calculations();
                        }});
                });
                function setText() {
                    document.getElementById("fc").innerHTML = 0.0;
                    document.getElementById("com").innerHTML = 0.0;
                    document.getElementById("papercash").innerHTML = 0.0;
                    document.getElementById("pd").innerHTML = 0.0;
                    document.getElementById("lcnc").innerHTML = 0.0;
                    document.getElementById("paymentTotal").innerHTML = 0.0;
                    document.getElementById("cash").innerHTML = 0.0;
                    document.getElementById('paycoms').innerHTML = 0.0;
                    document.getElementById('duesub').innerHTML = 0.0;
                    document.getElementById('paysub').innerHTML = 0.0;
                    document.getElementById('balance').innerHTML = 0.0;
                }
                function calculations() {
                    var fc = document.getElementById("fc").value;
                    var com = document.getElementById("com").value;
                    var pc = document.getElementById("papercash").value;
                    var pd = document.getElementById("pd").value;
                    var lcnc = document.getElementById("lcnc").value;
                    var paymentTotal = document.getElementById("paymentTotal").value;
                    var cash = document.getElementById("cash").value;
                    var comisionpay = (fc * com) / 100;
                    document.getElementById('paycoms').value = comisionpay;
                    var duesub = (parseFloat(fc)) + (parseFloat(lcnc)) + (parseFloat(pc)) + (parseFloat(pd));
                    var paysub = (parseFloat(paymentTotal)) + comisionpay + (parseFloat(cash));

                    document.getElementById('duesub').value = duesub;
                    document.getElementById('paysub').value = paysub;

                    if (duesub > paysub) {
                        var due = duesub - paysub
                        document.getElementById('balance').value = due;
                    } else if (duesub < paysub) {
                        var pay = paysub - duesub
                        document.getElementById('balance').value = pay;
                    }

                }


            </script>  
            <script>
                var chart;
                AmCharts.ready(function () {
                    // PIE CHART
                    chart = new AmCharts.AmPieChart();
                    chart.dataProvider = SummeryInfo;
                    chart.titleField = "info" + "<br>";
                    chart.valueField = "values";
                    chart.outlineColor = "#FFFFFF";
                    chart.outlineAlpha = 0.8;
                    chart.outlineThickness = 2;
                    chart.marginTop = -70;
                    chart.marginBottom = -50;
                    chart.marginLeft = -30;
                    chart.marginRight = -50;
                    chart.titleField = "";

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
                    charts.write("chartdiv3");
                });
            </script>


            <!-- Main content -->

            <section class="content">

                <div class="row">
                    <form  role="form"  action="../../AddGeneralSummery" method="POST" >
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title" >Basic informations</h3>
                                    <div  id="date" name="date" style="float: right;font-size: 16px"></div>
                                    <input type="hidden" id="dates" name="dates" style="float: right;font-size: 16px"/>
                                </div>
                                <div class="box-body" style="padding-bottom: 40px">

                                    <div class="col-md-6" style="padding-left: 0px; padding-right: 0px">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Agent name:</label><p style="float: right" id="txtHint"></p>
                                                <input type="text" class="form-control my-colorpicker1" id="gname" name="gname" placeholder="Enter agent name">

                                            </div>
                                        </div>
                                        <div class="form-group">

                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Less com amount:</label>

                                                <input type="text" class="form-control my-colorpicker1" id="lamount" name="lamount" placeholder="Enter center name" value="0.00">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6" style=" padding-right: 0px">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Center Number</label>
                                                <input type="hidden" class="form-control my-colorpicker1" id="com" name="com" disabled>
                                                <input type="text" class="form-control my-colorpicker1" id="gnumber" name="gnumber" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Not run amountname:</label>

                                                <input type="text" class="form-control my-colorpicker1" id="namount" name="namount" placeholder="Enter center name" value="0.00">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- /////////////////////////-->
                                    <div class="col-md-12" style="padding:15px 15px 15px 15px;background-color: #f0f0f0">


                                        <div id="tableDiv"></div>

                                    </div>


                                    <div class="col-md-12 " style="padding-left: 0px;padding-right: 0px;padding-top: 10px;">

                                    </div>
                                    <div id="myDiv"></div>
                                    <div class="col-md-12 " style="height: 230px">

                                        <table>
                                            <tr style="border-top: 1px solid">
                                                <td  style="width: 200px"><label>Full collection :</label></td>
                                                <td > <input type="text" style="font-size:  20px;border:none;width: 170px;text-align: right;padding-right: 20px" readonly  id="fc" name="fc" value="0.00"/></td>
                                                <td style="width: 170px"><label >Payment Total</label></td>
                                                <td ><input type="text" style="font-size:  27px;border:none;width: 120px;font-weight: bold;color: #0000ff;text-align: right" readonly  id="paymentTotal" name="paymentTotal" value="0.00"/></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px"><label>LC & NC amount :</label></td>
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 170px;text-align: right;padding-right: 20px" readonly  id="lcnc" name="lcnc" value="0.00" value="0.00"/></td> 
                                                <td style="width: 170px"><label >commision value</label></td>
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="paycoms" name="paycoms" value="0.00"/></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px"><label>Paper cash :</label></td >
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 170px;text-align: right;padding-right: 20px" readonly  id="papercash" name="papercash" value="0.00"/></td> 
                                                <td style="width: 150px"><label>Expenses :</label></td>
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exp" name="exp" value="0.00"/></td>
                                            </tr><tr>
                                                <td style="width: 200px"><label>Loan:</label></td>
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 170px;text-align: right;padding-right: 20px" readonly  id="loan" name="loan" value="0.00" placeholder="0.00"/></td> 
                                                <td style="width: 150px"><label>Excess :</label></td>
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exc" name="exc"  value="0.00"/></td>
                                            </tr>

                                            <tr>
                                                <td style="width: 200px"><label>Passed due:</label></td>
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 170px;text-align: right;padding-right: 20px" readonly  id="pd" name="pd" value="0.00"/></td> 
                                                <td style="width: 150px"><label>Cash :</label></td>
                                                <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="cash" name="cash" value="0.00"/></td>
                                            </tr>

                                            <tr style="border-top: 1px solid">
                                                <td style="width: 200px"><label>due sub total:</label></td>
                                                <td ><input type="text" style="font-size:  20px;font-weight: bold;border:none;width: 170px;text-align: right;padding-right: 20px" readonly  id="duesub" name="duesub" value="0.00"/></td> 
                                                <td style="width: 150px"><label>pay sub total :</label></td>
                                                <td ><input type="text" style="width: 120px;font-size:  20px;font-weight: bold;border: none;text-align: right;" readonly  id="paysub" name="paysub" value="0.00"/></td>
                                            </tr>
                                            <tr  style="border-top: 1px solid;">
                                                <td colspan="2" ></td>
                                                <td  style="width: 150px;font-size:  25px;border-bottom: 2px solid"><label>Balance :</label></td>
                                                <td style="border-bottom: 2px solid;"><input type="text" style="width: 120px;font-size:  35px;font-weight: bold;border: none;text-align: right;" readonly  id="balance" name="balance" value="0.00"/></td>
                                            </tr >
                                        </table>

                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <input type="submit" class="btn btn-info" onclick="doajax();" value="Add General" name="Add"/>

                                <!-- <button type="submit" name="submit" class="btn btn-info">
                                     <i class="glyphicon glyphicon-save"></i>
                                     Submit</button>
                                 <button type="reset" name="reset" class="btn btn-primary">
                                     <i class="glyphicon glyphicon-trash"></i>
                                     Clear</button>-->
                            </div>
                        </div>
                        <!-- /.col (left) -->
                        <div class="col-md-4">
                                <div class="box box-warning">
                                    <div class="box-header" >
                                        <h3 class="box-title">Summery informations</h3>
                                    </div>
                                    <div class="box-body" style="height:230px;">

                                        <div id="chartdiv" style=" height:190px;"></div>

                                        <div class="col-md-4" style="margin-left: 0px;padding-left: 0px">
                                            <div style="float: left;width: 15px;"><p style="height: 15px;width: 15px;background-color: #FF0F00;"></p></div>
                                            <div style="float: left;width: 60px;margin-top: -2px;margin-left: 4px">Total sum</div>
                                        </div>
                                        <div class="col-md-4" style="margin-left: 0px;padding-left: 0px">
                                            <div style="float: left;width: 15px;"><p style="height: 15px;width: 15px;background-color: #FF9E01"></p></div>
                                            <div style="float: left;width: 60px;margin-top: -2px;margin-left: 4px">Completed</div>
                                        </div>
                                        <div class="col-md-4" style="margin-left: 0px;padding-left: 0px">
                                            <div style="float: left;width: 15px;"><p style="height: 15px;width: 15px;background-color: #FCD202"></p></div>
                                            <div style="float: left;width: 60px;margin-top: -2px;margin-left: 4px">Remaining</div>
                                        </div>



                                    </div>
                                </div>
                                <div class="box box-warning">
                                    <div class="box-header">
                                        <h3 class="box-title">Agent summery informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div id="chartdiv3" style=" height:250px;"></div>
                                        <div style="">

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

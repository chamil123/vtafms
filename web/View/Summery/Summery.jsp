<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

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
                        Summery
                        <small>create summery</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewSummery.jsp">View summery</a></li>
                        <li class="active">Add summery</li>
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


                    var Center = [
                    ];
                    Summery = {item: []};
                    Excess = {item: []};
                    CenterCash = {item: []};
                    SummeryInfo = [];
                    AgentInfo = [];
                    $(document).on("ready", function () {
                        loadData();
                    });
                    var loadData = function () {
                        $.ajax({
                            type: 'POST',
                            url: "../../GetAllCentersDetailsinAjax"
                        }).done(function (data) {
                            var rowTokens = data.split("!");
                            var x;
                            for (x = 0; x < rowTokens.length - 1; x++) {
                                var columnTokens = rowTokens[x].split(":");

                                Center.push({"label": columnTokens[1], "number": columnTokens[0], "com": columnTokens[2], "nocom": columnTokens[3], "lesscom": columnTokens[4], "pprcash": columnTokens[5], "loan": columnTokens[7], "exp": columnTokens[8]});
                            }
                        });
                        $.ajax({
                            type: 'POST',
                            url: "../../CheckDailySummery?Type=normal"
                        }).done(function (data) {
                            var rowTokens = data.split("!");
                            var x;
                            for (x = 0; x < rowTokens.length - 1; x++) {
                                var columnTokens = rowTokens[x].split(":");
                                Summery.item.push({"date": columnTokens[0], "cname": columnTokens[1]});
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
                                CenterCash.item.push({"fc": columnTokens[0], "cash": columnTokens[1], "date2": columnTokens[2], "pd": columnTokens[3], "cnumber": columnTokens[4]});
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
                        $("#cname").autocomplete({source: Center, select: function (event, ui) {
                                event.preventDefault();
                                $(this).val(ui.item.label);
                                var value = JSON.stringify(Summery);
                                obj = JSON.parse(value);
                                var list = obj.item;
                                var val = 0;
                                var dates = document.getElementById("dates").value;
                                for (index in list) {
                                    var objs = list[index];
                                    var date = objs["date"];
                                    var names = objs["cname"];
                                    if (names == ui.item.label && date == dates) {
                                        document.getElementById("txtHint").innerHTML = "<i class='alert-danger'>Existing Summery Name</i>";
                                        val = 1;
                                    }
                                }
                                if (val == 0) {
                                    var value2 = JSON.stringify(CenterCash);
                                    obj2 = JSON.parse(value2);
                                    var list2 = obj2.item;
                                    $("#cnumber").val(ui.item.number);
                                    $("#papercash").val(ui.item.pprcash);
                                    $("#com").val(ui.item.com);
                                    $("#loan").val(ui.item.loan);
                                    $("#exp").val(ui.item.exp);
                                    $("#lcrate").val(ui.item.lesscom);
                                    $("#ncrate").val(ui.item.nocom);
                                    for (index in list) {
                                        var objc = list[index];
                                        var date = objc["date"];
                                        var names = objc["cname"];
                                        if (names == ui.item.label && date == dates) {
                                            document.getElementById("txtHint").innerHTML = "<i class='alert-danger'>Existing Summery Name</i>";
                                            val = 1;
                                            setText();
                                        }
                                    }
                                    var val2 = 0;
                                    var cnumber = document.getElementById("cnumber").value;
                                    for (index2 in list2) {
                                        var obj2 = list2[index2];
                                        var date2 = obj2["date2"];
                                        var number = obj2["cnumber"];
                                        if (number == cnumber && date2 == dates) {
                                            $("#fc").val(obj2["fc"]);
                                            $("#cash").val(obj2["cash"]);
                                            $("#pd").val(obj2["pd"]);
                                            // alert("fc : " + obj2["fc"] + " cash : " + obj2["cash"] + " pd : " + obj2["pd"]);
                                            val2 = 1
                                            document.getElementById("txtHint").innerHTML = "<i class='alert-success'>Availbale Summery Name</i>";
                                        }
                                    }
                                    var valueExcess = JSON.stringify(Excess);
                                    objEx = JSON.parse(valueExcess);
                                    var listEx = objEx.item;
                                    for (indexEx in listEx) {
                                        var obj3 = listEx[indexEx];
                                        var edate = obj3["edate"];
                                        var ecnumber = obj3["ecnumber"];
                                        if (ecnumber == cnumber && edate == dates) {
                                            $("#exc").val(obj3["excessTot"]);
                                        }
                                    }
                                    if (val2 !== 1) {
                                        document.getElementById("txtHint").innerHTML = "<i class='alert-warning'>Cash details not available</i>";
                                        setText();
                                    }
                                    calculations();
                                }
                            }});
                    });
                    function setText() {
                        document.getElementById("fc").innerHTML = 0.0;
                        document.getElementById("com").innerHTML = 0.0;
                        document.getElementById("papercash").innerHTML = 0.0;
                        document.getElementById("loan").innerHTML = 0.0;
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
                        var loan = document.getElementById("loan").value;
                        var pd = document.getElementById("pd").value;
                        var lcnc = document.getElementById("lcnc").value;
                        var paymentTotal = document.getElementById("paymentTotal").value;
                        var cash = document.getElementById("cash").value;
                        var exp = document.getElementById("exp").value;
                        var exc = document.getElementById("exc").value;


                        var comisionpay = (fc * com) / 100;
                        document.getElementById('paycoms').value = comisionpay;
                        var duesub = (parseFloat(fc)) + (parseFloat(lcnc)) + (parseFloat(pc)) + (parseFloat(pd)) + (parseFloat(loan));
                        var paysub = (parseFloat(paymentTotal)) + comisionpay + (parseFloat(cash)) + (parseFloat(exp)) + (parseFloat(exc));

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



                <script>
                    var increment = 0;
                    var rowCount;
                    function addRow(tableID) {

                        var chtnumber = document.getElementById('chtnumber').value;
                        var amount = document.getElementById('amount').value;
                        var payment = document.getElementById('payment').value;



                        var table = document.getElementById(tableID);
                        rowCount = table.rows.length;
                        document.getElementById("rowcount").value = rowCount;
                        var row = table.insertRow(rowCount);
                        var cell1 = row.insertCell(0);
                        var element1 = document.createElement("input");
                        element1.type = "checkbox";
                        element1.name = "chkbox[]";
                        cell1.appendChild(element1);

                        var counts = rowCount - 1;
                        var cell2 = row.insertCell(1);
                        var chitNo = document.createElement("input");
                        chitNo.type = "text";
                        if (rowCount % 2 == 1) {
                            chitNo.style = "border-style: hidden;background-color : #EEEEEE;width:117px";
                        } else {
                            chitNo.style = "border-style: hidden;width:117px";
                        }
                        chitNo.name = "houseNum[" + counts + "]";
                        chitNo.id = "houseNum[" + counts + "]";
                        chitNo.value = chtnumber;
                        //document.getElementById("rowcount").value = count-1;
                        cell2.appendChild(chitNo);

                        var cell3 = row.insertCell(2);
                        var chitAmount = document.createElement("input");
                        chitAmount.type = "text";
                        if (rowCount % 2 == 1) {
                            chitAmount.style = "border-style: hidden;background-color : #EEEEEE;width:152px";
                        } else {
                            chitAmount.style = "border-style: hidden;width:152px";
                        }
                        chitAmount.name = "city[" + counts + "]";
                        chitAmount.value = amount;
                        cell3.appendChild(chitAmount);

                        var cell4 = row.insertCell(3);
                        var chitPay = document.createElement("input");
                        chitPay.type = "text";
                        if (rowCount % 2 == 1) {
                            chitPay.style = "border-style: hidden;background-color : #EEEEEE;width:148px";
                        } else {
                            chitPay.style = "border-style: hidden;width:148px";
                        }
                        chitPay.name = "country[" + counts + "]";
                        chitPay.id = "country[" + (counts - 1) + "]";
                        chitPay.value = payment;
                        cell4.appendChild(chitPay);



                        var cell5 = row.insertCell(4);
                        var btn = document.createElement("a");
                        //btn.type = "button";
                        btn.setAttribute("class", "glyphicon glyphicon-trash");
                        btn.atribute = "<a href='#' style='color:red' style='float : right'  onClick='Javacsript:deleteRow(this)' >  <i class='glyphicon glyphicon-trash'></i></a> "
                        btn.onclick = function () {

                            var table = document.getElementById('addressesTable');
                            var rowCount = table.rows.length;

                            if (rowCount % 2 == 1) {

                                chitNo.style = "border-style: hidden;background-color : #ffffff";
                                chitAmount.style = "border-style: hidden;background-color : #ffffff";
                                chitPay.style = "border-style: hidden;background-color : #EEEEEE";
                            } else {
                                chitNo.style = "border-style: hidden";
                            }

                            for (var i = 0; i < rowCount; i++) {
                                var row = table.rows[i];

                                var chkbox = row.cells[0].childNodes[0];

                                if (null != chkbox && true == chkbox.checked) {
                                    table.deleteRow(i);
                                    rowCount--;
                                    i--;

                                }
                            }

                            var j;
                            var total = 0;
                            var row = rowCount - 2
                            if (row > 0) {
                                for (var i = 2; i < rowCount; i++) {
                                    j = document.getElementById("addressesTable").rows[i].cells[3].getElementsByTagName("input")[0].value;
                                    var k = parseInt(j);
                                    total = total + k;
                                    increment = 1;
                                }
                                document.getElementById('paymentTotal').value = total;
                            } else {
                                document.getElementById('paymentTotal').value = 0;
                            }
                            calculations();
                        };
                        btn.name = "button[" + counts + "]";
                        cell5.appendChild(btn);
                        rowTot();
                        document.getElementById('chtnumber').value = "";
                        document.getElementById('amount').value = "";
                        document.getElementById('payment').value = "";
                    }
                    function rowTot() {
                        var j;
                        var total = 0;
                        var row = rowCount - 2
                        if (row > 0) {
                            for (var i = 2; i < rowCount + 1; i++) {
                                j = document.getElementById("addressesTable").rows[i].cells[3].getElementsByTagName("input")[0].value;
                                var k = parseInt(j);
                                total = total + k;
                                increment = 1;
                            }
                            document.getElementById('paymentTotal').value = total;
                        } else {
                            var payment = document.getElementById('payment').value;
                            document.getElementById('paymentTotal').value = payment;
                        }
                        calculations();
                    }


                    function totlcnc() {
                        var lcAmount = parseFloat(document.getElementById('lamount').value);
                        var ncAmount = parseFloat(document.getElementById('namount').value);
                        var lcrate = parseFloat(document.getElementById('lcrate').value);
                        var ncrate = parseFloat(document.getElementById('ncrate').value);

                        document.getElementById('lcnc').value = (lcAmount * lcrate / 100) + (ncAmount * ncrate / 100);

                    }
                </script>


                <!-- Main content -->

                <section class="content">

                    <div class="row">
                        <form  role="form"  action="../../AddSummery" method="POST" >
                            <div class="col-md-8">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title" >Basic informations</h3>
                                        <div  id="date" name="date" style="float: right;font-size: 16px"></div>
                                        <input type="hidden" id="dates" name="dates" style="float: right;font-size: 16px"/>
                                    </div>
                                    <div class="box-body" style="padding-bottom: 70px">

                                        <div class="col-md-6" style="padding-left: 0px; padding-right: 0px">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label>Center name:</label><p style="float: right" id="txtHint"></p>

                                                    <input type="text" class="form-control my-colorpicker1" id="cname" name="cname" placeholder="Enter center name">

                                                </div>
                                            </div>
                                            <div class="form-group">

                                            </div>
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label>Less com amount:</label>
                                                    <input type="hidden"  id="lcrate"  name="lcrate" >
                                                    <input type="hidden"  id="ncrate"  name="ncrate" >
                                                    <input type="text" class="form-control my-colorpicker1" id="lamount" value="0.0" name="lamount" onkeyup="totlcnc();" placeholder="Enter center name">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6" style=" padding-right: 0px">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label>Center Number</label>
                                                    <input type="hidden" class="form-control my-colorpicker1" id="com" name="com" disabled>
                                                    <input type="text" class="form-control my-colorpicker1" id="cnumber" name="cnumber" >
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label>Not run amountname:</label>

                                                    <input type="text" class="form-control my-colorpicker1" id="namount" value="0.0" name="namount" onkeyup="totlcnc();" placeholder="Enter center name">
                                                </div>
                                            </div> 
                                        </div>

                                        <!-- /////////////////////////-->
                                        <div class="col-md-12" style="padding:15px 15px 15px 15px;background-color: #f0f0f0">
                                            <div class="col-md-3" style="padding-left: 0px;width: 255px">
                                                <div class="form-group">
                                                    <label style="color: #0066cc">Chit number</label>
                                                    <input type="text" name="chtnumber" style="color: black" id="chtnumber" class="form-control" placeholder="Select timebag">
                                                </div>
                                            </div>
                                            <div class="col-md-3"style="width:182px;padding-left: 0px;padding-right: 0px;margin-left: -15px">
                                                <div class="form-group">
                                                    <label style="color: #0066cc">Amount</label>
                                                    <input type="text" id="amount" name="amount" class="form-control" style="font-size: 20px;">
                                                </div>
                                            </div>

                                            <div class="col-md-3"style="width:178px;padding-left: 0px;padding-right: 0px">
                                                <div class="form-group">
                                                    <label style="color: #0066cc">Payment</label>
                                                    <input type="text" id="payment" name="payment"style="font-size: 16px;" class="form-control" >
                                                </div>
                                            </div>


                                            <div class="col-md-1" style="margin-left: -15px">
                                                <div class="form-group">
                                                    <label >.</label>
                                                    <button type="button" name="button[0]"   id="add" value="Add" onclick="addRow('addressesTable')" style="border-radius: 0px"  class="btn btn-primary">
                                                        <i class="glyphicon glyphicon-plus-sign"></i>
                                                        Add</button>
                                                </div>
                                            </div>

                                            <!-- /////////////////////////-->
                                            <table id="addressesTable"  class="table-style-three"   width='100%' style="padding: 10px 10px 10px 10px" >
                                                <tr>
                                                    <th>select</th>
                                                    <th>chit number</th>
                                                    <th>amount</th>
                                                    <th>payment</th>
                                                    <th>action</th>
                                                </tr>

                                                <tr hidden>
                                                <input type="hidden"  id="rowcount" name="rowcount" />
                                                <td ><input type="checkbox" name="chk"/></td>

                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="houseNum[0]" /></td>
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="city[0]" /></td>
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE"  name="country[0]"   /></td>
                                                <td> <a name="button[0]"  href='#' style='color:red' style='float : right'  onClick="deleteRow('addressesTable')" >  <i class='glyphicon glyphicon-trash'></i></a> </td>
                                                </tr>
                                            </table>

                                        </div>


                                        <div class="col-md-12 " style="padding-left: 0px;padding-right: 0px;padding-top: 10px;">

                                        </div>
                                        <div id="myDiv"></div>
                                        <div class="col-md-12 " style="height: 200px">

                                            <table>
                                                <tr style="border-top: 1px solid">
                                                    <td  style="width: 200px"><label>Full collection :</label></td>
                                                    <td > <input type="text" style="font-size:  20px;border:none;width: 170px" readonly  id="fc" name="fc" value="0.00"/></td>
                                                    <td style="width: 170px"><label >Payment Total</label></td>
                                                    <td ><input type="text" style="font-size:  27px;border:none;width: 120px;font-weight: bold;color: #0000ff;text-align: right" readonly  id="paymentTotal" name="paymentTotal" value="0.00"/></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 200px"><label>LC & NC amount :</label></td>
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 170px" readonly  id="lcnc" name="lcnc" value="0.00" value="0.00"/></td> 
                                                    <td style="width: 170px"><label >commision value</label></td>
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="paycoms" name="paycoms" value="0.00"/></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 200px"><label>Paper cash :</label></td >
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 170px" readonly  id="papercash" name="papercash" value="0.00"/></td> 
                                                    <td style="width: 150px"><label>Expenses :</label></td>
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exp" name="exp" value="0.00"/></td>
                                                </tr><tr>
                                                    <td style="width: 200px"><label>Loan:</label></td>
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 170px" readonly  id="loan" name="loan" placeholder="0.00"/></td> 
                                                    <td style="width: 150px"><label>Excess :</label></td>
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exc" name="exc" value="0.00"/></td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 200px"><label>Passed due:</label></td>
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 170px" readonly  id="pd" name="pd" placeholder="0.00"/></td> 
                                                    <td style="width: 150px"><label>Cash :</label></td>
                                                    <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="cash" name="cash" value="0.00"/></td>
                                                </tr>

                                                <tr style="border-top: 1px solid">
                                                    <td style="width: 200px"><label>due sub total:</label></td>
                                                    <td ><input type="text" style="font-size:  20px;font-weight: bold;border:none;width: 170px" readonly  id="duesub" name="duesub" placeholder="0.00"/></td> 
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
                                    <input type="submit" class="btn btn-info" onclick="doajax();" value="Add summery" name="Add"/>

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

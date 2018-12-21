<%-- 
    Document   : viewSummery
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

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
        <script src="../../plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
        <script src="../../dist/js/jquery-1.8.3.min.js" type="text/javascript"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>




    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load()">

        <%            //List<Role> listRole = (List<Role>) RoleController.getAllRoles();
            // List<Transaction> listTransaction = (List<Transaction>) TransactionController.getAllTransactions();
            //  List<Account> listaccount = (List<Account>) TransactionController.getAllTransactions();
            //int nopage = 5;

            String name = request.getParameter("name");
            String pagenum = request.getParameter("page1");
            int page1 = 0;
            if (request.getParameter("page") != null) {
                int pages = Integer.parseInt(request.getParameter("page"));
                page1 = 0;
                if (pages == 0 || pages == 1) {
                    page1 = 0;
                } else {
                    page1 = (pages * 8) - 8;
                }
            }

            double rowCount = TransactionController.getRowCount();
            int row = (int) rowCount;

            double nopage = rowCount / 8;
            DecimalFormat f = new DecimalFormat("##.0");
            String formatval = f.format(nopage).toString();

            int aa = formatval.indexOf(".");
            int bb = formatval.length();
            String sub = formatval.substring(aa, bb);

            if (!sub.equals("null")) {
                double subst = Double.parseDouble(sub);
                if (subst > 0) {
                    nopage++;
                } else {
                    System.out.print("subset : ");
                }
            }
            List<Transaction> limittrans = (List<Transaction>) TransactionController.limitResult("" + page1);

            double totExp = ExpensesController.getAllexpensesAmount();
            Date dNow = new Date();
            SimpleDateFormat ft
                    = new SimpleDateFormat("yyyy-MM-dd");
            double daytotExp = ExpensesController.getAllexpensesAmountbydate(ft.format(dNow));

            if (name != null && pagenum != null) {
                if (request.getParameter("page") != null) {
                    int pages = Integer.parseInt(pagenum);
                    page1 = 0;
                    if (pages == 0 || pages == 1) {
                        page1 = 0;
                    } else {
                        page1 = (pages * 8) - 8;
                    }
                }
                rowCount = TransactionController.getRowCountSearch(name);
                row = (int) rowCount;
                nopage = rowCount / 8;
                formatval = f.format(nopage).toString();
                aa = formatval.indexOf(".");
                bb = formatval.length();
                sub = formatval.substring(aa, bb);
                if (!sub.equals("null")) {
                    double subst = Double.parseDouble(sub);
                    if (subst > 0) {
                        nopage++;
                    } else {
                        System.out.print("subset : ");
                    }

                }
                limittrans = (List<Transaction>) TransactionController.searchAndlimitResult(name, "" + page1);
                totExp = ExpensesController.getAllexpensesAmount();
                daytotExp = ExpensesController.getAllexpensesAmountbydate(ft.format(dNow));

            }
            String res_expenses = request.getParameter("res_expenses");
            int expense = 0;
            if (res_expenses != null) {
                expense = Integer.parseInt(res_expenses.toString());
            }
        %>

        <script type="text/javascript">
            function load() {
                var result =<%=expense%>
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
            function alertFunction(summery_id) {
                var date, cname, cid, lcamount, ncamount, lcnc, papercash, slippaytot, compay, expenses, fc, pd, cash, exetot, chtNum, investment, payment;
                $.ajax({
                    type: 'POST',
                    url: "../../updateSummeryAjax?dayVal=" + summery_id + ""
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;

                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        date = columnTokens[0];
                        cname = columnTokens[1];
                        cid = columnTokens[2];
                        lcamount = columnTokens[3];
                        ncamount = columnTokens[4];
                        lcnc = columnTokens[5];
                        papercash = columnTokens[6];
                        slippaytot = columnTokens[7];
                        compay = columnTokens[8];
                        expenses = columnTokens[9];
                        fc = columnTokens[10];
                        pd = columnTokens[11];
                        cash = columnTokens[12];
                        exetot = columnTokens[13];
                    }
                    document.getElementById('cname').value = cname;
                    document.getElementById('cnumber').value = cid;
                    document.getElementById('lamount').value = lcamount;
                    document.getElementById('namount').value = ncamount;
                    document.getElementById('lcnc').value = lcnc;
                    document.getElementById('papercash').value = papercash;
                    document.getElementById('paymentTotal').value = slippaytot;
                    document.getElementById('paycoms').value = compay;
                    document.getElementById('exp').value = expenses;
                    document.getElementById('fc').value = fc;
                    document.getElementById('pd').value = pd;
                    document.getElementById('cash').value = cash;
                    document.getElementById('exc').value = exetot;
                });
                $.ajax({
                    type: 'POST',
                    url: "SearchExpenses"
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;

                    var outputData;
                    outputData = "<table id=addressesTable class=table-style-three width=100%>";
                    outputData += "<th>" + "Chit number" + "</th>";
                    outputData += "<th>" + "Investment" + "</th>";
                    outputData += "<th>" + "Payment" + "</th>";
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        alert(data);
                        var columnTokens = rowTokens[x].split(":");
                        chtNum = columnTokens[0];
                        investment = columnTokens[1];
                        payment = columnTokens[2];
                        outputData += "<tr>";
                        outputData += "<td>" + chtNum + "</td>";
                        outputData += "<td>" + investment + "</td>";
                        outputData += "<td style=text-align:right;font-size:15px;font-weight:bold>" + payment + "</td>";
                    }
                    outputData += "</tr>";
                    outputData += "</table>";
                    document.getElementById('tableDiv').innerHTML = outputData;


                });
            }
            function getUserIdForDelete(exp_id) {

                document.getElementById('iddelete').value = exp_id;

            }
        </script>

        <script>
            var chartDatas = [
            ];
            $.ajax({
                type: 'POST',
                url: "../../GetExpensesAccountTotal"
            }).done(function (data) {
                var rowTokens = data.split("!");
                var x;

                for (x = 0; x < rowTokens.length - 1; x++) {

                    var columnTokens = rowTokens[x].split(":");
                    var chtNum = columnTokens[0];
                    // alert(chtNum);
                    chartDatas.push({"country": columnTokens[0], "visits": columnTokens[1]});
                }



            });

            var chart;
            AmCharts.ready(function () {
                // PIE CHART
                chart = new AmCharts.AmPieChart();
                chart.dataProvider = chartDatas;
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
                chart.marginTop = -10;


                // WRITE
                chart.write("chartdiv");
            });


        </script>

        <div class="wrapper">
            <div style="height: 50px" >
                <header class="main-header effect" >
                    <a href="../../index2.html" class="logo" > 
                        <span class="logo-mini"><b>V</b>TA</span>
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
                        Expenses
                        <small>View Expenses</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">view expenses</li>
                    </ol>
                </section>
                <div style="margin: 15px 15px -15px 15px" >
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->

                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->

                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 230px">
                                <div class="col-md-3">

                                    <% if (rowCount == 0) { %>
                                    <div class="alert alert-danger">
                                        theere ara no result
                                    </div>
                                    <% }%>

                                    <div class="" style=";height: 80px;border-left: 4px solid #B9C904;padding: 0px 8px 8px 8px;margin: 10px 10px 10px 0px"><p style="font-size: 33px;color: #666666;margin-bottom: -2px">Rs.<%=totExp%></p>
                                        <p style="color: #999999;margin-bottom: -2px">Total Expenses</p>
                                        <p style="color: #cccccc;">since 30 days</p>
                                    </div>
                                    <div class="" style="height: 52px;;border-left: 4px solid #009999;padding: 0px 8px 8px 8px;margin: 23px 10px 10px 0px"><p style="font-size: 26px;color: #999999;margin-bottom: -2px">Rs.<%=daytotExp%></p>
                                        <p style="color: #999999;margin-bottom: -2px">Today total Expenses</p>

                                    </div>

                                </div>
                                <div class="col-md-8">
                                    <!-- HTML -->
                                    <div id="chartdiv" style="width: 100%; height:260px; margin: -30px 0px 0px -110px"></div>	

                                </div>
                                <div  style=" float: right"></div>	
                                <!-- <div id="chartdiv" style="width:100%; height:100px;;margin-bottom:  px"></div>-->
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Main content -->
                <section class="content">
                    <div class="alert alert-box success " >record is successfully updated </div>
                    <div class="alert alert-box failure " >record is successfully Deleted </div>
                    <div class="box box-default">
                        <div class="col-md-12" style="height: 45px;padding-top: 8px">

                            <form  class="form-inline" role="form"  action="../../SearchExpenses" method="POST" >

                                <div class="form-group">
                                    <a href="AddExpenses.jsp" style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px;margin-left: -5px" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; New expense</a>


                                </div>
                                <div class="form-group">


                                </div>

                                <div class="form-group" style="float: right">
                                    <input style="height: 25px"type="hidden" class="form-control" name="page" id="page" value="<%=page1%>" >
                                    <input style="height: 25px"type="text" class="form-control" name="search" id="search"  placeholder="Enter Center name">
                                    <button type="submit" class="btn btn-github"  style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px" value="search Expenses" name="Add"><i class="glyphicon glyphicon-search" ></i>&nbsp;Search summery</button>

                                </div>

                            </form>
                        </div>
                        <table class="table table-striped" width="70%" style="margin-bottom: 0px">

                            <tr style="background-color: #F2F2F3">
                                <th>&nbsp;id&nbsp;&nbsp;</th>
                                <th>&nbsp;&nbsp;Date&nbsp;</th>
                                <th>&nbsp;&nbsp;Payee&nbsp;</th>
                                <th>Amount&nbsp;</th>
                                <th >Description &nbsp;</th>
                                <th >Acount name</th>


                                <th style="text-align: right">Actions&nbsp;</th>
                            </tr>
                            <%                                for (Transaction model : limittrans) {
                                    Account account = AccountController.getAccountById("" + model.getAccount_id());
                            %>
                            <tr>
                                <td>&nbsp;<%=model.getTransaction_id()%></td>
                                <td>&nbsp;&nbsp;<%=model.getTransaction_date()%></td>
                                <td>&nbsp;&nbsp;<%=model.getTransaction_payee()%></td>
                                <td><%=model.getTransaction_amount()%></td>
                                <td><%=model.getTransaction_type()%></td>
                                <td><%=account.getAccount_name()%></td>
                                <td align="right" style="padding-right: 15px"> 

                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="UpdateExpenses.jsp?exp_id=<%=model.getTransaction_id()%>&action=update"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=model.getTransaction_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </button>
                                </td>
                            </tr>
                            <%}%>
                        </table>  
                        <div class="pagination " style="width: 100%">
                            <% int i = 0;%>
                            <a href="viewExpenses.jsp?page=<%=i%>" class="page active">first</a>
                            <% for (i = 1; i <= nopage; i++) {%>

                            <a href="viewExpenses.jsp?page=<%=i%>" class="page">
                                <%=i%>
                            </a>
                            <% }%>
                            <a href="viewExpenses.jsp?page=<%=i - 1%>" class="page active">last</a>
                            <div style="float: right;font-size: 12px;color: #666666;padding-right: 15px">Showing 1 to 8 of <spam ><%=row%></spam> entries</div>
                        </div>
                    </div>
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  
            <!-- Modal -->
            <div class="modal fade " id="myModal" role="dialog"  >
                <div class=" modal-dialog " style="width:40%;background-color: #f0f0f0;border-radius: 50px;">
                    <!-- Modal content-->
                    <div class="modal-content" style="background-color: #ffffff">

                        <div class="modal-header" style="padding: 8px 8px 8px 20px">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Update Summery   <span style="font-size: 15px;color: #0000cc">&nbsp;&nbsp;&nbsp;&nbsp; Hello </span><spam style="font-size: 13px;color: #0000cc" id="fname1" ></spam></h4>
                        </div>
                        <div class="modal-body" style="padding:  0px 5px 5px 5px">
                            <section class="content">
                                <div class="row">
                                    <form  role="form"  action="AddSummery" method="POST" >
                          
                                        <div class="box-body" style="padding-bottom: 40px">

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

                                                        <input type="text" class="form-control my-colorpicker1" id="lamount" name="lamount" placeholder="Enter center name">
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

                                                        <input type="text" class="form-control my-colorpicker1" id="namount" name="namount" placeholder="Enter center name">
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
                                            <div class="col-md-12 " style="height: 200px">

                                                <table>
                                                    <tr style="border-top: 1px solid">
                                                        <td style="width: 500px;"><label>Full collection :</label></td>
                                                        <td > <input   type="text" style="font-size:  20px;text-align: right;width: 110px;padding-right: 10px;border: none" readonly  id="fc" name="fc" value="0.00"/></td>
                                                        <td style="width: 100px"><label >Payment Total</label></td>
                                                        <td ><input type="text" style="font-size:  23px;border:none;width: 120px;font-weight: bold;color: #0000ff;text-align: right" readonly  id="paymentTotal" name="paymentTotal" value="0.00"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px"><label>LC NC amount :</label></td>
                                                        <td ><input type="text" style="font-size:  20px;text-align: right;width: 110px;padding-right: 10px;border: none" readonly  id="lcnc" name="lcnc" value="0.00" value="0.00"/></td> 
                                                        <td style="width: 170px"><label >commision</label></td>
                                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="paycoms" name="paycoms" value="0.00"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 200px"><label>Paper cash :</label></td >
                                                        <td ><input type="text" style="font-size:  20px;text-align: right;width: 110px;padding-right: 10px;border: none" readonly  id="papercash" name="papercash" value="0.00"/></td> 
                                                        <td style="width: 150px"><label>Expenses :</label></td>
                                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exp" name="exp" value="0.00"/></td>
                                                    </tr><tr>
                                                        <td style="width: 200px"><label>Loan:</label></td>
                                                        <td ><input type="text" style="font-size:  20px;text-align: right;width: 110px;padding-right: 10px;border: none" readonly  id="loan" name="loan" placeholder="0.00"/></td> 
                                                        <td style="width: 150px"><label>Excess :</label></td>
                                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="exc" name="exc" value="0.00"/></td>
                                                    </tr>

                                                    <tr>
                                                        <td style="width: 200px"><label>Passed due:</label></td>
                                                        <td ><input type="text" style="font-size:  20px;text-align: right;width: 110px;padding-right: 10px;border: none" readonly  id="pd" name="pd" placeholder="0.00"/></td> 
                                                        <td style="width: 150px"><label>Cash :</label></td>
                                                        <td ><input type="text" style="font-size:  20px;border:none;width: 120px;text-align: right" readonly  id="cash" name="cash" value="0.00"/></td>
                                                    </tr>

                                                    <tr style="border-top: 1px solid">
                                                        <td style="width: 200px"><label>due sub total:</label></td>
                                                        <td ><input type="text" style="font-size:  20px;text-align: right;font-weight: bold;;width: 110px;padding-right: 10px;border: none" readonly  id="duesub" name="duesub" placeholder="0.00"/></td> 
                                                        <td style="width: 150px"><label>pay sub total :</label></td>
                                                        <td ><input type="text" style="width: 120px;font-size:  20px;font-weight: bold;border: none;text-align: right;" readonly  id="paysub" name="paysub" value="0.00"/></td>
                                                    </tr>
                                                    <tr  style="border-top: 1px solid;">
                                                        <td colspan="2" ></td>
                                                        <td  style="width: 150px;font-size:  23px;border-bottom: 2px solid"><label>Balance :</label></td>
                                                        <td style="border-bottom: 2px solid;"><input type="text" style="width: 120px;font-size:  26px;font-weight: bold;border: none;text-align: right;" readonly  id="balance" name="balance" value="0.00"/></td>
                                                    </tr >
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.col (left) -->
                                    </form>
                                </div>
                            </section>
                        </div>
                        <div class="modal-footer" style="padding: 0px 8px 8px 0px">
                            <div class="form-group">
                                <input type="submit" class="btn btn-info" onclick="doajax();" value="Add summery" name="Add"/>

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
                            <h4 class="modal-title">Confirm a Expenses deletion</h4>
                        </div>
                        <form action="../../AddExpenses" method="POST">
                            <div class="modal-body">
                                <spam >This will delete this user <b>permanently</b></spam><br/>
                                <spam>Are you sure want to permanently delete the selected item ?</spam>
                                <!-- <spam>Please click the <b>Delete button</b> only ones, it will takes few moments for the <br/>deletion process to complete</spam>-->
                            </div>
                            <div class="modal-footer" style="height: 48px;padding: 7px 7px 7px 17px;">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                <input type="hidden" class="form-control" id="iddelete"  name="exp_id" >
                                <input  type="submit" class="btn btn-danger" value="Delete exp" name="delete" />
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

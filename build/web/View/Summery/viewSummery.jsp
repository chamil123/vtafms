<%-- 
    Document   : viewSummery
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

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
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../../dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="../../dist/css/_all-skins.min.css">
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>

        <style>
            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;

            }
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <%
            //List<Role> listRole = (List<Role>) RoleController.getAllRoles();
            List<Summery> listSummery = (List<Summery>) SummeryController.getAllSummerys();
            //int nopage = 5;
            int page1 = 0;
            if (request.getParameter("page") != null) {
                int pages = Integer.parseInt(request.getParameter("page"));
                page1 = 0;
                if (pages == 0 || pages == 1) {
                    page1 = 0;
                } else {
                    page1 = (pages * 12) - 12;
                }
            }

            double rowCount = SummeryController.getRowCount();
            int row = (int) rowCount;

            double nopage = rowCount / 12;

            // System.out.print("pagesnumber of : " + rowCount);
            //double d = 2.34568;
            DecimalFormat f = new DecimalFormat("##.0");
            String formatval = f.format(nopage).toString();

            //String[] parts = string.split("-");
//String part1 = parts[0]
            //  String splits[] = formatval.split(".");
            int aa = formatval.indexOf(".");
            int bb = formatval.length();
            String sub = formatval.substring(aa, bb);
            System.out.println("number of pafes : " + formatval);
            System.out.println("alssss : " + formatval.indexOf("."));
            System.out.println("alsssssdd : " + formatval.length());
            System.out.println("alssyuu : " + formatval.substring(aa, bb));

            if (!sub.equals("null")) {
                double subst = Double.parseDouble(sub);
                if (subst > 0) {
                    nopage++;
                } else {
                    System.out.print("subset : ");
                }

            }
            List<Summery> limitSummery = (List<Summery>) SummeryController.limitResult("" + page1);
        %>
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
                    url: "../../updateSummeryLineAjax?dayVal=" + summery_id + ""
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;

                    var outputData;
                    outputData = "<table id=addressesTable class=table-style-three width=100%>";
                    outputData += "<th>" + "Chit number" + "</th>";
                    outputData += "<th>" + "Investment" + "</th>";
                    outputData += "<th>" + "Payment" + "</th>";
                    for (x = 0; x < rowTokens.length - 1; x++) {

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


                calculations();
            }
            function calculations() {

                var fc = document.getElementById("fc").value;
                //var com = document.getElementById("com").value;
                var compay = document.getElementById('paycoms').value;
                var pc = document.getElementById("papercash").value;
                var loan = document.getElementById("loan").value;
                var pd = document.getElementById("pd").value;
                var lcnc = document.getElementById("lcnc").value;
                var paymentTotal = document.getElementById("paymentTotal").value;
                var cash = document.getElementById("cash").value;
                var exp = document.getElementById("exp").value;
                var exc = document.getElementById("exc").value;

                var duesub = (parseFloat(fc)) + (parseFloat(lcnc)) + (parseFloat(pc)) + (parseFloat(pd)) + (parseFloat(loan));
                var paysub = (parseFloat(paymentTotal)) + (parseFloat(compay)) + (parseFloat(cash)) + (parseFloat(exp)) + (parseFloat(exc));


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
            function getRowValues(summery_id) {
                var date, cname, cid;
                $.ajax({
                    type: 'POST',
                    url: "../../updateSummeryAjax?dayVal=" + summery_id + ""
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;

                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        //  date = columnTokens[0];
                        cname = columnTokens[1];
                        cid = columnTokens[2];

                    }
                    document.getElementById('summery_id').value = summery_id;
                    document.getElementById('id').value = cid;
                    document.getElementById('centername').value = cname;


                });

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
                        Summery 
                        <small>View summery</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">View summery</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="box box-default">
                        <div class="col-md-12" style="height: 45px;padding-top: 8px">

                            <form class="form-inline">
                                <div class="form-group">
                                    <label for="From:">From:</label>
                                    <input style="height: 25px" type="date" class="form-control" id="fromdate">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">To:</label>
                                    <input style="height: 25px"type="date" class="form-control" id="tomdate">
                                    <span class="label label-success">Filter</span>
                                </div>
                                <div class="form-group" style="float: right">

                                    <input style="height: 25px"type="text" class="form-control" id="search" placeholder="Enter Center name">
                                    <button type="submit" class="btn btn-github"  style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px"><i class="glyphicon glyphicon-search"></i>&nbsp;Search summery</button>
                                </div>
                            </form>
                        </div>
                        <table class="table table-bordered" width="70%" style="margin-bottom: 0px">

                            <tr style="background-color: #F2F2F3">
                                <th>&nbsp;id&nbsp;</th>
                                <th>Date&nbsp;</th>
                                <th>Summery name&nbsp;</th>
                                <th>Center id&nbsp;</th>
                                <th>commision pay&nbsp;</th>
                                <th>Paper cash&nbsp;</th>
                                <th>Due amount&nbsp;</th>
                                <th>Pay amount&nbsp;</th>

                                <th>Actions&nbsp;</th>
                            </tr>
                            <%
                                for (Summery model : limitSummery) {
                            %>
                            <tr 
                                <%if (model.getSummery_status().equals("Uncheck")) { %>
                                Style=" background-color: #f2dede;"
                                <% }%>
                                >
                                <td>&nbsp;<%=model.getSummery_id()%></td>
                                <td>&nbsp;<%=model.getSummery_date()%></td>
                                <td><%=model.getSummery_name()%></td>
                                <td><%=model.getCenter_id()%></td>
                                <td><%=model.getSummery_compay()%></td>
                                <td><%=model.getSummery_papercash()%></td>
                                <td><%=model.getSummery_due()%></td>
                                <td><%=model.getSummery_pay()%></td>
                                <td align="right" style="padding-right: 15px"> 

                                    <button  type="submit" class="btn btn-default btn-sm "  >
                                        <a href="" onclick="alertFunction(<%=model.getSummery_id()%>);" style="color: black"  data-toggle="modal" data-target="#myModal">
                                            <i class="glyphicon glyphicon-file"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="UpdateSummery.jsp?summery_id=<%=model.getSummery_id()%>&action=update"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=model.getSummery_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </button>
                                    <%if (model.getSummery_status().equals("Check")) {%>

<!-- <a href="../../AddNotification?summery_id=<%=model.getSummery_id()%>&action=check" style="color: white">-->

                                    <button style="width: 75px" type="button" class="btn btn-success btn-sm " onclick=" getRowValues(<%=model.getSummery_id()%>)"data-toggle="modal" data-target="#deleteModal">
                                        Checked
                                    </button> 
                                    <!-- </a>-->
                                    <%  } else {%>
                                    <a href="../../AddNotification?summery_id=<%=model.getSummery_id()%>&action=Check" style="color: black">

                                        <button style="width: 75px" type="button" class="btn btn-group btn-sm" onclick="return confirmMsg('Active')" >
                                            Uncheck 
                                        </button> 
                                    </a>       
                                    <%}%>

                                </td>
                            </tr>
                            <%}%>
                        </table>  
                        <div class="pagination " style="width: 100%">
                            <% int i = 0;%>
                            <a href="viewSummery.jsp?page=<%=i%>" class="page active">first</a>
                            <% for (i = 1; i <= nopage; i++) {%>

                            <a href="viewSummery.jsp?page=<%=i%>" class="page">
                                <%=i%>
                            </a>
                            <% }%>
                            <a href="viewSummery.jsp?page=<%=i - 1%>" class="page active">last</a>
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
                                        <!-- <div class="box-header">
                                              <h3 class="box-title" >Basic informations</h3>
                                              <div  id="date" name="date" style="float: right;font-size: 16px"></div>
                                              <input type="hidden" id="dates" name="dates" style="float: right;font-size: 16px"/>
                                          </div>-->
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
                                                        <label>Not run amount:</label>

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
                                                        <td ><input type="text" style="font-size:  20px;text-align: right;width: 110px;padding-right: 10px;border: none" readonly  id="loan" name="loan" value="0.00"/></td> 
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
                                                        <td ><input type="text" style="font-size:  20px;text-align: right;font-weight: bold;;width: 110px;padding-right: 10px;border: none" readonly  id="duesub" name="duesub" value="0.00"/></td> 
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
            <div class="modal fade" id="deleteModal" role="dialog">
                <div class="modal-dialog" style="width: 500px;">
                    <!-- Modal content-->
                    <div class="modal-content"  style="border-radius: 3px">

                        <div class="modal-header" style="height: 35px;padding: 7px 7px 7px 17px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <i class="glyphicon glyphicon-trash" style="float: left;padding-top: 5px;padding-right: 10px"></i>
                            <h4 class="modal-title">Confirm a user deletion</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" action="../../AddNotification">
                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="id">Summery id :</label>
                                    <div class="col-sm-9">
                                        <input type="hidden" class="form-control" id="summery_id" name="summery_id">
                                        <input type="text" class="form-control" id="id" name="id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="centername">Center name :</label>
                                    <div class="col-sm-9"> 
                                        <input type="text" class="form-control" id="centername" name="centername" placeholder="Enter password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="remark">Remark :</label>
                                    <div class="col-sm-9"> 
                                        <textarea type="text" class="form-control" rows ="4" id="remark" name="remark" placeholder="Enter reson"></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-offset-3 col-md-5"> 

                                        <button type="submit" name="notification" class="btn btn-primary"  value="Addnotification">
                                            <i class="glyphicon glyphicon-save"></i>
                                            Submit</button>
                                        <button type="reset" name="reset" class="btn btn-danger">
                                            <i class="glyphicon glyphicon-trash"></i>
                                            Clear</button>
                                    </div>
                                </div>
                            </form>
                        </div> 
                    </div>


                </div>
            </div>
        </div>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

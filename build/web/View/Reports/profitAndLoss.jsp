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


    </head>
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
    <style>
        #inputColor{
            border:1px solid white;
        }
    </style>
    <body class="hold-transition skin-blue sidebar-mini">

        <%
            Object centercash = session.getAttribute("centercash");
            Object centerdue = session.getAttribute("centerdue");
            Object nclc = session.getAttribute("nclc");
            Object papercash = session.getAttribute("papercash");
            Object paymentSlip = session.getAttribute("paymentSlip");
            Object travelExpenses = session.getAttribute("travelExpenses");
            Object shopRental = session.getAttribute("shopRental");
            Object labourExp = session.getAttribute("labourExp");
            Object repairExp = session.getAttribute("repairExp");
            Object payrollExp = session.getAttribute("payrollExp");
            Object generalExp = session.getAttribute("generalExp");
            Object mealsExp = session.getAttribute("mealsExp");
            Object commisionExp = session.getAttribute("commisionExp");

            double cash = 0;
            double due = 0;
            double notClessC = 0;
            double pc = 0;
            double paySlip = 0;
            double travelExp = 0;
            double rental = 0;

            double labour = 0;
            double repair = 0;
            double payroll = 0;
            double general = 0;
            double meals = 0;
            double commision = 0;

            if (centercash == null) {
                cash = 0;
            } else {
                cash = Double.parseDouble(centercash.toString());
            }
            if (centerdue == null) {
                due = 0;
            } else {
                due = Double.parseDouble(centerdue.toString());
            }
            if (nclc == null) {
                notClessC = 0;
            } else {
                notClessC = Double.parseDouble(nclc.toString());
            }
            if (papercash == null) {
                pc = 0;
            } else {
                pc = Double.parseDouble(papercash.toString());
            }
            if (paymentSlip == null) {
                paySlip = 0;
            } else {
                paySlip = Double.parseDouble(paymentSlip.toString());
            }
            if (travelExpenses == null) {
                travelExp = 0;
            } else {
                travelExp = Double.parseDouble(travelExpenses.toString());
            }
            if (shopRental == null) {
                rental = 0;
            } else {
                rental = Double.parseDouble(shopRental.toString());
            }
            if (labourExp == null) {
                labour = 0;
            } else {
                labour = Double.parseDouble(labourExp.toString());
            }

            if (repairExp == null) {
                repair = 0;
            } else {
                repair = Double.parseDouble(repairExp.toString());
            }

            if (payrollExp == null) {
                payroll = 0;
            } else {
                payroll = Double.parseDouble(payrollExp.toString());
            }

            if (generalExp == null) {
                general = 0;
            } else {
                general = Double.parseDouble(generalExp.toString());
            }

            if (mealsExp == null) {
                meals = 0;
            } else {
                meals = Double.parseDouble(mealsExp.toString());
            }

            if (commisionExp == null) {
                commision = 0;
            } else {
                commision = Double.parseDouble(commisionExp.toString());
            }

            double revernue = (cash + due);
            double totIncome = (notClessC + pc);
            double totExpenses = (paySlip + travelExp + rental + labour + repair + payroll + general + meals + commision);

            double netProfit = revernue + totIncome - totExpenses;

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
                        <small>Profit and loss</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Forms</a></li>
                        <li class="active">Advanced Elements</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <form  role="form"  action="../../ProfitAndLoss" method="POST" >
                        <div class="box box-default">
                            <div class="box-header">
                                <p style="padding-left: 15px;color: #999999">Report period</p>
                                <div class="col-md-3">
                                    <select class="form-control select2 required" style="width: 100%;" id="role" name="role">
                                        <option  value=""> --------Please select period---------   </option>
                                        <option value="" >Today</option>
                                        <option value="" >This month</option>
                                        <option value="" >This Year to date</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="fromdate" name="fromdate" style=";height: 30px;font-size: 16px;padding-left: 10px"/>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" id="todate" name="todate" style="height: 30px;font-size: 16px;padding-left: 10px"/>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" name="reset" class="btn btn-info" style="margin-left: 0px">
                                        <i class="glyphicon glyphicon-tag"></i>
                                        Run report</button>
                                </div>

                            </div>
                            <hr>
                            <div class="box-body">
                                <center>
                                    <div style="margin-top: -30px">
                                        <h3 style="font-family: sans-serif">Vikum turf accounts Pvt (Ltd)</h3>
                                        <h4 style="font-family: sans-serif">PROFIT AND LOSS</h4>
                                        <p style="margin-top: -10px;color: #999999">18 November, 2016</p>
                                    </div>

                                </center>
                                <div class="col-md-6 col-md-offset-3" style="">

                                    <div class="col-md-6" >
                                        <p style="font-size: 15px;font-weight: bold;margin-left: -13px;">Cash revenue</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Cash collection</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Due collection</p>
                                        <p style="font-size: 15px;margin-bottom: 18px;;font-weight: bold">Total Cash revenue</p>
                                        <p style="font-size: 15px;margin-bottom: 5px;margin-left: -7px;font-weight: bold">Less : cost of sales</p>
                                        <p style="font-size: 15px;margin-bottom: 5px;margin-left: 0px;">Cost of sales</p>
                                        <p style="font-size: 16px;font-weight: bold;margin-left: -13px;">Gross Profit</p>
                                        <p style="font-size: 15px;margin-bottom: 5px;margin-left: -7px;font-weight: bold">Add : Other Income</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Not run & Less commision</p>
                                        <p style="font-size: 15px;margin-bottom: 30px">Paper cash</p>
                                        <p style="font-size: 15px;margin-bottom: 5px;margin-left: -7px;font-weight: bold">Less : Expenses</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Betting slip payment</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Travel expenses</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Shop Rental</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Cost of Labour</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Repair and maintenance</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Payroll Expenses</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Office/General Adm: Expenses</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Meals and entertainment</p>
                                        <p style="font-size: 15px;margin-bottom: 5px">Commissions and fees</p>
                                        <p style="font-size: 16px;font-weight: bold;margin-top: 20px">Net Profit</p>

                                    </div>
                                    <div class="col-md-2 " style="padding-top: 27px;padding-right: 0px;padding-left: 0px;">
                                        <input id="inputColor" type="text" class="form-control required" style="text-align: right;height: 25px" value="<%=cash%>" id="centercash" name="centercash">
                                        <input id="inputColor" type="text" class="form-control required" style="border-bottom:  1px solid black;text-align: right;height: 25px" value="<%=due%>" id="centerdue" name="centerdue">

                                        <input id="inputColor" type="text" class="form-control required" style="border-bottom:  1px solid black;text-align: right;height: 25px;margin-top: 68px;" id="cos" value="0.00" name="cos">
                                        <p style="padding-top: 55px"><input id="inputColor" type="text" class="form-control required" style="text-align: right;height: 25px" value="<%=nclc%>" id="lcnc"  name="lcnc"></p>
                                        <p style="margin-top: -5px"><input id="inputColor" type="text" class="form-control required" style="border-bottom:  1px solid black;text-align: right;height: 25px" value="<%=papercash%>" id="papercash" name="papercash"></p>
                                        <p style="margin-top: 48px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=paySlip%>" id="paySlip" name="paySlip"></p>
                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=travelExp%>" id="papercash" name="papercash"></p>
                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=rental%>" id="papercash" name="papercash"></p>
                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=labour%>" id="papercash" name="papercash"></p>
                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=repair%>" id="papercash" name="papercash"></p>
                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=payroll%>" id="papercash" name="papercash"></p>
                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=general%>" id="papercash" name="papercash"></p>
                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="text-align: right;height: 25px" value="<%=meals%>" id="papercash" name="papercash"></p>

                                        <p style="margin-top: -9px"><input id="inputColor" type="text" class="form-control " style="border-bottom:  1px solid black;text-align: right;height: 25px" value="<%=commision%>" id="papercash" name="papercash"></p>

                                    </div>
                                    <div class="col-md-3 " style="padding-right: 0px;padding-left: 0px">

                                        <input id="inputColor" type="text" class="form-control required" style="border-top: 1px solid black;font-size: 18px;font-weight: bold;text-align: right;height: 25px;margin-top: 76px" value="<%=revernue%>"  id="revernue" name="revernue">

                                        <input id="inputColor" type="text" class="form-control required" style="border-top: 1px solid black;font-size: 18px;font-weight: bold;text-align: right;height: 25px;margin-top: 68px" value="<%=revernue%>" id="grossProfit" name="grossProfit">
                                        <input id="inputColor" type="text" class="form-control required" style="border-top: 1px solid black;font-size: 18px;font-weight: bold;text-align: right;height: 25px;margin-top: 85px" value="<%=totIncome%>" id="totIncome" name="totIncome">
                                        <input id="inputColor" type="text" class="form-control required" style="border-top: 1px solid black;font-size: 18px;font-weight: bold;text-align: right;height: 25px;margin-top: 256px;" value="<%=totExpenses%>" id="totIncome" name="totIncome">

                                        <input id="inputColor" type="text" class="form-control required" style="border-bottom: 2px solid black;font-size: 18px;font-weight: bold;text-align: right;height: 25px;" value="<%=netProfit%>" id="totIncome" name="totIncome">
                                    </div>


                                </div>

                            </div>

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

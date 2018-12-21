<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.LoanController"%>
<%@page import="BIT.Project.VTAFMS.Model.Loan"%>
<%@page import="BIT.Project.VTAFMS.Controller.AccountController"%>
<%@page import="BIT.Project.VTAFMS.Model.Account"%>
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
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../../dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="../../dist/css/_all-skins.min.css">

        <script src="../../dist/js/jquery-1.8.3.min.js"></script>
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>

        <script>
            $(function () {
                $("#date").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd',
                   // yearRange: "-55:-18"
                });
            });
        </script>



        <script type="text/javascript">

            var Center = [
            ];

            $(document).on("ready", function () {
                loadData();
            });
            var loadData = function () {

                $.ajax({
                    type: 'POST',
                    url: "../../GetCentersinAjax?type=normal"
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;
                    var seantorCity;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        var y;
                        for (y = 0; y < columnTokens.length; y++) {
                        }

                        Center.push({"label": columnTokens[1], "number": columnTokens[0], "agentName": columnTokens[2]});
                    }
                });
            }

            $(document).ready(function () {
                $("#cname").autocomplete({source: Center, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);
                        $("#cnumber").val(ui.item.number);
                        $("#aname").val(ui.item.agentName);


                    }});
            });
        </script>  
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="selectedItem();">

        <%
            String loan_ids = request.getParameter("loan_id");
            Loan loan = (Loan) LoanController.searchLoanById(Integer.parseInt(loan_ids));
            Center center = (Center) CenterController.getAllCenterByID2(loan.getCenter_id());

            List<Agent> listAgent = (List<Agent>) AgentController.getAllAgents();
            List<Expenses> listExpenses = (List<Expenses>) ExpensesController.getAllExpenses();
            List<Account> listAccount = (List<Account>) AccountController.getAllAccounts();
        %>
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

                document.getElementById('cdt').value = y + "-" + m + "-" + d;



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
                        Loan 
                        <small>Update Loan</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewLoan.jsp">View Loans</a></li>
                        <li class="active">Update Loan</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">
                    <div id="ss" class="alert-boxs  response-content " ></div> 
                    <div class="alert alert-box success " >Successfully added record</div>
                    <div class="row">
                        <form  role="form"  action="../../AddLoan" method="POST" >
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Center informations</h3>

                                        <!-- <div  id="cdate" name="cdate" style="float: right;font-size: 16px">ddddd</div>-->
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Center name</label>
                                            <input type="hidden" id="loanid" name="loanid" value="<%=loan_ids%>" >
                                            <input type="text" class="form-control my-colorpicker1 required" id="cname" name="cname" value="<%=center.getCenter_Name()%>" placeholder="Enter center name">
                                            <span id="msgcname"  style="color: #ff0000"></span>
                                        </div>
                                        <div class="form-group">

                                            <label>Center Number</label>
                                            <input type="text" class="form-control my-colorpicker1 required"  id="cnumber" name="cnumber" value="<%=loan.getCenter_id()%>" placeholder="center number" style="background-color: #f0f0f0">

                                        </div>

                                    </div>
                                </div>
                                <div class="box box-default">
                                    <div class="box-header">
                                        <h3 class="box-title">Other informations</h3>

                                        <!-- <div  id="cdate" name="cdate" style="float: right;font-size: 16px">ddddd</div>-->
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Interst rate :  ( % )</label>
                                            <input type="number" class="form-control my-colorpicker1 required" id="rate" value="<%=loan.getLoan_interestRate()%>" name="rate"  placeholder="Enter rate">
                                            <span id="msgcname"  style="color: #ff0000"></span>
                                        </div>


                                        <div class="form-group">
                                            <label>Remark :</label>
                                            <textarea class="form-control required" rows="3" id="remark" id="remark" name="remark"  placeholder="Enter remark"><%=loan.getLoan_remark()%></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Update loan" name="Update"/>
                                    <!-- <button type="submit" name="submit" class="btn btn-info">
                                         <i class="glyphicon glyphicon-save"></i>
                                         Submit</button>-->
                                    <button type="reset" name="reset" class="btn btn-danger">
                                        <i class="glyphicon glyphicon-trash"></i>
                                        Clear</button>
                                </div>
                            </div>
                            <!-- /.col (left) -->
                            <div class="col-md-6">
                                <div class="box box-warning">
                                    <div class="box-header">
                                        <h3 class="box-title">Cash informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Account</label>
                                            <select class="form-control select2 required" style="width: 100%;" id="account" name="account">
                                                <option > --------Please select account---------   </option>
                                                <%
                                                    for (Account model : listAccount) {
                                                        if (model.getAccount_id() == loan.getAccount_id()) {
                                                %>
                                                <option selected="selected" value="<%=model.getAccount_id()%>" ><%=model.getAccount_name()%></option>
                                                <%}
                                                    }%>
                                            </select> 
                                        </div>
                                        <div class="form-group">
                                            <label>Issue date:</label>
                                            <input type="text" class="form-control my-colorpicker1 required" id="date" name="date" value="<%=loan.getLoan_dateRelease()%>" placeholder="yyyy-mm-dd">
                                        </div>
                                        <div class="form-group">
                                            <label>Loan Amount :</label>
                                            <input type="number" class="form-control my-colorpicker1 required" id="amount" name="amount" value="<%=loan.getLoan_amount()%>" placeholder="Enter amount">

                                        </div>
                                        <div class="form-group">
                                            <label>Balance :</label>
                                            <input type="number" class="form-control my-colorpicker1 required" id="balance" name="balance" value="<%=loan.getLoan_balance()%>" placeholder="0.0">
                                        </div>
                                        <div class="form-group">
                                            <label>Shedule daily Payment:</label>
                                            <input type="number" class="form-control my-colorpicker1 required"  id="dpay" name="dpay" value="<%=loan.getLoan_scheduleOfPayment()%>" placeholder="daily payment">

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

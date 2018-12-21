<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.TransactionController"%>
<%@page import="BIT.Project.VTAFMS.Model.Transaction"%>
<%@page import="BIT.Project.VTAFMS.Controller.AccountController"%>
<%@page import="BIT.Project.VTAFMS.Model.Account"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/ExpensesValidate.js" type="text/javascript"></script>
        <script>
            $(function () {
                $("#date").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd',
                    //yearRange: "-55:-18"
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
            String exp_id = request.getParameter("exp_id");

            Transaction transaction = (Transaction) TransactionController.searchTransactionById(exp_id);

            // List<Agent> listAgent = (List<Agent>) AgentController.getAllAgents();
            //List<Expenses> listExpenses = (List<Expenses>) ExpensesController.getAllExpenses();
            List<Account> listAccount = (List<Account>) AccountController.getAllAccounts();
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
                        Expenses 
                        <small>Add Expenses</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewExpenses.jsp">view expenses</a></li>
                        <li class="active">update expenses</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">
                    <div id="ss" class="alert-boxs  response-content " ></div> 
                    <div class="alert alert-box success " >Successfully added record</div>
                    <div class="row">
                        <form  role="form"  action="../../AddExpenses" method="POST" >
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Basic informations</h3>

                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Date</label>
                                            <input type="hidden" id="id" name="id" value="<%=exp_id%>">
                                            <input type="text" class="form-control my-colorpicker1 required" id="date" name="date" value="<%=transaction.getTransaction_date()%>" >
                                        </div>
                                        <div class="form-group">

                                            <label>Payee</label>
                                            <input type="text" class="form-control my-colorpicker1 required"  id="payee" value="<%=transaction.getTransaction_payee()%>" name="payee" placeholder="Enter payee">
                                            <span id="msgpayee"  style="color: #ff0000"></span>
                                        </div>
                                        <div class="form-group">

                                            <label>Amount:</label>

                                            <input type="number" class="form-control my-colorpicker1 required" value="<%=transaction.getTransaction_amount()%>" id="amount" name="amount" placeholder="Enter amount">

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Update Expenses" name="Update"/>
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
                                        <h3 class="box-title">Other informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Account</label>
                                            <select class="form-control select2 required" style="width: 100%;" id="account" name="account">
                                                <option selected value=""> --------Please select account---------   </option>
                                                <%
                                                    for (Account model : listAccount) {
                                                        if (model.getAccount_id() == transaction.getAccount_id()) {
                                                %>
                                                <option selected="selected" value="<%=model.getAccount_id()%>" ><%=model.getAccount_name()%></option>
                                                <%}
                                                    }%>
                                            </select> 
                                        </div>
                                    
                                        <div class="form-group">
                                            <label>Description :</label>
                                            <textarea class="form-control required" rows="3" id="description" name="description" placeholder="Enter description"><%=transaction.getTransaction_type()%></textarea>


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
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
    </body>

</html>

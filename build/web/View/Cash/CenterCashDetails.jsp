<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

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
                <script src="../../plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>

        <script src="../../dist/js/CenterCashValidate.js" type="text/javascript"></script>



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

                        Center.push({"label": columnTokens[1], "number": columnTokens[0], "agentName": columnTokens[2],"agentnumber": columnTokens[3]});
                    }
                });
            }

            $(document).ready(function () {
                $("#cname").autocomplete({source: Center, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);
                        $("#cnumber").val(ui.item.number);
                        $("#aname").val(ui.item.agentName);
                         $("#anumber").val(ui.item.agentnumber);


                    }});
            });
        </script>  
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="selectedItem();">

        <%
            String cash = request.getParameter("res_cash");
            int res_cash = 0;
            if (cash != null) {
                res_cash = Integer.parseInt(cash.toString());
            }

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

                document.getElementById('cdt').value = y + "-" + m + "-" + d;

                var result =<%=res_cash%>
                if (result > 0) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                }

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
                        Cash 
                        <small>Add Cash details</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewCenterCash.jsp">View Center Cash</a></li>
                        <li class="active">Add cash</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">
                    <div id="ss" class="alert-boxs  response-content " ></div> 
                    <div class="alert alert-box success " >Successfully added record</div>
                    <div class="row">
                        <form  role="form"  action="../../AddCenterCash" method="POST" >
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Center informations</h3>

                                        <input type="text"  id="cdt" name="cdt"  style="width: 80px;float: right; font-size: 15px; border-style: hidden;background-color: #ffffff">
                                        <!-- <div  id="cdate" name="cdate" style="float: right;font-size: 16px">ddddd</div>-->
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Center name</label>
                                            <input type="text" class="form-control my-colorpicker1 required" id="cname" name="cname" placeholder="Enter center name">
                                            <span id="msgcname"  style="color: #ff0000"></span>
                                        </div>
                                        <div class="form-group">

                                            <label>Center Number</label>
                                            <input type="text" class="form-control my-colorpicker1 required"  id="cnumber" name="cnumber" placeholder="center number" style="background-color: #f0f0f0">

                                        </div>
                                        <div class="form-group">

                                            <label>Agent name:</label>

                                            <input type="text" class="form-control my-colorpicker1 required" disabled id="aname" name="aname" placeholder="Agent name">

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Add cash" name="Addcash"/>
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
                                            <input type="hidden" id="anumber" name="anumber" >
                                            <label>Account</label>
                                            <select class="form-control select2 required" style="width: 100%;" id="account" name="account">
                                                <option selected value=""> --------Please select account---------   </option>
                                                <%
                                                    for (Account model : listAccount) {
                                                %>
                                                <option value="<%=model.getAccount_id()%>" ><%=model.getAccount_name()%></option>
                                                <%}%>
                                            </select> 
                                        </div>
                                        <div class="form-group">
                                            <label>Full collection :</label>
                                            <input type="number" class="form-control my-colorpicker1 required" id="fc" name="fc" placeholder="Enter full collection">
                                        </div>
                                        <div class="form-group">
                                            <label>Cash :</label>
                                            <input type="number" class="form-control my-colorpicker1 required" id="cash" name="cash" placeholder="Enter cash">

                                        </div>
                                        <div class="form-group">
                                            <label>Past due :</label>
                                            <input type="number" class="form-control my-colorpicker1 required" id="pdue" name="pdue" placeholder="Enter pastdue">
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

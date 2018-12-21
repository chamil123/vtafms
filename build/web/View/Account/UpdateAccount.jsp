<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Model.Account"%>
<%@page import="BIT.Project.VTAFMS.Controller.AccountController"%>
<%@page import="BIT.Project.VTAFMS.Controller.AccountCategoryController"%>
<%@page import="BIT.Project.VTAFMS.Model.AccountCategory"%>
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

        <script src="../../dist/js/jquery-1.8.3.min.js" type="text/javascript"></script>
        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/AccountValiate.js" type="text/javascript"></script>

        <script type="text/javascript">
            function createXMLHttpRequest()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp = new XMLHttpRequest();
                } else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }
        </script>
        <script>
            /*   Date date=new Date();
             SimpleDateFormat df=new SimpleDateFormat("MdYYhms");*/

            function selectedItem(sel) {
                var test = document.getElementById('agent');
                var number = document.getElementById('cnumber');
                var optiont = test.options[test.selectedIndex].text;
                var res = optiont.substring(0, 2);
                var today = new Date();
                var d = today.getDate();
                var m = today.getMonth() + 1;
                var y = today.getFullYear();
                var time = today.getMinutes();
                var sec = today.getSeconds();
                var hour = today.getHours();
                var valllue = sel.toString();

                // alert(valllue+""+m+""+d+""+hour+""+time+""+sec);
                // alert(res+m+""+d+""+hour+""+time+""+sec);
                document.getElementById('cnumber').value = res + m + "" + d + "" + hour + "" + time + "" + sec;
                document.getElementById('cnum').value = m + "" + d + "" + hour + "" + time + "" + sec;
            }
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load()">

        <%
            String account_id = request.getParameter("account_id");

            Account account = (Account) AccountController.getAccountById(account_id);
            AccountCategory acat=null;
            List<AccountCategory> listaccountCat = (List<AccountCategory>) AccountCategoryController.getAllAccountsCategory();

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
                        Center registration
                        <small>Add center</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewAccounts.jsp">view accounts</a></li>
                        <li class="active">Update accounts</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">

                    <div class="row">
                        <form  role="form"  action="../../AddAccount" method="POST" >
                            <div id="ss" class="alert-boxs  response-content " style="margin: 0px 15px 10px 15px"></div> 
                            <div class="alert alert-box success " style="margin: 0px 15px 10px 15px">Warning Alert !!!</div>
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Account category informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Acount type:</label>
                                            <input type="hidden" value="<%=account_id%>" id="id" name="id">
                                            <select class="form-control select2 required" onchange="maneFunction();" style="width: 100%;" id="accountcat" name="accountcat">
                                                <option selected value=""> --------Please select State---------   </option>
                                                <%

                                                    for (AccountCategory model : listaccountCat) {
                                                        if (model.getAccount_category_id() == account.getAccount_category_id()) {
                                                            acat = (AccountCategory) AccountCategoryController.searchAccountCategoryById(account.getAccount_category_id());

                                                %>
                                                <option selected="selected" value="<%=model.getAccount_category_id()%>" ><%=model.getAccount_category_name()%></option>
                                                <%}
                                                    }
                                                %>
                                            </select>

                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Account Category Number</label>

                                                <input type="text"  class="form-control my-colorpicker1" readonly id="acatnum" value="<%=acat.getAccount_category_id()%>" name="acatnum" placeholder="Enter last name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Description:</label>
                                                <textarea class="form-control" readonly rows="5" id="catdes"  name="catdes" placeholder="Enter Address"><%=acat.getAccount_category_description()%></textarea>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Update Account" name="Update"/>
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
                                        <h3 class="box-title">Account informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Account name:</label>
                                                <input type="tel" class="form-control my-colorpicker1 required" value="<%=account.getAccount_name()%>" id="acname" name="acname" placeholder="Enter mobile number">
                                                <span id="msgacname" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Start balance:</label>
                                                <input type="text" class="form-control my-colorpicker1 required" value="<%=account.getAccount_correntBalance()%>" id="stbalnce" name="stbalnce"  placeholder="Enter home  number">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea class="form-control required" rows="4" id="des" name="des" placeholder="Enter Description"><%=account.getAccount_description()%></textarea>
                                            </div>
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
        <script>
            function maneFunction() {
                this.alertFunction();

            }
            function alertFunction() {
                var eacatID = document.getElementById("accountcat");
                var acatVal = eacatID.options[eacatID.selectedIndex].value;
                var request = createXMLHttpRequest();
                var url = "../../GetAllAccountCategory";
                request.open("GET", url + "?acatVal=" + acatVal, true);
                request.send();
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            var data = request.responseText;
                            var rowTokens = data.split("!");
                            var x;
                            for (x = 0; x < rowTokens.length - 1; x++) {
                                var columnTokens = rowTokens[x].split(":");
                            }
                            document.getElementById("acatnum").value = columnTokens[0];
                            document.getElementById("catdes").value = columnTokens[2];
                        }
                    }
                }
            }


        </script>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

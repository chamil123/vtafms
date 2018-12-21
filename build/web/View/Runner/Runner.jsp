<%-- 
    Document   : Runner
    Created on : Oct 29, 2016, 6:46:05 PM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.ExpensesController"%>
<%@page import="BIT.Project.VTAFMS.Model.Expenses"%>
<%@page import="BIT.Project.VTAFMS.Controller.AgentController"%>
<%@page import="BIT.Project.VTAFMS.Model.Agent"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vikum Turf Account | Dashboard</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../../dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="../../dist/css/_all-skins.min.css">

        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../../dist/js/RunnerValidate.js" type="text/javascript"></script>


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
    <body class="hold-transition skin-blue sidebar-mini" onload="load();">

        <%

            String runner = request.getParameter("runnerResult");
            // Object runners=request.getAttribute("runnerResult");
            int res_runner = 0;
            if (runner != null) {
                res_runner = Integer.parseInt(runner.toString());
            }
            List<Agent> listAgent = (List<Agent>) AgentController.getAllAgents();
            List<Expenses> listExpenses = (List<Expenses>) ExpensesController.getAllExpenses();

        %>
        <script>

            function load() {
                var result =<%=res_runner%>
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
                        <!-- Sidebar toggle button-->

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
                        Runner registration
                        <small>Add Runner</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="ViewRunners.jsp">View Runner</a></li>
                        <li class="active">New Runner</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">

                    <div class="row">
                        <form  role="form"  action="../../AddRunner" method="POST" >
                            <div id="ss" class="alert-boxs  response-content " style="margin: 0px 15px 10px 15px"></div> 
                            <div class="alert alert-box success " style="margin: 0px 15px 10px 15px">Warning Alert !!!</div>
                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Basic informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>First name</label>
                                            <input type="text" class="form-control my-colorpicker1 required" id="fname" name="fname" placeholder="Enter first name">
                                            <span id="msgfname" style="color: #ff0000"></span>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Last Number</label>

                                                <input type="text" class="form-control my-colorpicker1 required" id="lname" name="lname" placeholder="Enter last name">
                                                <span id="msglname" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Nic number:</label>

                                                <input type="text" class="form-control my-colorpicker1 required" id="nic" name="nic" placeholder="Enter NIC number">
                                                <span id="msgnic" style="color: #ff0000"></span>
                                            </div>
                                        </div>






                                    </div>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Add Runner" name="Add"/>
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
                                        <h3 class="box-title">Contact informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Mobile number:</label>
                                                <input type="tel" class="form-control my-colorpicker1 required" id="pnumber" name="pnumber" placeholder="Enter mobile number">
                                                <span id="msgpnumber" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Home number:</label>
                                                <input type="tel" class="form-control my-colorpicker1 required" id="hnumber" name="hnumber" placeholder="Enter home  number">
                                                <span id="msghnumber" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Email address :</label>
                                                <input type="text" class="form-control my-colorpicker1 required" id="email" name="email" placeholder="Enter email address">
                                                <span id="msgemail" style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Address:</label>
                                                <textarea class="form-control required" rows="4" id="address" name="address" placeholder="Enter Address"></textarea>
                                                <span id="msgaddress" style="color: #ff0000"></span>
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
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>


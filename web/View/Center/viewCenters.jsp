<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="java.text.DecimalFormat"%>
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

        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>

        <style>
            .effect{
                -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
                box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.28);
            }
        </style>
        <script>
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
            function alertFunction(center_num) {

                var aname, cnumber, cname, email, status, image, phonenumber, gender, dob, nic, address, uname, rolename;

                var request = createXMLHttpRequest();
                var url = "../../viewCenter";
                request.open("GET", url + "?dayVal=" + center_num, true);
                request.send();

                request.onreadystatechange = function () {
                     
                    if (request.readyState == 4) {
                        if (request.status == 200) {

                            var data = request.responseText;
                          alert(data);
                            var rowTokens = data.split("!");
                            var x;
                            var outputData;
                            for (x = 0; x < rowTokens.length - 1; x++) {
                                var columnTokens = rowTokens[x].split(":");
                                var y;
                                for (y = 0; y < columnTokens.length; y++) {
                                }

                                aname = columnTokens[0];
                                cnumber = columnTokens[1];
                                cname = columnTokens[2];
                                email = columnTokens[3];
                                status = columnTokens[4];
                                phonenumber = columnTokens[6];
                                gender = columnTokens[7];
                                dob = columnTokens[8];
                                nic = columnTokens[9];
                                address = columnTokens[10];
                                rolename = columnTokens[11];
                                uname = columnTokens[12];
                               // alert(id + "" + fname + "" + lname + "" + email + "" + status);
                                outputData = ' <img style="max-width:223px;" src="' + "uploads/" + columnTokens[5].trim() + '">';
                                //CiviliansDetails.item.push({"Id": columnTokens[0], "FirstName": columnTokens[1], "LastName": columnTokens[2], "Nationality": columnTokens[3], "Mobile": columnTokens[4], "Ethnicity": columnTokens[5], "e_mail": columnTokens[6], "city": columnTokens[7], "Profession": columnTokens[9]});
                            }
                            document.getElementById('aname').innerHTML = aname;
                            document.getElementById('cnumber').innerHTML = cnumber;
                            document.getElementById('cname').innerHTML = cname;
                            document.getElementById('firstname').innerHTML = fname;
                            document.getElementById('lastname').innerHTML = lname;
                            document.getElementById('gender').innerHTML = gender;
                            document.getElementById('dateofbirth').innerHTML = dob;
                            document.getElementById('nic').innerHTML = nic;
                            document.getElementById('email').innerHTML = email;
                            document.getElementById('phone').innerHTML = phonenumber;
                            document.getElementById('Address').innerHTML = address;
                            document.getElementById('Address2').innerHTML = address;
                            document.getElementById('uname').innerHTML = uname;
                            document.getElementById('id').innerHTML = id;
                            document.getElementById('image').innerHTML = outputData;
                            document.getElementById('role').innerHTML = rolename;
                        }
                    }

                }
            }
            function getUserIdForDelete(user_id) {

                document.getElementById('iddelete').value = user_id;

            }
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load()">

        <%
            String name = request.getParameter("name");
            String pagenum = request.getParameter("page1");
            int page1 = 0;
            if (request.getParameter("page") != null) {
                int pages = Integer.parseInt(request.getParameter("page"));
                page1 = 0;
                if (pages == 0 || pages == 1) {
                    page1 = 0;
                } else {
                    page1 = (pages * 10) - 10;
                }
            }
            double rowCount = CenterController.getRowCount();
            int row = (int) rowCount;
            double nopage = rowCount / 10;
            DecimalFormat f = new DecimalFormat("##.0");
            String formatval = f.format(nopage).toString();

            int before = formatval.indexOf(".");
            int after = formatval.length();
            String sub = formatval.substring(before, after);

            if (!sub.equals("null")) {
                double subst = Double.parseDouble(sub);
                if (subst > 0) {
                    nopage++;
                }
            }

            List<Center> listUser = (List<Center>) CenterController.limitresult("" + page1);

            String centerRes = request.getParameter("res_center");
            int res_center = 0;

            if (centerRes != null) {
                res_center = Integer.parseInt(centerRes.toString());
            }
            //List<Role> listRole = (List<Role>) RoleController.getAllRoles();
            // List<Center> listCenter = (List<Center>) CenterController.getAllCenters();
%>
        <script>
            function load() {
                var result =<%=res_center%>
                if (result == 1) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                } else if (result == 2) {
                    $('.failure').fadeIn(1500).delay(1500).fadeOut(400);
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

                       
                    </nav>
                </header>
            </div>
            <%@include file="../../includes/navbar.jspf" %>  
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Center 
                        <small>View centers</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">View Centers</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="alert alert-box success " >record is successfully updated </div>
                    <div class="alert alert-box failure " >record is successfully Deleted </div>
                    <div class="box box-default">
                        <div class="col-md-12" style="height: 45px;padding-top: 8px">

                            <form  class="form-inline" role="form"  action="" method="POST" >

                                <div class="form-group">
                                    <a href="center.jsp" style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px;margin-left: -5px" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; New Center</a>


                                </div>
                                <div class="form-group">


                                </div>

                                <div class="form-group" style="float: right">
                                    <input style="height: 25px" type="hidden" class="form-control" name="page" id="page" value="" >
                                    <input style="height: 25px" type="text" class="form-control" name="search" id="search"  placeholder="Enter Center name">
                                    <button type="submit" class="btn btn-github"  style="height: 28px;padding: 5px 10px 8px 10px;font-size: 12px" value="search Expenses" name="Add"><i class="glyphicon glyphicon-search" ></i>&nbsp;Search summery</button>

                                </div>

                            </form>
                        </div>
                        <table class="table table-striped" width="70%">

                            <tr >
                                <th>&nbsp;id&nbsp;</th>
                                <th>Center name&nbsp;</th>
                                <th>Acount type&nbsp;</th>
                                <th>Mobile&nbsp;</th>
                                <th>Office Number&nbsp;</th>
                                <th>Commision &nbsp;</th>
                                <th>Paper cash&nbsp;</th>
                                <th>No commision&nbsp;</th>

                                <th style="float: right;padding-right: 15px">Actions&nbsp;</th>
                            </tr>
                            <%
                                for (Center modelCenter : listUser) {
                            %>
                            <tr>
                                <td>&nbsp;<%=modelCenter.getCenter_id()%></td>
                                <td>&nbsp;<%=modelCenter.getCenter_Name()%></td>
                                <td><%=modelCenter.getCenter_accountType()%></td>
                                <td><%=modelCenter.getCenter_mobile()%></td>
                                <td><%=modelCenter.getCenter_officenumber()%></td>
                                <td><%=modelCenter.getCenter_com()%></td>
                                <td><%=modelCenter.getCenter_papercash()%></td>

                                <td><%=modelCenter.getCenter_lc()%></td>
                                <td style="float: right;padding-right: 15px"> 

                                    <button type="submit" class="btn btn-default btn-sm "  >

                                        <a href="" onclick="alertFunction(<%=modelCenter.getCenter_number()%>);" style="color: black"  data-toggle="modal" data-target="#myModal">
                                            <i class="glyphicon glyphicon-file"></i>
                                        </a>

                                    </button>
                                    <button type="submit" class="btn btn-warning btn-sm ">
                                        <a href="../../UpdateUser.jsp?center_id=<%=modelCenter.getCenter_id()%>&action=update"  style="color: white">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                    </button>
                                    <button type="submit" class="btn btn-danger btn-sm ">
                                        <a href="#" onclick="getUserIdForDelete(<%=modelCenter.getCenter_id()%>);" style="color: white" data-toggle="modal" data-target="#deleteModal">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </button>
                                    <%if (modelCenter.getCenter_status().equals("Activate")) {%>

                                    <a href="../../CenterActivation?center_id=<%=modelCenter.getCenter_number()%>&action=deactivate"style="color: white">

                                        <button type="button"style="width: 75px" class="btn btn-github btn-sm" onclick="return confirmMsg('Active')">
                                            Deactivate
                                        </button> 
                                    </a>
                                    <%  } else {%>
                                    <a href="../../CenterActivation?center_id=<%=modelCenter.getCenter_number()%>&action=activate"style="color: black">

                                        <button type="button" style="width: 75px" class="btn btn-group btn-sm" onclick="return confirmMsg('Active')">
                                            Activate
                                        </button> 
                                    </a>       
                                    <%}%>

                                </td>
                            </tr>


                            <%}%>
                        </table>  
                        <div class="pagination " style="width: 100%">
                            <% int i = 0;%>
                            <a href="viewCenters.jsp?page=<%=i%>" class="page active">first</a>
                            <% for (i = 1; i <= nopage; i++) {%>

                            <a href="viewCenters.jsp?page=<%=i%>" class="page">
                                <%=i%>
                            </a>
                            <% }%>
                            <a href="viewCenters.jsp?page=<%=i - 1%>" class="page active">last</a>
                            <div style="float: right;font-size: 12px;color: #666666;padding-right: 15px">Showing 1 to 8 of <spam ><%=row%></spam> entries</div>
                        </div>
                    </div>
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog" >
                <div class=" modal-dialog " style="width:50%;margin-top: 100px;background-color: #f0f0f0;border-radius: 50px">

                    <!-- Modal content-->

                    <div class="modal-content" style="background-color: #ECF0F5">

                        <div class="modal-header" style="padding: 8px 8px 8px 20px">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Center informations  <span style="font-size: 15px;color: #0000cc">&nbsp;&nbsp;&nbsp;&nbsp;  </h4>
                        </div>
                        <div class="modal-body" style="margin: 0px 15px 0px 15px">
                            
                            <!-- /.col (left) -->
                            <div class="col-md-12"style="background-color: #ffffff;height: 395px;;float: right;margin-right: -5px;">

                                <div class="panel panel-default" style="margin-left: -15px;margin-right: -15px">
                                    <div class = "panel-heading" style="background-color: #009688;border-radius: 0px;color: #ffffff;padding: 8px 8px 8px 8px">
                                        <h3 class = "panel-title">
                                            Generel Informations
                                        </h3>
                                    </div>
                                    <div class = "panel-body">
                                        <table >              
                                            <tr ><td style="width: 190px;"><span>Agent name :</span></td>
                                                <td><span id="aname"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Last name :</span></td>
                                                <td><span id="cnumber"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Gender :</span></td>
                                                <td><span id="cname"></span></td>
                                            </tr>
                                        
                                        </table> 
                                    </div>
                                    <div class = "panel-heading" style="background-color: #009688;color: #ffffff;border-radius: 0px;padding: 8px 8px 8px 8px">
                                        <h3 class = "panel-title">
                                            Contact Informations
                                        </h3>
                                    </div>
                                    <div class = "panel-body">
                                        <table >              
                                            <tr ><td style="width: 190px;"><span>E mail address :</span></td><td><span id="email"></span></td></tr>
                                            <tr><td style="width: 190px"><span>Phone number :</span></td><td><span id="phone"></span></td></tr>
                                            <tr><td style="width: 190px"><span>Address :</span></td><td><span id="Address2"></span></td></tr>

                                        </table> 
                                    </div>
                                    <div class = "panel-heading" style="background-color: #009688;color: #ffffff;border-radius: 0px;padding: 8px 8px 8px 8px">
                                        <h3 class = "panel-title">
                                            Other Informations
                                        </h3>
                                    </div>
                                    <div class = "panel-body">
                                        <table >              
                                            <tr ><td style="width: 190px;"><span>User ID numer :</span></td><td><span id="id"></span></td></tr>
                                            <tr><td style="width: 190px"><span>User name :</span></td><td><span id="uname"></span></td></tr>

                                        </table> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div></div>
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
                            <h4 class="modal-title">Confirm a user deletion</h4>
                        </div>
                        <form action="ss?action=delete" method="POST">


                            <div class="modal-body">
                                <spam >This will delete this user <b>permanently</b></spam><br/>
                                <spam>Are you sure want to permanently delete the selected item ?</spam>
                                <!-- <spam>Please click the <b>Delete button</b> only ones, it will takes few moments for the <br/>deletion process to complete</spam>-->
                            </div>
                            <div class="modal-footer" style="height: 48px;padding: 7px 7px 7px 17px;">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                <input type="hidden" class="form-control" id="iddelete"  name="user_id" >
                                <input  type="submit" class="btn btn-danger" value="Delete user" name="delete" />


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

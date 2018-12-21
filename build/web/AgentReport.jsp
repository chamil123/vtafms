<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="dist/css/VikumTA.min.css">
        <link rel="stylesheet" href="dist/css/_all-skins.min.css">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
                }
                else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }
            function alertFunction(user_id) {
                var id, fname, lname, email, status, image, phonenumber, gender, dob, nic, address, uname, rolename;

                var request = createXMLHttpRequest();
                var url = "a";
                request.open("GET", url + "?dayVal=" + user_id, true);
                request.send();
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            var data = request.responseText;
                            var rowTokens = data.split("!");
                            var x;
                            var outputData;
                            for (x = 0; x < rowTokens.length - 1; x++) {
                                var columnTokens = rowTokens[x].split(":");
                                var y;
                                for (y = 0; y < columnTokens.length; y++) {
                                }
                                id = columnTokens[0];
                                fname = columnTokens[1];
                                lname = columnTokens[2];
                                email = columnTokens[3];
                                status = columnTokens[4];
                                phonenumber = columnTokens[6];
                                gender = columnTokens[7];
                                dob = columnTokens[8];
                                nic = columnTokens[9];
                                address = columnTokens[10];
                                rolename = columnTokens[11];
                                uname = columnTokens[12];
                                outputData = ' <img style="max-width:223px;" src="' + "uploads/" + columnTokens[5].trim() + '">';
                                //CiviliansDetails.item.push({"Id": columnTokens[0], "FirstName": columnTokens[1], "LastName": columnTokens[2], "Nationality": columnTokens[3], "Mobile": columnTokens[4], "Ethnicity": columnTokens[5], "e_mail": columnTokens[6], "city": columnTokens[7], "Profession": columnTokens[9]});
                            }
                            document.getElementById('fname').innerHTML = fname;
                            document.getElementById('fname1').innerHTML = fname;
                            document.getElementById('lname').innerHTML = lname;
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
    <body class="hold-transition skin-blue sidebar-mini">

        <%
            //List<Role> listRole = (List<Role>) RoleController.getAllRoles();
            List<User> listUser = (List<User>) UserController.getAllUsers();
        %>

        <div class="wrapper">
          <div style="height: 50px" >
                <header class="main-header effect" >
                    <a href="index2.html" class="logo" > 
                        <span class="logo-mini"><b>A</b>LT</span>
                        <span class="logo-lg"><b>Vikum</b> TURF </span>
                    </a>
                    <nav class="navbar navbar-static-top " role="navigation"  >
                        <a href="#" class="sidebar-toggle hidden" data-toggle="offcanvas" role="button" >
                            <span class="glyphicon glyphicon-menu-hamburger"></span>
                        </a>
                        <div class="navbar-custom-menu">
                            <ul class="nav navbar-nav">
                                <li class="dropdown user user-menu">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <img src="" class="user-image" alt="User Image">
                                        <span class="hidden-xs">Alexander Pierce</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li class="user-header">
                                            <img src="" class="img-circle" alt="User Image">
                                            <p>
                                                Chamil pathirana - Web Developer
                                                <small>Member since Nov. 2016</small>
                                            </p>
                                        </li>
                                        <li class="user-footer">
                                            <div class="pull-left">
                                                <a href="#" class="btn btn-default btn-flat">Profile</a>
                                            </div>
                                            <div class="pull-right">
                                                <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
            </div>
            <%@include file="includes/navbar.jspf" %>  
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        User registration
                        <small>Add user</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Forms</a></li>
                        <li class="active">Advanced Elements</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="box box-default">
                    <div class="container">
  
  <form class="form-inline">
      <div class="form-group">
      <label for="date">Report date :</label>
      <select class="form-control select2">
          <option selected value="default">--Select an option--</option>
      </select>
    </div>
    <div class="form-group">
      <label for="date">From :</label>
      <input type="date" class="form-control" id="email" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">To :</label>
      <input type="date" class="form-control" id="pwd" placeholder="Enter password">
    </div>
    
    <button type="submit" class="btn btn-warning">Run report</button>
  </form>
</div>
                        
                        

                    </div>
                </section>
            </div>
            <%@include file="includes/footer.jspf" %>  
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog" >
                <div class=" modal-dialog " style="width:70%;margin-top: 100px;background-color: #f0f0f0;border-radius: 50px">

                    <!-- Modal content-->

                    <div class="modal-content" style="background-color: #ECF0F5">

                        <div class="modal-header" style="padding: 8px 8px 8px 20px">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">User informations  <span style="font-size: 15px;color: #0000cc">&nbsp;&nbsp;&nbsp;&nbsp; Hello </span><spam style="font-size: 13px;color: #0000cc" id="fname1" ></spam></h4>
                        </div>
                        <div class="modal-body" style="margin: 0px 15px 0px 15px">
                            <div class="col-md-3" style="background-color: #ffffff;height: 395px;float: left;margin-left: -5px" >
                                <div id="image" style="margin-left: -15px"> </div>
                                <table>
                                    <tr><td><h4 id="fname" style="float: left"></h4></td><td><h5 id="lname" ></h5></td></tr>
                                    <tr><td><h5 style="font-weight: bold" id="role"></h5></td></tr>
                                </table>
                                <div id="Address"></div>
                            </div>
                            <!-- /.col (left) -->
                            <div class="col-md-9"style="background-color: #ffffff;height: 395px;;float: right;margin-right: -5px;">

                                <div class="panel panel-default" style="margin-left: -15px;margin-right: -15px">
                                    <div class = "panel-heading" style="background-color: #009688;border-radius: 0px;color: #ffffff;padding: 8px 8px 8px 8px">
                                        <h3 class = "panel-title">
                                            Generel Informations
                                        </h3>
                                    </div>
                                    <div class = "panel-body">
                                        <table >              
                                            <tr ><td style="width: 190px;"><span>First name :</span></td>
                                                <td><span id="firstname"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Last name :</span></td>
                                                <td><span id="lastname"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Gender :</span></td>
                                                <td><span id="gender"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>Date of birth :</span></td>
                                                <td><span id="dateofbirth"></span></td>
                                            </tr>
                                            <tr ><td style="width: 190px"><span>NIC number :</span></td>
                                                <td><span id="nic"></span></td>
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
                            <div>...</div>
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
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="dist/js/app.min.js"></script>
    </body>

</html>

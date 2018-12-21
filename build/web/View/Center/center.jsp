<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

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

        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/jquery-1.8.3.min.js"></script>

        <script src="../../dist/js/CenterValidate.js" type="text/javascript"></script>
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>

        <script>
            $(function () {
                $("#dob").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd',
                    yearRange: "-55:-18"
                });
            });
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
        <script type="text/javascript">

            var Account = [
            ];

            $(document).on("ready", function () {
                loadData();
            });
            var loadData = function () {
                $.ajax({
                    type: 'POST',
                    url: "../../GetAccountsinAjax"
                }).done(function (data) {
                    var rowTokens = data.split("!");
                    var x;
                    var seantorCity;
                    for (x = 0; x < rowTokens.length - 1; x++) {
                        var columnTokens = rowTokens[x].split(":");
                        var y;
                        for (y = 0; y < columnTokens.length; y++) {
                        }

                        Account.push({"label": columnTokens[1], "number": columnTokens[0], "acbalance": columnTokens[2], "accatid": columnTokens[3], "acdes": columnTokens[4]});

                    }
                });
            }

            $(document).ready(function () {
                $("#expname").autocomplete({source: Account, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);
                        $("#rmk").val(ui.item.acdes);
                    }});
            });



        </script> 
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="load();">

        <%
            String center = request.getParameter("res_center");
            int res_cemter = 0;
            if (center != null) {
                res_cemter = Integer.parseInt(center.toString());
            }

            List<Agent> listAgent = (List<Agent>) AgentController.getAllAgents();
            List<Expenses> listExpenses = (List<Expenses>) ExpensesController.getAllExpenses();
        %>
        <script>
            function load() {
                var result =<%=res_cemter%>
                if (result > 0) {
                    $('.success').fadeIn(1500).delay(1500).fadeOut(400);

                }

            }
        </script>
        <script>

            function addRow(tableID) {
                addTable(tableID);
                getTotal(tableID);
            }
            function addTable(tableID) {

                var expname = document.getElementById('expname').value;

                var amount = document.getElementById('amount').value;

                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
                document.getElementById("rowcount").value = rowCount;
                var row = table.insertRow(rowCount);
                var cell1 = row.insertCell(0);
                var element1 = document.createElement("input");
                element1.type = "checkbox";
                element1.name = "chkbox[]";
                cell1.appendChild(element1);

                var counts = rowCount - 1;
                var cell2 = row.insertCell(1);
                var expensesname = document.createElement("input");
                expensesname.type = "text";
                if (rowCount % 2 == 1) {
                    expensesname.style = "border-style: hidden;background-color : #EEEEEE;width:230px";
                } else {
                    expensesname.style = "border-style: hidden;width:230px";
                }
                expensesname.name = "expensesname[" + counts + "]";
                expensesname.id = "expensesname[" + counts + "]";
                expensesname.value = expname;
                //document.getElementById("rowcount").value = count-1;
                cell2.appendChild(expensesname);



                var cell3 = row.insertCell(2);
                var value = document.createElement("input");
                value.type = "text";

                if (rowCount % 2 == 1) {
                    value.style = "border-style: hidden;background-color : #EEEEEE; width:20px;";
                } else {
                    value.style = "border-style: hidden;width:20px;";
                }
                value.style = "border-style: hidden;text-align:right;";
                value.name = "value[" + counts + "]";
                value.id = "value[" + (counts - 1) + "]";
                value.value = amount;
                cell3.appendChild(value);



                var cell4 = row.insertCell(3);
                var btn = document.createElement("a");
                //btn.type = "button";
                btn.setAttribute("class", "glyphicon glyphicon-trash");
                btn.atribute = "<a href='#' style='color:red' style='float : right'  onClick='Javacsript:deleteRow(this)' >  <i class='glyphicon glyphicon-trash'></i></a> "
                btn.onclick = function () {
                    var table = document.getElementById('addressesTable');
                    var rowCount = table.rows.length;
                    if (rowCount % 2 == 1) {
                        btn.style = "border-style: hidden;background-color : #EEEEEE";
                    } else {
                        btn.style = "border-style: hidden";
                    }
                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null != chkbox && true == chkbox.checked) {
                            table.deleteRow(i);
                            rowCount--;
                            i--;
                        }
                    }

                };
                btn.name = "button[" + counts + "]";
                cell4.appendChild(btn);
            }


            function getTotal(tableID) {
                var total = 0;
                var j;
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
                for (var i = 2; i < rowCount; i++) {
                    j = document.getElementById("addressesTable").rows[i].cells[2].getElementsByTagName("input")[0].value;
                    if (j == "") {
                        k = 0;
                    } else {
                        var k = parseInt(j);
                    }

                    total = total + k;
                    document.getElementById('tot').value = total;
                }
            }
            function deleteRow(addressesTable) {
                try {
                    var table = document.getElementById(addressesTable);
                    var rowCount = table.rows.length;

                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null != chkbox && true == chkbox.checked) {
                            table.deleteRow(i);
                            rowCount--;
                            i--;
                        }
                    }
                } catch (e) {
                    alert(e);
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
                        Center registration
                        <small>Add center</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewCenters.jsp">View center</a></li>
                        <li class="active">Add center</li>
                    </ol>
                </section>

                <!-- Main content -->

                <section class="content">

                    <div class="row">
                        <form  role="form"  action="../../AddCenter" method="POST" >
                            <div id="ss" class="alert-boxs  response-content " style="margin: 0px 15px 10px 15px"></div> 
                            <div class="alert alert-box success " style="margin: 0px 15px 10px 15px">Successfully added record</div>
                            <div class="col-md-6">

                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Basic informations</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Agent name</label>
                                            <select class="form-control select2 required" onchange="selectedItem(this)" style="width: 100%;" id="agent" name="agent">
                                                <option  value=""> --------Please select State---------   </option>
                                                <%
                                                    for (Agent model : listAgent) {
                                                %>
                                                <option value="<%=model.getAgent_id()%>"  ><%=model.getAgent_name()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group">

                                            <label>Center Number</label>
                                            <input type="hidden" class="form-control my-colorpicker1" id="cnum" name="cnum" placeholder="Enter center name">
                                            <input type="text" class="form-control my-colorpicker1 required" id="cnumber" name="cnumber" placeholder="Enter center name">

                                        </div>
                                        <div class="form-group">

                                            <label>Center name:</label>

                                            <input type="text" class="form-control my-colorpicker1 required" id="cname" name="cname" placeholder="Enter center name">

                                        </div>

                                    </div>
                                </div>
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title">Other information</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">

                                            <label>Acount type:</label>
                                            <select class="form-control select2 required" style="width: 100%;" id="type" name="type">
                                                <option value="">----Please select a status-----</option>
                                                <option>General</option>
                                                <option>Normal</option>
                                            </select>

                                        </div>


                                        <div class="form-group">

                                            <label>Paper cash  :</label>
                                            <input type="number" class="form-control my-colorpicker1 required" id="pcash" name="pcash" placeholder="Enter papercash">

                                        </div>

                                    </div>
                                </div>


                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title">Expenses information</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="col-md-12" style="padding-left: 0px;padding-right: 0px">
                                            <div class="col-md-7"style="padding-left: 0px;padding-right: 0px">
                                                <div class="form-group">
                                                    <label style="">Expenses name :</label>
                                                    <input type="text" id="expname" id="expname" name="expname" class="form-control "  placeholder="Expenses name">
                                                </div>
                                            </div>

                                            <div class="col-md-2"style="padding-left: 0px;padding-right: 0px;">
                                                <div class="form-group">
                                                    <label style="">Amount :</label>
                                                    <input type="text" id="amount" name="amount" class="form-control "  placeholder="amount">
                                                </div>
                                            </div>
                                            <div class="col-md-2" style="margin-left: -15px">
                                                <div class="form-group">
                                                    <label >.</label>
                                                    <button type="button" name="button[0]"   id="add" value="Add" onclick="addRow('addressesTable')" style="border-radius: 0px 4px 4px 0px"  class="btn btn-success">
                                                        <i class="glyphicon glyphicon-plus-sign"></i>
                                                        Add expense</button>
                                                </div>
                                            </div>
                                            <table id="addressesTable"  class="table table-style-three"   width='100%' style="margin-bottom: 0px">
                                                <tr>
                                                    <th>Select</th>
                                                    <th>Name</th>
                                                    <th>Amount </th>
                                                    <th>action</th>
                                                </tr>
                                                <tr hidden>
                                                    <td><input type="checkbox" name="chk"/></td>
                                                <input type="hidden"  id="rowcount" name="rowcount" />
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="houseNum[0]" /></td>
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="city[0]" /></td>
                                                <td><input type="text" style="border-style: hidden;background-color: #EEEEEE"  name="country[0]"   /></td>
                                                <td> <a name="button[0]"  href='#' style='color:red' style='float : right'  onClick="deleteRow('addressesTable')" >  <i class='glyphicon glyphicon-trash'></i></a> </td>
                                                </tr>
                                            </table >

                                            <div style="float: right;padding-top: 0px;" >Total<input readonly style=";width: 170px;text-align: right;margin-right: 50px;font-size: 20px;border-bottom: 2px solid;border-top: 1px solid;border-left: hidden;border-right: hidden" value="0.0" type="text" id="tot" name="tot"/></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="AddCenter" name="Add"/>
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
                                                <span id="msgpnumber"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Office number:</label>
                                                <input type="tel" class="form-control my-colorpicker1 required" id="onumber" name="onumber" placeholder="Enter Office number">
                                                <span id="msgonumber"  style="color: #ff0000"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Address:</label>
                                                <textarea class="form-control required" rows="4" id="address" id="address" name="address" placeholder="Enter Address"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Comissions</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Commision  :</label>
                                                <input type="number" class="form-control my-colorpicker1 required" id="comision" name="comision" placeholder="Enter comission">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Not run Commision  :</label>
                                                <input type="number" class="form-control my-colorpicker1 required" id="nocomision" name="nocomision" placeholder="Enter no comission">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Less Commision  :</label>
                                                <input type="number" class="form-control my-colorpicker1 required" id="lcomision" name="lcomision" placeholder="Enter less comission">
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

            <!-- Modal expencess -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end Modal expencess -->       


        </div>

        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>
    </body>

</html>

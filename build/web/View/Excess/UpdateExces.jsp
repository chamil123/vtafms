<%-- 
    Document   : index
    Created on : Jun 25, 2016, 12:14:39 AM
    Author     : Chamil
--%>

<%@page import="BIT.Project.VTAFMS.Controller.ExcessLineController"%>
<%@page import="BIT.Project.VTAFMS.Model.ExcessLine"%>
<%@page import="BIT.Project.VTAFMS.Model.Center"%>
<%@page import="BIT.Project.VTAFMS.Controller.CenterController"%>
<%@page import="BIT.Project.VTAFMS.Controller.ExcessController"%>
<%@page import="BIT.Project.VTAFMS.Model.Excess"%>
<%@page import="BIT.Project.VTAFMS.Controller.ExpensesCategoryController"%>
<%@page import="BIT.Project.VTAFMS.Model.ExpensesCategory"%>
<%@page import="java.util.List"%>
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

        <script src="../../dist/js/jquery-1.8.3.min.js"></script>
        <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <link href="../../dist/js/datePicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../../dist/js/datePicker/jquery-ui.js"></script>

        <link href="../../dist/css/Style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">

            var Customer = [
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

                        Customer.push({"label": columnTokens[1], "number": columnTokens[0]});
                    }
                });
            }
            var currency = [
            ];
            $(document).ready(function () {
                $("#cname").autocomplete({source: Customer, select: function (event, ui) {
                        event.preventDefault();
                        $(this).val(ui.item.label);
                        $("#cnumber").val(ui.item.number);
                    }});
            });
        </script> 
        <script>
            var increment = 0;
            var rowCount;
            function addRow(tableID) {
                var chtnumber = document.getElementById('chtnumber').value;
                var rcount = document.getElementById('rcount').value;
                var tpayment = document.getElementById('tpayment').value;
                var dpayment = document.getElementById('dpayment').value;
                var resons = document.getElementById('resons').value;
                var lineid = document.getElementById('lineid').value;

                var table = document.getElementById(tableID);
                rowCount = table.rows.length;
                document.getElementById("rowcount").value = rowCount;
                var row = table.insertRow(rowCount);
                var cell1 = row.insertCell(0);
                var element1 = document.createElement("input");
                element1.type = "checkbox";
                element1.name = "chkbox[]";
                cell1.appendChild(element1);

                var counts = rowCount - 1;
                var cell2 = row.insertCell(1);
                var chitNumber = document.createElement("input");
                chitNumber.type = "text";
                if (rowCount % 2 == 1) {
                    chitNumber.style = "border-style: hidden;background-color : #EEEEEE";
                } else {
                    chitNumber.style = "border-style: hidden";
                }
                chitNumber.name = "chitNumber[" + counts + "]";
                chitNumber.id = "chitNumber[" + counts + "]";
                chitNumber.value = chtnumber;
                cell2.appendChild(chitNumber);

                var cell3 = row.insertCell(2);
                var repeatCount = document.createElement("input");
                repeatCount.type = "text";
                if (rowCount % 2 == 1) {
                    repeatCount.style = "border-style: hidden;background-color : #EEEEEE";
                } else {
                    repeatCount.style = "border-style: hidden";
                }
                repeatCount.name = "repeatCount[" + counts + "]";
                repeatCount.value = rcount;
                cell3.appendChild(repeatCount);

                var cell4 = row.insertCell(3);
                var totalAmount = document.createElement("input");
                totalAmount.type = "text";
                if (rowCount % 2 == 1) {
                    totalAmount.style = "border-style: hidden;background-color : #EEEEEE";
                } else {
                    totalAmount.style = "border-style: hidden";
                }
                totalAmount.name = "totalAmount[" + counts + "]";
                totalAmount.id = "totalAmount[" + (counts - 1) + "]";
                totalAmount.value = tpayment;
                cell4.appendChild(totalAmount);

                var cell5 = row.insertCell(4);
                var duePayment = document.createElement("input");
                duePayment.type = "text";
                if (rowCount % 2 == 1) {
                    duePayment.style = "border-style: hidden;background-color : #EEEEEE";
                } else {
                    duePayment.style = "border-style: hidden";
                }
                duePayment.name = "duePayment[" + counts + "]";
                duePayment.id = "duePayment[" + (counts - 1) + "]";
                duePayment.value = dpayment;
                cell5.appendChild(duePayment);

                var cell6 = row.insertCell(5);
                var reson = document.createElement("input");
                duePayment.type = "text";
                if (rowCount % 2 == 1) {
                    reson.style = "border-style: hidden;background-color : #EEEEEE;width : 205px;";
                } else {
                    reson.style = "border-style: hidden;width : 205px;";
                }
                reson.name = "reson[" + counts + "]";
                reson.id = "reson[" + (counts - 1) + "]";
                reson.value = resons;
                cell6.appendChild(reson);

                var cell7 = row.insertCell(6);
                var line = document.createElement("input");
                line.type = "text";
                if (rowCount % 2 == 1) {
                    line.style = "border-style: hidden;background-color : #EEEEEE;width : 50px;";
                } else {
                    line.style = "border-style: hidden;width : 50px;";
                }
                line.name = "lineid[" + counts + "]";
                line.id = "lineid[" + (counts - 1) + "]";
                line.value = lineid;
                cell7.appendChild(line);

                var cell8 = row.insertCell(7);
                var btn = document.createElement("a");
                //btn.type = "button";
                btn.setAttribute("class", "glyphicon glyphicon-trash");
                btn.atribute = "<a href='#' style='color:red' style='float : right'  onClick='Javacsript:deleteRow(this)' >  <i class='glyphicon glyphicon-trash'></i></a> "
                btn.onclick = function () {
                    var table = document.getElementById('addressesTable');
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

                };
                btn.name = "button[" + counts + "]";
                cell8.appendChild(btn);

                rowTot();

                document.getElementById('chtnumber').value = "";
                document.getElementById('rcount').value = "";
                document.getElementById('tpayment').value = "";
                document.getElementById('dpayment').value = "";
                document.getElementById('resons').value = "";
            }


            function rowTot() {
                var j;
                var total = 0;
                var row = rowCount - 2
                var currentTot = document.getElementById('dpayment').value;
                var q = parseInt(currentTot);
                var inner = 0;
                if (row > 0) {
                    for (var i = 1; i < rowCount; i++) {

                        j = document.getElementById("addressesTable").rows[i].cells[4].getElementsByTagName("input")[0].value;
                        if (j != "") {

                            var k = parseInt(j);
                            total = total + k;
                            inner = 1;
                        }



                    }

                    document.getElementById('tot').value = total + q;


                } else {
                    var payment = document.getElementById('dpayment').value;
                    document.getElementById('tot').value = payment;
                }
            }




            function deleteRow(addressesTable) {
                try {
                    var table = document.getElementById(addressesTable);
                    var rowCount = table.rows.length;
                    alert("e");
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

            function  gettablerowcount() {
                var count = document.getElementById("addressesTable").rows.length;
                document.getElementById("rowcount").value = count - 1;
            }
        </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="gettablerowcount();">
        <%
            String excess_id = request.getParameter("excess_id");
            Excess excess = ExcessController.getExcessById(excess_id);

            String center_id = excess.getCenter_id();
            String center_number = center_id.substring(2, center_id.length());
            Center center = CenterController.searchCenterById(Integer.parseInt(center_number));

            List<ExcessLine> excess_line = (List<ExcessLine>) ExcessLineController.searchAllExcessLineById(excess_id);

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
                <section class="content-header">
                    <h1>
                        Excess
                        <small>Excess registration</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="viewExcess.jsp"><i class="fa fa-dashboard"></i> View excess</a></li>
                        <li class="active">Update excess</li>


                    </ol>
                </section>
                <section class="content">
                    <div class="box box-default">
                        <div class="box-header no-border">
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <form method="POST" action="../../AddExcess">
                                    <div class="col-md-12">
                                        <div class="form-group" style="width: 400px">
                                            <label>Center name</label>
                                            <input type="hidden" name="lineid" id="lineid"  value="0">
                                            <input type="hidden" name="excess_id" id="excess_id"  value="<%=request.getParameter("excess_id")%>">
                                            <input type="text" name="cname" style="color: black" id="cname" class="form-control" value="<%=center.getCenter_Name()%>"  placeholder="Select Center">
                                        </div>
                                        <div class="form-group" style="width: 400px">
                                            <label>Center name</label>
                                            <input type="text" name="cnumber" style="color: black" id="cnumber" class="form-control" value="<%=excess.getCenter_id()%>"readonly placeholder="Center number">
                                        </div>
                                        <div class="form-group" style="width: 400px">
                                            <label>date</label>
                                            <input type="date" id="edate" name="edate" value="<%=excess.getExcess_date()%>" class="form-control"placeholder="Enter date">
                                        </div>
                                    </div>

                                    <!-- /////////////////////////-->
                                    <div class="col-md-12" style="padding:15px 15px 5px 15px">
                                        <div class="col-md-3" style="padding-left: 0px;width: 255px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Chit number</label>
                                                <input type="text" name="chtnumber" style="color: black" id="chtnumber" class="form-control" placeholder="Select timebag">
                                            </div>
                                        </div>
                                        <div class="col-md-3"style="width:182px;padding-left: 0px;padding-right: 0px;margin-left: -15px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Repeat Count</label>
                                                <input type="text" id="rcount" name="rcount" class="form-control" style="font-size: 20px;">
                                            </div>
                                        </div>

                                        <div class="col-md-3"style="width:178px;padding-left: 0px;padding-right: 0px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Total payment</label>
                                                <input type="text" id="tpayment" name="tpayment"style="font-size: 16px;" class="form-control" >
                                            </div>
                                        </div>
                                        <div class="col-md-3"style="width:178px;padding-left: 0px;padding-right: 0px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Due payment</label>
                                                <input type="text" id="dpayment" name="dpayment"style="font-size: 16px;" class="form-control" >
                                            </div>
                                        </div>
                                        <div class="col-md-3"style="width:178px;padding-left: 0px;padding-right: 0px">
                                            <div class="form-group">
                                                <label style="color: #0066cc">Reson</label>
                                                <input type="text" id="resons" name="resons"style="font-size: 16px;" class="form-control" >
                                            </div>
                                        </div>


                                        <div class="col-md-1" style="margin-left: -15px">
                                            <div class="form-group">
                                                <label >.</label>
                                                <button type="button" name="button[0]"   id="add" value="Add" onclick="addRow('addressesTable')" style="border-radius: 0px"  class="btn btn-primary">
                                                    <i class="glyphicon glyphicon-plus-sign"></i>
                                                    Add</button>
                                            </div>
                                        </div>

                                        <!-- /////////////////////////-->
                                    </div>

                                    <div class="col-md-12 " >
                                        <table id="addressesTable"  class="table-style-three"   width='100%'  >
                                            <tr >
                                                <th>select</th>
                                                <th>chit number</th>
                                                <th>Repeat Count</th>
                                                <th>Total payment</th>
                                                <th>Due payment</th>
                                                <th>Reson</th>
                                                <th>Line id</th>
                                                <th>action</th>
                                            </tr>

                                            <%
                                                int i = 1;
                                                for (ExcessLine model : excess_line) {

                                            %>
                                            <tr>
                                                <td><input type="checkbox" name="chk"/></td>



                                                <td>&nbsp;<input type="text" style="width: 100px;border-style: hidden;background-color: #EEEEEE" value="<%=model.getExcess_line_chitNumber()%>" name="chitNumber[<%=i%>]" /></td>
                                                <td>&nbsp;<input type="text" style="width: 100px;border-style: hidden;background-color: #EEEEEE" value="<%=model.getExcess_line_repeatCount()%>" name="repeatCount[<%=i%>]" /></td>
                                                <td>&nbsp;<input type="text" style="width: 100px;border-style: hidden;background-color: #EEEEEE" value="<%=model.getExcess_line_totalPayment()%>" name="totalAmount[<%=i%>]" /></td>
                                                <td>&nbsp;<input type="text" style="width: 100px;border-style: hidden;background-color: #EEEEEE" value="<%=model.getExcess_line_duePayment()%>" name="duePayment[<%=i%>]" /></td>
                                                <td>&nbsp;<input type="text" style="width: 150px;border-style: hidden;background-color: #EEEEEE" value="<%=model.getExcess_line_reason()%>" name="reson[<%=i%>]" /></td>
                                                <td >&nbsp;<input type="text" style="width: 50px;border-style: hidden;background-color: #EEEEEE" value="<%=model.getExcess_line_id()%>" name="lineid[<%=i%>]" /></td>
                                                <td> <a name="button[0]"  href='#' style='color:red' style='float : right'  onClick="deleteRow('addressesTable')" >  <i class='glyphicon glyphicon-trash'></i></a> </td>

                                            </tr>


                                            <%
                                                    i++;
                                                }%>
                                            <tr hidden>
                                                <td><input type="checkbox" name="chk"/></td>
                                            <input type="hidden"  id="rowcount" name="rowcount" />
                                            <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="chitNumber[0]" /></td>
                                            <td><input type="text" style="border-style: hidden;background-color: #EEEEEE" name="repeatCount[0]" /></td>
                                            <td><input type="text" style="border-style: hidden;background-color: #EEEEEE"  name="totalAmount[0]"   /></td>
                                            <td><input type="text" style="border-style: hidden;background-color: #EEEEEE"  name="duePayment[0]"   /></td>
                                            <td><input type="text" style="border-style: hidden;background-color: #EEEEEE;width : 265px;"  name="reson[0]"   /></td>
                                            <td> <a name="button[0]"  href='#' style='color:red' style='float : right'  onClick="deleteRow('addressesTable')" >  <i class='glyphicon glyphicon-trash'></i></a> </td>
                                            </tr>



                                        </table>
                                        <div> <input type="text" id="tot" name="tot"style="font-size: 16px;width: 200px;float: right" value="<%=excess.getExcess_total()%>" class="form-control" ></div>
                                        <!-- <INPUT type="button" name="button[0]" value="Add row" onclick="addRow('addressesTable')" />-->

                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <button type="submit" class="btn btn-primary"  value="Update Excess" name="Update">
                                                <i class="glyphicon glyphicon-save"></i>
                                                Update Excess
                                            </button>
                                            <button type="reset" name="reset" class="btn btn-danger">
                                                <i class="glyphicon glyphicon-trash"></i>
                                                Clear</button>

                                        </div>

                                    </div>
                                </form>
                            </div>

                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->
                </section>
            </div>
            <%@include file="../../includes/footer.jspf" %>  
        </div>

        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <script src="../../dist/js/app.min.js"></script>


    </body>

</html>

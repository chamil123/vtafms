<%-- 
    Document   : abc
    Created on : Sep 16, 2016, 2:03:08 PM
    Author     : Chamil
--%>

<%@page import="net.sf.jasperreports.engine.util.JRProperties"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory"%>
<%@page import="BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            font-family: 'TimesNewRoman', sans-serif;
            font-size: 75%;
        }  
    </style>

    <body>

        <%
            try {
                //HttpSession session = request.getSession();
                Object date = session.getAttribute("date");
                Object cname = session.getAttribute("cname");
                Object namount = session.getAttribute("namount");
                Object lamount = session.getAttribute("lamount");
                Object due = session.getAttribute("due");
                Object pay = session.getAttribute("pay");
                Object cnumber = session.getAttribute("cnumber");
                Object lcnc = session.getAttribute("lcnc");
                Object papercash = session.getAttribute("papercash");
                Object paycoms = session.getAttribute("paycoms");
                Object exp = session.getAttribute("exp");

                Object fc = session.getAttribute("fc");
                Object pd = session.getAttribute("pd");
                Object cash = session.getAttribute("cash");
                Object paymentTotal = session.getAttribute("paymentTotal");
                Object lastID = session.getAttribute("lastID");
                Object loan = session.getAttribute("loan");
                Object excess = session.getAttribute("excess");

                ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
                Connection conn = (Connection) connectionProvider.getConnection();
                ServletContext applications = getServletContext();
                File reportFile = new File(application.getRealPath("reports/summery.jasper"));

                //String absolutePathToIndexJSP = application.getRealPath("reports/sample.jasper");
                Map parameters = new HashMap();
                //    parameters.put("parasumdate","2016-09-25");
                //parameters.put("paraAgentId","1");
                System.out.print("print venne date eka : " + date);
                parameters.put("date", date);
                parameters.put("cname", cname);
                parameters.put("cnumber", cnumber);
                parameters.put("fc", fc);
                parameters.put("lcnc", lcnc);
                parameters.put("papercash", papercash);
                parameters.put("pd", pd);
                parameters.put("ln", loan);
                parameters.put("excess", excess);

                parameters.put("paycoms", paycoms);
                parameters.put("exp", exp);
                parameters.put("cash", cash);

                double payamount = Double.parseDouble(pay.toString());
                double dueamount = Double.parseDouble(due.toString());
                if (payamount == 0.0) {
                    parameters.put("due", due);
                    parameters.put("pay", "");
                } else {
                    parameters.put("due", "");
                    parameters.put("pay", pay);
                }

                parameters.put("paymentTotal", paymentTotal);
                parameters.put("lastID", lastID);
                // parameters.put("cnumber", cnumber);
                // parameters.put("cnumber", cnumber);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
                //   OutputStream outStream = response.getOutputStream();
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outputstream = response.getOutputStream();
                outputstream.write(bytes, 0, bytes.length);
                outputstream.flush();
                outputstream.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </body>
</html>

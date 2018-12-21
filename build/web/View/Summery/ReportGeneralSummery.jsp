<%-- 
    Document   : ReportGeneralSummery
    Created on : Oct 19, 2016, 6:11:57 PM
    Author     : Chamil
--%>

<%@page import="javax.faces.context.FacesContext"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory"%>
<%@page import="BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl"%>
<%@page import="BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Object gname = session.getAttribute("gname");
                Object gnumber = session.getAttribute("gnumber");
                Object date = session.getAttribute("date");
                Object fc = session.getAttribute("fc");
                Object paymentTotal = session.getAttribute("paymentTotal");
                Object lcnc = session.getAttribute("lcnc");
                Object paycoms = session.getAttribute("paycoms");
                Object papercash = session.getAttribute("papercash");
                Object pd = session.getAttribute("pd");
                Object cash = session.getAttribute("cash");
                Object exp = session.getAttribute("exp");

                Object duesub = session.getAttribute("duesub");
                Object paysub = session.getAttribute("paysub");
                Object balance = session.getAttribute("balance");

                ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
                Connection conn = (Connection) connectionProvider.getConnection();
                ServletContext applications = getServletContext();
                File reportFile = new File(application.getRealPath("reports/GeneralSummery.jasper"));

                Map parameters = new HashMap();
        
                String sumDate = "2016-10-19";

                parameters.put("gname", gname);
                parameters.put("gnumber", gnumber);
                parameters.put("sumDate", date);
                parameters.put("fc", fc);
                parameters.put("paymentTotal", paymentTotal);
                parameters.put("lcnc", lcnc);
                parameters.put("paycoms", paycoms);
                parameters.put("papercash", papercash);
                parameters.put("pd", pd);
                parameters.put("cash", cash);
                parameters.put("exp", exp);
                
                  parameters.put("ln", "0");
                    parameters.put("exc", "0");

                parameters.put("duesub", duesub);
                parameters.put("paysub", paysub);
                parameters.put("balance", balance);

                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
                //   OutputStream outStream = response.getOutputStream();
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outputstream = response.getOutputStream();
                outputstream.write(bytes, 0, bytes.length);
                outputstream.flush();
                outputstream.close();
                FacesContext.getCurrentInstance().responseComplete();

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>

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
                Object paraAgentId = session.getAttribute("AgentId");
                Object parasumdate = session.getAttribute("date");
                Object parasumdate2 = session.getAttribute("date2");
                Object paraAgentName = session.getAttribute("AgentName");
                

                System.out.print(paraAgentId+" "+parasumdate+" "+parasumdate2+"  "+paraAgentName);

                ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
                Connection conn = (Connection) connectionProvider.getConnection();
                ServletContext applications = getServletContext();
                File reportFile = new File(application.getRealPath("reports/sum.jasper"));

                //String absolutePathToIndexJSP = application.getRealPath("reports/sample.jasper");
                Map parameters = new HashMap();
                //    parameters.put("parasumdate","2016-09-25");
              

                parameters.put("paraAgentId", paraAgentId);
                parameters.put("parasumdate", parasumdate);
                 parameters.put("parasumdate2", parasumdate2);
                parameters.put("paraAgentName", paraAgentName);
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

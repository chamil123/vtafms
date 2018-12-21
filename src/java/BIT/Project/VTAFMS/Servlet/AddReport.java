/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Model.CenterCash;
import BIT.Project.VTAFMS.Model.Summery;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chamil
 */
@WebServlet(name = "AddReport", urlPatterns = {"/AddReport"})
public class AddReport extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String value = request.getParameter("value");

            try {
                if (value.equals("centerReport")) {
                    String fromdate = request.getParameter("fromdate");
                    String todate = request.getParameter("todate");
                    String centername = request.getParameter("cname");

                    List<Summery> summerylist = (List<Summery>) SummeryController.summeryBetweenDates(fromdate, todate, centername);
                    CenterCash centercash;
                    double totFC = 0;
                    double totCash = 0;
                    double totPay = 0;
                    double totPD = 0;
                    for (int i = 0; i < summerylist.size(); i++) {
                        centercash = CenterCashController.searchCenterCashByDateandId(summerylist.get(i).getSummery_date(), summerylist.get(i).getCenter_id());
                        totFC += centercash.getCenterCash_details_FullCollection();
                        totCash += centercash.getCenterCash_details_cash();
                        totPay += summerylist.get(i).getSummery_compay();
                        totPD += centercash.getCenterCash_details_passDue();
                    }
                    response.sendRedirect("View/Reports/CenterReport.jsp?fromdate=" + fromdate + "&todate=" + todate + "&centername=" + centername + "&totFC=" + totFC + "&totCash=" + totCash + "&totPay=" + totPay + "&totPD=" + totPD);
                }

                if (value.equals("agentReport")) {
                    String fromdate = request.getParameter("fromdate");
                    String todate = request.getParameter("todate");
                    String agentNumber = request.getParameter("agentNumber");
                    String cname = request.getParameter("cname");
//                    List<Summery> summerylist = (List<Summery>) SummeryController.summeryBetweenDates(fromdate, todate, centername);
//                    CenterCash centercash;
//                    double totFC = 0;
//                    double totCash = 0;
//                    double totPay = 0;
//                    double totPD = 0;

//                    for (int i = 0; i < summerylist.size(); i++) {
//                        centercash = CenterCashController.searchCenterCashByDateandId(summerylist.get(i).getSummery_date(), summerylist.get(i).getCenter_id());
//                        totFC += centercash.getCenterCash_details_FullCollection();
//                        totCash += centercash.getCenterCash_details_cash();
//                        totPay += summerylist.get(i).getSummery_compay();
//                        totPD += centercash.getCenterCash_details_passDue();
//                    }
//                    response.sendRedirect("View/Reports/CenterReport.jsp?fromdate=" + fromdate + "&todate=" + todate + "&centername=" + centername + "&totFC=" + totFC + "&totCash=" + totCash + "&totPay=" + totPay + "&totPD=" + totPD);
                    response.sendRedirect("View/Reports/AgentReport.jsp?fromdate=" + fromdate + "&todate=" + todate + "&agentNumber=" + agentNumber + "&cname=" + cname);
                }
                if (value.equals("dashboard")) {
                    String dates = request.getParameter("dates");
                    List<Summery> summerylist = (List<Summery>) SummeryController.summeryFromDates(dates);

                    CenterCash centercash;
                    double totFC = 0;
                    double totCash = 0;
                    double totPay = 0;
                    double totPD = 0;
                    for (int i = 0; i < summerylist.size(); i++) {
                        centercash = CenterCashController.searchCenterCashByDateandId(summerylist.get(i).getSummery_date(), summerylist.get(i).getCenter_id());
                        totFC += centercash.getCenterCash_details_FullCollection();
                        totCash += centercash.getCenterCash_details_cash();
                        totPay += summerylist.get(i).getSummery_compay();
                        totPD += centercash.getCenterCash_details_passDue();
                    }
                    out.print(totFC + ":" + totCash + ":" + totPay + ":" + totPD + "!");
                }
                if (value.equals("agentjasper")) {
                    String AgentId = request.getParameter("aid");
                    String AgentName = request.getParameter("aname");
                    String date = request.getParameter("date1");
                     String date2 = request.getParameter("date2");
 
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("AgentId", AgentId);
                    session.setAttribute("AgentName", AgentName);
                    session.setAttribute("date", date);
                    session.setAttribute("date2", date2);

                    response.sendRedirect("View/Reports/AgentJasper.jsp");
                }
            } catch (Exception ex) {
                Logger.getLogger(AddReport.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

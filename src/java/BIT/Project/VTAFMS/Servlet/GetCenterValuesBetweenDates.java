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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chamil
 */
@WebServlet(name = "GetCenterValuesBetweenDates", urlPatterns = {"/GetCenterValuesBetweenDates"})
public class GetCenterValuesBetweenDates extends HttpServlet {

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
            String fromdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String cname = request.getParameter("cname");
            String type = request.getParameter("type");

            try {

                if (type.equals("centerReport")) {
                    List<Summery> summerylist = (List<Summery>) SummeryController.summeryBetweenDates(fromdate, todate, cname);
                    CenterCash centercash;
                    double totFC = 0;
                    for (int i = 0; i < summerylist.size(); i++) {
                        centercash = CenterCashController.searchCenterCashByDateandId(summerylist.get(i).getSummery_date(), summerylist.get(i).getCenter_id());
                        out.print(summerylist.get(i).getSummery_date() + ":" + centercash.getCenterCash_details_FullCollection() + ":" + centercash.getCenterCash_details_cash() + ":" + summerylist.get(i).getSummery_compay() + ":" + centercash.getCenterCash_details_passDue() + ":" + summerylist.get(i).getSummery_excess() + ":" + summerylist.get(i).getSummery_expences() + ":" + summerylist.get(i).getSummery_slippaytot() + "!");

                        totFC += centercash.getCenterCash_details_FullCollection();
                    }
                }
                if (type.equals("agentReport")) {
                    String agentNumber = request.getParameter("agentNumber");
                    List<Summery> summerylist = (List<Summery>) SummeryController.summeryBetweenDatesByAgentId(fromdate, todate, agentNumber);
                    // List<Summery> summerylist = (List<Summery>) SummeryController.summeryBetweenDates(fromdate, todate, cname);
                    CenterCash centercash;
                    double totFC = 0;
                    double totalFC = 0;
                    double totalCASH = 0;
                    double totalPAY = 0;
                    double totalPD = 0;
                    double totalEXC = 0;
                    double totalEXP = 0;
                    double totalPAYSLIP = 0;
                    List<String> list2 = new ArrayList<>();
                    for (int i = 0; i < summerylist.size(); i++) {
                        centercash = CenterCashController.searchCenterCashByDateandId(summerylist.get(i).getSummery_date(), summerylist.get(i).getCenter_id());
                        // out.print(summerylist.get(i).getSummery_date() + ":" + centercash.getCenterCash_details_FullCollection() + ":" + centercash.getCenterCash_details_cash() + ":" + summerylist.get(i).getSummery_compay() + ":" + centercash.getCenterCash_details_passDue() + ":" + summerylist.get(i).getSummery_excess() + ":" + summerylist.get(i).getSummery_expences() + ":" + summerylist.get(i).getSummery_slippaytot() + "!");
                        totalFC += centercash.getCenterCash_details_FullCollection();
                        totalCASH += centercash.getCenterCash_details_cash();
                        totalPAY += summerylist.get(i).getSummery_compay();
                        totalPD += centercash.getCenterCash_details_passDue();
                        totalEXC += summerylist.get(i).getSummery_excess();
                        totalEXP += summerylist.get(i).getSummery_expences();
                        totalPAYSLIP += summerylist.get(i).getSummery_slippaytot();

                        totFC += centercash.getCenterCash_details_FullCollection();
                    }
                    list2.add("totalFC#" + totalFC);
                    list2.add("totalCASH#" + totalCASH);
                    list2.add("totalPAY#" + totalPAY);
                    list2.add("totalPD#" + totalPD);
                    list2.add("totalEXC#" + totalEXC);
                    list2.add("totalEXP#" + totalEXP);
                    list2.add("totalPAYSLIP#" + totalPAYSLIP);
                    String split[];
                    for (String listItem : list2) {
                        split = listItem.split("#");
                        out.print(split[0] + ":" + split[1] + "!");
                    }
                }if (type.equals("agentReportBar")) {
                    
                      String agentNumber = request.getParameter("agentNumber");
                    List<Summery> summerylist = (List<Summery>) SummeryController.summeryBetweenDatesByAgentId(fromdate, todate, agentNumber);
                    CenterCash centercash;
                     System.out.println("ssaa s as as as ; "+summerylist.size());
                    for (int i = 0; i < summerylist.size(); i++) {
                        centercash = CenterCashController.searchCenterCashByDateandId(summerylist.get(i).getSummery_date(), summerylist.get(i).getCenter_id());
                        out.print(summerylist.get(i).getSummery_date() + ":" + centercash.getCenterCash_details_FullCollection() + ":" + centercash.getCenterCash_details_cash() + ":" + summerylist.get(i).getSummery_compay() + ":" + centercash.getCenterCash_details_passDue() + ":" + summerylist.get(i).getSummery_excess() + ":" + summerylist.get(i).getSummery_expences() + ":" + summerylist.get(i).getSummery_slippaytot() + "!");
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(GetCenterValuesBetweenDates.class.getName()).log(Level.SEVERE, null, ex);
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

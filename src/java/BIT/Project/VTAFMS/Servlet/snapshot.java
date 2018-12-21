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
@WebServlet(name = "snapshot", urlPatterns = {"/snapshot"})
public class snapshot extends HttpServlet {

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
            try {
                List<String> month = new ArrayList<String>();
                month.add("01");
                month.add("02");
                month.add("03");
                month.add("04");
                month.add("05");
                month.add("06");
                month.add("07");
                month.add("08");
                month.add("09");
                month.add("10");
                month.add("11");
                month.add("12");

                Summery summery;

                // for (int i = 0; i < month.size(); i++) {
                double lcnc = 0;
                double papercash = 0;
                double passDue = 0;
                double loan = 0;
                double centercash = 0;

                double totalSlip = 0;
                double compay = 0;
                double exp = 0;
                double exc = 0;

                double totalincome = 0;
                double totalExpense = 0;
                
                String submonth;
                List<Summery> sum = (List<Summery>) SummeryController.searchPaymentsOrderByMonth();

                for (int i = 0; i < sum.size(); i++) {
                    centercash = CenterCashController.getMonthlyCashTot(sum.get(i).getSummery_date());
                    lcnc = sum.get(i).getSummery_lcnc();
                    papercash = sum.get(i).getSummery_papercash();
                    passDue = sum.get(i).getSummery_due();
                    loan = sum.get(i).getSummery_loan();

                    totalSlip = sum.get(i).getSummery_slippaytot();
                    compay = sum.get(i).getSummery_compay();
                    exp = sum.get(i).getSummery_expences();
                    exc = sum.get(i).getSummery_excess();

                    totalincome = lcnc + papercash + passDue + loan + centercash;
                    totalExpense = totalSlip + compay + exp + exc;

                    out.print(sum.get(i).getSummery_date().substring(0, 7) + ":" + totalincome + ":" + totalExpense + ":"+centercash+":"+passDue+"!");
                }

            } catch (Exception ex) {
                Logger.getLogger(snapshot.class.getName()).log(Level.SEVERE, null, ex);
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

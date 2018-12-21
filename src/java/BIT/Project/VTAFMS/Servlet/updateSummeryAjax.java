/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.ExcessController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Controller.SummeryLineController;
import BIT.Project.VTAFMS.Model.CenterCash;
import BIT.Project.VTAFMS.Model.Excess;
import BIT.Project.VTAFMS.Model.Summery;
import BIT.Project.VTAFMS.Model.SummeryLine;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "updateSummeryAjax", urlPatterns = {"/updateSummeryAjax"})
public class updateSummeryAjax extends HttpServlet {

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
            String id = request.getParameter("dayVal");
            System.out.print("ssddffggdd : "+id);
            Summery summery;
            try {
                summery = (Summery) SummeryController.searchSummeryById(Integer.parseInt(id));

                CenterCash centercash = (CenterCash) CenterCashController.searchCenterCashByDateandId(summery.getSummery_date(), summery.getCenter_id());
                double excessTot = ExcessController.getexcessTotalByidandDate(summery.getCenter_id(), summery.getSummery_date());
                //  SummeryLine sumline = (SummeryLine) SummeryLineController.searchSummeryLineById(summery.getSummery_id());

                out.print(summery.getSummery_date().toString().concat(":") + ""
                        + "" + summery.getSummery_name().concat(":") + " "
                        + "" + summery.getCenter_id().concat(":") + " "
                        + "" + summery.getSummery_lessCommisionAmount() + ":" + " "
                        + "" + summery.getSummery_noCommisionAmount() + ":" + " "
                        + "" + summery.getSummery_lcnc() + ":" + ""
                        + " " + summery.getSummery_papercash() + ":" + ""
                        + " " + summery.getSummery_slippaytot() + ":" + ""
                        + " " + summery.getSummery_compay() + ":" + ""
                        + " " + summery.getSummery_expences() + ":" + " "
                        + "" + centercash.getCenterCash_details_FullCollection() + ":"
                        + centercash.getCenterCash_details_passDue() + ":" + " "
                        + centercash.getCenterCash_details_cash() + ":"
                        + excessTot + "!");
                
            } catch (Exception ex) {
                Logger.getLogger(updateSummeryAjax.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Controller.ExcessController;
import BIT.Project.VTAFMS.Controller.ExcessLineController;
import BIT.Project.VTAFMS.Model.Center;
import BIT.Project.VTAFMS.Model.Excess;
import BIT.Project.VTAFMS.Model.ExcessLine;
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

/**
 *
 * @author Chamil
 */
@WebServlet(name = "updateExcessLineAjax", urlPatterns = {"/updateExcessLineAjax"})
public class updateExcessLineAjax extends HttpServlet {

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

            String excessId = request.getParameter("dayVal");
            String type = request.getParameter("type");
            List<ExcessLine> excessLine;
            Excess excess;
            Center center;
            try {
                if (type.equals("excessLine")) {
                    excessLine = (List<ExcessLine>) ExcessLineController.getAllExcessLineByExcessID(excessId);

                    for (int i = 0; i < excessLine.size(); i++) {
                        // excess = ExcessController.searchExcessById(excessId);

                        // center = CenterController.getAllCenterByID2(excess.getCenter_id());
                        out.print(excessLine.get(i).getExcess_line_id() + ":"
                                + excessLine.get(i).getExcess_line_chitNumber() + ":"
                                + excessLine.get(i).getExcess_line_repeatCount() + ":"
                                + excessLine.get(i).getExcess_line_totalPayment() + ":"
                                + excessLine.get(i).getExcess_line_duePayment() + ":"
                                + excessLine.get(i).getExcess_line_reason() + "!");
                    }
                }
                if (type.equals("excess")) {
                    excess = ExcessController.getExcessById(excessId);
                    center = CenterController.getAllCenterByID2(excess.getCenter_id());
                    out.print(excess.getExcess_date() + ":"
                            + center.getCenter_Name() + ":"
                            + center.getCenter_id() + "!");
                }
            } catch (Exception ex) {
                Logger.getLogger(updateExcessLineAjax.class.getName()).log(Level.SEVERE, null, ex);
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

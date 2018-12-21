/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Model.CenterCash;
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
@WebServlet(name = "GetCentercashDetailsinAjax", urlPatterns = {"/GetCentercashDetailsinAjax"})
public class GetCentercashDetailsinAjax extends HttpServlet {

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
                //                List<CenterCash> center = (List<Center>) CenterController.getAllCenters();
//                Agent agent;

//                for (int i = 0; i < center.size(); i++) {
//                    agent = AgentController.searchAgentById(center.get(i).getAgent_id());
               // double centercash = CenterCashController.ggetAllcashBydate();
                //double centerdue = CenterCashController.getAllcDueBydate();
                
                List<CenterCash> list;

                list = (List<CenterCash>) CenterCashController.getAllcashandPassDuesBydate();

                for (int i = 0; i < list.size(); i++) {

                    out.print(list.get(i).getCenterCash_details_cash()+ ":"+list.get(i).getCenterCash_details_passDue()+":"+list.get(i).getCenterCash_details_date()+"!");
                }
//                    //System.out.println("run venavacah yipee : "+center.get(i).getCenter_id());
//
                    
//                }
            } catch (Exception ex) {
                Logger.getLogger(GetCentercashDetailsinAjax.class.getName()).log(Level.SEVERE, null, ex);
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

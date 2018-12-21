/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AgentController;
import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Model.Agent;
import BIT.Project.VTAFMS.Model.Center;
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
@WebServlet(name = "GetCentersinAjax", urlPatterns = {"/GetCentersinAjax"})
public class GetCentersinAjax extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String ids = request.getParameter("id");
            String type = request.getParameter("type");
            List<Center> center;
            Agent agent;
            try {
                if (type.equals("normal")) {
                    center = (List<Center>) CenterController.getAllCenters();

                    for (int i = 0; i < center.size(); i++) {
                        agent = AgentController.searchAgentById(center.get(i).getAgent_id());
                        out.print(center.get(i).getCenter_id().concat(":")
                                + center.get(i).getCenter_Name().concat(":") + agent.getAgent_name().concat(":")+agent.getAgent_id()+"!");

                    }
                }
                List<Agent> agentlist;
                if (type.equals("general")) {
                    agentlist = (List<Agent>) AgentController.getAllAgents();

                    for (int i = 0; i < agentlist.size(); i++) {
                        // agent = AgentController.searchAgentById(center.get(i).getAgent_id());
                        out.print(agentlist.get(i).getAgent_id() + ":"
                                + agentlist.get(i).getAgent_name().concat(":") + agentlist.get(i).getAgent_location().concat("!"));

                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(GetCentersinAjax.class.getName()).log(Level.SEVERE, null, ex);
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

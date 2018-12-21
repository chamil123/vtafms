/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AgentController;
import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Controller.ExpensesController;
import BIT.Project.VTAFMS.Model.Agent;
import BIT.Project.VTAFMS.Model.Center;
import BIT.Project.VTAFMS.Model.Expenses;
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
@WebServlet(name = "viewCenter", urlPatterns = {"/viewCenter"})
public class viewCenter extends HttpServlet {

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

            String id = request.getParameter("dayVal");
            Center center;
            System.out.print(id);
            try {
                center = (Center) CenterController.searchCenterById(Integer.parseInt(id));
                System.out.print("agent id : " + center.getCenter_address());
                Agent agent = (Agent) AgentController.searchAgentById(center.getAgent_id());
                // Expenses expenses = (Expenses) ExpensesController.searchExpensesById(center.getExpences_id());

                out.print(center.getCenter_id().concat(":") + ""
                        + "" + center.getCenter_Name().concat(":") + " "
                        + "" + center.getCenter_com() + ":" + " "
                        + "" + center.getCenter_nc() + ":" + " "
                        + "" + center.getCenter_lc() + ":" + " "
                        + "" + center.getCenter_papercash() + ""
                        + " " + center.getCenter_mobile().concat(":") + ""
                        + " " + center.getCenter_officenumber().concat(":") + ""
                        + " " + center.getCenter_accountType().concat(":") + ""
                        + " " + center.getCenter_status().concat(":") + " "
                        + "" + center.getCenter_address().concat(":") + "" + agent.getAgent_name().concat(":") + " " + center.getCenter_expenses() + "!");
               
                //   System.out.println("sdfsf sfsf  f dfsdf fs df sdf df df sf df df dsfsd sdf df : " + listperson.get(j).getPersonId() + ":" + listperson.get(j).getPersonFirstName().concat(":") + listperson.get(j).getPersonLastName().concat(":") + listcivillians.get(k).getCivillianDurationOfResidency().concat(":") + listcivillians.get(k).getCivillianLegalStatus().concat(":") + listcivillians.get(k).getCivillianNationality().concat(":") + listcivillians.get(k).getCivillianProfession().concat(":") + listcivillians.get(k).getCivillianEmail().concat(":") + listcivillians.get(k).getCivillianPhone().concat("!") + city.getCityName() + sentorCity.concat("!"));
            } catch (Exception ex) {
                Logger.getLogger(viewCenter.class.getName()).log(Level.SEVERE, null, ex);
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

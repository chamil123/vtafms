/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AgentController;
import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Model.Agent;
import BIT.Project.VTAFMS.Model.Center;
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
@WebServlet(name = "CheckDailySummery", urlPatterns = {"/CheckDailySummery"})
public class CheckDailySummery extends HttpServlet {

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

            String type = request.getParameter("Type");
            try {
                List<Summery> summery;
                Center center;
                if (type.equals("general")) {
                    summery = (List<Summery>) SummeryController.getAllSummerysTypeGen();

                    for (int i = 0; i < summery.size(); i++) {
                        center = CenterController.getAllCenterByID2(summery.get(i).getCenter_id());
                        System.out.println(" dd : " + summery.get(i).getSummery_name() + " U : " + summery.get(i).getSummery_slippaytot() + " A : " + summery.get(i).getSummery_date() + "  G :" + summery.get(i).getCenter_id());
                        out.print(summery.get(i).getSummery_name().concat(":")
                                + summery.get(i).getSummery_slippaytot() + ":"
                                + summery.get(i).getSummery_date() + ":"
                                + summery.get(i).getCenter_id().concat(":") + center.getAgent_id() + "!");
                    }
                } else if (type.equals("normal")) {

                    summery = (List<Summery>) SummeryController.getAllSummerys();

                    for (int i = 0; i < summery.size(); i++) {

                        out.print(summery.get(i).getSummery_date().concat(":")
                                + summery.get(i).getSummery_name().concat("!"));
                    }
                } else if (type.equals("normalTotal")) {
                    String date = request.getParameter("date");
                    double ceterTotal = CenterController.getRowCount();
                    int summeryTotal = SummeryController.getSummeryDailyCount(date);

                    int remaining = (int) (ceterTotal - summeryTotal);
                    List<String> list2 = new ArrayList<>();

                    list2.add("#" + ceterTotal);
                    list2.add("#" + summeryTotal);
                    list2.add("#" + remaining);
                    //list2.add("#" + 15);

                    String split[];
                    for (String listItem : list2) {
                        split = listItem.split("#");
                        System.out.print(split[0] + ":" + split[1] + "!");
                        out.print(split[0] + ":" + split[1] + "!");
                    }

                } else if (type.equals("GeneralTotal")) {
                    String date = request.getParameter("date");

                    List<Agent> agent = (List<Agent>) AgentController.getAllAgents();
                    Object a = null;
                    for (int i = 0; i < agent.size(); i++) {
                        out.print(agent.get(i).getAgent_name() + ":" + SummeryController.getDailyAgentIncome(date, agent.get(i).getAgent_id()) + "!");
                    }

                } else if (type.equals("GeneralTotalIncExp")) {

                    List<Agent> agent = (List<Agent>) AgentController.getAllAgents();
                    Object a = null;
                    for (int i = 0; i < agent.size(); i++) {
                        out.print(agent.get(i).getAgent_name() + ":" + SummeryController.getAgentIncomeExp(agent.get(i).getAgent_id()) + "!");
                    }

                }
            } catch (Exception ex) {
                Logger.getLogger(CheckDailySummery.class.getName()).log(Level.SEVERE, null, ex);
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

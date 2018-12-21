/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AgentController;
import BIT.Project.VTAFMS.Controller.CollectTimeBagController;
import BIT.Project.VTAFMS.Controller.CollectTimeBagLineController;
import BIT.Project.VTAFMS.Controller.RunnerController;
import BIT.Project.VTAFMS.Controller.TimeBagController;
import BIT.Project.VTAFMS.Model.Agent;
import BIT.Project.VTAFMS.Model.CollectTimeBag;
import BIT.Project.VTAFMS.Model.CollectTimeBagLine;
import BIT.Project.VTAFMS.Model.Runner;
import BIT.Project.VTAFMS.Model.TimeBag;
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
@WebServlet(name = "CollectTimeBags", urlPatterns = {"/CollectTimeBags"})
public class CollectTimeBags extends HttpServlet {

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

            String rnum, agent, dt, timeBagCode, openTime, clockVal, closing, packets, availablepkt, btnAdd, action, btnUpdate, btnDelete, rateAmount;
            // int expences, agent, comision = 0, nocomision, lesscommision,cnum;

            action = request.getParameter("action");
            btnUpdate = request.getParameter("Update");
            btnAdd = request.getParameter("Add");
            btnDelete = request.getParameter("delete");
            if (action.equals("add")) {
                int rowcount = Integer.parseInt(request.getParameter("rowcount"));
                rnum = request.getParameter("rnum");
                agent = request.getParameter("agent");
                dt = request.getParameter("dt");
                if (btnAdd != null) {

                    timeBagCode = request.getParameter("timeBagCode[" + 1 + "]");
                    if (btnAdd.equals("Add timeBag")) {

                        CollectTimeBag collecttimebag = new CollectTimeBag(null, dt, Integer.parseInt(rnum), 1, Integer.parseInt(agent));
                        try {
                            int res_collecttimebag = CollectTimeBagController.insertCollectTimeBag(collecttimebag);
                            CollectTimeBagLine collecttimebagline;
                            int lastID = CollectTimeBagController.getMaxId();
                            int res_collecttimebagline = 0;
                            for (int i = 1; i < rowcount; i++) {
                                timeBagCode = request.getParameter("timeBagCode[" + i + "]");
                                openTime = request.getParameter("openTime[" + i + "]");
                                clockVal = request.getParameter("clockVal[" + i + "]");
                                closing = request.getParameter("closing[" + i + "]");
                                packets = request.getParameter("packets[" + i + "]");
                                availablepkt = request.getParameter("availablepkt[" + i + "]");

                                /////////////////////////////
                                rateAmount = request.getParameter("amount[" + i + "]");

                                ////////////////////////////
                                if (!timeBagCode.equals("") && !openTime.equals("") && !clockVal.equals("") && !closing.equals("") && !packets.equals("") && !availablepkt.equals("")) {
                                    collecttimebagline = new CollectTimeBagLine(null, clockVal, openTime, closing, lastID, timeBagCode, rateAmount);
                                    res_collecttimebagline = CollectTimeBagLineController.insertCollectTimeBagLine(collecttimebagline);
                                }
                            }
                            response.sendRedirect("View/TimeBag/CollectTimeBag.jsp?res_timebag=" + res_collecttimebagline);
                        } catch (Exception ex) {
                            Logger.getLogger(CollectTimeBags.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            }
            if (action.equals("timebag")) {
                String timebag_id = request.getParameter("timebag_id");
                CollectTimeBag timebag;
                Runner runner;
                Agent agents;
                try {
                    timebag = CollectTimeBagController.searchCollectTimeBagById(Integer.parseInt(timebag_id));

                    runner = RunnerController.searchRunnerById(timebag.getRunner_id());
                    agents = AgentController.searchAgentById(timebag.getAgent_id());
                    out.print(timebag.getCollection_timeBag_date() + ":"
                            + runner.getRunner_firstName() + " " + runner.getRunner_lastName() + ":"
                            + agents.getAgent_name() + "!");
                } catch (Exception ex) {
                    Logger.getLogger(CollectTimeBags.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (action.equals("timebagLine")) {
                String timebag_id = request.getParameter("timebag_id");
                List<CollectTimeBagLine> collectTimeBagLine;
                try {

                    collectTimeBagLine = (List<CollectTimeBagLine>) CollectTimeBagLineController.getAllCollectTimeBagLinesBytimebagId(timebag_id);
                    for (int i = 0; i < collectTimeBagLine.size(); i++) {
                        out.print(collectTimeBagLine.get(i).getCollection_timeBag_line_id() + "#"
                                + collectTimeBagLine.get(i).getCollection_timeBag_id() + "#"
                                + collectTimeBagLine.get(i).getTime_bag_Code() + "#"
                                + collectTimeBagLine.get(i).getCollection_timeBag_line_OpenTime() + "#"
                                + collectTimeBagLine.get(i).getCollection_timeBag_line_timeValue() + "#"
                                + collectTimeBagLine.get(i).getCollection_timeBag_line_closeTime() + "!");
                    }
                } catch (Exception ex) {
                    Logger.getLogger(CollectTimeBags.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (action.equals("update")) {
                if (btnUpdate != null) {
                    if (btnUpdate.equals("Update timeBag")) {

                        String timebagId = request.getParameter("tnum");

                        int rowcount = Integer.parseInt(request.getParameter("rowcount"));
                        rnum = request.getParameter("rnum");
                        agent = request.getParameter("agent");
                        dt = request.getParameter("dt");
                        timeBagCode = request.getParameter("timeBagCode[" + 1 + "]");

                        System.out.println("timeBagCode : " + timeBagCode);

                        CollectTimeBag collecttimebag = new CollectTimeBag(Integer.parseInt(timebagId), dt, Integer.parseInt(rnum), 1, Integer.parseInt(agent));
                        try {
                            int res_collecttimebag = CollectTimeBagController.updateCollectTimeBag(collecttimebag);
                            CollectTimeBagLine collecttimebagline;

                            int res_deletecollecttimebagline = CollectTimeBagLineController.DeleteCollectTimeBagLineById(timebagId);

                            int res_collecttimebagline;
                            for (int i = 1; i < rowcount; i++) {
                                timeBagCode = request.getParameter("timeBagCode[" + i + "]");
                                openTime = request.getParameter("openTime[" + i + "]");
                                clockVal = request.getParameter("clockVal[" + i + "]");
                                closing = request.getParameter("closing[" + i + "]");
                                packets = request.getParameter("packets[" + i + "]");
                                availablepkt = request.getParameter("availablepkt[" + i + "]");

                                /////////////////////////////
                                rateAmount = request.getParameter("amount[" + i + "]");

                                ////////////////////////////
                                //out.println("timeBagCode : " + timeBagCode + " openTime : " + openTime + " clockVal : " + clockVal + " closing : " + closing + " packets : " + packets + " availablepkt : " + availablepkt+" rowcount : "+rowcount);
                                // System.out.println("timebagId : " + timebagId + " rnum : " + rnum + " agent : " + agent);
                                if (!timeBagCode.equals("") && !openTime.equals("") && !clockVal.equals("") && !closing.equals("") && !packets.equals("") && !availablepkt.equals("")) {

                                    collecttimebagline = new CollectTimeBagLine(null, clockVal, openTime, closing, Integer.parseInt(timebagId), timeBagCode,rateAmount);
                                    res_collecttimebagline = CollectTimeBagLineController.insertCollectTimeBagLine(collecttimebagline);
                                }
                            }

                            response.sendRedirect("View/TimeBag/viewCollectTimeBags.jsp");
                        } catch (Exception ex) {
                            Logger.getLogger(CollectTimeBags.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            }

            if (action.equals("delete")) {
                String timebag_id = request.getParameter("timebag_id");
                if (btnDelete.equals("Delete timebag")) {
                    // String timebag_ids = request.getParameter("timebag_id");

                    // Runner runner = new Runner(Integer.parseInt(runnerId), fname, lname, nic, pnumber, hnumber, email, address);
                    try {
                        // int res_excessLine = ExcessLineController.DeleteExcessLineById(runnerId);
                        // int res_excess = ExcessController.DeleteExcessById(runnerId);
                        //   int res_timebagLine = CollectTimeBagLineController.DeleteTimeBagById(timebag_id);
                        //    int res_timebag = CollectTimeBagController.DeleteCollectTimeBagById(timebag_id);
                        // int result = 0;
                        // if (res_excess > 0) {
                        //     result = 2;
                        // }
                        response.sendRedirect("View/TimeBag/viewCollectTimeBags.jsp");
                        // response.sendRedirect("View/Excess/viewExcess.jsp?ExcessResult=" + result);
                    } catch (Exception ex) {
                        Logger.getLogger(AddRunner.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
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

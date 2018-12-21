/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Controller.GeneralCashController;
import BIT.Project.VTAFMS.Controller.GeneralSummeryController;
import BIT.Project.VTAFMS.Controller.GeneralSummeryLineController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Model.Center;
import BIT.Project.VTAFMS.Model.CenterCash;
import BIT.Project.VTAFMS.Model.GeneralCash;
import BIT.Project.VTAFMS.Model.GeneralSummery;
import BIT.Project.VTAFMS.Model.GeneralSummeryLine;
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
@WebServlet(name = "AddGeneralSummery", urlPatterns = {"/AddGeneralSummery"})
public class AddGeneralSummery extends HttpServlet {

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
            String gname, gnumber, date, chitNumber, amount, payment;
            double namount, lamount, lcnc, exp, papercash, paycoms, fc, pd, paymentTotal, cash, duesub, paysub, balance, due, pay, sliptot, loan, excess;

            gname = request.getParameter("gname");
            lamount = Double.parseDouble(request.getParameter("lamount"));
            gnumber = request.getParameter("gnumber");
            namount = Double.parseDouble(request.getParameter("namount"));
            date = request.getParameter("dates");

            fc = Double.parseDouble(request.getParameter("fc"));
            paymentTotal = Double.parseDouble(request.getParameter("paymentTotal"));
            lcnc = Double.parseDouble(request.getParameter("lcnc"));
            paycoms = Double.parseDouble(request.getParameter("paycoms"));
            papercash = Double.parseDouble(request.getParameter("papercash"));
            //loan = Double.parseDouble(request.getParameter("loan"));
            pd = Double.parseDouble(request.getParameter("pd"));
            cash = Double.parseDouble(request.getParameter("cash"));
            exp = Double.parseDouble(request.getParameter("exp"));
            duesub = Double.parseDouble(request.getParameter("duesub"));
            paysub = Double.parseDouble(request.getParameter("paysub"));
            balance = Double.parseDouble(request.getParameter("balance"));

            loan = Double.parseDouble(request.getParameter("loan"));
            excess = Double.parseDouble(request.getParameter("exc"));

            String btnAdd = request.getParameter("Add");

            try {
                //            out.print("ssdsdasdasd : " + gname + "</br>" + lamount
//                    + lamount + "</br>"
//                    + gnumber + "</br>" + namount + "</br>"
//                    + date + "</br>"
//                    + fc + "</br>"
//                    + paymentTotal + "</br>" + lcnc + "</br>"
//                    + paycoms + "</br>"
//                    + papercash + "</br>"
//                    + "</br>"
//                    + pd + "</br>"
//                    + cash + "</br>"
//                    + exp + "</br>"
//            );
                GeneralCash generalcash = GeneralCashController.searchGeneralCashByDateandId(date, gnumber);

                if (duesub > paysub) {
                    due = duesub - paysub;
                    pay = 0;
                } else {
                    pay = paysub - duesub;
                    due = 0;
                }
                if (btnAdd != null) {
                    if (btnAdd.equals("Add General")) {
                        GeneralSummery gensummery = new GeneralSummery(null, date, gname, namount, lamount, due, pay, lcnc, papercash, paycoms, exp, paymentTotal, loan, excess, "Check", Integer.parseInt(gnumber), 1, generalcash.getGeneralCash_details_id());
                        int res_gensum = GeneralSummeryController.insertGeneralSummery(gensummery);
                        int lastID = GeneralSummeryController.getMaxId();

                        List<Center> center = (List<Center>) CenterController.searchCenterByAgentId(gnumber);
                        Summery summery;
                        GeneralCash generalCash;
                        CenterCash centercash;
                        GeneralSummeryLine generalSummeryline;
                        for (int i = 0; i < center.size(); i++) {
                            summery = SummeryController.searchSummerysBydateandCenterNumber(center.get(i).getCenter_id(), date);
                            generalCash = GeneralCashController.searchGeneralCashByDateandId(center.get(i).getCenter_id(), date);
                            centercash = CenterCashController.searchCenterCashByDateandId(date, center.get(i).getCenter_id());

                            generalSummeryline = new GeneralSummeryLine(null, summery.getSummery_name(), centercash.getCenterCash_details_FullCollection(), summery.getSummery_slippaytot(), lastID, summery.getSummery_id());

                            int res_generalSummeryline = GeneralSummeryLineController.insertGeneralSummery(generalSummeryline);

                            
                        }

 
                        HttpSession session = request.getSession();
                        session.setAttribute("gname", gname);
                        session.setAttribute("gnumber", gnumber);
                        session.setAttribute("date", date);
                        session.setAttribute("fc", fc);
                        session.setAttribute("paymentTotal", paymentTotal);
                        session.setAttribute("lcnc", lcnc);
                        session.setAttribute("paycoms", paycoms);
                        session.setAttribute("papercash", papercash);
                        session.setAttribute("pd", pd);
                        session.setAttribute("cash", cash);
                        session.setAttribute("exp", exp);

                        session.setAttribute("duesub", duesub);
                        session.setAttribute("paysub", paysub);
                        session.setAttribute("balance", balance);

                        response.sendRedirect("View/Summery/ReportGeneralSummery.jsp");
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(AddGeneralSummery.class.getName()).log(Level.SEVERE, null, ex);
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

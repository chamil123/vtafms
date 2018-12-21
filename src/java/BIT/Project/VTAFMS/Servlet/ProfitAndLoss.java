/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Controller.TransactionController;
import BIT.Project.VTAFMS.Model.CenterCash;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProfitAndLoss", urlPatterns = {"/ProfitAndLoss"})
public class ProfitAndLoss extends HttpServlet {

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

            try {
                double centercash = CenterCashController.cashBetweenDates(fromdate, todate);
                double centerdue = CenterCashController.dueBetweenDates(fromdate, todate);
                double nclc = SummeryController.nclcBetweenDates(fromdate, todate);
                double papercash = SummeryController.papercashBetweenDates(fromdate, todate);
                double paymentSlip = SummeryController.paymentSlipBetweenDates(fromdate, todate);
                double travelExpenses = TransactionController.travelExpensesBetweenDates(fromdate, todate);
                double shopRental = TransactionController.shopRentalExpensesBetweenDates(fromdate, todate);
                double labourExp = TransactionController.slabourExpensesBetweenDates(fromdate, todate);
                double repairExp = TransactionController.repairExpensesBetweenDates(fromdate, todate);
                double payrollExp = TransactionController.payrollExpensesBetweenDates(fromdate, todate);
                double generalExp = TransactionController.generalExpensesBetweenDates(fromdate, todate);
                double mealsExp = TransactionController.mealsExpensesBetweenDates(fromdate, todate);
                double commisionExp = TransactionController.commsionExpensesBetweenDates(fromdate, todate);

                HttpSession session = request.getSession();
                session.setAttribute("centercash", centercash);
                session.setAttribute("centerdue", centerdue);
                session.setAttribute("nclc", nclc);
                session.setAttribute("papercash", papercash);
                session.setAttribute("paymentSlip", paymentSlip);
                session.setAttribute("travelExpenses", travelExpenses);
                session.setAttribute("shopRental", shopRental);
                session.setAttribute("labourExp", labourExp);
                session.setAttribute("repairExp", repairExp);
                session.setAttribute("payrollExp", payrollExp);
                session.setAttribute("generalExp", generalExp);
                session.setAttribute("mealsExp", mealsExp);
                session.setAttribute("commisionExp", commisionExp);

                response.sendRedirect("View/Reports/profitAndLoss.jsp");
            } catch (Exception ex) {
                Logger.getLogger(ProfitAndLoss.class.getName()).log(Level.SEVERE, null, ex);
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

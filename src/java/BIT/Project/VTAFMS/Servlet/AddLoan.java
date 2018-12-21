/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.LoanController;
import BIT.Project.VTAFMS.Model.Loan;
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
@WebServlet(name = "AddLoan", urlPatterns = {"/AddLoan"})
public class AddLoan extends HttpServlet {

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

            String btnAdd = request.getParameter("Add");
            String btnsearch = request.getParameter("Search");
            String btnUpdate = request.getParameter("Update");
            String btnDelete = request.getParameter("delete");

            if (btnAdd != null) {
                double amount;
                if (request.getParameter("amount").equals("")) {
                    amount = 0;
                } else {
                    amount = Double.parseDouble(request.getParameter("amount"));
                }
                String date = request.getParameter("date");
                String remark = request.getParameter("remark");
                String dpay = request.getParameter("dpay");
                String rate = request.getParameter("rate");
                String cnumber = request.getParameter("cnumber");
                int account = Integer.parseInt(request.getParameter("account"));
                if (btnAdd.equals("Add loan")) {
                    Loan loan = new Loan(null, amount, date, "Pending", remark, dpay, rate, cnumber, 1, account, amount);
                    int res_loan;
                    try {
                        res_loan = LoanController.insertLoan(loan);
                        response.sendRedirect("View/Loan/Loan.jsp?res_loan=" + res_loan);
                    } catch (Exception ex) {
                        Logger.getLogger(AddLoan.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnUpdate != null) {
                double amount;
                if (request.getParameter("amount").equals("")) {
                    amount = 0;
                } else {
                    amount = Double.parseDouble(request.getParameter("amount"));
                }

                String date = request.getParameter("date");
                String remark = request.getParameter("remark");
                String dpay = request.getParameter("dpay");
                String rate = request.getParameter("rate");
                String cnumber = request.getParameter("cnumber");
                int account = Integer.parseInt(request.getParameter("account"));
                if (btnUpdate.equals("Update loan")) {
                    String loanid = request.getParameter("loanid");
                    Loan loan = new Loan(Integer.parseInt(loanid), amount, date, "Pending", remark, dpay, rate, cnumber, 1, account, amount);
                    try {
                        int res_loan = LoanController.updateLoan(loan);
                        response.sendRedirect("View/Loan/viewLoan.jsp?loanResult=" + res_loan);
                    } catch (Exception ex) {
                        Logger.getLogger(AddRunner.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnDelete != null) {

                if (btnDelete.equals("Delete loan")) {
                    String loanid = request.getParameter("loanid");
                    try {
                        int res_loan = LoanController.DeleteLoanById(loanid);
                        int result = 0;
                        if (res_loan > 0) {
                            result = 2;
                        }
                        response.sendRedirect("View/Loan/viewLoan.jsp?loanResult=" + result);
                    } catch (Exception ex) {
                        Logger.getLogger(AddRunner.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnsearch != null) {
                String search = request.getParameter("searchs");
                String page1 = request.getParameter("page");
                if (btnsearch.equals("search Loan")) {
                    response.sendRedirect("View/Loan/viewLoan.jsp?name=" + search.trim() + "&page1=" + page1);

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

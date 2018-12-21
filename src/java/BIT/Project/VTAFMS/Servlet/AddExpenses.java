/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.TransactionController;
import BIT.Project.VTAFMS.Model.Transaction;
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
@WebServlet(name = "AddExpenses", urlPatterns = {"/AddExpenses"})
public class AddExpenses extends HttpServlet {

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
            String date, payee, account, description;
            double amount;

            date = request.getParameter("date");
            payee = request.getParameter("payee");

            account = request.getParameter("account");
            description = request.getParameter("description");

            String btnAdd = request.getParameter("Add");
            String btnUpdate = request.getParameter("Update");
            String btnDelete = request.getParameter("delete");

            String exp_id = request.getParameter("id");
            if (btnAdd != null) {
                amount = Double.parseDouble(request.getParameter("amount"));
                if (btnAdd.equals("Add Expenses")) {
                    try {
                        Transaction transaction = new Transaction(null, date, payee, amount, description, Integer.parseInt(account));

                        int res_expeneses = TransactionController.insertTransaction(transaction);
                        //  HttpSession session = request.getSession();
                        //session.setAttribute("Login_Expired", "Expired");
                        response.sendRedirect("View/Expenses/AddExpenses.jsp?res_expenses=" + res_expeneses);
                    } catch (Exception ex) {
                        Logger.getLogger(AddExpenses.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnUpdate != null) {
                amount = Double.parseDouble(request.getParameter("amount"));
                if (btnUpdate.equals("Update Expenses")) {
                    try {
                        Transaction transaction = new Transaction(Integer.parseInt(exp_id), date, payee, amount, description, Integer.parseInt(account));

                        int res_expeneses = TransactionController.updateTransaction(transaction);
                        //  HttpSession session = request.getSession();
                        //session.setAttribute("Login_Expired", "Expired");
                        response.sendRedirect("View/Expenses/viewExpenses.jsp?res_expenses=" + res_expeneses);
                    } catch (Exception ex) {
                        Logger.getLogger(AddExpenses.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnDelete != null) {
                if (btnDelete.equals("Delete exp")) {
                    String expId = request.getParameter("exp_id");
                    // Runner runner = new Runner(Integer.parseInt(runnerId), fname, lname, nic, pnumber, hnumber, email, address);
                    try {
                        int res_exp = TransactionController.DeleteTransactionById(expId);
                        int result = 0;
                        if (res_exp > 0) {
                            result = 2;
                        }
                        // HttpSession session = request.getSession();
                        response.sendRedirect("View/Expenses/viewExpenses.jsp?res_expenses=" + result);
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

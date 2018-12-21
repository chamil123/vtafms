/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AccountCategoryController;
import BIT.Project.VTAFMS.Controller.AccountController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Controller.TransactionController;
import BIT.Project.VTAFMS.Model.Account;
import BIT.Project.VTAFMS.Model.AccountCategory;
import BIT.Project.VTAFMS.Model.Transaction;
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
@WebServlet(name = "GetAccountCategoryAmountTotal", urlPatterns = {"/GetAccountCategoryAmountTotal"})
public class GetAccountCategoryAmountTotal extends HttpServlet {

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
                String val = request.getParameter("val");
                if (val.equals("piechart")) {
                    double transactionAmount;
                    double sumAmounts;
                    double totval = 0;
                    List<AccountCategory> accountcat = (List<AccountCategory>) AccountCategoryController.getAllAccountsCategory();
                    for (int i = 0; i < accountcat.size(); i++) {
                        transactionAmount = TransactionController.getSumAccountCategoryValues(accountcat.get(i).getAccount_category_id());
                        sumAmounts = SummeryController.getSumAccountCategoryValues(accountcat.get(i).getAccount_category_id());
                        totval = transactionAmount + sumAmounts;
                        out.print(accountcat.get(i).getAccount_category_name().concat(":") + totval + "!");
                    }
                }
                if (val.equals("barchart")) {
                    double paymentTotal = 0;
                    double papercash = 0;
                    double lcnc = 0;
                    double commisionPayment = 0;
                    List<Object> summerylist = (List<Object>) SummeryController.getPaymentOrderBydate(null, null);
                    for (int i = 0; i < summerylist.size(); i++) {
                        paymentTotal = Double.parseDouble(summerylist.get(0).toString());
                        lcnc = Double.parseDouble(summerylist.get(1).toString());
                        papercash = Double.parseDouble(summerylist.get(2).toString());
                        commisionPayment = Double.parseDouble(summerylist.get(3).toString());

                    }

                    Transaction transaction;

                    List<Account> account = (List<Account>) AccountController.getAllAccounts();
                    String acountNAme = "";
                    double accountAmmount = 0;
                    for (int i = 0; i < account.size(); i++) {
                        transaction = TransactionController.getTotalTransactionAmountByAccount(account.get(i).getAccount_id(), null, null);

                        System.out.println("account list : " + transaction.getTransaction_payee() + "   " + transaction.getTransaction_type() + "  " + transaction.getTransaction_amount());
                        String name = account.get(i).getAccount_name();
                        String split[] = name.split(" ");
                        acountNAme = split[0];
                        if (account.get(i).getAccount_id() == transaction.getAccount_id()) {

                            accountAmmount = transaction.getTransaction_amount();
                        } else if (account.get(i).getAccount_name().equals("Betting Slip Payment")) {
                            acountNAme = "BSlp Pay";
                            accountAmmount = paymentTotal;
                        } else if (account.get(i).getAccount_name().equals("Paper Cash")) {
                            acountNAme = "Papr Csh";
                            accountAmmount = papercash;
                        } else if (account.get(i).getAccount_name().equals("Commision Given")) {
                            acountNAme = "Com Given";
                            accountAmmount = lcnc;
                        } else if (account.get(i).getAccount_name().equals("Commissions and fees")) {
                            acountNAme = "Com fees";
                            accountAmmount = commisionPayment;
                        }

                        out.print(acountNAme.concat(":") + accountAmmount + "!");
                        accountAmmount = 0;
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(GetAccountCategoryAmountTotal.class.getName()).log(Level.SEVERE, null, ex);
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

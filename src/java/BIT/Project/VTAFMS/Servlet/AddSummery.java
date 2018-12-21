/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AccountController;
import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.CenterExpensesController;
import BIT.Project.VTAFMS.Controller.ExcessController;
import BIT.Project.VTAFMS.Controller.ExcessLineController;
import BIT.Project.VTAFMS.Controller.LoanController;
import BIT.Project.VTAFMS.Controller.NotificationController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Controller.SummeryLineController;
import BIT.Project.VTAFMS.Controller.TransactionController;
import BIT.Project.VTAFMS.Model.Account;
import BIT.Project.VTAFMS.Model.CenterCash;
import BIT.Project.VTAFMS.Model.CenterExpenses;
import BIT.Project.VTAFMS.Model.Excess;
import BIT.Project.VTAFMS.Model.ExcessLine;
import BIT.Project.VTAFMS.Model.Loan;
import BIT.Project.VTAFMS.Model.Notification;
import BIT.Project.VTAFMS.Model.Summery;
import BIT.Project.VTAFMS.Model.SummeryLine;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chamil
 */
@WebServlet(name = "AddSummery", urlPatterns = {"/AddSummery"})
public class AddSummery extends HttpServlet {

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
            int rowcount = Integer.parseInt(request.getParameter("rowcount"));

            String cname, cnumber, date, chitNumber, amount, payment;
            double namount, lamount, lcnc, exp, papercash, paycoms, fc, pd, paymentTotal, cash, duesub, paysub, balance, due, pay, sliptot, loan, excess;

            cname = request.getParameter("cname");
            lamount = Double.parseDouble(request.getParameter("lamount"));
            cnumber = request.getParameter("cnumber");
            namount = Double.parseDouble(request.getParameter("namount"));
            date = request.getParameter("dates");

            paymentTotal = Double.parseDouble(request.getParameter("paymentTotal"));
            lcnc = Double.parseDouble(request.getParameter("lcnc"));
            paycoms = Double.parseDouble(request.getParameter("paycoms"));
            papercash = Double.parseDouble(request.getParameter("papercash"));
            exp = Double.parseDouble(request.getParameter("exp"));
            loan = Double.parseDouble(request.getParameter("loan"));
            excess = Double.parseDouble(request.getParameter("exc"));

            String btnAdd = request.getParameter("Add");
            String btnUpdate = request.getParameter("Update");

            try {
                CenterCash centercash = CenterCashController.searchCenterCashByDateandId(date, cnumber);
                fc = centercash.getCenterCash_details_FullCollection();
                pd = centercash.getCenterCash_details_passDue();
                cash = centercash.getCenterCash_details_cash();
                duesub = fc + lcnc + papercash + pd + loan;
                paysub = paymentTotal + paycoms + exp + cash;

                if (duesub > paysub) {
                    due = duesub - paysub;
                    pay = 0;
                } else {
                    pay = paysub - duesub;
                    due = 0;
                }
                if (btnAdd != null) {
                    if (btnAdd.equals("Add summery")) {
                        Summery summery = new Summery(null, date, cname, namount, lamount, due, pay, cnumber, 1, centercash.getCenterCash_details_id(), lcnc, papercash, paycoms, exp, paymentTotal, loan, excess, "Check");
                        int res_summery = SummeryController.insertSummery(summery);
                        int lastID = SummeryController.getMaxId();
                        SummeryLine summeryline;
                        int res_summeryLine;
                        for (int i = 0; i < rowcount; i++) {
                            chitNumber = request.getParameter("houseNum[" + i + "]");
                            amount = request.getParameter("city[" + i + "]");
                            payment = request.getParameter("country[" + i + "]");
                            if (!chitNumber.equals("") && !amount.equals("") && !payment.equals("")) {
                                summeryline = new SummeryLine(null, lastID, chitNumber, Double.parseDouble(amount), Double.parseDouble(payment), date);
                                res_summeryLine = SummeryLineController.insertSummeryLine(summeryline);
                            }
                        }
                        List<CenterExpenses> cexp;
                        Transaction transaction;
                        Account account;
                        int res_exptrans;
                        cexp = (List<CenterExpenses>) CenterExpensesController.getAllcenterExpensesByCenterID(cnumber);
                        for (int i = 0; i < cexp.size(); i++) {
                            account = AccountController.getAllAccountByName(cexp.get(i).getCenter_expenses_expenseName());
                            transaction = new Transaction(null, date, cname, cexp.get(i).getCenter_expenses_amount(), "bookey expenses", account.getAccount_id());
                            res_exptrans = TransactionController.insertTransaction(transaction);
                        }

                        /*for loan deduction acording to daily summery*/
                        List<Loan> loans = (List<Loan>) LoanController.getLoansByCenterID(cnumber);
                        double deductBal = 0;
                        double balanceAmount = 0;
                        double shedulePay = 0;
                        Loan loan2;
                        //   Loan loan3;
                        Notification notification;
                        for (int j = 0; j < loans.size(); j++) {

                            balanceAmount = loans.get(j).getLoan_balance();
                            shedulePay = Double.parseDouble(loans.get(j).getLoan_scheduleOfPayment());
                            if (balanceAmount <= 0) {
                            } else if (balanceAmount < shedulePay) {
                                deductBal = balanceAmount - balanceAmount;
                                //  String status="Completed";
                                int resLoan = LoanController.updateLoanByIdAndBalaandStatus(loans.get(j).getLoan_id(), deductBal, "Completed");

                                notification = new Notification(null, cname, "complete deduction loan in " + cname + " date of " + loans.get(j).getLoan_dateRelease() + " ", "Active");
                                int res_not = NotificationController.insertNotification(notification);
                            } else {
                                deductBal = balanceAmount - shedulePay;
                                int resLoan = LoanController.updateLoanByIdAndBalance(loans.get(j).getLoan_id(), deductBal);
                                System.out.println("daily dudcution amount : " + loans.get(j).getLoan_scheduleOfPayment() + " amount : " + loans.get(j).getLoan_amount());
                            }
                        }
                        //totLoanAmount += Double.parseDouble(loans.get(j).getLoan_scheduleOfPayment());

                        /*end loan deduction*/
                        HttpSession session = request.getSession();
                        session.setAttribute("date", date);
                        session.setAttribute("cname", cname);
                        session.setAttribute("due", due);
                        session.setAttribute("pay", pay);
                        session.setAttribute("cnumber", cnumber);
                        session.setAttribute("lcnc", lcnc);
                        session.setAttribute("papercash", papercash);
                        session.setAttribute("paycoms", paycoms);
                        session.setAttribute("exp", exp);
                        session.setAttribute("fc", fc);
                        session.setAttribute("pd", pd);
                        session.setAttribute("cash", cash);
                        session.setAttribute("duesub", duesub);
                        session.setAttribute("paysub", paysub);
                        session.setAttribute("paymentTotal", paymentTotal);
                        session.setAttribute("lastID", lastID);
                        session.setAttribute("loan", loan);
                        session.setAttribute("excess", excess);

                        response.sendRedirect("View/Summery/summeryJasper.jsp");
                    }
                }
                if (btnUpdate != null) {
                    if (btnUpdate.equals("Update summery")) {
                        String summery_id = request.getParameter("summery_id");
                        System.out.println("susssssssssssssss : "+summery_id);
                        try {
                            Summery summery = new Summery(Integer.parseInt(summery_id), date, cname, namount, lamount, due, pay, cnumber, 1, centercash.getCenterCash_details_id(), lcnc, papercash, paycoms, exp, paymentTotal, loan, excess, "Check");
                            int res_summery = SummeryController.updateSummery(summery);

                           
                            SummeryLine summeryline;
                            int res_summeryLine;
                            
                            int resDeletSummeryLine=SummeryLineController.DeleteSummeryLineByDateAndSummeryId(date,summery_id);
                           // List<SummeryLine> summeryList=(List<SummeryLine>)SummeryLineController.getAllSummeryLinesByDateAndSummeryId(date,summery_id);
                           
                            for (int i = 0; i < rowcount; i++) {
                                chitNumber = request.getParameter("houseNum[" + i + "]");
                                amount = request.getParameter("city[" + i + "]");
                                payment = request.getParameter("country[" + i + "]");
                                
                                
                                
                                if (!chitNumber.equals("") && !amount.equals("") && !payment.equals("")) {
                                    
                                    
                                //    summeryline = new SummeryLine(null, Integer.parseInt(summery_id), chitNumber, Double.parseDouble(amount), Double.parseDouble(payment), date);
                                 //   res_summeryLine = SummeryLineController.insertSummeryLine(summeryline);
                                }
                            }

                        } catch (Exception ex) {
                            Logger.getLogger(AddExcess.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }

            } catch (Exception ex) {
                Logger.getLogger(AddSummery.class.getName()).log(Level.SEVERE, null, ex);
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

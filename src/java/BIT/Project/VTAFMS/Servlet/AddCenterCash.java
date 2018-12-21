/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.TransactionController;
import BIT.Project.VTAFMS.Model.CenterCash;
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
@WebServlet(name = "AddCenterCash", urlPatterns = {"/AddCenterCash"})
public class AddCenterCash extends HttpServlet {

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
            String cnumber, cname, aname, cdt;
            int account,anumber;
            double fc, cash, pdue;

            cname = request.getParameter("cname");
            cdt = request.getParameter("cdt");
            cnumber = request.getParameter("cnumber");
            aname = request.getParameter("aname");

            String btnAdd = request.getParameter("Addcash");
            String btnUpdate = request.getParameter("Update");
            String btnDelete = request.getParameter("delete");
            String iddelete = request.getParameter("iddelete");


            String c_cashID = request.getParameter("c_cashID");
            if (btnAdd != null) {

                if (btnAdd.equals("Add cash")) {
                    fc = Double.parseDouble(request.getParameter("fc"));
                    cash = Double.parseDouble(request.getParameter("cash"));
                    pdue = Double.parseDouble(request.getParameter("pdue"));
                    account = Integer.parseInt(request.getParameter("account"));
                    anumber = Integer.parseInt(request.getParameter("anumber"));
                    System.out.print("sout KS :" + cnumber);

                    CenterCash centercash = new CenterCash(null, fc, cash, cdt, pdue, cnumber, anumber);
                    Transaction transaction = new Transaction(null, cdt, cnumber, cash, "Collet cash", account);

                    try {
                        int res_cash = CenterCashController.insertCenterCash(centercash);
                        int res_exptrans = TransactionController.insertTransaction(transaction);

                        response.sendRedirect("View/Cash/CenterCashDetails.jsp?res_cash=" + res_cash);
                    } catch (Exception ex) {
                        Logger.getLogger(AddCenterCash.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    // int res_address = CenterController.insertCenter(center);

                }
            }
            if (btnUpdate != null) {
                if (btnUpdate.equals("Update cash")) {
                    fc = Double.parseDouble(request.getParameter("fc"));
                    cash = Double.parseDouble(request.getParameter("cash"));
                    pdue = Double.parseDouble(request.getParameter("pdue"));
                    account = Integer.parseInt(request.getParameter("account"));

                    CenterCash centercash = new CenterCash(Integer.parseInt(c_cashID), fc, cash, cdt, pdue, cnumber, account);
                    try {
                        int res_centercash = CenterCashController.updateCenterCash(centercash);
                        response.sendRedirect("View/Cash/viewCenterCash.jsp?res_centercash=" + res_centercash);
                    } catch (Exception ex) {
                        Logger.getLogger(AddRunner.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnDelete != null) {
                if (btnDelete.equals("Delete cash")) {

                    //  CenterCash centercash = new CenterCash(Integer.parseInt(iddelete), fc, cash, cdt, pdue, cnumber, account);
                    try {
                        int res_centercash = CenterCashController.DeleteCenterCashById(iddelete);
                        int result = 0;
                        if (res_centercash > 0) {
                            result = 2;
                        }

                        response.sendRedirect("View/Cash/viewCenterCash.jsp?res_centercash=" + result);
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

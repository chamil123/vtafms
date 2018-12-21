/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AccountController;
import BIT.Project.VTAFMS.Model.Account;
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
@WebServlet(name = "AddAccount", urlPatterns = {"/AddAccount"})
public class AddAccount extends HttpServlet {

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
            String acatnum, acname, stbalnce, des, btnAdd;
            acatnum = request.getParameter("acatnum");
            acname = request.getParameter("acname");
            stbalnce = request.getParameter("stbalnce");
            des = request.getParameter("des");
            btnAdd = request.getParameter("Add");
            String btnUpdate = request.getParameter("Update");
            String btnDelete = request.getParameter("delete");
            if (btnAdd != null) {
                if (btnAdd.equals("Add Account")) {

                    try {
                        Account account = new Account(null, acname, Double.parseDouble(stbalnce), Integer.parseInt(acatnum), des);
                        int res_account = AccountController.insertAccount(account);

                        response.sendRedirect("View/Account/Account.jsp?res_account=" + res_account);
                    } catch (Exception ex) {
                        Logger.getLogger(AddAccount.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnUpdate != null) {
                if (btnUpdate.equals("Update Account")) {
                    String accountId = request.getParameter("id");
                    System.out.println("a : "+Integer.parseInt(accountId));
                     System.out.println("b : "+acname);
                      System.out.println("c : "+Double.parseDouble(stbalnce));
                       System.out.println("d : "+Integer.parseInt(acatnum));
                        System.out.println("e : "+des);
                        
                    Account account = new Account(Integer.parseInt(accountId), acname, Double.parseDouble(stbalnce), Integer.parseInt(acatnum), des);
                    int res_account;
                    try {
                        res_account = AccountController.updateAccount(account);
                        // HttpSession session = request.getSession();
                        response.sendRedirect("View/Account/viewAccounts.jsp?accountResult=" + res_account);
                    } catch (Exception ex) {
                        Logger.getLogger(AddAccount.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            if (btnDelete != null) {
                if (btnDelete.equals("Delete Account")) {
                    String accountId = request.getParameter("account_id");
                    try {
                        int res_runner = AccountController.DeleteAccountById(accountId);
                        int result = 0;
                        if (res_runner > 0) {
                            result = 2;
                        }
                       // HttpSession session = request.getSession();
                        response.sendRedirect("View/Account/viewAccounts.jsp?accountResult=" + result);
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

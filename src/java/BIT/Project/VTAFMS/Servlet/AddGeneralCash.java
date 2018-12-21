/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.GeneralCashController;
import BIT.Project.VTAFMS.Model.GeneralCash;
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
@WebServlet(name = "AddGeneralCash", urlPatterns = {"/AddGeneralCash"})
public class AddGeneralCash extends HttpServlet {

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
          String cnumber, cname, aname, cdt;
            int account,anumber;
            double fc, cash, pdue;

            cname = request.getParameter("aname");
            cdt = request.getParameter("cdt");
            cnumber = request.getParameter("anumber");
            aname = request.getParameter("aname");

            String btnAdd = request.getParameter("Addcash");
            String btnUpdate = request.getParameter("Update");
            String btnDelete = request.getParameter("delete");
            String iddelete = request.getParameter("iddelete");


            String c_cashID = request.getParameter("c_cashID");
            if (btnAdd != null) {

                if (btnAdd.equals("Add cash")) {
                    
                    cash = Double.parseDouble(request.getParameter("cash"));
                    pdue = Double.parseDouble(request.getParameter("pdue"));
                    account = Integer.parseInt(request.getParameter("account"));
                    anumber = Integer.parseInt(request.getParameter("anumber"));
   

                    GeneralCash generalcash = new GeneralCash(null, cash, pdue,cdt, anumber);
                   
                        int res_cash;
                    try {
                        res_cash = GeneralCashController.insertCenterCash(generalcash);
                         response.sendRedirect("View/Cash/GeneralCashDetails.jsp?res_cash=" + res_cash);
                    } catch (Exception ex) {
                        Logger.getLogger(AddGeneralCash.class.getName()).log(Level.SEVERE, null, ex);
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

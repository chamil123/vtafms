/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Controller.GeneralCashController;
import BIT.Project.VTAFMS.Model.CenterCash;
import BIT.Project.VTAFMS.Model.GeneralCash;
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
@WebServlet(name = "DailyCashDetails", urlPatterns = {"/DailyCashDetails"})
public class DailyCashDetails extends HttpServlet {

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
                String value = request.getParameter("value");
                 String date = request.getParameter("date");
                

                if (value.equals("normal")) {
                    List<CenterCash> list = (List<CenterCash>) CenterCashController.getAllCenterCash();
                    for (int i = 0; i < list.size(); i++) {
//                   center = CenterController.searchCenterById(list.get(i).getCenter_id());
                        out.print(list.get(i).getCenterCash_details_FullCollection() + ":"
                                + list.get(i).getCenterCash_details_cash() + ":"
                                + list.get(i).getCenterCash_details_date() + ":"
                                + list.get(i).getCenterCash_details_passDue() + ":"
                                + list.get(i).getCenter_id() + ":"+list.get(i).getCenterCash_details_id()+":"+list.get(i).getAccount_id()+"!");
                    }
                } else if (value.equals("gen")) {
                     List<GeneralCash> list = (List<GeneralCash>) GeneralCashController.getAllGeneralCash();
                    for (int i = 0; i < list.size(); i++) {
//                   center = CenterController.searchCenterById(list.get(i).getCenter_id());
                        out.print(list.get(i).getGeneralCash_details_cash()+ ":"
                                + list.get(i).getGeneralCash_details_date()+ ":"
                                + list.get(i).getGeneralCash_details_passDue()+ ":"
                                + list.get(i).getAgent_id()+ "!");
                        System.out.print("sssssssdd : " + value);
                    }
                }else if (value.equals("viewCash")) {
                     List<CenterCash> list = (List<CenterCash>) CenterCashController.searchCenterCashById(date);
                     
                      System.out.print("sssssssddsssfffff : " + date);
                    for (int i = 0; i < list.size(); i++) {
                         System.out.print("svvvvvvvvvvvvv : " + list.get(i).getCenterCash_details_date());
//                   center = CenterController.searchCenterById(list.get(i).getCenter_id());
                        out.print(list.get(i).getCenterCash_details_date()+ ":"
                                + list.get(i).getCenterCash_details_FullCollection()+ ":"
                                + list.get(i).getCenterCash_details_cash()+ ":"
                                + list.get(i).getCenterCash_details_passDue()+ "!");
                       
                    }
                }
                
            } catch (Exception ex) {
                Logger.getLogger(DailyCashDetails.class.getName()).log(Level.SEVERE, null, ex);
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

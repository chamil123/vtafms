/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.NotificationController;
import BIT.Project.VTAFMS.Controller.SummeryController;
import BIT.Project.VTAFMS.Model.Notification;
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
@WebServlet(name = "AddNotification", urlPatterns = {"/AddNotification"})
public class AddNotification extends HttpServlet {

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
            String btnnotif = request.getParameter("notification");
              String summery_id = request.getParameter("summery_id");
            String action = request.getParameter("action");
            if (btnnotif != null) {
              
                String centername = request.getParameter("centername");
                String remark = request.getParameter("remark");

                if (btnnotif.equals("Addnotification")) {
                    Notification notification = new Notification(null, centername, remark, "Active");
                    try {
                        int res_notification = NotificationController.insertNotification(notification);
                        int res_updateSummery = SummeryController.UpdateSummeryStatus(summery_id,"Uncheck");
                        response.sendRedirect("View/Summery/viewSummery.jsp");
                    } catch (Exception ex) {
                        Logger.getLogger(AddNotification.class.getName()).log(Level.SEVERE, null, ex);
                    }

                }
            }
            if (action != null) { 
                 if (action.equals("Check")) {
                    try {
                        int res_updateSummery = SummeryController.UpdateSummeryStatus(summery_id,"Check");
                        response.sendRedirect("View/Summery/viewSummery.jsp");
                    } catch (Exception ex) {
                        Logger.getLogger(AddNotification.class.getName()).log(Level.SEVERE, null, ex);
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

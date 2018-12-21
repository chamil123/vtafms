/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.UserController;
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
@WebServlet(name = "UserActivation", urlPatterns = {"/UserActivation"})
public class UserActivation extends HttpServlet {

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

            //   $action = $_GET['action'];
            String action = request.getParameter("action");
            String userId = request.getParameter("user_id");
            try {
                if (action.equals("deactivate")) {
                    int result = UserController.deactivateUser(userId);
                    if (result == 1) {
                        out.print("User id : has been deactivated");
                    } else {
                        out.print("User id :not has been activated");
                    }
                    response.sendRedirect("View/User/viewUser.jsp");

                }
                if (action.equals("activate")) {
                    int result = UserController.activateUser(userId);
                    if (result == 1) {
                        out.print("User id : has been activated");
                    } else {
                        out.print("User id :not has been deactivated");
                    }
                    response.sendRedirect("View/User/viewUser.jsp");
                }
                if (action.equals("delete")) {
                    int res_runner = UserController.DeleteUserById(userId);
                    int result = 0;
                    if (res_runner > 0) {
                        result = 2;
                    }
                    response.sendRedirect("View/User/viewUser.jsp?userResult=" + result);
//

                }

            } catch (Exception ex) {
                Logger.getLogger(UserActivation.class.getName()).log(Level.SEVERE, null, ex);
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

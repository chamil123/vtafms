/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.LoginController;
import BIT.Project.VTAFMS.Controller.RoleController;
import BIT.Project.VTAFMS.Controller.UserController;
import BIT.Project.VTAFMS.Model.Login;
import BIT.Project.VTAFMS.Model.Role;
import BIT.Project.VTAFMS.Model.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "LoginCheck", urlPatterns = {"/LoginCheck"})
public class LoginCheck extends HttpServlet {

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
            System.out.println("dsdsdsd");
            // get parameter from login view page
            String uname = request.getParameter("uname");
            String pword = request.getParameter("pword");
            //check given username and password is empty
           
            if (!uname.equals("") && !pword.equals("")) {
                
                try {
                    //pass login controller and check into database
                    
                    Login login = LoginController.serchLoginByUsernameAndPassword(uname, pword);
                     System.out.println("pword : "+login);
                    System.out.println("dasds : " + pword);
                    
                    if (login != null) {
                        User user = UserController.searchUserById(login.getUser_id());
                        Role role = RoleController.searchRoleById(user.getRole_id());
                        //create session object and apend username and password
                        HttpSession session = request.getSession();
                        session.setAttribute("username", login.getLogin_username());
                        session.setAttribute("name", user.getUser_firstName() + " " + user.getUser_lastName());
                        session.setAttribute("password", login.getLogin_password());
                        session.setAttribute("user_id", user.getRole_id());
                        session.setAttribute("userid", user.getUser_id());
                        session.setAttribute("user_role", role.getRole_name());
                        session.setAttribute("user_image", user.getUser_image());

                        //if username and password is match in database redirect the dashboard
                        if (user.getRole_id() == 1) {
                            response.sendRedirect("View/Dashboard/Dashboard.jsp");
                        } else if (user.getRole_id() == 5) {
                          
                            response.sendRedirect("View/Dashboard/DashboardUser.jsp");
                        }


                    } else {
                        String msg = "Sorry! cannot complete login due to an incorrect username or password ";
                        response.sendRedirect("login.jsp?msg='" + msg + "'");
                    }
                } catch (Exception ex) {
                    Logger.getLogger(LoginCheck.class.getName()).log(Level.SEVERE, null, ex);
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

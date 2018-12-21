/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.LoginController;
import BIT.Project.VTAFMS.Controller.UserController;
import BIT.Project.VTAFMS.Model.Login;
import BIT.Project.VTAFMS.Model.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.Alert;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Chamil
 */
@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
public class AddUser extends HttpServlet {

    String fname = "";
    public final String UPLOAD_DIRECTORY = "E:/AMERCK/Project/Chamil/VTAFMS/web/uploads";

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
            /*all the variable declair and initial in this*/
            String btnAdd = null, fstname = null, lname = null, nic = null, gender = null, uname = null, pnumber = null, email = null,
                    address = null, status = null, img = null, btnUpdate = null, btnDelete = null, id = null, userId = null, btnUpdatepro = null, password = "";
            int role = 0;
            String dob = "";
            /*end variable declairation*/
            
            /*check for the multipart content. because get all user details from user jsp and store into multipart content varible,
            if multipart contend have values then go to the body condent*/
            if (ServletFileUpload.isMultipartContent(request)) {

                List<FileItem> multiparts;
                try {
                    multiparts = new ServletFileUpload(
                            new DiskFileItemFactory()).parseRequest(request);

                    for (FileItem item : multiparts) {
                        if (!item.isFormField()) {
                            fname = new File(item.getName()).getName();
                            item.write(new File(UPLOAD_DIRECTORY + File.separator + fname));

                        }
                        String ss = item.getFieldName();
                        if (item.getFieldName().equals("fname")) {
                            fstname = item.getString();
                        }
                        if (item.getFieldName().equals("lname")) {
                            lname = item.getString();
                        }
                        if (item.getFieldName().equals("dob")) {
                            dob = item.getString();

                        }
                        if (item.getFieldName().equals("nic")) {
                            nic = item.getString();
                        }
                        if (item.getFieldName().equals("gender")) {
                            gender = item.getString();
                        }
                        if (item.getFieldName().equals("uname")) {
                            uname = item.getString();
                        }
                        if (item.getFieldName().equals("pnumber")) {
                            pnumber = item.getString();
                        }
                        if (item.getFieldName().equals("email")) {
                            email = item.getString();
                        }
                        if (item.getFieldName().equals("address")) {
                            address = item.getString();
                        }
                        if (item.getFieldName().equals("role")) {
                            role = Integer.parseInt(item.getString());
                        }
                        /* if (item.getFieldName().equals("status")) {
                            status = item.getString();
                        }*/
                        if (item.getFieldName().equals("Add")) {
                            btnAdd = item.getString();
                        }
                        if (item.getFieldName().equals("Update")) {
                            btnUpdate = item.getString();
                        }
                        if (item.getFieldName().equals("Updateprofile")) {
                            btnUpdatepro = item.getString();
                        }
                        if (item.getFieldName().equals("delete")) {
                            btnDelete = item.getString();
                        }
                        if (item.getFieldName().equals("id")) {
                            id = item.getString();
                        }
                        if (item.getFieldName().equals("user_id")) {
                            userId = item.getString();
                        }
                        if (item.getFieldName().equals("pwd")) {
                            password = item.getString();
                        }

                    }
                    User user;
                    Login login;
                    if (btnAdd != null) {
                        if (btnAdd.equals("AddUser")) {
                            user = new User(null, fstname, lname, email, "Activate", fname, pnumber, gender, dob, nic, address, uname, role); // response.sendRedirect("AddSenator.jsp?id=" + id);
                            int res_person = UserController.insertUser(user);

                            int max = UserController.getMaxId();
                            String passpd = "123";
                            login = new Login(max, uname, passpd);
                            int res_login = LoginController.insertlogin(login);

                            response.sendRedirect("View/User/User.jsp?res_person=" + res_person);

                        }
                    }

                    if (btnUpdate != null) {
                        if (btnUpdate.equals("Update User")) {
                            user = new User(Integer.parseInt(id), fstname, lname, email, "Activate", fname, pnumber, gender, dob, nic, address, uname, role);
                            int res_user = UserController.updateUser(user);
                            HttpSession session = request.getSession();
                            response.sendRedirect("View/User/viewUser.jsp?userResult=" + res_user);

                        }
                    }
                    if (btnUpdatepro != null) {
                        if (btnUpdatepro.equals("Update Profile")) {
                            user = new User(Integer.parseInt(id), fstname, lname, email, "Activate", fname, pnumber, gender, dob, nic, address, uname, role);
                            int res_user = UserController.updateUserProfile(user);
                            int res_login = LoginController.resetPasswordAndUsername(id, password, uname);
                            HttpSession session = request.getSession();
                            response.sendRedirect("View/User/UserProfile.jsp?userResult=" + res_user);
                        }
                    }

                } catch (FileUploadException ex) {
                    Logger.getLogger(AddUser.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(AddUser.class.getName()).log(Level.SEVERE, null, ex);
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

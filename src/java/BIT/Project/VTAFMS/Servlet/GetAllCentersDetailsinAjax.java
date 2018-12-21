/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.AgentController;
import BIT.Project.VTAFMS.Controller.CenterCashController;
import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Controller.ExcessController;
import BIT.Project.VTAFMS.Controller.LoanController;
import BIT.Project.VTAFMS.Model.Agent;
import BIT.Project.VTAFMS.Model.Center;
import BIT.Project.VTAFMS.Model.CenterCash;
import BIT.Project.VTAFMS.Model.Excess;
import BIT.Project.VTAFMS.Model.Loan;
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
@WebServlet(name = "GetAllCentersDetailsinAjax", urlPatterns = {"/GetAllCentersDetailsinAjax"})
public class GetAllCentersDetailsinAjax extends HttpServlet {

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
            String ids = request.getParameter("id");
            try {
                List<Center> center = (List<Center>) CenterController.getAllCenters();
                Agent agent;
                // CenterCash centercash;
                List<Loan> loan;
                Double totexcess;
                double totLoanAmount = 0;
                double loanbalAmount = 0;
                double loanshedulepay = 0;
                String centerId;
                for (int i = 0; i < center.size(); i++) {
                    centerId = center.get(i).getCenter_id();
                    /*daily deduction loans acording to center*/
                    loan = (List<Loan>) LoanController.getLoansByCenterID(center.get(i).getCenter_id());
                    for (int j = 0; j < loan.size(); j++) {
                        if (centerId.equals(loan.get(j).getCenter_id())) {
                            loanbalAmount = loan.get(j).getLoan_balance();
                            loanshedulepay = Double.parseDouble(loan.get(j).getLoan_scheduleOfPayment());
                            if (loanbalAmount <= 0) {
                                totLoanAmount += 0;
                            } else {
                                if (loanbalAmount < loanshedulepay) {
                                    totLoanAmount += loanbalAmount;
                                } else {
                                    totLoanAmount += loanshedulepay;
                                }

                            }
                            //totLoanAmount += Double.parseDouble(loan.get(j).getLoan_scheduleOfPayment());
                        }
                    }
                    /*end deduction loans */
                    agent = AgentController.searchAgentById(center.get(i).getAgent_id());
                    // centercash = CenterCashController.searchCenterCashById(center.get(i).getCenter_id());
                    totexcess = ExcessController.getexcessTotalByid(center.get(i).getCenter_id());
                    //System.out.println("run venavacah yipee : "+center.get(i).getCenter_id());

                    out.print(center.get(i).getCenter_id().concat(":")
                            + center.get(i).getCenter_Name().concat(":")
                            + center.get(i).getCenter_com() + ":"
                            + center.get(i).getCenter_nc() + ":"
                            + center.get(i).getCenter_lc() + ":"
                            + center.get(i).getCenter_papercash() + ":"
                            + agent.getAgent_name() + ":" + totLoanAmount + ":"+center.get(i).getCenter_expenses()+"!");
                    totLoanAmount = 0;
                }

            } catch (Exception ex) {
                Logger.getLogger(GetAllCentersDetailsinAjax.class.getName()).log(Level.SEVERE, null, ex);
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

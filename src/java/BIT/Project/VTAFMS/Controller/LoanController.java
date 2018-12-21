/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.LoanDAO;
import BIT.Project.VTAFMS.DaoImpl.LoanDAOImpl;
import BIT.Project.VTAFMS.Model.Loan;

/**
 *
 * @author Chamil
 */
public class LoanController {

    private static LoanDAO loanDao = new LoanDAOImpl();

    public static int insertLoan(Loan loan) throws Exception {
        return loanDao.insert(loan);
    }

    public static Loan searchLoanById(int id) throws Exception {
        return loanDao.searchLoanById(id);
    }

    public static Object getAllLoans() throws Exception {
        return loanDao.viewAll();
    }

    public static int updateLoan(Loan loan) throws Exception {
        return loanDao.update(loan);
    }

    public static int DeleteLoanById(String id) throws Exception {
        return loanDao.delete(id);
    }

    public static Object getLoansByCenterID(String id) throws Exception {
        return loanDao.getLoansByCenterID(id);
    }

    public static int updateLoanByIdAndBalance(int id, double balance) throws Exception {
        return loanDao.updateLoanByIdAndBalance(id, balance);
    }

    public static int updateLoanByIdAndBalaandStatus(int id, double balance, String status) throws Exception {
        return loanDao.updateLoanByIdAndBalaandStatus(id, balance, status);
    }

    public static double getRowCount() throws Exception {
        return loanDao.getRowCount();
    }

    public static Object limitresult(String page) throws Exception {
        return loanDao.limitResult(page);
    }

    public static int getRowCountSearch(String id) throws Exception {
        return loanDao.getRowCountSearch(id);
    }

    public static Object searchAndlimitResult(String name, String page) throws Exception {
        return loanDao.searchAndlimitResult(name, page);
    }
}

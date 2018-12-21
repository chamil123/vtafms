/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.TransactionDAO;
import BIT.Project.VTAFMS.DaoImpl.TransactionDAOImpl;
import BIT.Project.VTAFMS.Model.Transaction;

/**
 *
 * @author Chamil
 */
public class TransactionController {

    private static TransactionDAO transactionDao = new TransactionDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertTransaction(Transaction transaction) throws Exception {

        return transactionDao.insert(transaction);

    }

    public static Object getAllTransactions() throws Exception {
        return transactionDao.viewAll();
    }

    public static int updateTransaction(Transaction transaction) throws Exception {
        return transactionDao.update(transaction);
    }

    public static int getRowCount() throws Exception {
        return transactionDao.getRowCount();
    }

    public static int getRowCountSearch(String name) throws Exception {
        return transactionDao.getRowCountSearch(name);
    }

    public static int DeleteTransactionById(String id) throws Exception {
        return transactionDao.delete(id);
    }

    public static Object limitResult(String page) throws Exception {
        return transactionDao.limitResult(page);
    }

    public static Object searchAndlimitResult(String name, String page) throws Exception {
        return transactionDao.searchAndlimitResult(name, page);
    }

    public static Transaction getTotalTransactionAmountByAccount(int id, String fromdate, String todate) throws Exception {
        return transactionDao.getTotalTransactionAmountByAccount(id, fromdate, todate);
    }

    public static double getSumAccountCategoryValues(int id) throws Exception {
        return transactionDao.getSumAccountCategoryValues(id);
    }

    public static Transaction searchTransactionById(String id) throws Exception {
        return transactionDao.getAllRunnersByID(id);
    }

    public static double travelExpensesBetweenDates(String fromdate, String todate)throws Exception {
       return transactionDao.travelExpensesBetweenDates(fromdate,todate);
    }

    public static double shopRentalExpensesBetweenDates(String fromdate, String todate) throws Exception {
        return transactionDao.shopRentalExpensesBetweenDates(fromdate,todate);
    }

    public static double slabourExpensesBetweenDates(String fromdate, String todate)throws Exception {
        return transactionDao.slabourExpensesBetweenDates(fromdate,todate);
    }

    public static double repairExpensesBetweenDates(String fromdate, String todate) throws Exception{
         return transactionDao.repairExpensesBetweenDates(fromdate,todate);
    }

    public static double payrollExpensesBetweenDates(String fromdate, String todate)throws Exception {
         return transactionDao.payrollExpensesBetweenDates(fromdate,todate);
    }

    public static double generalExpensesBetweenDates(String fromdate, String todate)throws Exception {
        return transactionDao.generalExpensesBetweenDates(fromdate,todate);
    }

    public static double mealsExpensesBetweenDates(String fromdate, String todate)throws Exception{
         return transactionDao.mealsExpensesBetweenDates(fromdate,todate);
    }

    public static double commsionExpensesBetweenDates(String fromdate, String todate)throws Exception{
       return transactionDao.commsionExpensesBetweenDates(fromdate,todate);
    }

}

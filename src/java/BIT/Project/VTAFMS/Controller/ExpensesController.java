/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.ExpensesDAO;
import BIT.Project.VTAFMS.DaoImpl.ExpensesDAOImpl;
import BIT.Project.VTAFMS.Model.Account;
import BIT.Project.VTAFMS.Model.Expenses;
import java.util.Vector;

/**
 *
 * @author Chamil
 */
public class ExpensesController {

    private static ExpensesDAO expensesDao = new ExpensesDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertExpenses(Expenses expenses) throws Exception {

        return expensesDao.insert(expenses);

    }

    public static Expenses searchExpensesById(int id) throws Exception {
        return expensesDao.getAllExpensesByID(id);
    }

    public static Object getAllExpenses() throws Exception {
        return expensesDao.viewAll();
    }

    public static int updateExpenses(Expenses expenses) throws Exception {
        return expensesDao.update(expenses);
    }

    public static int DeleteExpensesById(String id) throws Exception {
        return expensesDao.delete(id);
    }

    public static double getAllexpensesAmount() throws Exception {
        return expensesDao.getAllexpensesAmount();
    }

    public static double getAllexpensesAmountbydate(String date) throws Exception {
        return expensesDao.getAllexpensesAmountbydate(date);
    }

    public static double getAllexpensesAmountbyaccountID(String id) throws Exception {
        return expensesDao.getAllexpensesAmountbyaccountID(id);
    }

}

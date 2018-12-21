/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.ExpensesCategoryDAO;
import BIT.Project.VTAFMS.DaoImpl.ExpensesCategoryDAOImpl;
import BIT.Project.VTAFMS.Model.ExpensesCategory;

/**
 *
 * @author Chamil
 */
public class ExpensesCategoryController {
      private static ExpensesCategoryDAO expensesCategoryDao = new ExpensesCategoryDAOImpl();
       // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertExpensesCategory(ExpensesCategory expensesCategory) throws Exception {

        return expensesCategoryDao.insert(expensesCategory);

    }

    public static Object searchExpensesCategoryById(int id) throws Exception {
        return expensesCategoryDao.getAllCenterByID(id);
    }

    public static Object getAllExpensesCategory() throws Exception {
        return expensesCategoryDao.viewAll();
    }

    public static int updateExpensesCategory(ExpensesCategory expensesCategory) throws Exception {
        return expensesCategoryDao.update(expensesCategory);
    }

    public static int DeleteExpensesCategoryById(String id) throws Exception {
        return expensesCategoryDao.delete(id);
    }
   
}
